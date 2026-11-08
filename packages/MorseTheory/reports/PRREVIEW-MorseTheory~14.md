# Review of MorseTheory (pull request #1682 at a78ce2c)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/MorseTheory/` at head a78ce2ce5b254ccc85ab75890faad74cca6b9e57. The folder changed by 1136 lines since fadc182, the head the last review read. There are four findings; one of them blocks.

- R01 is the last review's R01. Only a merge of main into the branch can repair it, and a repair job cannot do that, so it is marked re-raised.
- Every other finding of the last review is repaired (see "Previous findings").
- R02–R04 are new P3 findings about passages this round left unchanged.

## R01 (P1) — The branch is still not merged with main, so 89 Tau Ceti declarations the README and `Suggested.lean` call "pinned" do not exist at this head's pin

Re-raised: H01

**Location:**
- `TauCetiRoadmap/MorseTheory/README.md:38–40`: "The pinned Tau Ceti Morse library already proves a large part of Layers 1–4 and 6, and the targets it proves are consumed by the names that the Tau Ceti contract lists".
- The same claim runs through the Tau Ceti contract (lines 149–322 and 344–376), the "pinned" sentences of §1.1–§4.4 and §6.1, and `TauCetiRoadmap/MorseTheory/Suggested.lean:18–34`.

**Claim:** This head's `lake-manifest.json` still pins Tau Ceti a91d3aaf, Mathlib 6b7abb3c and Lean v4.35.0-rc3. The merge base is still ffcc9d31, and `git merge-tree --write-tree origin/main HEAD` reports CONFLICT in both `README.md` and `Suggested.lean`.

The README is written for main's pins: Tau Ceti 2fd255d, Mathlib 1b1ccf4, Lean v4.36.0-rc2. I indexed both Tau Ceti trees. Of the dotted Tau Ceti names backticked in the README:
- 89 exist only at 2fd255d;
- 13 exist at both pins;
- none exists only at a91d3aaf.

At this head that has three consequences:
1. **The deferred targets have no owner.** Every target of Layers 1–4 and 6 that the README defers as pinned is unowned at this head's pin. Examples are `TauCeti.criticalPoints`, `TauCeti.exists_sublevelDeformation`, `TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation`, `TauCeti.lsCategoryCount_univ_le_totalCriticalCount` and the §4.4 inputs `IsLocalExtr.mem_criticalPoints`, `IsOpen.image_of_continuousOn_of_injOn` and `TauCeti.nonempty_homeomorph_sphere_of_union_closedBall`.
2. **Statable headlines are missing.** Reeb's theorem can be stated at a91d3aaf from `TauCeti.IsMorse` alone, and `Suggested.lean` omits it because it is "pinned".
3. **The docstring names missing declarations.** `Suggested.lean`'s docstring names eleven "proved" declarations, and its lines 18–19 name `TauCeti.criticalPoints I f`. None of them exists at a91d3aaf.

The gate passes only because `Suggested.lean` imports three modules that exist at both pins.

**Witness:** At a91d3aaf, `TauCeti/Geometry/Manifold/Morse/` holds only `Basic.lean`, `Index.lean`, `Prod.lean` and `Sphere/`. At 2fd255d the same directory has 35 entries, among them `CriticalPoints.lean` (with `criticalPoints` at line 87), `Reeb.lean:148` and `Deformation.lean:199`.

**Why H01's reason does not settle it:** H01 is right that the merge is a branch operation for the worker: it touches `lake-manifest.json` and `lean-toolchain`, which a repair job may not edit. But the merge has not been done. Until it is, the contract is false at the pin the build uses, and no edit to the two roadmap files can repair that.

**Exact repair (for the worker or a human, not a repair job):**
1. Merge `origin/main` (ad30d94) into the branch, resolving `README.md` and `Suggested.lean` to this head's text. This brings Tau Ceti 2fd255d, Mathlib 1b1ccf4 and Lean v4.36.0-rc2.
2. In `Suggested.lean`:
   - import `TauCeti.Geometry.Manifold.Morse.CriticalPoints` and `TauCeti.Geometry.Manifold.Riemannian.Gradient.Basic`;
   - use `x ∈ TauCeti.criticalPoints I f`, `(TauCeti.criticalCount I f j).toNat`, `TauCeti.totalCriticalCount I f = 2` and `-TauCeti.Manifold.mgradient I f`;
   - delete docstring lines 18–19;
   - add Reeb's theorem and the pinned weak and strong inequalities to the docstring's list of consumed headlines.
3. Re-elaborate and re-run the gate at the new pins.
4. Update the pull request's title and description. They still announce "Palais–Smale compactness and nonproper gradient convergence" and `PalaisSmaleTargets.lean`, which README lines 74–79 place outside this roadmap.

No edit to `README.md` is requested before the merge. Tested at 2fd255d: every contract entry I opened carries the hypotheses the README states (list under Verified sound).

## R02 (P3) — Brown's theorem re-encodes the bicollar hypothesis instead of using Tau Ceti's `IsBicollared`, which both pins define

**Location:**
- `TauCetiRoadmap/MorseTheory/Suggested.lean:124–126`: "`(β : Metric.sphere (0 : EuclideanSpace ℝ (Fin m)) 1 × Set.Icc (-1 : ℝ) 1 → …) (hβ : Topology.IsEmbedding β)`".
- `README.md:1209–1211` (the same hypothesis) and `1240`: "The hypothesis is the explicit bicollar β".
- `README.md:378–381`: the contract names only `TauCeti.IsLocallyFlat` and `TauCeti.brownBicollaring`, and only as non-inputs.

**Claim:** At both pins, `TauCeti/Geometry/Manifold/LocallyFlat/Bicollar.lean` defines:
- `TauCeti.IsBicollar f b` (line 101): an open embedding `b : N × ℝ → M` with `b (x, 0) = f x`;
- `TauCeti.IsBicollared f` (line 108).

The README cites neither, although its §4.4 hypothesis is this object. The two forms are equivalent here: an open bicollar restricts to an embedding of S^(m−1)×[−1,1], and conversely invariance of domain makes β open on S^(m−1)×(−1,1). Only the native form composes with the pinned `TauCeti.brownBicollaring` (`LocallyFlat/Brown.lean:39`) to give the locally flat Schoenflies theorem. It is also the form in which GeometricTopology's open revision states the same theorem (§2.2, its README line 1377).

**Witness:** `Bicollar.lean:101–106`, identical at a91d3aaf and 2fd255d, is a `structure IsBicollar (f : N → M) (b : N × ℝ → M) : Prop` with the fields `isOpenEmbedding` and `apply_zero`.

**Exact repair:**
1. In `Suggested.lean`, import `TauCeti.Geometry.Manifold.LocallyFlat.Bicollar`.
2. Replace β and hβ by `(f : Metric.sphere (0 : EuclideanSpace ℝ (Fin m)) 1 → Metric.sphere (0 : EuclideanSpace ℝ (Fin (m + 1))) 1) (hf : TauCeti.IsBicollared f)`, and write `Set.range f` for Σ in its three occurrences.
3. In README §4.4, state the target the same way and cite `TauCeti.IsBicollar` and `TauCeti.IsBicollared` in the Tau Ceti contract.
4. In the two-open-cell sketch (line 1263), take the open annulus {r−η<|u|<r+η} ≅ S^(m−1)×ℝ as the bicollar.
5. Add one sentence saying that composing with `TauCeti.brownBicollaring` gives the locally flat form.

Tested:
- The restated theorem elaborates at this head's pin with one `sorry` warning.
- m=0: the empty map ∅×ℝ→S⁰ is an open embedding, so the hypothesis holds and the conclusion is the S⁰ case of the adversarial row 16.
- m=1: an open bicollar of S⁰ is two disjoint open arcs.

## R03 (P3) — §6.1's route applies the open-interval uniqueness lemma at the endpoint t = 0 of [0, ∞)

**Location:**
- `README.md:1424–1426`: "by uniqueness of integral curves of the C¹ field −grad f it agrees on [0,∞) with the maximal integral curve through γ(0)".
- `README.md:1433–1434`: "*Needs:* … Mathlib's uniqueness of integral curves, `isMIntegralCurveOn_Ioo_eqOn_of_contMDiff_boundaryless`".

**Claim:** The cited lemma needs two curves that are integral on `Ioo a b` and agree at some `t₀ ∈ Ioo a b`. The headline's γ is integral only on `Ici 0`, where Mathlib's `IsMIntegralCurveOn` takes the derivative within the set, so it is one-sided at 0. The only agreement available is at t₀ = 0, the endpoint. So the input listed does not give the step as written; uniqueness from the endpoint is an unlisted input.

**Witness:**
- `Mathlib/Geometry/Manifold/IntegralCurve/ExistUnique.lean:227` assumes `(ht₀ : t₀ ∈ Ioo a b)`.
- `Mathlib/Geometry/Manifold/IntegralCurve/Basic.lean:65` defines `IsMIntegralCurveOn` with `HasMFDerivAt[s]`.

**Exact repair:** Replace the sentence by this route: "For t₁>0, the shifted curve γ(t₁+·) is an integral curve on (−t₁,∞) and agrees at time 0 with the maximal integral curve Γ through γ(t₁). By the cited lemma they agree on Γ's forward domain, so Γ's forward part is trapped in K. The pinned maximal-trajectory theorems applied to Γ then give the limit and the decay for γ, with T and C adjusted by t₁."

Tested on f=x², with γ(t)=x₀e^(−2t) for t≥0 and γ(t)=x₀ for t<0:
- γ satisfies the headline's hypothesis but is not integral on any open interval containing 0 (left derivative 0, right derivative −2x₀), so the old step has nothing to apply to.
- Γ through γ(1) is x₀e^(−2)e^(−2t)=γ(1+t). It agrees with γ(1+·) at 0 ∈ Ioo(−1,T).

## R04 (P3) — The handle-attachment homeomorphism of §2.2 has no locator

**Location:** `README.md:675–679`: "**Handles.** Across one critical value … The conclusion is a homeomorphism of M_(c+ε) with the topological handle adjunction along ∂D^λ×D^(m−λ)".

**Claim:** This is an owned theorem stated with no source. None of the README's readable sources states it:
- `cohen-iga-norbury` never mentions handles;
- §2.2's only locator, Milnor 1963, Theorem 3.1, p. 12, is the critical-free deformation;
- the cell form is the pinned `TauCeti.IsMorse.exists_morseCellAttachment_deformation`.

**Witness:** A case-insensitive `grep -c handle` on the `cohen-iga-norbury` text gives 0. Lines 642–686 cite only Milnor's Theorem 3.1.

**Exact repair:** At the claim, add the locator of a text that proves the handle-attachment homeomorphism (Milnor's *Lectures on the h-cobordism theorem*, §3, is the usual one), with the theorem number and page read from that text, and record the work in the manifest. If no legal copy exists, cite it by that locator as uncertified.

## Previous findings

- **R01 (merge main into the branch): not repaired.** This is R01 above. The merge base is still ffcc9d31, and both files still conflict with main.
- **R02 (four pinned objects restated): repaired.**
  - The model transport is now a citation of `TauCeti.BoundarylessModel`: lines 154–163, and §1.1 at 465–478.
  - The CW identity `TauCeti.sum_range_monomial_natCard_cell_mul_finrank_eq_of_cwComplex` is cited at lines 305 and 960–968: "The description of the coefficients of Q as ranks is the pinned CW identity".
  - `Submodule.free_of_isPrincipalIdealRing` is cited at lines 311 and 973.
  - `TauCeti.IsMorse.criticalCount_neg` is cited at lines 173 and 1114.
  - All four exist at 2fd255d only, which is R01.
- **R03 (dropped AlgebraicTopology names): repaired.**
  - `grep` finds none of the seven names. The descriptions at lines 409–414 and 817–821 resolve at main, at #1652 (§4.4 line 947, §4.5 line 1072) and at #1663 (Stage 4, line 656).
  - §4.2 is now unnormalized (line 1043): "`lsCupLength M R + 1 ≤ TauCeti.lsCategoryCount M univ ≤ TauCeti.totalCriticalCount I f`".
- **R04 (construction plans for pinned targets): repaired.** §1.1–§3.2, §4.2 and §6.1 now cite the pinned declarations. The owned remainders are listed in Scope (lines 60–72), and I checked that none of them is pinned at 2fd255d (Verified sound).
- **R05 (dropped name HomotopySpheres): repaired.** `grep -c HomotopySpheres` gives 0, and my gate rerun reports `dropped=0`.
- **R06 (`bettiNumber` API): repaired.** There are four bullets with hypotheses (lines 984–987). Lines 998–1000 add Checks for the point, for discrete ℕ (the junk value 0) and for S¹ against ℝ²∖{0}.

## Verified sound

**Gate, dependencies, elaboration and signatures.**
- The worktree is clean at a78ce2c. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/MorseTheory'` is empty.
- Gate rerun: every check is 0, and the gate prints `OK`.
- Dependency check output: `depcheck: 229 roadmaps, 2316 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `lake env lean TauCetiRoadmap/MorseTheory/Suggested.lean` elaborates in 18 s. Its only output is 7 `declaration uses sorry` warnings, at lines 67, 93, 108, 123, 146, 160 and 174.
- `#check @name` for all 8 declarations, in one scratch file, matches `scratch/signatures.md` and the README statements:
  - the standing binders are present on the five manifold theorems;
  - `omit` drops them from Brown's theorem and the two-open-cell lemma;
  - `bettiNumber` takes k and X in one universe, as §4.1 says.

  Nothing changed after the check.
- **One-tactic probe.** I replaced each `sorry` by `first | rfl | simp | infer_instance | aesop | trivial | decide | exact ⟨_, rfl⟩`. All 7 theorems fail, so there is no padding.
- After the merge, `strong_morse_inequalities` is the partial-sum algebra over the pinned `…_le` and `…_eq` (`Inequalities.lean:414, 429`) that README line 955 describes. It is not closed by one tactic, so it is not padding by the brief's test.

**Library declarations opened, with hypotheses compared with the README.**
- At this head's pin: `TauCeti.IsMorseOn` and `TauCeti.IsMorse` (`Morse/Basic.lean:110, 212`) include `ContMDiff … ∞`, so the headlines' `IsMorse` hypothesis carries smoothness.
- At 2fd255d, in `TauCeti/Geometry/Manifold/Morse/`:
  - `CriticalPoints.lean`:
    - `criticalPoints`, line 87, and `mem_criticalPoints_iff_mfderiv_eq_zero`, line 96;
    - `IsLocalExtr.mem_criticalPoints` (line 213) and `criticalPoints_nonempty` (line 229) require boundaryless, compact, nonempty;
    - `isClosed_criticalPoints` (line 252) and `finite_criticalPoints_inter` (line 274) require `IsManifold I 1`;
    - `totalCriticalCount` and `criticalCount` are at lines 342 and 348;
    - `criticalCount_neg` (line 426) requires `j ≤ finrank` and is boundaryless with no smoothness instance; the README's extra "C¹ manifold" is harmless.
  - `Lemma.lean:69`: `MorseChart` has `f y = f x + 2⁻¹ Σ wᵢ (coord (ψ y))ᵢ²` with `wᵢ = ±1`.
  - `PseudoGradient/Basic.lean:72`: the field is `−wᵢ zᵢ`, so it reads (u,−v) in y=z/√2, matching the contract at lines 265–269.
  - `PseudoGradient/Existence.lean:530` (T2, σ-compact, self-model) and `PseudoGradient/ModelTransport.lean:223` (compact, T2, finite-dimensional).
  - `Generic/Strong.lean:110` (`tsupport (g − f) ⊆ Cᶜ`, `|g − f| < ε`), `:279` (within 1) and `:290`.
  - `GradientFlow.lean:208, 261, 282`: C², with the forward part of the maximal curve through x mapped into K.
  - `HandleRetraction.lean:241`: a deformation retraction onto the sublevel with the cells, not the handle homeomorphism, so R04's target is owned.
- At 2fd255d, elsewhere:
  - `AlgebraicTopology/Cellular/EulerCharacteristic/MorseInequalities.lean:148`: finitely many cells through n and none in n+1. Q's coefficient of Xⁱ is the rank of d(i+1,i) for i<n, as README lines 302–310 say.
  - `LinearAlgebra/FreeModule/PID.lean:42`: no zero divisors, no finiteness.
  - `Topology/Homotopy/LusternikSchnirelmann.lean:454`: finite clopen family. It sums `lsCategoryCount X (A ∩ Cᵢ)`; the §4.2 component formula also needs this to equal the count of the clopen subspace, a one-line step because homotopies stay in a clopen set.
  - `Inequalities.lean:393, 403, 414, 429`.
- At both pins: `LocallyFlat/Bicollar.lean:101, 108` and `LocallyFlat/Brown.lean:39` (R02). No Morse–Bott predicate exists at either pin or in Mathlib, so the docstring's statement that Layer 5 cannot be stated is correct.
- Also at 2fd255d, none of the owned remainders is pinned:
  - `RegularValue/Scalar/*.lean` has no `Diffeomorph`;
  - `Boundary/OutwardExistence.lean` gives global outward fields, not the face co-orientation signs;
  - `ContMDiffMap/Chart/Seminorm.lean` has no chart-change bound.
- Mathlib (head pin): `IsMIntegralCurveOn` (`IntegralCurve/Basic.lean:65`) and the Ioo uniqueness lemma (`ExistUnique.lean:227`), which is R03.

**Cross-roadmap citations, resolved on main (ad30d94):**
- DifferentialGeometry:
  - Layer 3 (line 371);
  - Layer 5 with 5.1 `boundaryOrientation_spec` (lines 503 and 507);
  - Layer 10 with 10.2 Sard (lines 877 and 884);
  - Layer 12 with 12.2 and 12.3 (lines 910, 918 and 920).
- AlgebraicTopology:
  - Stages 2, 4, 6 and 8 (lines 326, 499, 946 and 1602);
  - "Stage 4.4" and "Stage 4.6" in the text (lines 358 and 271);
  - `lsCupLength` and its bound (lines 1117–1122).
- GeometricTopology Layer 1 (line 177).
- CharacteristicClasses C2 (line 90).
- ComplexKahlerGeometry K7.1 (line 1407).
- ComplexManifolds Milestone 1 (line 172), with the anchor used at README line 1097.
- DGFloer Layer 1 item 3 (line 227).
- SymplecticGeometry/ConvexityToric T2 (line 73).
- HeegaardFloer Lane M (line 70).
- RiemannianGeometry R3 (lines 82 and 89).

**Consumers of this roadmap.** On main and in the open pull requests, other roadmaps cite MorseTheory only by the labels M1–M6, which the layer headings keep, and by the two HeegaardFloer anchors (main lines 647 and 1064). Lines 443–449 map those anchors old → new, and the anchors computed from the headings agree with the map. `scratch/overlaps.md` lists no other dropped id and no other pull request changing this roadmap.

**Ownership against open pull requests.**
- MorseNovikov (rev 1161), RiemannianGeometry (rev 1683) and DGFloerPartII (rev 1799) consume this roadmap by label and own none of its headlines.
- No open roadmap states the Morse CW model, the ℕ[t] identity, the two-critical-point sphere theorem or the trapped-curve convergence.
- **Brown's generalized Schoenflies theorem has two claimed owners, but the conflict is not this folder's to fix.**
  - GeometricTopology (rev 903) plans it at README line 1377 and says at line 13341 that MorseTheory consumes it.
  - FourManifolds (rev 936, line 223) declares `gap:brown-schoenflies` on GeometricTopology.
  - MorseTheory on main already owns the theorem (main README line 668), and a revision is never a supplier. So this folder needs no change, and those two pull requests should cite MorseTheory §4.4 (M4.1) or agree an order.
  - R02 puts the statement on the same native predicate, so either settlement becomes a citation swap.

**Sources: the seeded sample.** In Cohen–Iga–Norbury, the printed page is the PDF page minus 13 (for example, line 995 prints 27 on PDF page 40).

| Target | Locator | Checked at | Result |
| --- | --- | --- | --- |
| 1.1 | none (pinned construction) | row 1 | citation only; R01 |
| 1.2 | none (pinned definitions) | row 2 | citation only; R01 |
| 1.3 | CIN Thm 5.3, pp. 36–37; Cor 5.4, p. 38 | cohen-iga-norbury lines 1322, 1423 (PDF 49, 51) | exact |
| 2.1 | Lee Cor 5.14, Prop 5.38 | uncertified (settled) | — |
| 2.2 | Milnor 1963 Thm 3.1, p. 12 | not verifiable; CIN Thm 5.1, line 1202 (p. 33), agrees | handle claim has no locator (R04) |
| 2.3 | Milnor 1963 Lemma 3.6, pp. 20–21 | not verifiable | — |
| 2.4 | Milnor 1963 Thm 3.5, p. 20; CIN Thm 5.7, pp. 40–41 | lines 1519–1548 (PDF 53–54) | closed M, one λ-cell per index-λ point |
| 3.1 | Hirsch Ch. 2 §1; Ch. 6 Thm 1.2 | uncertified (settled) | — |
| 3.2 | Milnor 1963 Cor 6.7, p. 36 | not verifiable | — |
| 4.1 | CIN Cor 5.11 and proof, p. 42 | lines 1569–1596 (PDF 55) | ck = dk+1 + bk + dk holds over any field, so Q's tʲ coefficient is d(j+1) ≥ 0 |
| 4.2 | Weber Thm 1.1, p. 2; proof pp. 2–3 | weber-conley lines 62–67, 73–106 | C² on a closed manifold; cat = least ℓ ≥ 1 open nullhomotopic sets |
| 4.3 | CIN Application 5.13, p. 43 | lines 1617–1643 (PDF 56) | Morse, two critical points ⇒ homeomorphic to Sⁿ |
| 4.4 | Milnor 1959 Thm 1(3), p. 440; Cor 1, p. 442 | milnor-1959 lines 53, 72–76, 109, 117–119 | exact |
| 4.4 | Brown 1960 Thms 0–4, pp. 74–76; Thm 5, p. 76 | brown-1960 lines 25, 37, 60, 69, 84, 101–113 | exact; the n=1 gap in the proof is under Source issues and the README handles m=1 separately |
| 5.1 | CIN Thms 15.1, 15.4, 15.6–15.7, pp. 143, 146–148 | lines 4986, 5091, 5142, 5161 (PDF 156, 159, 160) | exact; 15.1 is local in N, as README line 1330 says |
| 6.1 | CIN Thm 4.6, pp. 27–29 | lines 1022–1122 (PDF 40–42) | closed M; convergence only, and the README attributes the decay to the pin |

**Adversarial table.** Every value was computed this round.

| # | Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §1.1 model transport | self-model ℝ²; half-line model | df=(1,0) ↦ (1,0); range [0,∞) ≠ ℝ | Checks exact | R01 |
| 2 | §1.2 Hessians, counts | −x²+y²; constant on S¹; a point; f=0 and f=x² on ℝ | diag(−2,2), index 1, one point; encard ⊤ (Nat.card gives 0); count 1, index 0; λ(f)+λ(−f): 0+0=0≠1, 0+1=1 | nondegeneracy needed, and stated | R01 |
| 3 | §1.3 normal form, seminorm comparison | x²; x³−tx; δx² on [−1,1]; τ(y)=y/2 on K=[−2,2] | y=x gives f=y², Hessian 2; ±√(t/3) for t>0, none for t<0; suprema (δ,2δ,2δ); (g∘τ)^(m)=(1/2)^m g^(m): (1,1,1/2) vs (1,2,2), C=1, reverse C=2^k | sound | none |
| 4 | §2.1 levels, faces | x on ℝ² at 0; x² at 0; x on [a,b]; x²+y², a=1 | derivative v↦(0,v), range span e₂ = ker(1,0); df=0; outward df=+1 at b, −1 at a; ∂M₁ on `EuclideanSpace ℝ (Fin 1)`, level on `Fin (2−1)→ℝ` | sound | R01 |
| 5 | §2.2 restriction, adapted fields | x², a<a′<b′<b; band [1,4]; z=√2x; −u²+v² | x∈[√a′,√b′] ↦ √a′ ↦ √a; X=−1/(2x): x²=4−t, hits 1 at t=3, equals −2x/(4x²); z′=−z ⇒ x′=−x, df(X)=−2x²; −2x reads z′=−2z; (−z₁,−z₂): df=z₁²−z₂²>0 at z₂=0; y=z/√2 reads (u,−v) | matches `MorseChart` normalization | none |
| 6 | §2.3 chart change | (x²−1)², c=1, ε=1/2, charts ±x√(2−x²); RP² top point | 1−x²(2−x²)=(x²−1)²; x²=1−1/√2, x=±0.5412, f=1/2; {f≤1/2}={0.5412≤\|x\|≤1.3066}, two components; 2−f=(2X²+Y²)/(1+X²+Y²) | Checks exact | none |
| 7 | `exists_morseCWModel` | S² height; x² on ℝ; ∅; f=x on ℝ; discrete ℕ, f(n)=n | cells (1,0,1); one 0-cell; none; f=x proper, unbounded below, no critical points ⇒ X=∅ ≄ ℝ; ℵ₀ 0-cells | `BddBelow` necessary and present; proper with `BddBelow` ⇔ compact sublevels | none |
| 8 | §3.1 strong topology | tolerance e^(−x²) vs constant 0.01; δψ on (0,1) | fails for \|x\|>√(ln 100)=2.146; at 0<x<δ, δψ(x)=δ>x | strong ≠ compact-open | none |
| 9 | §3.2 exhaustion | x² with \|g−f\|<1; ∅; discrete ℕ | g≥−1 and {g≤b}⊆{x²<b+1} compact; empty function proper, vacuously Morse; a constant has fibre ℕ, not compact | sound | R01 |
| 10 | `strong_morse_inequalities` | RP² over ℚ and 𝔽₂; c=(2,0,0,2), b=(1,0,0,1); point; ∅ | ℚ: q=(0,1,0), C−B=t+t²=(1+t)t; 𝔽₂: b=(1,1,1), Q=0; q₁=(0−2)−(0−1)=−1<0, C−B=1+t³=(1+t)(1−t+t²); 1=1; 0=0 | ℕ[t] encodes the strong inequalities; S_n+S_(n−1)=x_n checked | none |
| 11 | `bettiNumber` | point; S¹; discrete ℕ; RP² over ℚ and 𝔽₂ | (1,0,…); (1,1,0,…); H₀=k^(⊕ℕ) gives finrank 0; b₁=0 vs 1 | junk value documented | none |
| 12 | §4.2 bound, cup length | S¹; T²; RP² over 𝔽₂ and ℚ; S¹⊔S¹; ∅; point | 2≥2≥2; 4≥3≥3; 3≥3≥3 and 3≥3≥1; 4=2+2 while normalized 1+1≠3; 0+1≤0 fails; 1≥1≥1 | nonemptiness needed, and stated | none |
| 13 | §4.3 applications | CP¹, \|z₁\|²/(\|z₀\|²+\|z₁\|²); S² with c=(2,1,1) | near [1:w] ≈\|w\|², index 0; near [u:1] ≈1−\|u\|², index 2; c(−f)=(1,1,2); χ=2−1+1=2 | sound | none |
| 14 | `nonempty_homeomorph_sphere_of_two_criticalPoints` | h−h³/3; h²; two copies of S²; 2 points; 1 point | s=1−cos r: f=2/3−s²+s³/3=2/3−r⁴/4+O(r⁶), Hessian 0; h²: count ⊤ (m≥2) or 4 (m=1); ≥4; S⁰; 1≠2 | sound | none |
| 15 | `exists_twoEuclideanOpenCover_of_two_criticalPoints` | round S¹, f=h; case a+ε>b−δ | ‖grad h‖=\|sin θ\|=√(1−h²), η=√3/2, (b−a)/η²=8/3; K⊆{f≤b−δ}⊆{f<a+ε}⊆B, so T=0 | sound | none |
| 16 | `exists_closedBall_homeomorph_closure_of_bicollar` | m=0; m=1 with co-rotating collars; equator | S^(−1)=∅, A={1}, B={−1}, closures ≃{0}, false ↔ (‖0‖=1); arcs with endpoints Σ, closures ≃[−1,1]; hemispheres | true | R02 |
| 17 | `nonempty_homeomorph_sphere_of_two_euclidean_opens` | S¹ as two arcs; point with m=0; ℝ^m | glued arcs ≃ S¹; 1 point vs #S⁰=2, so `0 < m` needed; not compact | sound | none |
| 18 | §5.1 Morse–Bott | y² vs y⁴; negative Möbius line; RP² | ker Hess=span e₁=TC vs ℝ²; H₀(S¹;ℤ^w)=ℤ/2 vs ℤ; E¹=(ℤ,ℤ,ℤ), d=2, E²=(ℤ,ℤ/2,0) | sound | none |
| 19 | `exists_compactTrapped_gradient_limit` | x²; metric 4dx²; −u²+v² on u=0; e^(−x) | γ=x₀e^(−2t), E=x₀²e^(−4t), tail \|x₀\|e^(−2t); grad=x/2, γ=x₀e^(−t/2), distance 2\|x₀\|e^(−t/2); v=v₀e^(−2t); γ′=e^(−γ)>0, γ→∞, no trap | statement true | R03 |
| 20 | R01 citations | README dotted names at a91d3aaf vs 2fd255d | 89 only at 2fd255d, 13 at both, 0 only at a91d3aaf; Morse directory 4 vs 35 entries | contract unresolvable at the head's pin | R01 |
| 21 | R03 route | γ=x₀e^(−2t) on [0,∞), x₀ for t<0 | Ioo lemma needs t₀ in the open interval; 0 ∉ Ioo(0,T); with Γ through γ(1), t₀=0 ∈ Ioo(−1,T) and Γ(t)=γ(1+t) | repaired route closes | R03 |
| 22 | R02 repair | IsBicollared form at m=0, m=1; elaboration | empty open embedding; two open arcs; 1 `sorry` warning at the head's pin | equivalent hypothesis, native carrier | R02 |

## Not verifiable

- **Milnor, *Morse Theory* (1963):** cited for §2.2 (Theorem 3.1), §2.3 (Lemma 3.6), §2.4 (Theorem 3.5, the locator of `exists_morseCWModel`) and §3.2 (Corollary 6.7). The worker's sources cache holds no copy, and the roadmap's `sources.toml` has no record of the work. Last round's fetch into a scratch manifest found no legal source. Where Cohen–Iga–Norbury Theorems 5.1 and 5.7 cover the same statements (compact case), the README agrees with them.
- **`hirsch-differential-topology` and `lee-smooth-manifolds`:** uncertified and settled; cited by locator.
- **Thomas Mark, Math240 Homework 11:** no legal text. It is used only for bibliographic attribution.
- **Elaboration at main's pins:** I may run Lean only from this worktree, at the head's pins, so I compared 2fd255d by reading its sources. The repair report records that the native form of step 2 of R01 elaborates there, except the `mgradient` replacement.
- **Ownership against ManifoldOptimization (#1506), the multi-roadmap pull request #1854 and SymplecticGeometry (#1651):** the brief gives no files for them, so ownership against them was not checked.

## Source issues

- **Misprint** in cohen-iga-norbury at Corollary 5.11, p. 42: the source says the alternating sums over k have summands c_i(f) and b_i(M) with the fixed index i; it should be c_k(f) and b_k(M); affects nothing.
- **Misprint** in cohen-iga-norbury at Application 5.13, proof, p. 43: the source says the lower disc is the preimage of [t₁,a], around a minimum called P; it should be the preimage of [t₀,a], around the minimum S; affects nothing.
- **Gap** in brown-1960 at Theorem 5, proof, p. 76: the source says to take the complementary domain of h(S^(n−1)×1) avoiding h(S^(n−1)×0), which for n=1 with co-rotating collar arcs does not exist; it should assume n≥2 or treat n=1 separately; affects the proof.
