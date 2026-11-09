# Review of ComplexComparisonPartII (pull request #848 at 9cd29e4)

**Verdict:** needs changes

This is an incremental re-review of the 8 changed lines since `6723806`. All of them are in `README.md`, at lines 146, 742, 2411 and 2412; `Suggested.lean` is unchanged. R02 and R03 of the previous review are repaired. R01 is partly repaired and is carried below as R01.

## R01 (P2) — The frame-torsor bijection, the holomorphic exponential sequence and the `c₁` identification still have more than one owner

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:146`: "C5.4 is the single owner, on every complex manifold, of … the frame-torsor bijection from holomorphic line-bundle classes to `H¹(M,O_M^×)`, the holomorphic exponential sequence … ComplexKahlerGeometry K4 … states neither the group of their isomorphism classes, nor `H¹(M,O_M^×)`, nor the exponential sequence". The same ownership is claimed at :90–93 and :3709–3719.

**Claim:** C5.4 is the only owner of the three items on every complex manifold, and ComplexKahlerGeometry K4 states none of them.

**Witness:** #1234 (ComplexKahlerGeometry, `06e0a3f7`), README:690–693: "K4.P owns, on every complex manifold, the holomorphic exponential sequence, the isomorphism `Pic_hol(M)≃H¹(M,𝒪×)`" and supplies the segment to C5.4. #1285 (K3Surfaces, `2ddcd6b`), README:156–160, declares `gap:integral-topology` on ComplexKahlerGeometry for that isomorphism.

**What the repair did and did not change:**

- **The new sentence is true on main** (`35884a8`). K4 is `ComplexKahlerGeometry/README.md:444–567`. It has the fixed-rank section/reconstruction equivalence at :459–470 and the Chern connection at :479. In the whole main README, "exponential sequence", `Pic_hol`, `𝒪×`, `O^×` and `O_M^×` occur 0 times.
- **It records the boundary with main, which was not in dispute.** The previous review's context already noted that main has no K4.P.
- **It records no settlement with the open heads that claim the same objects.** The pull request's merge-order paragraph still names none of #1234, #1285 or #1375.
- **#1234's head has not changed since the previous review (`06e0a3f7`).** Its ownership sentences are still at :690–693 and :769–770. If #1234 merges as it stands, the new sentence at :146 becomes false.

**Who each head names as owner:**

| Object | Owner named | Where |
| --- | --- | --- |
| Exponential sequence and `c₁` identification | C5.4 | this README; #1285 :13–14 and :175–176; #1375 (`c1d6da0`) :13; #1186 (`be6ed5f`) :20, :217, :719 |
| Exponential sequence and `c₁` identification | K4.P | #1234 |
| Frame-torsor bijection `Pic_hol(M) ≃ H¹(M,O_M^×)` | C5.4 | this README alone |
| Frame-torsor bijection `Pic_hol(M) ≃ H¹(M,O_M^×)` | ComplexKahlerGeometry | #1234 (as K4.P); #1285 (as a gap, :14–16 and :156–176); #1375 :13 ("K3Surfaces' contract with ComplexKahlerGeometry") |

SchubertGeometry (#1224, :38–40) disclaims all three items, so it does not conflict.

**Repair:** Keep C5.4 as the owner. With :146, the README side is complete and needs no further edit. Record the settlement in this pull request's merge-order paragraph:

> Ownership: ComplexComparisonPartII C5.4 is the single owner, on every complex manifold, of `Pic_hol(M) ≃ H¹(M,O_M^×)`, the holomorphic exponential sequence and its `c₁` identification. #1234 drops K4.P's ownership sentences (README:690–693, :769–770) and cites C5.4, or is rebased on this roadmap. #1285 re-points `gap:integral-topology` (README:156–176) to ComplexComparisonPartII C5.4, and #1375 re-points README:13 to C5.4.

Tested on the three refuting lines: with this paragraph, each of #1234 :690, #1285 :156 and #1375 :13 is listed with the edit that makes it cite the one owner.

**Alternative:** cede only the frame-torsor bijection to ComplexKahlerGeometry, as #1285 and #1375 already do.

- In this pull request:
  - name #1234 in the merge-order paragraph;
  - cite K4.P for `Pic_hol(M) ≃ H¹(M,O_M^×)`;
  - keep in C5.4 the exponential sequence, the `δu` cocycle and the `c₁` identification;
  - rewrite :90–93, :146 and :3709–3719 to match.
- #1234 must still drop its claim to the exponential sequence and the `c₁` identification.

## Previous findings

- R01 — partly repaired: :146 adds "ComplexKahlerGeometry K4 supplies the holomorphic line bundles and their Chern connection, and states neither the group of their isomorphism classes, nor `H¹(M,O_M^×)`, nor the exponential sequence"; true on main, but #1234 :690 and #1285 :156 still claim them (R01 above).
- R02 — repaired: :742 now reads "Layer 9: Poincaré duality and the finite-dimensionality of `H^k_dR(M)` for compact `M`", which resolves on main (`DifferentialGeometry/README.md:874`) and at #886's head `4d6e96e` (:1902).
- R03 — repaired: :2411 reads "with `B′` locally Noetherian" and :2412 reads "whose standing conventions on p. 15 restrict all schemes"; both are typographically correct and match `kleiman-picard` lines 727 and 749.

No repair report marks any finding `not actionable in this package`, so R01 carries no `Re-raised:` line.

## Verified sound

### Gate, dependency check and Lean

- **Gate.** My run on `9cd29e4` printed the following and exited 0. The worker's run on the same head also records `build=0`.

  ```text
  gate ComplexComparisonPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

- **Dependency check** (with `--movable`), in full. It printed no UPWARD, CYCLE or `moved:` line, and exited 0.

  ```text
  depcheck: 239 roadmaps, 2364 edges, 0 problem(s)
  ```

- **Diff scope.** `git diff --stat origin/main...HEAD` outside the folder is empty. `git diff --stat 6723806 HEAD` lists only `README.md`. No `design/plan.json` is readable, so no gaps are declared.
- **Pins.** Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, unchanged since the previous head.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives exactly four `declaration uses sorry` warnings, at lines 116, 127, 154 and 172, and nothing else (exit 0).
- **Signatures.** A scratch copy with `#check @` for the four declarations elaborates. The types are identical to the worker's signature file, and no binder is lost:
  - `montelTheorem` keeps `[FiniteDimensional ℂ E]`;
  - `schwartzFiniteness` keeps the complete metrizable locally convex Hausdorff structure on `E` and `F`;
  - `holomorphicPoincare` keeps `IsManifold 𝓘(ℂ, E) ∞ M`;
  - `nonempty_sheafSingularComparison` keeps `LocallyContractibleSpace T`.
- **One-tactic probe.** The file and the pins are unchanged, so the previous review's probe carries: `rfl`, `simp`, `infer_instance` and `exact?` close none of the four, and nothing is padding.
- **Headline theorems.** The headline table (:46–53) and the module docstring are untouched. The previous count carries: 67 headline targets, 4 stated, 63 named in the docstring with the carrier each lacks.

### The changed passages

1. **:146, the K4 boundary sentence.**
   - On main (`35884a8`), `ComplexKahlerGeometry/README.md` has K4 at :444–567:
     - the fixed-rank section/reconstruction equivalence for holomorphic-transition `VectorBundle ℂ F` at :459–470, which in rank one gives the line bundles;
     - existence and uniqueness of the Chern connection at :479;
     - 0 occurrences, in the whole README, of "exponential sequence", `Pic_hol`, `𝒪×`, `O^×` or `O_M^×`. The only Picard mention, `Pic(ℂP¹)` at :1457, is outside K4 and states nothing.
   - The sentence agrees with this README's own supplier contract:
     - :705–707: K4 supplies the section/reconstruction equivalence and the Chern connection;
     - :721–722: ComplexManifolds 7.1–7.3 supply the holomorphic gluing to K4.
   - It also agrees with C5.4 (:3709–3719), which constructs the frame-torsor bijection itself (Demailly V.11.1–11.2).
   - It is in `## Scope and ownership` (:56–380), the right place for an ownership statement.
2. **:742, the DifferentialGeometry layer map.** Every layer it names resolves on main and at #886's head `4d6e96e`:

   | Layer | Main (heading; cited content) | #886 head (heading; cited content) |
   | --- | --- | --- |
   | 0 | :268 | :464 |
   | 1 | :311 | :613 |
   | 2 | :341 | :732 |
   | 5 | :503 | :1070 |
   | 8 | :816; `deRhamEquiv` :852 | :1757; "cited as deRhamEquiv" :1856 |
   | 9 | :862; finite-dimensionality :874 | :1867; corollary :1902 |
   | 12 | :910; `laplaceBeltrami` :921 | :2023; `laplaceBeltrami` :2075 |

3. **:2411–2412, C3.2e.**
   - `kleiman-picard` line 727 is the p. 15 marker; line 749 says the notes work only with locally Noetherian schemes.
   - Theorem 6.16 is at line 2782 (p. 58 marker at line 2759).
     - Hypotheses: `f` projective Zariski-locally over `S`, flat, with integral geometric fibres.
     - Conclusion: `Pic^τ` is an open and closed group subscheme of finite type, and its formation commutes with changing `S`.
   - The README's hypotheses and conclusions match. "pp. 58–59" covers the proof.

### Adversarial pass (computed)

Rows 20–22 are the changed statements, recomputed on this head. The other rows are carried from the previous report (r17), whose statements the diff leaves untouched.

| # | Statement | Instances | Values computed (left / right) | Result |
| --- | --- | --- | --- | --- |
| 20 | C5.4 frame-torsor bijection and exponential sequence; K4 boundary (:146, changed) | point; `ℂ*`; `E = ℂ/Λ`; `O(1)` on `P¹`; main and open heads | Point: `H¹(pt,O^×) = 0`, one class `[O]`. `ℂ*`: `H¹(ℤ)=ℤ → H¹(O)=0 → H¹(O^×) → H²(ℤ)=0`, so `Pic_hol(ℂ*) = 0` with no compactness. `E`: `ℂ → ℂ^×` is onto, so `0 → ℤ² → ℂ → Pic → ℤ → H²(O)=0` and `Pic⁰ = ℂ/ℤ² ≅ E`, `NS = ℤ`. `δ[O(1)] = +1` vs `−1` for `exp(−2πiu)`. Main: 0/0/0 hits for exponential sequence, `Pic_hol`, `O^×`. #1234 :690 says K4.P; #1285 :156 a gap on CKG; #1375 :13 CKG | mathematics holds; the sentence is true on main; ownership is R01 |
| 21 | DifferentialGeometry Layer 9 (:742, changed) | `S¹`; `ℝ² ∖ ℤ²`; main vs #886 | `dim H⁰_dR(S¹) = dim H¹_dR(S¹) = 1`; on the noncompact `ℝ² ∖ ℤ²` the angle forms `dθ_p`, `p ∈ ℤ²`, have independent periods, so `H¹_dR` is infinite-dimensional and "compact" is needed; content at main :874 and #886 :1902 | holds; resolves on both |
| 22 | C3.2e `Pic^τ` (:2411–2412, changed) | `P¹`; elliptic `E`; Enriques, char ≠ 2; `B′ = Spec k[x₁,x₂,…]` | `Pic(P¹) = ℤ` by degree, `Pic^τ = 0`; `Pic^τ(E) = Pic⁰ ≅ E`, `NS(E) = ℤ`; Enriques: `h¹(O) = 0` gives `Pic⁰ = 0`, torsion of `NS` is `ℤ/2 = ⟨K⟩`, so `Pic^τ = ℤ/2`; the non-Noetherian `B′` is outside Kleiman's convention (line 749) and the README excludes it | holds; locators verified |
| 1 | Riemann surface of a smooth curve (C1.9), r17 | `P¹`; `G_m` vs `A¹`, `z ↦ z²`; nodal cubic; doubled origin | transition `z ↦ 1/z` on `ℂ*`; `d(z²)/dz` at 0 is 0, so no chart at 0; gradient `(−3x²−2x, 2y)` of `y²−x²(x+1)` is 0 at the node; two origins with no disjoint neighbourhoods | smooth and separated both used; holds |
| 2 | Curve GAGA maps (C1.9), r17 | `E: y² = x³ − x`; `P¹`, `D = ∞`; `E ∖ {∞}` | `div x = 2(0,0) − 2∞`, degree 0; sections `a + bz`, dim 2 = `h⁰(O(1))`, reversed sign gives 0; `Pic(E∖∞) ≅ E(ℂ) ≠ 0` vs trivial holomorphic Pic | holds; properness needed |
| 3 | `IsDifferentialOperator` (C5.1), r17 | `ℂ[z]`; `𝔽₂[z]`, `𝔽₃[z]`; `P^m(k[z])` | `[d/dz, z]f = f`; in `𝔽₂` the `t²`-coefficient of `(z+t)²` is 1 while `(d/dz)²z² = 0`; in `𝔽₃` the `t³`-coefficient of `(z+t)⁴` is `z`; `P^m = k[t]/(t^{m+1})` | holds; matches EGA's `D(at) − aD(t)` |
| 4 | `artinDeRhamBetti` (C5.2), r17 | `A = ℂ[ε]/ε²`, `X = P¹_A`; `X = Spec A` | `H⁰ = H² = A` (length 2), `H¹ = 0`; complex `A` in degree 0 | holds; matches Deligne (5.5.4) |
| 5 | `CurrentCalculus` (C5.4), r17 | Stokes sign; `ℂ` wedge; `\|z\|⁻²`; `d[Z]` | `∫dα∧η = (−1)^{k+1}∫α∧dη`; `α∧η = (aψ − bφ)dx∧dy`; `∫₀^ε r⁻²·r dr = ∞`; `d[Z](η) = (−1)^{k+1}∫_{∂Z}η` | all four Checks hold |
| 6 | `analyticSetLocalFiniteMass` (C5.4), r17 | line in `ℂ²`; node `xy = 0`; metric comparison | `πR²` on `B(0,R)`; `2πR²`, no atom; `c^d μ_g ≤ μ_h ≤ C^d μ_g` | holds |
| 7 | Analytic log differentials (C5.5), r17 | `ℂ{z,ε}/ε²`; `D(eᶻ)=1` with `D(z)=0`; log point | `ε dε = 0`, `dε ≠ 0`; the chain rule forces `D(eᶻ) = 0`; `ℂ·dlog t`, and 0 relative to itself | holds |
| 8 | `complexAlgebraicTopology` (C6.0), r17 | `A¹`; `P¹` strata; node; doubled origin | contractible noncompact; `ℂ*` not a subcomplex; conic neighbourhood; not Hausdorff | holds |
| 9 | `topologicalCoefficientComparison` (C6.1), r17 | `𝔽₃` monodromy −1; `𝔽₅` transport 2; `(0,1) ⊂ [0,1]`; `ℤ/2` over `ℤ/4` | `ker(−2) = 0` in `𝔽₃`; `2·3 ≡ 1`; `H¹_c = Λ`, `H¹ = 0`; `Tor_i = ℤ/2` for all `i` | holds |
| 10 | `riemannExistence` (C6.2), r17 | `z ↦ zⁿ` on `ℂ*`; `⊔ G_m` | deck group `ℤ/n`; unbounded degree | locally-finite-type scope supported (SGA 1 XII 5.1) |
| 11 | `artinComparison` (C6.3), r17 | `G_m`, `Λ(1)`, `n ≥ 3`; `ℤ/4`, `K = ℤ/2` | `e^{2πi/n} ≠ e^{−2πi/n}` for `n ≥ 3`; in `Dᵇ_c` but outside ctf | holds |
| 12 | `artinComparisonCompactSupport` (C6.4), r17 | `A¹`; conjugation on `P¹` | `H⁰_c = 0` vs `H⁰ = Λ`; degree −1 | holds |
| 13 | `relativeArtinComparison` (C6.5), r17 | `j: G_m ↪ A¹`; `⊕ (i_x)_*Λ`; `P¹` | stalk of `R¹j_*μ_n` free of rank one; `1_ℤ` not in the étale `H⁰`; both sides finitely supported on `P¹` | constructibility needed in (i); holds |
| 14 | `artinSmoothTrace` (C6.5), r17 | `A¹ ⊔ A¹ → pt`; `P¹` | `H²_c = Λ²`, trace `(a,b) ↦ a + b`; `c₁(O(1)) ↦ 1` | holds |
| 15 | `adicArtinComparison` (C6.6), r17 | torsion object; `P¹` | `ℤ/ℓ ⊗ ℚ_ℓ = 0`; `H²` rank 1, trace 1 | holds |
| 16 | `montelTheorem` (Lean), r17 | `Ω = ∅`; `ℂ²`, `z₁ⁿ`; `ℓ²`, `⟨·, e_n⟩` | vacuous; limit 0 locally uniformly; `sup_{B(0,r)} \|f_n − f_m\| ≥ r`, no convergent subsequence | `FiniteDimensional` needed and present |
| 17 | `schwartzFiniteness` (Lean), r17 | `ℂ`, `h = −g = −id`; `ℓ²`, `h = −diag(1/n)`; `g = diag(1/n)`; `h = −id` on `ℓ²` | codimension 1; kernel `e₁`, codimension 1; dense non-closed range; codimension ∞ | both hypotheses used; holds |
| 18 | `holomorphicPoincare` (Lean), r17 | `ℂ`, `dz`; `ℂ`, `dz̄`; `ℂ²`, `dz₁∧dz₂`; `E = 0` | `η = z`; radial primitive `z̄`, not holomorphic; `(z₁dz₂ − z₂dz₁)/2`; `α = 0 = η` | holds |
| 19 | `nonempty_sheafSingularComparison` (Lean), r17 | point; `∅`; `S¹`; Warsaw circle | `A` = `A`; 0 = 0; `ℤ` = `ℤ`; sheaf `H¹ = ℤ` vs singular `H¹ = 0` | hypothesis needed and present |
| 23 | C1.3 conventions, r17 | `e^{−\|z\|²}`; `[iΘ,Λ]` on `ℂ²` | `Θ = dz∧dz̄`; `dd_c = (i/2π)∂∂̄`; `p+q−n = −1, +1` | holds |
| 24 | `AnalyticTwist` (C1.7), r17 | `O(1)` on `P¹` | `h⁰ = 2`; reversed factor `h⁰ = 0` | holds |
| 25 | `regularSingularDeRhamComparison` (C5.6), r17 | residues `(−1,0)`, `(1,0)`, `(−1,+1)` | `H⁰ = H¹ = ℂ`; acyclic; acyclic | holds |
| 26 | Residue strip and monodromy (C5.6), r17 | `−1/4`; `3/4 + 3/4`; `1/4` | `3/4`; `1/2`; `−i` | holds |
| 27 | `curveResidueLocalization` (C5.7), r17 | `dz/z` on `G_m`; three punctures | `(2πi, −2πi)`; sum 0 | holds |
| 28 | C3.2 and C3.2b Checks, r17 | DVR `j_!O_η`; `k[[t]]`; non-qs `U` | not quasi-coherent; 0 vs `k((t))`; `H¹ ≠ 0` | holds |
| 29 | `compactEllipticHodge` (C5.3), r17 | `−d² − 2` on `S¹` | `⟨Pu,u⟩ + ‖u‖² = −‖u‖²` | holds |
| 30 | `chernFubiniStudyIntersection` (C5.4), r17 | affine-chart integral | `π⁻¹ · 2π · ½ = 1` | holds |
| 31 | `FineLogChart` (C5.5), r17 | `⟨2,3⟩`; `2ℕ`; `ℕ ∪ {∞}` | fine, not saturated; saturated; not integral | holds |

### Seeded sample

None of the 15 sampled targets is in the changed lines (146, 742, 2411, 2412). Their verification in r17 carries:

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

In this round I re-read only the changed locator: Kleiman p. 15 and Theorem 6.16.

### Citations, overlaps, ownership and order

- **Citation tool.** Run against main `a8eadd4` and 466 open heads, it found 0 cross-roadmap citations unresolved. Its 39 Lean-name leads are the same supplier target names as in r17:
  - 23 `VanishingCycles.*`, 5 `spaceDQCoh.*`, 4 `ClassicalDerived.*`, 3 `ClassicalAlgebraic.*`, 1 `DeRham.*`, 1 `ModuliDescent.*`, 1 `ProjectiveBundles.*`;
  - the module `TauCeti.Analysis.Fredholm.CompactPerturbation`, whose file exists at the pin.
- **Main has moved.** It is now `35884a8` (r17 read `b67091a7`). `git diff --stat a8eadd4 HEAD` of ComplexKahlerGeometry and DifferentialGeometry is empty.
- **Overlaps.** No other pull request changes this roadmap. No cited id is dropped, and none is defined only by an open revision.
- **Closest roadmaps in vocabulary.**
  - #1234 (ComplexKahlerGeometry, `06e0a3f7`) is R01.
  - #1398 (ComplexKahlerGeometry, now `b55cf4d8`) has 0 occurrences of K4.P, `Pic_hol` or "exponential sequence".
  - #1807, #1808 and #1854 do not appear in an all-heads search for `Pic_hol`, frame-torsor or the holomorphic exponential sequence. That search returned:
    - #1234, #1285, #1375, #1186 and #1224 (R01);
    - unrelated "frame-torsor" uses in #1841, #1831, #1511 and #1084.
- **Merge order.**
  - This roadmap is at `ORDER.txt:39`.
  - Its suppliers that are not on main come earlier: DerivedDeRhamCohomology :22, CrystallineCohomology :23, AlgebraicModuliForArithmeticGeometry :34.
  - The roadmaps that cite C5.4 come later: K3Surfaces :133, GeometricQuantization :152, K3SurfacesAndSymplecticBoundedness :313.
  - ComplexKahlerGeometry is on main.
- **Policy.** The changed lines have no LaTeX, pull-request number, process word or machine path; the gate's scanners agree.

## Not verifiable

- Kleiman's published numbering "9.6.16" (C3.2e, a changed line): the AMS chapter is paywalled. The arXiv Theorem 6.16 on p. 58 is verified above.
- Carried from r17 and untouched by the diff:
  - Kato, *Logarithmic structures of Fontaine–Illusie* (C5.5): no legal copy found.
  - Dimca, *Sheaves in Topology* (C6.1): paywalled.
  - Hironaka, *Triangulations of algebraic sets*, and Bochnak–Coste–Roy, Theorem 9.2.1 (C6.0): no open host; paywalled.

## Source issues

- none
