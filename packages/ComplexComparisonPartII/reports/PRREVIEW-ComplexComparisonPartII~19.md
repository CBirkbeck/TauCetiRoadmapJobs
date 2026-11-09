# Review of ComplexComparisonPartII (pull request #848 at 490f7c9)

**Verdict:** needs changes

This is an incremental re-review of the 10 changed lines since `9cd29e4`. All of them are in `README.md`: the K4 sentence at :146 and the K3Surfaces/GeometricQuantization consumer bullet at :4984–4988. `Suggested.lean` is unchanged. R01 of the previous review is still only partly repaired, so it is carried below as R01.

## R01 (P2) — The frame-torsor bijection, the holomorphic exponential sequence and the `c₁` identification still have more than one owner across the open heads

**Location:**
- `TauCetiRoadmap/ComplexComparisonPartII/README.md:4984–4986` (changed): "**K3Surfaces §1.1** and **GeometricQuantization §3.3** use C5.4's frame-torsor bijection from isomorphism classes of holomorphic line bundles onto `H¹(M,O_M^×)`, with its tensor, dual and pullback laws".
- The single-owner claim, also at :90–93, :146 and :3709–3719.

**Claim:** C5.4 is the only owner of the three objects, and K3Surfaces §1.1 takes the bijection from C5.4.

**Witness:**
- #1285 (K3Surfaces, `2ddcd6be`), README:403–406: §1.1 takes `Pic_hol(M)≃H¹(M,O_Mˣ)` "from the ComplexKahlerGeometry contract (gap:integral-topology)" and states that "no part of that comparison is constructed here".
- #1234 (`06e0a3f7`), README:690–694: K4.P owns all three objects.

**What this head changed:**

- **:146 is fixed.** It now records what this roadmap takes from K4 ("only the holomorphic line bundles and their Chern connection"), not what K4 states.
  - This is true on main (`35884a8`): K4 is at `ComplexKahlerGeometry/README.md:444–567`, with the line bundles at :459–470 and the Chern connection at :479. "Exponential sequence", `Pic_hol` and `O^×` occur 0 times.
  - It matches C5.4's *Needs:* line (:3750–3753) and C1.9's `analyticPicardGroup` (:1988, :2017).
  - The sentence can no longer become false if #1234 merges, which was the narrow part of R01.
- **:4984 now claims more than before.** At `9cd29e4` the bullet named only the exponential sequence and the `c₁` identification, and both consumer heads agree with that (#1285 :411–419; #1186 :719). This head adds the frame-torsor bijection with its laws, and K3Surfaces' own head says it takes the bijection from ComplexKahlerGeometry. The conflict therefore now runs through the consumer list as well as the scope section.
- **No settlement is recorded.** The pull request's merge-order paragraph is unchanged and still names none of #1234, #1285 or #1375.

**Who each open head names as owner** (all heads unchanged since the previous review):

| Object | Owner named | Where |
| --- | --- | --- |
| Exponential sequence and `c₁` identification | C5.4 | this README; #1285 :13–14 and :411–419; #1375 (`c1d6da06`) :13, :76 and :200; #1186 (`be6ed5f4`) :20, :217 and :719 |
| Exponential sequence and `c₁` identification | ComplexKahlerGeometry K4.P | #1234 :690–694 and :769–770; consumed inside #1234 at :2260 |
| Frame-torsor bijection | C5.4 | this README :91, :146, :3709–3716 and :4984 |
| Frame-torsor bijection | ComplexKahlerGeometry | #1234 (as K4.P); #1285 :14–16, :156–176 and :403–406 (as `gap:integral-topology`); #1375 :13 |
| Frame-torsor bijection | ComplexComparisonPartII C0.3 | #1186 :710–712; C0.3 (:1197) states no `H¹(M,O^×)`, so this is #1186's citation to correct, not this README's |

**Why only one settlement fits the rules:**

- #1234 is another author's revision of ComplexKahlerGeometry, a roadmap on main. A revision is never a dependency, so this roadmap cannot take K4.P from it.
- ComplexKahlerGeometry precedes ComplexComparisonPartII (`ORDER.txt:39`). #1234 therefore cannot cite C5.4 as a supplier either. The previous review's wording "#1234 … cites C5.4" would create an upward citation in ComplexKahlerGeometry, and is withdrawn here.
- What remains is the settlement this README already describes: C5.4 is the owner, and #1234, #1285 and #1375 align with it.

**Repair:** Add one paragraph to this pull request's description, in the merge-order block. This is not an edit to the folder.

> **Ownership.** ComplexComparisonPartII C5.4 is the single owner, on every complex manifold, of `Pic_hol(M) ≃ H¹(M,O_M^×)`, the holomorphic exponential sequence and the identification of its connecting map with the integral first Chern class; ComplexKahlerGeometry on main states none of them. ComplexKahlerGeometry #1234 removes K4.P's claim to them (README :681–694, :769–770) without citing C5.4, which it precedes; its torus use at :2260 then reads isomorphism classes of K4's line bundles directly. K3Surfaces #1285 replaces `gap:integral-topology` (README :156–176, :403–406) by a citation of C5.4. K3SurfacesAndSymplecticBoundedness #1375 re-points README :13, :76 and :200 to C5.4.

Under that paragraph, :4984 states the settled consumption and needs no edit. Tested on the refuting lines: with the paragraph, #1285 :403, #1234 :690 and #1375 :13 are each named with the edit that makes them cite the one owner, and #1285's re-pointed §1.1 is what :4984 says.

If the repair job cannot edit the pull request description, mark R01 `not actionable in this package` with that reason. No folder edit can remove a claim made in #1234 or #1285, and with that marking the board parks the roadmap for a human.

## Previous findings

- R01 — partly repaired: :146 reads "takes from ComplexKahlerGeometry K4 only the holomorphic line bundles and their Chern connection" (true on main); :4984 names K3Surfaces §1.1 as a consumer of C5.4's bijection, which #1285 :403–406 denies; no settlement recorded (R01 above).

No repair report marks R01 `not actionable in this package`, so it carries no `Re-raised:` line.

## Verified sound

### Gate, dependency check and Lean

- **Gate.** My run on `490f7c9` printed the following and exited 0. The worker's run on the same head also records `build=0`.

  ```text
  gate ComplexComparisonPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

- **Dependency check** (with `--movable`), in full. It printed no UPWARD, CYCLE or `moved:` line, and exited 0.

  ```text
  depcheck: 239 roadmaps, 2365 edges, 0 problem(s)
  ```

- **Diff scope.**
  - `git diff --stat 9cd29e4 HEAD` lists only `README.md` (6 insertions, 4 deletions).
  - `git diff --stat origin/main...HEAD` outside the folder is empty.
  - No `design/plan.json` is readable, so no gaps are declared.
- **Pins.** Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, unchanged.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives exactly four `declaration uses sorry` warnings, at lines 116, 127, 154 and 172, and nothing else (exit 0).
- **Signatures.** I elaborated a scratch copy with `#check @` for all four declarations. The types are identical to the worker's signature file, and no binder is lost:
  - `montelTheorem` keeps `[FiniteDimensional ℂ E]`;
  - `schwartzFiniteness` keeps the complete metrizable locally convex Hausdorff structure on `E` and `F`;
  - `holomorphicPoincare` keeps `IsManifold 𝓘(ℂ, E) ∞ M`;
  - `nonempty_sheafSingularComparison` keeps `LocallyContractibleSpace T`.
- **One-tactic probe and headline theorems.** The file and the pins are unchanged, so the previous results carry:
  - no declaration closes with one tactic, so nothing is padding;
  - 67 headline targets, 4 stated, 63 named in the docstring with the carrier each lacks.

### The changed passages

1. **:146, the K4 consumption sentence.** Every object it says is not taken from K4 has an owner inside this roadmap:
   - the group of isomorphism classes is C1.9's `analyticPicardGroup` (:1988), whose description in `H¹` is assigned to C5.4 (:2017);
   - the `H¹(M,O_M^×)` description uses SchemeAndStackFoundations §2.2 `cech_to_cohomology` (main :3309, :3314);
   - the exponential sequence is C5.4's own (:3709–3719).

   What remains from K4 is the line bundles, reached through C0.3's `holomorphicBundleDictionary`, and the Chern connection; C5.4's *Needs:* line (:3750–3753) lists nothing else from K4. The sentence keeps the CharacteristicClasses C1.5/C3/C4.1–C4.2 and SmoothBundlesConnections B6.1–B6.2 citations unchanged; both were resolved in r17/r18.
2. **:4984–4988, the consumer bullet.**
   - C5.4 states the bijection with `[L ⊗ L′] = [L][L′]`, `[L∨] = [L]⁻¹` and `[f^*L] = f^*[L]` (:3711–3715), and the exponential sequence with `δ[L]` equal to `integralLineBundleChernClass L` (:3716–3719). The bullet's "tensor, dual and pullback laws" and its segment match.
   - Demailly, *Complex Analytic and Differential Geometry* (author's version, text lines 13157–13168, page marker p. 267 at line 13141), has Definitions V.11.1–11.2: line-bundle classes correspond one-to-one to Čech `H¹(X,O*)`, and that group is the Picard group.
   - Demailly's transition convention `σ_α = g_αβ σ_β` matches C5.4's "`g_αβ` changes β-coordinates to α-coordinates".
   - The targets exist at their heads: K3Surfaces §1.1 at #1285 :399 and GeometricQuantization §3.3 at #1186 :694.
   - Remark on untouched text: Demailly 11.1–11.2 states the bijection but not the tensor, dual and pullback laws, which follow from multiplying, inverting and pulling back transition functions.

### Adversarial pass (computed)

Rows 20 and 32 are the changed statements, computed on this head. Every other row is carried from the previous report (r18), whose statements the diff leaves untouched. Rows 21–22 were first computed in r18; the rest come from r17.

| # | Statement | Instances | Values computed (left / right) | Result |
| --- | --- | --- | --- | --- |
| 20 | :146, what C5.4 takes from K4 (changed) | point; `ℂ*`; `E = ℂ/Λ`; `O(1)` on `P¹`; K4 on main | Point: `H¹(pt,O^×) = 0`, one class `[O]`. `ℂ*`: `H¹(O) = 0` and `H²(ℤ) = 0`, so `Pic_hol(ℂ*) = 0` without compactness. `E`: `0 → ℤ² → ℂ → Pic → ℤ → H²(O) = 0`, so `Pic⁰ = ℂ/ℤ²` and `NS = ℤ`. `P¹`: `Pic ≅ ℤ`, `δ[O(1)] = +1`, and `−1` with `exp(−2πiu)`. K4 on main: line bundles :459–470, Chern connection :479, 0/0/0 hits for exponential sequence, `Pic_hol` and `O^×`. C5.4's *Needs:* takes only the Chern connection from K4, and the bundles via C0.3 | true on main; ownership is R01 |
| 32 | :4984–4988, consumer segment with the bijection laws (changed) | K3 surface `X`; `ℂP¹`; `f : P¹ → P¹`, `z ↦ z²`; `O(1) ⊗ O(1)`, `O(1)∨`; `O(p − q)` on `E`; consumer heads | `X`: `H¹(O) = 0`, so `Pic(X) ↪ H²(X,ℤ) = ℤ²²` with image `ker(H²(ℤ) → H²(O) = ℂ)`, and `ρ ≤ h^{1,1} = 20`. `ℂP¹`: `Pic ≅ ℤ`, `c₁(O(k)) = k`. Pullback: `f^*O(1) = O(2)`, `δ = 2 = deg f · 1`. Tensor and dual: `δ = 1 + 1 = 2` and `δ = −1`; `L ⊗ L∨` has `δ = 0`. `O(p − q) ≠ 1` but `δ = 0`, so "read on line-bundle classes" needs the bijection, not `δ` alone. Heads: #1285 :411–419 takes exp/`c₁` from C5.4 (agrees) but :403–406 takes the bijection from CKG (disagrees); #1186 :719 takes exp from C5.4, and :712 cites C0.3 for `H¹` | mathematics holds; K3Surfaces attribution is R01 |
| 1 | Riemann surface of a smooth curve (C1.9), r18 | `P¹`; `G_m` vs `A¹`, `z ↦ z²`; nodal cubic; doubled origin | transition `z ↦ 1/z` on `ℂ*`; `d(z²)/dz` at 0 is 0, so no chart at 0; gradient `(−3x²−2x, 2y)` of `y²−x²(x+1)` is 0 at the node; two origins with no disjoint neighbourhoods | smooth and separated both used; holds |
| 2 | Curve GAGA maps (C1.9), r18 | `E: y² = x³ − x`; `P¹`, `D = ∞`; `E ∖ {∞}` | `div x = 2(0,0) − 2∞`, degree 0; sections `a + bz`, dim 2 = `h⁰(O(1))`, reversed sign gives 0; `Pic(E∖∞) ≅ E(ℂ) ≠ 0` vs trivial holomorphic Pic | holds; properness needed |
| 3 | `IsDifferentialOperator` (C5.1), r18 | `ℂ[z]`; `𝔽₂[z]`, `𝔽₃[z]`; `P^m(k[z])` | `[d/dz, z]f = f`; in `𝔽₂` the `t²`-coefficient of `(z+t)²` is 1 while `(d/dz)²z² = 0`; in `𝔽₃` the `t³`-coefficient of `(z+t)⁴` is `z`; `P^m = k[t]/(t^{m+1})` | holds; matches EGA's `D(at) − aD(t)` |
| 4 | `artinDeRhamBetti` (C5.2), r18 | `A = ℂ[ε]/ε²`, `X = P¹_A`; `X = Spec A` | `H⁰ = H² = A` (length 2), `H¹ = 0`; complex `A` in degree 0 | holds; matches Deligne (5.5.4) |
| 5 | `CurrentCalculus` (C5.4), r18 | Stokes sign; `ℂ` wedge; `\|z\|⁻²`; `d[Z]` | `∫dα∧η = (−1)^{k+1}∫α∧dη`; `α∧η = (aψ − bφ)dx∧dy`; `∫₀^ε r⁻²·r dr = ∞`; `d[Z](η) = (−1)^{k+1}∫_{∂Z}η` | all four Checks hold |
| 6 | `analyticSetLocalFiniteMass` (C5.4), r18 | line in `ℂ²`; node `xy = 0`; metric comparison | `πR²` on `B(0,R)`; `2πR²`, no atom; `c^d μ_g ≤ μ_h ≤ C^d μ_g` | holds |
| 7 | Analytic log differentials (C5.5), r18 | `ℂ{z,ε}/ε²`; `D(eᶻ)=1` with `D(z)=0`; log point | `ε dε = 0`, `dε ≠ 0`; the chain rule forces `D(eᶻ) = 0`; `ℂ·dlog t`, and 0 relative to itself | holds |
| 8 | `complexAlgebraicTopology` (C6.0), r18 | `A¹`; `P¹` strata; node; doubled origin | contractible noncompact; `ℂ*` not a subcomplex; conic neighbourhood; not Hausdorff | holds |
| 9 | `topologicalCoefficientComparison` (C6.1), r18 | `𝔽₃` monodromy −1; `𝔽₅` transport 2; `(0,1) ⊂ [0,1]`; `ℤ/2` over `ℤ/4` | `ker(−2) = 0` in `𝔽₃`; `2·3 ≡ 1`; `H¹_c = Λ`, `H¹ = 0`; `Tor_i = ℤ/2` for all `i` | holds |
| 10 | `riemannExistence` (C6.2), r18 | `z ↦ zⁿ` on `ℂ*`; `⊔ G_m` | deck group `ℤ/n`; unbounded degree | locally-finite-type scope supported (SGA 1 XII 5.1) |
| 11 | `artinComparison` (C6.3), r18 | `G_m`, `Λ(1)`, `n ≥ 3`; `ℤ/4`, `K = ℤ/2` | `e^{2πi/n} ≠ e^{−2πi/n}` for `n ≥ 3`; in `Dᵇ_c` but outside ctf | holds |
| 12 | `artinComparisonCompactSupport` (C6.4), r18 | `A¹`; conjugation on `P¹` | `H⁰_c = 0` vs `H⁰ = Λ`; degree −1 | holds |
| 13 | `relativeArtinComparison` (C6.5), r18 | `j: G_m ↪ A¹`; `⊕ (i_x)_*Λ`; `P¹` | stalk of `R¹j_*μ_n` free of rank one; `1_ℤ` not in the étale `H⁰`; both sides finitely supported on `P¹` | constructibility needed in (i); holds |
| 14 | `artinSmoothTrace` (C6.5), r18 | `A¹ ⊔ A¹ → pt`; `P¹` | `H²_c = Λ²`, trace `(a,b) ↦ a + b`; `c₁(O(1)) ↦ 1` | holds |
| 15 | `adicArtinComparison` (C6.6), r18 | torsion object; `P¹` | `ℤ/ℓ ⊗ ℚ_ℓ = 0`; `H²` rank 1, trace 1 | holds |
| 16 | `montelTheorem` (Lean), r18 | `Ω = ∅`; `ℂ²`, `z₁ⁿ`; `ℓ²`, `⟨·, e_n⟩` | vacuous; limit 0 locally uniformly; `sup_{B(0,r)} \|f_n − f_m\| ≥ r`, no convergent subsequence | `FiniteDimensional` needed and present |
| 17 | `schwartzFiniteness` (Lean), r18 | `ℂ`, `h = −g = −id`; `ℓ²`, `h = −diag(1/n)`; `g = diag(1/n)`; `h = −id` on `ℓ²` | codimension 1; kernel `e₁`, codimension 1; dense non-closed range; codimension ∞ | both hypotheses used; holds |
| 18 | `holomorphicPoincare` (Lean), r18 | `ℂ`, `dz`; `ℂ`, `dz̄`; `ℂ²`, `dz₁∧dz₂`; `E = 0` | `η = z`; radial primitive `z̄`, not holomorphic; `(z₁dz₂ − z₂dz₁)/2`; `α = 0 = η` | holds |
| 19 | `nonempty_sheafSingularComparison` (Lean), r18 | point; `∅`; `S¹`; Warsaw circle | `A` = `A`; 0 = 0; `ℤ` = `ℤ`; sheaf `H¹ = ℤ` vs singular `H¹ = 0` | hypothesis needed and present |
| 21 | DifferentialGeometry Layer 9 (:742), r18 | `S¹`; `ℝ² ∖ ℤ²`; main vs #886 | `dim H⁰_dR(S¹) = dim H¹_dR(S¹) = 1`; the angle forms `dθ_p`, `p ∈ ℤ²`, have independent periods on the noncompact `ℝ² ∖ ℤ²`, so `H¹_dR` is infinite-dimensional and "compact" is needed | holds; resolves on both |
| 22 | C3.2e `Pic^τ` (:2411–2412), r18 | `P¹`; elliptic `E`; Enriques, char ≠ 2; `B′ = Spec k[x₁,x₂,…]` | `Pic^τ(P¹) = 0`; `Pic^τ(E) = Pic⁰ ≅ E`; Enriques `Pic^τ = ℤ/2`; the non-Noetherian `B′` is outside Kleiman's convention | holds |
| 23 | C1.3 conventions, r18 | `e^{−\|z\|²}`; `[iΘ,Λ]` on `ℂ²` | `Θ = dz∧dz̄`; `dd_c = (i/2π)∂∂̄`; `p+q−n = −1, +1` | holds |
| 24 | `AnalyticTwist` (C1.7), r18 | `O(1)` on `P¹` | `h⁰ = 2`; reversed factor `h⁰ = 0` | holds |
| 25 | `regularSingularDeRhamComparison` (C5.6), r18 | residues `(−1,0)`, `(1,0)`, `(−1,+1)` | `H⁰ = H¹ = ℂ`; acyclic; acyclic | holds |
| 26 | Residue strip and monodromy (C5.6), r18 | `−1/4`; `3/4 + 3/4`; `1/4` | `3/4`; `1/2`; `−i` | holds |
| 27 | `curveResidueLocalization` (C5.7), r18 | `dz/z` on `G_m`; three punctures | `(2πi, −2πi)`; sum 0 | holds |
| 28 | C3.2 and C3.2b Checks, r18 | DVR `j_!O_η`; `k[[t]]`; non-qs `U` | not quasi-coherent; 0 vs `k((t))`; `H¹ ≠ 0` | holds |
| 29 | `compactEllipticHodge` (C5.3), r18 | `−d² − 2` on `S¹` | `⟨Pu,u⟩ + ‖u‖² = −‖u‖²` | holds |
| 30 | `chernFubiniStudyIntersection` (C5.4), r18 | affine-chart integral | `π⁻¹ · 2π · ½ = 1` | holds |
| 31 | `FineLogChart` (C5.5), r18 | `⟨2,3⟩`; `2ℕ`; `ℕ ∪ {∞}` | fine, not saturated; saturated; not integral | holds |

### Seeded sample

None of the 15 sampled targets is in the changed lines (:146, :4984–4988). The two that sit in C5.4, `CurrentCalculus` and `analyticSetLocalFiniteMass`, are in passages the diff does not touch. Their verification in r17 carries:

- SGA 1 XII 3.1, 3.2, 4.2–4.4 and 5.1;
- EGA IV₄ 16.7–16.8;
- Deligne 1968 (5.5.3)–(5.5.4);
- Demailly I §2 and III (1.1)–(2.7);
- Freitag I.2, I.6 and II.2;
- Deligne LNM 163 I.2.10–2.25;
- Sella's Theorem, Lemma 0.1, Example 0.3 and nestings;
- Hatcher §3.H;
- SGA 4 XI 3.1–4.6, XVI 4.1, XVII 5.3.5 and XVIII 2.8–3.2.5;
- Milne §21;
- Bhatt–Scholze §§6.5–6.8.

In this round I read only Demailly V.11.1–11.2, the locator behind the changed bullet.

### Citations, overlaps, ownership and order

- **Citation tool.** Against main `35884a8` and 467 open heads it found 0 unresolved cross-roadmap citations. Its 39 Lean-name leads are the same supplier target names as in r17 and r18; none is on a changed line.
- **Changed-line citations.** All resolve:
  - K4 on main (:444);
  - K3Surfaces §1.1 at #1285 :399;
  - GeometricQuantization §3.3 at #1186 :694;
  - CharacteristicClasses C1.5/C3/C4.1–C4.2 and SmoothBundlesConnections B6.1–B6.2, unchanged from r18.
- **Overlaps.** No other pull request changes this roadmap. No cited id is dropped, and none is defined only by an open revision.
- **All-heads search.** I searched every open head and main for `Pic_hol`, `K4.P`, `H¹(M,O_M^×)`, `H¹(M,O_Mˣ)` and "holomorphic exponential sequence". The hits are #1186 (2), #1224 (1), #1234 (20), #1285 (9), #1375 (1) and this pull request (6).
  - #1224 (SchubertGeometry, `79a11f99`) :38 disclaims all three objects.
  - #1398 (ComplexKahlerGeometry, `b55cf4d8`) has 0 hits.
  - #1807, #1808 and #1854 do not appear.
  - The other hits are R01.
- **Merge order.**
  - This roadmap is at `ORDER.txt:39`.
  - K3Surfaces is at :133, GeometricQuantization at :152 and K3SurfacesAndSymplecticBoundedness at :314.
  - ComplexKahlerGeometry is on main and precedes them all. This is why #1234 cannot cite C5.4 (R01).
- **Policy.** The changed lines have no LaTeX, pull-request number, process word or machine path; the gate's scanners agree.

## Not verifiable

- Nothing new. The diff touches no locator other than Demailly V.11.1–11.2, verified above.
- Carried from r18, all in untouched text:
  - Kleiman's published numbering "9.6.16" (C3.2e): the AMS chapter is paywalled; arXiv Theorem 6.16 on p. 58 was verified.
  - Kato, *Logarithmic structures of Fontaine–Illusie* (C5.5): no legal copy found.
  - Dimca, *Sheaves in Topology* (C6.1): paywalled.
  - Hironaka, *Triangulations of algebraic sets*, and Bochnak–Coste–Roy, Theorem 9.2.1 (C6.0): no open host; paywalled.

## Source issues

- none
