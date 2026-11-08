# Review of BordismFormalGroups (pull request #1854 at 1ccc517)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/BordismFormalGroups/` (README.md, 2247 lines; Suggested.lean, 104 lines) at the pins of the branch's `lake-manifest.json` (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9). Gate at this head: `FAIL` with `dropped=3`, `outside-folder=2`, every other check 0, build 0. Dependency check: `depcheck: 239 roadmaps, 2362 edges, 0 problem(s)` (no UPWARD or CYCLE line; the roadmap is on main and not in the merge order). `lake env lean` on Suggested.lean: exit 0, the two `sorry` warnings only. Six findings, two blocking.

## R01 (P2) — F1 re-plans the pinned Tau Ceti formal-group tree and misstates the pin

**Location.** `TauCetiRoadmap/BordismFormalGroups/README.md` lines 57–61 ("The pinned Tau Ceti has no n-series module, so own the n-series API on `formalNSeries`"), lines 101–103 ("The pinned libraries have no invariant differential and no formal-group logarithm, so own them"), and the F1 paragraphs on the Lazard ring, the cocycle lemma and coordinate-change Hopf algebroid (77–96), the exponent-two logarithm (137–166) and height/isomorphisms (170–185).

**Claim.** Both statements about the pin are false, and the paragraphs plan, as new targets, theorems the pinned Tau Ceti already proves. The version of this folder on main cites them by name (main README lines 46–60 and 88–98: `FormalGroup.nsmulSeries`, `nsmulSeries_add`, `nsmulSeries_mul`, `constantCoeff_nsmulSeries`, `coeff_one_nsmulSeries`, `natCast_dvd_coeff_nsmulSeries`, `FormalGroup.invariantDifferential`, `FormalGroup.log`, `FormalGroup.exp`, `subst_toPowerSeries_eq_add_iff`, `subst_exp_log`); this head's diff (hunks `@@ -45,15 +52,21 @@` and `@@ -85,17 +98,38 @@`) deletes those citations and replaces them with ownership claims. A roadmap on main is built on, and what the pin has is cited, never planned again.

**Witness** (Tau Ceti 2fd255d9, `TauCeti/RingTheory/FormalGroup/`): `NSMul/Basic.lean:93` `nsmulSeries` (= `(n • F.tautologicalPoint).val`), `:97/:101` zero/succ recursion, `:106` `nsmulSeries_add`, `:139` `nsmulSeries_mul`, `:117` `constantCoeff_nsmulSeries`, `:274` `coeff_one_nsmulSeries`, `:310` `natCast_dvd_coeff_nsmulSeries` (hypothesis `k.Coprime n`), `:327` `exists_nsmulSeries_eq_of_prime` (`[p]_F = p·X·u + X^p·h`, `u(0)=1`), `:298` `natCast_eq_zero_of_nsmulSeries_eq_zero`; `NSMul/BaseChange.lean:35` `map_nsmulSeries`; `Logarithm/Basic.lean:178` `invariantDifferential`, `:188/:236/:256` the invariance laws, `:278/:287` the values for `𝔾ₐ`, `𝔾ₘ`, `:333` `log`, `:355` `derivative_log`, `:404` `subst_toPowerSeries_eq_add_iff` (every additive series is `c·log`), `:449` `exp`, `:464/:469` the two substitution inverses, `:560` `logIso`; `Logarithm/InfiniteHeight.lean:249` `existsUnique_logarithm_of_nsmulSeries_eq_zero` (exactly the exponent-two statement, for every prime), `:278` `height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ`; `ExponentTwo/Basic.lean:64` `exponentTwoLog` and `eq_exponentTwoLog`; `LazardRing/Basic.lean:232` `LazardRing`, `:463` `gradedLift`, `LazardRing/Polynomial.lean:112` `mvPolynomialEquiv : MvPolynomial ℕ+ ℤ ≃ₐ[ℤ] LazardRing` (Lazard's polynomial theorem); `SymmetricCocycle/Classification.lean:420` `existsUnique_eq_smul_lazardCocycle` (any ring, `2 ≤ n`); `CoordinateChange/Lazard.lean` `coordinateChangeLift` and `CoordinateChange/HopfAlgebroid.lean`; `Height/Basic.lean:200` `height`, `:211` `height_eq_natCast_iff`, `:263` `height_map`, `:346` `FormalGroupIso.height_eq`, `:180` `exists_order_nsmulSeries_eq_pow`; `Hom.lean:137/351/433` `TauCeti.FormalGroupHom`, `FormalGroupIso`, `IsStrict`; `AddInv.lean` `addInvX`. All elaborate at the pin (probe in the reviewer's scratch, signatures listed under Verified sound).

**Repair.** Restore F1 as a consumer: name each of the declarations above with its module in `## Exact supplier contracts` (the folder at the head of pull request #1807 already does this, module by module), delete the sentences claiming the pin lacks them, and keep as F1 targets only what the pin does not have: the Lubin–Tate deformation theory, the classification over separably closed fields (the forward direction and the infinite-height case are pinned), the graded real-orientation exponent-two comparison, the topologically nilpotent extension beyond `TopNilpotentPoint`, and the comparison with TangentialBordism's consumption. Then R02 follows.

## R02 (P2) — Suggested.lean restates pinned declarations, states the one headline on stand-in carriers, and its docstring is false

**Location.** `TauCetiRoadmap/BordismFormalGroups/Suggested.lean` lines 17–19 ("no Lazard ring at the pins"), 47 `formalNSeries`, 52 `formalVariable`, 56–63 the proved `example`, 68 `exists_unique_normalized_exponentTwo_logarithm`, 82 `IsFormalGroupIso`, 92 `formalHeight`, 98 `exists_formalGroupIso_iff_formalHeight_eq`.

**Claim.** Four of the six declarations duplicate pinned objects, one sorried "headline" is a pinned theorem, the real headline is forced through hand-rolled carriers, and the docstring's "not statable" list names a theorem the pin proves.

**Witness.** A scratch copy importing `TauCeti.RingTheory.FormalGroup.NSMul.Basic` and `…Logarithm.InfiniteHeight` elaborates (exit 0 on those lines): `formalNSeries F n = F.nsmulSeries n` by `induction n` with `rw [formalNSeries, ih, F.nsmulSeries_succ]`, and the whole of line 68's statement closes by one `exact F.existsUnique_logarithm_of_nsmulSeries_eq_zero Nat.prime_two (… ▸ hexponent)`. `formalVariable` is `FormalGroup.tautologicalPoint : F.Point Unit` (elaborates at the pin). `IsFormalGroupIso` is the unbundled form of `TauCeti.FormalGroupIso` (`Hom.lean:351`). `formalHeight` is `FormalGroup.height` (`Height/Basic.lean:200`; `height_eq_natCast_iff` at `:211` gives the "least `h`" reading over a characteristic-`p` field). `TauCeti.LazardRing.mvPolynomialEquiv : MvPolynomial ℕ+ ℤ ≃ₐ[ℤ] TauCeti.LazardRing` elaborates (`LazardRing/Polynomial.lean:112`), so "Lazard's polynomial theorem … (no Lazard ring at the pins)" at lines 17–19 is wrong.

**Repair.** Replace the file by the module docstring, `public import Mathlib`, `public import TauCeti.RingTheory.FormalGroup.Hom`, `public import TauCeti.RingTheory.FormalGroup.Height.Basic`, and the single headline

```lean
theorem nonempty_formalGroupIso_iff_height_eq {k : Type*} [Field k] [IsSepClosed k]
    (p : ℕ) [Fact p.Prime] [CharP k p] (F G : FormalGroup k) [F.IsComm] [G.IsComm] :
    Nonempty (TauCeti.FormalGroupIso F G) ↔ F.height p = G.height p := by
  sorry
```

(this elaborates at the pin; it is the form the folder has at the head of pull request #1807). Delete `formalNSeries`, `formalVariable`, the `example`, the exponent-two theorem, `IsFormalGroupIso` and `formalHeight`. The docstring says the forward direction and the infinite-height case are pinned (`TauCeti.FormalGroupIso.height_eq`, `FormalGroup.height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ`) and moves Lazard's polynomial theorem, the exponent-two logarithm and the symmetric cocycle lemma from the "not statable" list to the "already proved at the pin" list. In the README, replace the six backticked own names (lines 55, 57, 141, 171, 178, 184) by prose or by the new name, as the gate's readme-ids check requires.

## R03 (P3) — HomotopySpheres named (gate `dropped=3`)

**Location.** README lines 40–41 ("HomotopySpheres consumes F4's Toda brackets and F6.2's James construction."), 297 ("TangentialBordism and HomotopySpheres consume these operations, algebras and towers."), 883 ("… targets of the James–Hopf maps of item 3; HomotopySpheres consumes them.").

**Claim.** The name is on the project's dropped-names list; the gate fails on it, and a dropped roadmap is not named even as a consumer.

**Witness.** `scratch/gate.md`: `dropped (3)` with these three lines; the brief's "never cite" list includes HomotopySpheres.

**Repair.** Delete the sentence at 40–41; line 297 becomes "TangentialBordism consumes these operations, algebras and towers."; line 883 ends at "item 3." (The Toda brackets and the James construction stay owned here, as the Carriers paragraph already says.)

## R04 (P3) — edits outside the pull request's named folders (gate `outside-folder=2`)

**Location.** `Completed/ArithmeticDirichletSeries/README.md` (1 line) and `TauCetiRoadmap/SymplecticGeometry/README.md` (3 lines), per `git diff --stat origin/main...HEAD` excluding the sixteen folders the brief names as the pull request's own.

**Claim.** The gate counts both as outside this roadmap's folder; the description explains them as the ArithmeticDirichletSeries → LFunctions and SymplecticGeometry → DGFloer loop cuts, but neither folder is in the pull request's declared folder list.

**Witness.** `scratch/gate.md`: `outside-folder (2)`.

**Repair.** Either list the two folders among the pull request's own (so that each gets its review) or move those two hunks to a pull request of their own; no change to this folder.

## R05 (P3) — the Carriers paragraph is process narrative with pull-request numbers

**Location.** README lines 15–21: "Follow the proposed `FormalGroupHom`, `FormalGroupIso` and `addInvX` designs in Mathlib #38213 and #36167, including #41710's topologically nilpotent point carrier. Construct the missing APIs in Tau Ceti with these shapes; adopt Mathlib's resulting APIs when they arrive."

**Claim.** Pull-request references and "proposed … when they arrive" are not timeless, and the APIs are no longer missing.

**Witness.** Tau Ceti 2fd255d9 `Hom.lean:137` `TauCeti.FormalGroupHom`, `:351` `TauCeti.FormalGroupIso`, `:433` `IsStrict`; `AddInv.lean` `addInvX`; `TopNilpotentPoint/Basic.lean`, `Hom.lean`, `Topology.lean`.

**Repair.** "Use Mathlib's `FormalGroup R`, `FormalGroup.IsComm`, `FormalGroup.Point`, `FormalGroup.map`, `FormalGroup.𝔾ₐ`, `FormalGroup.𝔾ₘ` and `MvPowerSeries (Fin 2) R`, and Tau Ceti's `TauCeti.FormalGroupHom`, `TauCeti.FormalGroupIso` (strict ones through `IsStrict`), `FormalGroup.addInvX` and the topologically nilpotent points of `TauCeti.RingTheory.FormalGroup.TopNilpotentPoint`." Drop the three links.

## R06 (P3) — README shape

**Location.** README headings: `## Carriers, conventions and owners` (12), `## F1` … `### F6.7`, `## Order and references` (2159); Checks are inline sentences ("Checks: …", e.g. lines 123–135, 291–299, 434–441) rather than `**Checks.**` bullet lists; no layer ends with `### Examples` and `### Dependencies`; no target carries a `*Needs:*` line; no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Downstream consumers`, `## References`.

**Claim.** The roadmap form of the content repository (compare `TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md` lines 24–360, which this roadmap cites) is not followed; the supplier contracts of R01 have no section to live in.

**Witness.** The heading list above (`grep '^## \|^### '` on the README).

**Repair.** Split the Carriers paragraph into `## Scope and ownership` (owners and consumers, including the TangentialBordism/StringOrientation/EllipticCohomology sentences), `## Conventions` (the grading paragraph) and `## Exact supplier contracts` (`From Mathlib`, `From Tau Ceti` with R01's names, `From TauCetiRoadmap.GeneralizedCohomology` G2–G5 and G2.11, `…AlgebraicTopology` Stages 5.5, 8.8–8.10, `…CharacteristicClasses` C3, `…GeometricTopology` the smoothing-and-triangulation comparison item 1, `…RepresentationTheory/SchurWeyl` Layers 0, 2, 5, `…RepresentationTheory/CompactGroups` Layers 1–2, `…ProfiniteCohomology`, `…DGAInfinity` Layer 8, `…SymplecticGeometry/ConvexityToric` T2); turn the first half of "Order and references" into `## How to read the build` and its list into `## References`; add `## Downstream consumers` (EllipticCohomology E2/E4/E5, TangentialBordism, StringOrientation, ModularCurves); convert each inline Checks sentence into a `**Checks.**` bullet list under its definition; end each of F1–F6.7 with `### Examples` and `### Dependencies`.

## Verified sound

**Gate and build.** Gate at 1ccc517 as quoted above; `lake env lean TauCetiRoadmap/BordismFormalGroups/Suggested.lean` exit 0 with warnings only at lines 68 and 98 (`declaration uses sorry`); the elaborated signatures of the six declarations match their README sentences (no dropped section binder: both theorems carry `[F.IsComm]`, the classification carries `[Field k] [IsSepClosed k] [Fact p.Prime] [CharP k p] [G.IsComm]`).

**Dependency check.** `depcheck: 239 roadmaps, 2362 edges, 0 problem(s)`.

**Seeded sample, verified at the text.**
- "Steenrod algebras and mod-p Adams towers" (README 216–299): Hatcher `hatcher-at` Theorem 4L.12 (line 21777, properties (1)–(7) of `Sq^i`, with instability `Sq^n x = x²`, `Sq^i x = 0` for `i > n` proved at 21780–21782 and the Cartan formula at 21783–21798), Theorem 4L.13 (21864, Adem relations), Theorem 4L.16 (22197, `P^i` properties (1)–(6) and Adem; `P^i x = 0` for `2i > |x|`, `P^{|x|/2} x = x^p` at 22199–22200); the unnumbered theorem on printed page 500 (file line 21565, under the marker of file page 509 = printed 500): `H^*(K(ℤ_p,n);ℤ_p)` free commutative on admissible monomials of excess `< n`, "will be proved in [SSAT]" (21561), and the admissible-monomial independence corollary (21579–21583). Guillou–Weibel `guillou-weibel` Definition 6.1 (line 748, `ℓ`-simple system), Theorem 6.2 (752: first-quadrant spectral sequence of graded-commutative `H^*`-algebras with `H^0 = 𝔽_ℓ`, hypotheses (i) `E₂ ≅ W ⊗_H V`, (ii) transgressive `ℓ`-simple generators; conclusion free on `τ(x_i)` and `τ(y_j ⊗ x_j^{ℓ−1})`), Proposition 6.4 (767, Künneth hypothesis giving (i) for the Leray spectral sequence of `E•G → B•G`, `G` connected), Kudo's Theorem 6.5 (784: `β x ↦ −β y`, `P^a x ↦ P^a y`, `x^{ℓ−1} ⊗ y ↦ −Q_a(y)` for `n = 2a`, with `Q_a = βP^a` at line 744): the README's three Kudo laws and the Borel conclusion are these, at `H^* = 𝔽_p`. Miller `miller-cobordism` Theorem 11.2 (line 1142, Milnor: `𝔽₂[ξ₁,ξ₂,…] → A_*` is an isomorphism), Proposition 10.4 (1023, Milnor–Moore). Ravenel `ravenel-green` Theorem 3.1.1 (3673: `A_*` at both primes with the stated degrees, coproducts and conjugation), Lemma 3.1.4 (3741: `H_*(MU;ℤ) = ℤ[b_i]`, image of the Thom class `P(ξ_i²)` at 2 and `P(ξ_i)` at odd `p`), Corollary A1.1.18 (18098: a comodule algebra surjecting onto the Hopf algebra is `C ⊗ Σ`), Corollary A1.3.13 (18732: `Ext_Γ(K, Γ □_Σ N) = Ext_Σ(K,N)`), Theorem 2.1.1 (2627: `d_r` of bidegree `(r, r−1)`, `E₂ = Ext_A`, (ii) `π_*(X) ⊗ ℤ_p` for `X` of finite type, under the standing hypothesis at 2619 that `X` is connective with `H_*(X)` of finite type), Definition 2.2.1 (3107), Theorem 2.2.3 (3146: `E₂ = Ext(E_*(X))`, convergence to `π_*(X̂)`), Theorem 2.3.3 (3398: the pairing with its Leibniz sign), Corollary 3.1.10 (3816: `C ⊗ P(a₀,a₁,…)`, `a_i ∈ Ext^{1,2p^i−1}`), Lemma 3.1.3 (3718: `a₀ x` represented by `pα`), Theorem 3.1.5 (3748: `π_*MU = ℤ[x_i]`, `h(x_i) ≡ −p b_i` for `i = p^k − 1`, `−b_i` otherwise). Bousfield §6 Theorem 6.6 is uncertified (below).
- "Unoriented coefficients" (README 357–390): Miller Theorem 12.1 (1226: `A` acts freely through degree `n` on the Thom class of `MO(n)`, by restriction `u ↦ w_n ↦ x₁⋯x_n`), Corollary 12.2 (1238), Theorem 12.3 (1239: `H^*MO` free over `A`, by Proposition 10.4 since `H^*MO` is an `A`-module coalgebra), Theorem 12.4 (1261: `v : MO → ⋁ Σ^{|α|} H` is a weak equivalence), Chapter 1 §13 (1368–1373: `π_*MO = 𝔽₂[x_n : n ≠ 2^i − 1]`), Ravenel Corollary A1.1.18 as above. Thom 1954 Chapitre IV is uncertified (below).
- "The smoothing-and-triangulation comparison" (README 1995–1998): `TauCetiRoadmap/GeometricTopology/README.md` on main, heading at line 930 and item 1 "Smooth implies PL" at line 938 (Whitehead's smooth triangulation, Munkres); AlgebraicTopology's smooth-manifold CW comparison at `TauCetiRoadmap/AlgebraicTopology/README.md` line 67 at this head ("the finite-dimensional Hausdorff second-countable smooth-manifold CW comparison consumes geometric topology's smooth triangulation; compact manifolds have finite CW type").
- Other locators opened: Ravenel Theorem 4.1.6 (6062, Quillen), Theorem A2.1.6 (19937: logarithm `∫ dt / F₂(t,0)`; for commutative `F`, `F₂(t,0) = F_X(0,t)`, so the README's `P` is this integrand), Lemma A2.1.9 (19984, uniqueness of the strict logarithm in the proof of (i)), Lemma A2.2.7 (20711, printed p. 386: a nontrivial endomorphism over an `𝔽_p`-algebra is `g(x^{p^n})`, `g'(0) ≠ 0`), Theorem A2.2.12 (20790, printed p. 387: separably closed field, height `n` law isomorphic to `F_n`, `n = ∞` included); Miller Chapter 2 Theorem 3.5 (1809) and Proposition 8.3 (2973); Kuhn Theorem 1.5 (line 151); Hovey–Sadofsky Theorem 1.1 (78); Carrick–Davies–van Nigtevecht Definitions 3.3 (1190), 3.7 (1244), Lemma 3.9 (1261), Propositions 3.14–3.15 (1397, 1403), Theorem 3.16 (1476, threefold); Bauer Lemma 8.6 (1020).

**Adversarial table.**

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| F1 `[n]_F` recursion, linear coefficient `n` | `𝔾ₐ`, `n=2`; `𝔾ₘ` over ℤ and `𝔽₂` | `[2]_𝔾ₐ = 2X`; `[2]_𝔾ₘ = 2X + X²`, over `𝔽₂` `= X²`; coeff₁ = 2 | agrees with pin `nsmulSeries_𝔾ₐ/𝔾ₘ` | cite (R01) |
| F1 prime-series form (A2.2.7 applied to `[p]`) | `𝔾ₘ/𝔽_p`; `𝔾ₘ/ℤ`, `k < p` | `[p] = X^p = g(X^p)`, `h = 1`, `g' (0) = 1`; coeff of `X^k` in `(1+X)^p − 1` is `C(p,k)`, `p ∣ C(p,k)` for `0<k<p` | sound; `k = p` has `p ∤ k` false, no claim | none |
| F1 invariant differential `P = F_X(0,T)⁻¹`, invariance | `𝔾ₘ`; wrong model `1+T` | `P = (1+T)⁻¹`; `P(F)·F_X = (1+X)⁻¹(1+Y)⁻¹(1+Y) = P(X)`; `(1+X+Y+XY)(1+Y) ≠ 1+X` | README Check correct; derivation from associativity at `U=0` gives `F_X(X,Y)·F_X(0,X) = F_X(0,F(X,Y))` | cite pin `subst_invariantDifferential_mul_pderiv` (R01) |
| F1 exponent-two logarithm (Lean line 68) | `𝔾ₐ/𝔽₂`; `𝔾ₘ/𝔽₂`; any `F/ℤ` | `g = X` unique (`X + X²` is additive but coeff₂ ≠ 0); `[2]_𝔾ₘ = X² ≠ 0`, hypothesis fails; over ℤ coeff₁`[2] = 2 ≠ 0`, hypothesis unsatisfiable | true; equals pinned theorem at `p = 2` (probe: one `exact`) | delete (R02) |
| F1 `formalHeight` | `𝔾ₘ/𝔽_p`; `𝔾ₐ/𝔽_p`; junk `𝔾ₐ/ℤ`, `p=2` | coeff of `X^{p⁰}` is 0, of `X^p` is 1 → 1; `[p]=0` → ⊤; `[2]=2X`, coeff₁ = 2 ≠ 0 → 0 | matches pin `height_𝔾ₘ = 1`, `height_𝔾ₐ = ⊤`; junk harmless (headline over `CharP k p`) | delete, use `FormalGroup.height` (R02) |
| F1 `IsFormalGroupIso` | `φ = 0`; `φ = X : 𝔾ₐ → 𝔾ₘ`; `φ = X : F → F`; `φ = log_𝔾ₘ` over ℚ | coeff₁ = 0 not a unit, excluded; `X+Y ≠ X+Y+XY`, excluded; identity law holds; coeff₁ = 1, `log(F) = log X + log Y` | determines the object | replace by `TauCeti.FormalGroupIso` (R02) |
| F1 classification (Lean line 98) | `F = G = 𝔾ₐ`; `𝔾ₘ` vs `𝔾ₐ` over `𝔽̄_p`; `𝔽_p` not separably closed | both sides true; heights `1 ≠ ⊤` and no iso (`FormalGroupIso.height_eq`); README's twisted `𝔾ₘ` counterexample shows `IsSepClosed` is needed | sound as stated | restate on native carriers (R02) |
| F2 Quillen Check `h(x_i)` | `i = 1..6` | `i+1 = 2,3,4,5,6,7`: prime powers except 6 → `2b₁, 3b₂, 2b₃, 5b₄, b₅, 7b₆` | agrees with Ravenel 3.1.5(ii) up to sign (unit) | none |
| F2 Adams `d_r` bidegree | `d₂` on `(s,t) = (1,2)` | `(1+2, 2+1) = (3,3)`, `t−s: 1 → 0` | agrees with Ravenel 2.1.1 | none |
| F2 Steenrod Checks | `a ∈ H¹(RP^∞)`; degrees at `p=2,3` | `Sq¹a = a²`, `Sq²a = 0`; `|ξ₂| = 2²−1 = 3 = |Q₁|`; `p=3`: `|ξ₁| = 4`, `|τ₀| = 1`, `|τ₁| = 5`, `|Q₁| = 2·3−1 = 5` | agree with 4L.12 and 3.1.1 | none |
| F2 Kudo at odd `p` | `y` even transgressive, `|y| = 2k` | `y^{p−1} ⊗ τy` in bidegree `(2k+1, 2k(p−1))`, `r = 2k(p−1)+1`; target degree `2kp+2 = |βP^k τy|` | degrees agree; sign `−βP^k` is GW 6.5(3) with `Q_a = βP^a` | none |
| F2 unoriented Checks | degree 5; degree 4; degrees 1, 3 | ranks `H_*MO: p(5) = 7`, `A_*: {ξ₁⁵, ξ₁²ξ₂} = 2`, `P: {x₅} = 1`; Künneth `1·1+1·2+1·0+2·1+2·0+2·1 = 7`; `π₄MO = ⟨x₄, x₂²⟩`; `π₁ = π₃ = 0` | agree with Miller §13 | none |
| F2 derived 2-completion of `Mℤ/2^∞` | `M = ℤ/2^∞` | `L₀ = Ext(ℤ/2^∞, ℤ/2^∞) = 0`, `L₁ = Hom(ℤ/2^∞, ℤ/2^∞) = ℤ₂`; classical completion `lim ℤ/2^∞ ⊗ ℤ/2^n = 0` | Check correct | none |
| F2 K-theory law | `x(L) = u⁻¹([L⁻¹] − 1)` | `x(L⊗M) = u⁻¹((1+ux)(1+uy) − 1) = x + y + uxy`; `x(O(1)) = u⁻¹([O(−1)] − 1) = 1` | correct | none |
| F2 quaternionic restriction | `γ_H|CP^∞ = L ⊕ L̄` | `e^c = e(L)e(L̄) = t·[−1]_F(t)` | correct for the complex-induced class; `e^std` sign is G4's convention | none |
| F3 Adams summands | odd `p` | `ku_(p)`: `p−1` summands `Σ^{2i}`, `0 ≤ i ≤ p−2`, period `2p−2`; `ko_(p)`: `(p−1)/2` summands `Σ^{4i}` | standard | none |
| F4 Toda Checks | `⟨2,η,2⟩`; circle swap | `η² ≠ 0 ∈ π₂^s = ℤ/2`, indeterminacy `2π₂^s + π₂^s·2 = 0`; swap degree `(−1)^{1·1} = −1` | correct | none |
| F5 invariant primes | `(p, v₁−1)` ungraded | `η_R(v₁−1) = v₁ + pt₁ − 1 ≡ v₁ − 1 mod p` → invariant, not homogeneous | the homogeneity caveat is right | none |
| F6.2 James Checks; vanishing slopes | `Y = S²`, `S⁰`; `p = 2` | `J₂/J₁ = S²∧S² = S⁴`; `J(S⁰) = ℕ`, `π₀ΩS¹ = ℤ`; `2r·2^k − 1 = r·2^{k+1} − 1` | correct | none |
| F6.3 Smith staircase | `λ_i = (a+1−i)(p−1)` | `|λ| = (p−1)·a(a+1)/2 = (p−1)·C(a+1,2) = k_V` | consistent | none |
| F6.3 Adams `v₁` degrees | `p` odd; `p = 2` | `2p−2`; `8` | standard | none |
| F6.5 `K(n)^{tC_p}` | `[p](x) = v_n x^{p^n}` | `x^{p^n} = 0` in `K(n)^*[[x]]/([p]x)` after inverting `v_n` → `x` nilpotent → Euler inversion 0 | correct | none |
| F6.6 Euler cancellation identity | `n = Π − eν`, `n^q = 0` | `eν·Σ_{i=1}^q Π^{q−i} n^{i−1} = Π^q − n^q = Π^q`; `q = 1 + dim C` since a product of `q` classes of filtration ≥ 1 has filtration > dim C; Koszul `(−1)^{2rk} = 1`; `e(O(−1)) ↦ −h` | correct | none |

**Library declarations opened at the pins** (file:line as in R01, plus): Mathlib `FormalGroup`, `FormalGroup.Point`, `FormalGroup.tautologicalPoint : F.Point Unit` (elaborated); Tau Ceti `TauCeti.LazardRing.lift : {F // F.IsComm} ≃ (LazardRing →+* R)`, `gradedLift`, `mvPolynomialEquiv`, `existsUnique_eq_smul_lazardCocycle`, `coordinateChangeLift`, `exponentTwoLog`, `eq_exponentTwoLog`, `exists_nsmulSeries_eq_of_prime`, `exists_order_nsmulSeries_eq_pow`, `natCast_dvd_coeff_nsmulSeries`, `height`, `height_eq_natCast_iff`, `height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ`, `FormalGroupIso.height_eq`, `invariantDifferential`, `log`, `logIso`, `addInvX` (all `#check`ed in the scratch probe, elaborated signatures recorded there). No `IsSepClosed` classification exists at the pin, so the headline of R02 is the roadmap's.

**Cross-roadmap citations resolved** (on main unless stated; this pull request's own folders at 1ccc517): GeometricTopology smoothing-and-triangulation comparison, item 1 (README 930, 938); AlgebraicTopology Stage 5 (1153), Stage 5.5 Serre predicate and spectral sequences (118, 2905–2906), Stage 8 (2195) with 8.8a–d and 8.10 (94–145, 2905–2906), smooth-manifold CW comparison (67); GeneralizedCohomology G2 items 1–11 at this head, item 11 "Enriched, quasicategorical and monoidal foundations" being G2.11 (also defined at #1807's head; absent on main, and the description's merge-order paragraph puts #1807 first), G3 (1506), G4 (1779), G5 (2202), G5.7 ordering paragraph (3380–3397: "BordismFormalGroups F6.5 consumes it with no returned input"); CharacteristicClasses C3 (1222) with `H^*(BO(n);𝔽₂) = 𝔽₂[w₁,…,w_n]` (1365); RepresentationTheory/SchurWeyl Layers 0 (309) and 2 (340), hook-length formula (7, 50, 177); RepresentationTheory/CompactGroups unitarizability and complete reducibility (168), the circle Fourier basis (14–16); SymplecticGeometry/ConvexityToric T2 "Morse–Bott and moment-map topology" (73); DGAInfinity Layer 8 (520); EllipticCurves Layer 1 (88–117); EllipticCohomology E2 (486), E4 (885), E5 (1527); ModularCurves height classification (2479, 3621); ProfiniteCohomology README present; TopologicalKTheory `O(−1)` tautological line (156–157). TangentialBordism (#942) and StringOrientation (#948) are open pull requests named here only as consumers; EllipticCohomology is on main. The overlaps file lists no dropped id in either direction; #1807 and #1808 also change this folder (toward consuming the pin), and the description orders #1807 before this pull request, so the F1 text of R01 is what the rebase must keep.

**Not reviewed.** Ownership against open pull requests was checked only against the sibling checkouts the brief lists and `roadmaps grep`; the three board packages (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) are unrelated.

## Not verifiable

Settled as uncertified in the manifest and cited by locator only: Thom 1954 Chapitre IV (`thom-1954`); Quillen 1971 (`quillen-elementary`); Adams blue book; Bousfield 1979 §6 Theorem 6.6 (`bousfield-1979`); Toda 1962 Chapter I (`toda-1962`); James 1955 §§1–6 (`james-1955`); Wilson Ω-spectrum II; Hovey MString; Hovey–Strickland Proposition 7.10(e); Johnson–Wilson Proposition 4.14; Würgler Theorem 2.16 and Remark 6.19; Symonds §5 and §7; Devinatz–Hopkins–Smith §§1–3, Propositions 3.27, 3.33 and Lemma 3.35 (`dhs-nilpotence-i`); Hopkins–Smith II; Landweber 1976; Landweber–Ravenel–Stong; Greenlees–Sadofsky. The Lurie HTT/HA section lists and Nikolaus–Scholze §I.3/Appendix A are cited for G2.11's content, which GeneralizedCohomology owns; not re-verified here.

## Source issues

- none
