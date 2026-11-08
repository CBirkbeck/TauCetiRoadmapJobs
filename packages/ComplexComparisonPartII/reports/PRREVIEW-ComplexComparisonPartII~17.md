# Review of ComplexComparisonPartII (pull request #848 at 6723806)

**Verdict:** needs changes

This is a full review of the head the previous review read: the folder has not changed since then (0 changed lines). Main has moved to `b67091a7`, and the open heads of #886, #1234, #1285 and #1186 have moved. R01 is the previous review's R02, carried with the new heads. R02 is what remains of the previous R01 now that #886 has restored its Layers 8–9. R03 is new.

## Previous findings

- **Previous R01 (DifferentialGeometry Layers 8–9 dropped by #886): repaired, except for one declaration name.** The #886 head is now `6f270bfe`, and its `DifferentialGeometry/README.md` again has Layer 8 (:1725) and Layer 9 (:1835). 8.5 is "cited by consumers as deRhamEquiv" (:1824), so README :547 ("The de Rham theorem and Poincaré duality are DifferentialGeometry Layers 8–9"), :741, :3741 and :3753 resolve on main and at that head. The one exception is `finiteDimensional_deRhamCohomology` at README :742, which that head no longer names; see R02.
- **Previous R02 (two owners of the holomorphic exponential sequence): not repaired.** README :146 still reads "C5.4 is the single owner, on every complex manifold, of … the frame-torsor bijection … the holomorphic exponential sequence". #1234 (now `06e0a3f7`, :690) still claims K4.P, and K3Surfaces' head now adds a third assignment. Carried as R01 below.
- **Previous R03 (holomorphicPoincare route): repaired.** The previous review recorded this; the text is unchanged and I re-checked it below (row 18).

No repair report marks any of these findings `not actionable in this package`, so no finding below carries a `Re-raised:` line.

## R01 (P2) — The holomorphic exponential sequence and `Pic_hol ≅ H¹(O^×)` have more than one owner

**Location:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:146`: "C5.4 is the single owner, on every complex manifold, of the holomorphic-to-smooth forgetful adapter, the frame-torsor bijection from holomorphic line-bundle classes to `H¹(M,O_M^×)`, the holomorphic exponential sequence with its cocycle `δu`". The same claim is made at :89–93 (scope), :3709–3718 (C5.4) and :4982–4986 (consumers).

**Claim:** C5.4 is the only owner, on every complex manifold, of the frame-torsor bijection, the exponential sequence and the identification of the connecting map with the integral first Chern class.

**Witness:**

- #1234 (`06e0a3f7`), `ComplexKahlerGeometry/README.md:690–692`, says that K4.P owns, on every complex manifold, the exponential sequence, `Pic_hol(M)≃H¹(M,𝒪×)` and the `c₁` identification. Its :693–694 hands the segment to C5.4, and :769–770 repeats the ownership.
- #1285 (`5108929c`), `K3Surfaces/README.md:14–16`, assigns `Pic_hol(M)≃H¹(M,O_Mˣ)` to ComplexKahlerGeometry through its gap contract at :126–131.

**Context:**

- ComplexKahlerGeometry on main (`b67091a7`) has no K4.P and no exponential sequence: the README has 0 occurrences of `K4.P`, `exponential sequence` or `Pic_hol`.
- So K4.P exists only in a revision pull request, and a revision is never a dependency. This roadmap is therefore the admissible owner, and the three heads disagree:
  - this README gives all three items to C5.4;
  - #1234 gives all three to K4.P;
  - #1285 gives the frame-torsor bijection to ComplexKahlerGeometry and the exponential/Chern comparison to C5.4 (its :13–14).
- GeometricQuantization (#1186, `bcc56981`) cites C5.4 for the segment at :20, :714 and :743.
- SchubertGeometry (#1224) disclaims the objects at :36–40.
- The normalisation agrees everywhere it is stated: `c₁(O(−1))·[ℂP¹] = −1` (#1234 :696–698; this README :3760–3763).

**Repair:** Record one owner before either pull request merges. The smallest repair is a sentence in this pull request's merge-order paragraph:

- C5.4 owns the frame-torsor bijection, the holomorphic exponential sequence and the `c₁` identification on every complex manifold;
- #1234 drops K4.P's ownership sentences (:690–695, :769–770) or is rebased on this roadmap;
- K3Surfaces' gap contract at :126–131 is re-pointed to ComplexComparisonPartII C5.4.

The alternative is for this roadmap to cede the three items: name #1234 in the merge-order paragraph, cite K4.P for them, and keep in C5.4 only:

- the identification of `analyticPicardGroup` with `Pic_hol`;
- the explicit `δu` cocycle;
- the `O(±1)`, `O(p − q)` and Enriques Checks;

with :89–93, :146 and :4982–4986 rewritten to match.

## R02 (P3) — `finiteDimensional_deRhamCohomology` is a DifferentialGeometry name that the open revision drops

**Location:** `README.md:741–742`: "Layer 9: Poincaré duality and `finiteDimensional_deRhamCohomology` for compact manifolds".

**Claim:** DifferentialGeometry Layer 9 supplies a declaration named `finiteDimensional_deRhamCohomology`.

**Witness:** On main, `DifferentialGeometry/README.md:874` names it as a corollary of 9.3. At #886's head (`6f270bfe`), Layer 9 states the same fact unnamed ("Corollaries: `H^k_dR(M)` is finite-dimensional for compact `M`", :1870), and the name occurs 0 times in that README.

**Context:** No `*Needs:*` line of this README uses the name; it occurs only in this supplier-contract sentence. That is why this is P3, not the P2 a consumed supplier id would be. The overlap tool does not track declaration names, which is why it reports no dropped id.

**Repair:** Replace the backticked name with the content: "Layer 9: Poincaré duality and the finite-dimensionality of `H^k_dR(M)` for compact `M`". That wording resolves both on main (:874) and at the open head (:1870).

## R03 (P3) — Two typography slips in the C3.2e statement and locator

**Location:** `README.md:2411`: "with `B`′ locally Noetherian"; and `README.md:2412`: "whose standing conventions on `p`. 15 restrict all schemes".

**Claim:** The text is the base change `B′ → B` and Kleiman's page 15.

**Witness:** The prime sits outside the code span, so the base reads as `B` followed by a stray `′`. The page locator renders the letter `p` as code, followed by ". 15". `kleiman-picard` line 728 is the header of page 15, where the locally Noetherian conventions are stated (line 755). Theorem 6.16 is at line 2782, on p. 58.

**Repair:** Write "with `B′` locally Noetherian" and "whose standing conventions on p. 15 restrict all schemes".

## Verified sound

### Checks run

**Gate.** My run on this head printed the following and exited 0. The worker's run also records `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty, and no `design/plan.json` is readable, so no gaps are declared.

```text
gate ComplexComparisonPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

**Dependency check** (with `--movable`), in full. It printed no UPWARD, CYCLE or `moved:` line.

```text
depcheck: 238 roadmaps, 2353 edges, 0 problem(s)
```

**Lean** (pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`):

- `lake env lean` on `Suggested.lean` gives exactly four `declaration uses sorry` warnings, at lines 116, 127, 154 and 172, and nothing else.
- **Signatures.** A scratch copy with `#check @` for the four declarations elaborates. Their types are identical to the worker's signature file, and they agree with the README statements at C1.6 (:1712–1736) and C5.1 (:2762–2788, :2933–2948). No binder is lost:
  - `montelTheorem` carries `FiniteDimensional ℂ E`;
  - `schwartzFiniteness` carries the full Fréchet structure on both spaces;
  - `holomorphicPoincare` carries `IsManifold 𝓘(ℂ, E) ∞ M`;
  - `nonempty_sheafSingularComparison` carries `LocallyContractibleSpace T`.
- **One-tactic probe.** On the scratch copy I tried `first | rfl | (simp; done) | infer_instance | exact?` on each declaration. All four failed: `exact?` reports it could not close the goal. Nothing is padding.
- **Pinned carriers behind the headlines.** `TauCeti.montel` (`Analysis/Complex/Conformal/Montel/Basic.lean:58`) is one-variable only. The Riesz theorems (`RieszTheory.lean:160, :183`) cover only `g = id` on Banach spaces. So neither Lean statement restates the library.

**Headline theorems.** The README table (:46–53) lists 67 headline targets. The four statable ones are stated in `Suggested.lean`; the module docstring names each of the other 63, layer by layer, with the carrier it lacks. I checked against the pins that the absences are real:

- no complex analytic space or analytification;
- no complex-analytic subset predicate: the only "analytic set" declarations at the pin are descriptive-set-theory ones in `MeasureTheory/MeasurableSpace/Analytic.lean`;
- no sheaf complex of holomorphic forms.

The docstring's pinned names all resolve:

- `TauCeti.SmoothPair.AlgebraicChart` (`AlgebraicGeometry/SmoothPair/AlgebraicChart.lean:45`);
- `TauCeti.AlgebraicGeometry.Spaces.IsAlgebraicSpace` (`AlgebraicGeometry/AlgebraicSpace/Basic.lean:195`, inside `namespace Spaces` at :70);
- `TauCeti.LocalCoefficientSystem.twistedCochainComplex` and `TauCeti.mextDeriv_ofFunction_eq_zero_iff` (`DifferentialForm/ExtDeriv.lean:420`).

**Library declarations opened at the pins.**

- **Tau Ceti.** All 55 backticked `TauCeti.*` declaration names in the README elaborate under `#check`. The only token that does not elaborate is `TauCeti.AlgebraicGeometry`, which the README uses as a namespace. The README's `TauCeti.*` module paths all exist at the pin; `TauCeti.Analysis.Complex.RiemannSurface` is a directory of modules.
- **Mathlib.** 99 distinct Mathlib names the README cites elaborate, including:
  - `LocallyContractibleSpace` (`Topology/Homotopy/LocallyContractible.lean:81`: every neighbourhood `U` of `x` contains a neighbourhood `V` whose inclusion into `U` is null-homotopic);
  - `Manifold.IsSubmersion`, `Bundle.Trivialization.pullback`, `Module.free_of_flat_of_isLocalRing`, `KaehlerDifferential.ideal`;
  - `Distribution.mapCLM`, `Distribution.delta`, `Distribution.lineDerivCLM`;
  - `HasStrictFDerivAt.toOpenPartialHomeomorph`, `OpenPartialHomeomorph.analyticAt_symm'`, `OpenPartialHomeomorph.hasFPowerSeriesAt_symm`;
  - `AlgebraicGeometry.Scheme.AffineEtale`, `CategoryTheory.Functor.mapDerivedCategory`, `CategoryTheory.Abelian.Ext.mapExactFunctor`;
  - `AlgebraicGeometry.UniversallyClosed.eq_valuativeCriterion` and `CategoryTheory.Functor.sheafPullback` (`Sites/Pullback.lean:56`).
- The bare `Trivialization` of :3123 needs `Bundle.`; the same line's *Needs:* cites `Bundle.Trivialization.pullback`, so I raise nothing.
- **Mathlib's `LocallyContractibleSpace` agrees with Sella's "semi-locally contractible".** Sella's definition is that every open `U` is covered by opens contractible in `U` (`sella-comparison` lines 16–20).
  - Mathlib to Sella: given open `U` and `x ∈ U`, take `int V` for Mathlib's `V`; its inclusion into `U` factors through `V`.
  - Sella to Mathlib: apply Sella's condition to `int U` and take the member containing `x`.
  - So the Lean hypothesis is exactly the hypothesis of Sella's Theorem.

### Adversarial pass (computed)

| # | Statement | Instances | Values computed (left / right) | Result |
| --- | --- | --- | --- | --- |
| 1 | Riemann surface of a smooth curve (C1.9) | `P¹`; `G_m` vs `A¹`, `z ↦ z²`; nodal cubic; doubled origin | transition `z ↦ 1/z` on `ℂ*`; `d(z²)/dz` at 0 is 0, so no chart at 0, chart elsewhere; gradient `(−3x²−2x, 2y)` of `y²−x²(x+1)` is 0 at the node; two origins with no disjoint neighbourhoods | smooth and separated both used; holds |
| 2 | Curve GAGA maps (C1.9) | `E: y² = x³ − x`; `P¹`, `D = ∞`; `E ∖ {∞}`; surjectivity divisor | `x = y²/(x²−1)` with `x²−1 = −1` at `(0,0)`: order 2; order of `x` and `y` at ∞ is −2, −3; `div x = 2(0,0) − 2∞`, degree 0. Sections `a + bz`, dim 2 = `h⁰(O(1))`; reversed sign gives 0. `Pic(E∖∞) ≅ E(ℂ) ≠ 0` vs trivial holomorphic Pic. `E x = max(0, −ord_x h)` gives `−E x ≤ ord_x h` in both cases | holds; properness needed |
| 3 | `IsDifferentialOperator` (C5.1) | `ℂ[z]`; `𝔽₂[z]`, `𝔽₃[z]`; `P^m(k[z])` | `[d/dz, z]f = (zf)′ − zf′ = f`; in `𝔽₂`, the `t²`-coefficient of `(z+t)²` is 1 while `(d/dz)²z² = 2 = 0`; in `𝔽₃`, the `t³`-coefficient of `(z+t)⁴` is `4z = z`; `P^m = k[t]/(t^{m+1})`, jet `f(z+t)` | holds; matches EGA's `D(at) − aD(t)` |
| 4 | `artinDeRhamBetti` (C5.2) | `A = ℂ[ε]/ε²`, `X = P¹_A`; `X = Spec A` | `H⁰ = H² = A` (length 2 = `2·1`), `H¹ = 0`; complex `A` in degree 0 | holds; matches Deligne (5.5.4) |
| 5 | `CurrentCalculus` (C5.4) | Stokes sign; `ℂ` wedge; `\|z\|⁻²`; `d[Z]` | `d(α∧η) = dα∧η + (−1)^k α∧dη`, so `∫dα∧η = (−1)^{k+1}∫α∧dη`; `α∧η = (aψ − bφ)dx∧dy`; `∫₀^ε r⁻²·r dr = ∞`; `d[Z](η) = (−1)^{k+1}∫_{∂Z}η`, `k = 2n − dim Z` | all four Checks hold |
| 6 | `analyticSetLocalFiniteMass` (C5.4) | line in `ℂ²`; node `xy = 0`; metric comparison | `πR²` on `B(0,R)`, total ∞; `2πR²`, no atom; `c g ≤ h ≤ C g` gives `c^d μ_g ≤ μ_h ≤ C^d μ_g` on real dimension `2d` | holds; matches Demailly III.2.6 |
| 7 | Analytic log differentials (C5.5) | `ℂ{z,ε}/ε²`; `D(z)=0`, `D(eᶻ)=1`; log point | `d(ε²) = 2ε dε`, so `ε dε = 0`, `dε ≠ 0`; the derivation exists by extension through a transcendence basis of `Frac ℂ{z}` over `ℂ(z,eᶻ)`, but the chain rule forces `D(eᶻ) = eᶻD(z) = 0`; `ℂ·dlog t`, and 0 relative to itself | holds |
| 8 | `complexAlgebraicTopology` (C6.0) | `A¹`; `P¹` strata; node; doubled origin | contractible and noncompact; `ℂ*` a union of open simplices, not a subcomplex; conic neighbourhood at the node; not Hausdorff | holds |
| 9 | `topologicalCoefficientComparison` (C6.1) | `𝔽₃`, monodromy −1; `𝔽₅`, transport 2; `(0,1) ⊂ [0,1]`; `ℤ/2` over `ℤ/4` | `ker(−1 − 1) = ker(−2) = 0` in `𝔽₃`; `2·3 = 6 ≡ 1`; `H⁰_c = 0`, `H¹_c = coker(Λ → Λ²) = Λ`, `H¹ = 0`; `Tor_i = ℤ/2` for all `i`, not perfect | holds |
| 10 | `riemannExistence` (C6.2) | `z ↦ zⁿ` on `ℂ*`; `⊔ G_m` with `zⁿ` on the n-th copy | deck group `ℤ/n`; finite étale of unbounded degree, `n`-point fibres | locally-finite-type scope needed and supported (SGA 1 XII 5.1) |
| 11 | `artinComparison` (C6.3) | `G_m`, `Λ(1)`, `n ≥ 3`; `ℤ/4`, `K = ℤ/2` | Kummer class ↦ torsor with transport `e^{2πi/n}`; the negation gives `e^{−2πi/n} ≠ e^{2πi/n}` (equal for `n = 2`, hence `n ≥ 3`); `Tor_i = ℤ/2` for all `i`, in `Dᵇ_c` but outside ctf | holds; `IsIso` of the named map is needed |
| 12 | `artinComparisonCompactSupport` (C6.4) | `A¹`; conjugation on `P¹` | `H⁰_c = 0` vs `H⁰ = Λ`; `z ↦ z̄` has degree −1 | holds |
| 13 | `relativeArtinComparison` (C6.5) | `j: G_m ↪ A¹`, `μ_n`; `K = ⊕ (i_x)_*Λ` on `A¹`; `P¹` | stalk of `R¹j_*μ_n` at 0 is free of rank one; étale `H⁰` is the finitely supported functions, while the analytic `H⁰` contains `1_ℤ` (locally finite, infinite support), so the map is not surjective; on `P¹` both sides are finitely supported | constructibility needed in (i); holds |
| 14 | `artinSmoothTrace` (C6.5) | `A¹ ⊔ A¹ → pt`; `P¹` | `H²_c = Λ²`, trace `(a,b) ↦ a + b`, kernel `≅ Λ ≠ 0` for `n > 1`; `c₁(O(1)) ↦ 1` | holds |
| 15 | `adicArtinComparison` (C6.6) | torsion object; `P¹` | `ℤ/ℓ ⊗ ℚ_ℓ = 0`; `H²` of rank 1, trace 1 at every level | holds |
| 16 | `montelTheorem` (Lean) | `Ω = ∅`; `ℂ²`, `z₁ⁿ` on the bidisc; `ℓ²`, `⟨·, e_n⟩` | vacuous (`φ = id`, `g = 0`); sup ≤ 1, limit 0 locally uniformly; `sup_{B(0,r)} \|f_n − f_m\| ≥ r` for `n ≠ m`, no convergent subsequence | `FiniteDimensional` needed and present |
| 17 | `schwartzFiniteness` (Lean) | `ℂ`, `g = id`, `h = −id`; `ℓ²`, `g = id`, `h = −diag(1/n)`; `g = diag(1/n)`; `ℓ²`, `h = −id` | range 0, codimension 1; `diag(1−1/n)` has kernel `e₁`, closed range, codimension 1; dense non-closed range without surjectivity; range 0, codimension ∞ without compactness | both hypotheses used; holds |
| 18 | `holomorphicPoincare` (Lean) | `ℂ`, `α = dz`; `ℂ`, `dz̄`; `ℂ²`, `dz₁∧dz₂`; `E = 0` | `η = z`, of type `(0,0)`, with `∂̄z = 0` and `dz = α`; radial primitive `∫₀¹ z̄ dt = z̄`, not holomorphic (type hypothesis needed); `∫₀¹ t(z₁dz₂ − z₂dz₁) dt = (z₁dz₂ − z₂dz₁)/2`, and adding `d\|z₁\|²` adds the `(0,1)`-part `z₁dz̄₁`; `α = 0 = η` | holds; the route's type step derives `(k,0)` from complex multilinearity |
| 19 | `nonempty_sheafSingularComparison` (Lean) | point; `∅`; `S¹`, `ℤ`; Warsaw circle | `A` in degree 0 on both sides; 0 = 0; `H¹ = ℤ` on both sides; sheaf `H¹ = ℤ` vs singular `H¹ = 0` (not locally contractible) | hypothesis needed and present; matches Sella's Theorem |
| 20 | C5.4 exponential sequence (R01) | `O(1)` on `P¹`; `O(p − q)` on `E`; dual; Enriques `K`; metric change | `δ[O(1)]` is the positive generator, and `exp(−2πiu)` would flip it; `h⁰ = 0`, so `[L] ≠ 1` while `δ = 0`; `δ(−u) = −δu`; Bockstein ≠ 0 with real image 0; `(i/2π)Θ′ = (i/2π)Θ − (i/2π)∂∂̄φ` | mathematics holds; ownership is R01 |
| 21 | DifferentialGeometry citation (R02) | main `:874`; #886 `:1870` | name present; name absent, content present | R02 |
| 22 | C3.2e `Pic^τ` (R03) | `P¹`; elliptic `E`; Enriques, char ≠ 2 | `Pic^τ = 0` vs `Pic = ℤ`; `Pic^τ = Pic⁰ ≅ E`; `Pic⁰ = 0`, `Pic^τ = ℤ/2` | holds; typography only |
| 23 | C1.3 conventions | `e^{−\|z\|²}`; `[iΘ,Λ]` on `ℂ²` | `Θ = ∂∂̄\|z\|² = dz∧dz̄`; `dd^c = 2i∂∂̄`, so `dd_c = (i/2π)∂∂̄`; `p+q−n` is −1 on `(0,1)` and +1 on `(2,1)`; `(n,k)` eigenvalue `k` | holds |
| 24 | `AnalyticTwist` direction (C1.7) | `O(1)` on `P¹` | `e_j = (Z_j/Z_i)ᵏ e_i`, `h⁰ = 2` (`Z₀, Z₁`); the reversed factor gives `O(−1)`, `h⁰ = 0` | holds |
| 25 | `regularSingularDeRhamComparison` lattices (C5.6) | residues `(−1,0)`, `(1,0)`, `(−1,+1)` on `G_m` | `Ē = O(1)`, `d = diag(0,−1)`, so `H⁰ = H¹ = ℂ`; `O(−1)` in both terms, acyclic; `Ē = O`, `d = −1`, acyclic | holds |
| 26 | Residue strip and monodromy (C5.6) | `−1/4`; `3/4 + 3/4`; `1/4` | `3/4`; `1/2`; `e^{−πi/2} = −i` | holds |
| 27 | `curveResidueLocalization` (C5.7) | `dz/z` on `G_m`; three punctures | residues `(1,−1)`, periods `(2πi, −2πi)`; `a`, `b`, `−(a+b)`, sum 0 | holds |
| 28 | C3.2 and C3.2b Checks | DVR `j_!O_η`; `k[[t]]`, `O/tⁿ`; non-qs `U` over `∏ℂ` | `Γ = 0`, stalk ≠ 0, not quasi-coherent; sheaf limit 0 on `D(t)` vs `k((t))`; `(δ_ij) ∉ im(⊕A → ∏ e_i(⊕A))`, so `H¹ ≠ 0` while `H¹ = 0` for `M = A` | holds |
| 29 | `compactEllipticHodge` (C5.3) | `−d² − 2` on `S¹`, `u = 1`; `λ = 3` | `⟨Pu,u⟩ + ‖u‖² = −‖u‖²`; `‖u′‖² + ‖u‖²` | holds |
| 30 | `chernFubiniStudyIntersection` (C5.4) | affine-chart integral | `π⁻¹ · 2π · ∫₀^∞ r(1+r²)⁻² dr = π⁻¹ · 2π · ½ = 1` | holds |
| 31 | `FineLogChart` (C5.5) | `⟨2,3⟩ ⊂ ℤ`; `2ℕ`; `ℕ ∪ {∞}` | fine, not saturated (1 ∉ P, 2·1 ∈ P); saturated in `2ℤ`; `0 + ∞ = 1 + ∞`, not integral | holds |

### Sampled sources

Every listed target, and every locator I could read legally, was checked at its locator against the cached text:

- **The Riemann surface of a smooth complex curve; Curve GAGA as named maps.** SGA 1 XII (printed page = marker − 16):
  - Proposition 3.1, `sga1` line 9594, p. 244: étale, smooth, separated, open immersion;
  - Proposition 3.2, line 9639, p. 245: proper, finite;
  - Theorem 4.2, line 9738, p. 248; Corollary 4.3, line 9801;
  - Theorem 4.4, line 9805, pp. 249–250.
- **`IsDifferentialOperator`.** EGA IV₄ (printed = marker + 1):
  - §16.7 from `ega4-4` line 1260, p. 36;
  - (16.8.1) line 1371, p. 39;
  - 16.8.8 b), the commutator `D(at) − aD(t)`, line 1489, p. 42;
  - 16.8.9 and (16.8.9.2), lines 1526 and 1537, pp. 42–43.
- **`artinDeRhamBetti`.** Deligne 1968, Lemme (5.5.3) and (5.5.4), `deligne-lefschetz-1968` lines 689 and 701, p. 124; Théorème (5.5) at line 651, p. 123.
- **`CurrentCalculus`; `analyticSetLocalFiniteMass`.** Demailly (printed = marker):
  - I §2.A, `demailly-agbook` line 498, p. 13; §2.D.3, line 818, p. 19; (3.20), line 1095, p. 25;
  - III (1.1) at line 6463, p. 130, through (1.14), p. 133; (1.21)–(1.22), pp. 135–136;
  - III (2.2)–(2.3), lines 6885 and 6928, pp. 138–140; (2.5)–(2.7), lines 6990–7027, p. 140.
  - Lemma 2.6 is Lelong's finite mass via finite-sheet projections.
- **Analytic cotangent and logarithmic differentials.**
  - Freitag (printed = marker − 3): I.2 p. 2, I.6 p. 16 (`freitag-complex-spaces` line 650, with Lemma 6.2 on substitution at line 695), II.2 p. 47 (Remark 2.4, line 1827).
  - Deligne 1970 (printed = marker − 3): I.2.10 at `deligne-lnm163` line 312, p. 9; I.2.22 at line 474, p. 14.
  - Kato is under *Not verifiable*.
- **`complexAlgebraicTopology`.** The SGA 1 XII part is verified as above; Hironaka and Bochnak–Coste–Roy are under *Not verifiable*.
- **`topologicalCoefficientComparison`.**
  - Sella: Theorem, `sella-comparison` lines 45–47, p. 2; Lemma 0.1, line 69, pp. 2–3; Example 0.3, line 157, p. 5; nestings, line 188, p. 6.
  - Hatcher §3.H, direct cochains, `hatcher-at` lines 14576–14589, pp. 333–334.
  - Dimca is under *Not verifiable*.
- **`riemannExistence`.** SGA 1 XII Théorème 5.1, `sga1` line 9872, p. 251, stated for `X` locally of finite type.
- **`artinComparison`.**
  - SGA 4 (printed = marker − 9): XI Définition 3.1 and Proposition 3.3, `sga4` lines 24606 and 24629, p. 549; Théorème 4.4, line 24767, p. 552; Variante 4.6, line 24818, p. 553.
  - Milne v2.21: Theorems 21.1 and 21.5, Definition 21.7 and Proposition 21.8 at `milne-lec` lines 5007, 5094, 5142 and 5154, in §21, pp. 130–134.
- **`artinComparisonCompactSupport`.** SGA 4 XVII Corollaire 5.3.5, `sga4` line 31745, p. 705: separated finite type over `ℂ`, any torsion `F`.
- **`relativeArtinComparison`.** SGA 4 XVI Théorème 4.1, `sga4` line 28350, p. 638: `f` of finite type between schemes locally of finite type over `ℂ`, with (i) `f` proper or (ii) `F` constructible. This matches clauses (i)–(ii) as written.
- **`artinSmoothTrace`.** SGA 4 XVIII: 2.8 at `sga4` line 37190, Théorème 2.9 (trace axioms) at line 37209, Proposition 2.10 at line 37405, Théorème 3.2.5 at line 38315.
- **`adicArtinComparison`.** Bhatt–Scholze v2: §6.5, `bhatt-scholze-proetale` line 2294; §6.7 (six functors), line 2579; §6.8 (`ℤ_ℓ`/`ℚ_ℓ`-sheaves), line 2757.
- **Also checked:**
  - Deligne 1968 (4.2) and Proposition 4.3 (lines 515 and 521, p. 120) and Proposition 5.3 (line 577, pp. 121–123), for `properPureHodge`;
  - Deligne 1970 I.2.19 (line 442, p. 13), I.2.23 and 2.23.2–2.23.3 (lines 490–552, pp. 14–17) and I.2.25 (line 651, p. 19), for `holomorphicPoincare` and `relativeBettiLocalSystem`;
  - Kleiman Theorem 6.16 (`kleiman-picard` line 2782, p. 58).
- The texts read here that the package manifest does not record are those the previous reviews used (`deligne-lnm163` from the IAS institutional copy; the others from Numdam, author pages or arXiv). I recorded them only in a scratch manifest; this review edits no manifest.

### Cross-roadmap citations, ownership and order

**Cross-roadmap citations resolved on main (`b67091a7`).**

- EtaleCohomologyFoundations:
  - §0.11 `ClassicalAlgebraic.smoothTrace` (:1157–1159);
  - §§F.0–F.4 `VanishingCycles.finiteEtaleGaloisCategory`, `normalizedAdicSystems`, `lisseDirectImageTransport`, `etaleProetaleAdicComparison`;
  - §§G.1–G.3 `nagataCompactification`, `compactificationCommonRefinement`;
  - §0.8 `ClassicalAlgebraic.properSupports`.
- EnhancedDerivedSheaves: `perfect_proper_pushforward`, `adjointFunctorTheorem`, `ClassicalDerived.enhancedCategory`, `derivedCompletion`.
- DerivedModuleAlgebra: `perfectInverseSystemEffectivity`.
- CharacteristicClasses: `cechSingularCWTypeComparison` (:640) and C1.2a.
- Hyperfunctions: HF3a.
- AffineMorseLefschetz: `finite_semialgebraic_triangulation`.
- RealAnalyticGeometry: R3.2.
- ComplexKahlerGeometry: K4.ComponentwiseFiniteRankAssembly (:517), `BundleDistribution`, K5b.0, K6.0.
- GeometricCurrents G1; SmoothBundlesConnections B1.5 and B6.2; ComplexManifolds Milestone 7.
- ResolutionOfSingularitiesCharacteristicZero §6.4 (now on main).
- ModularCurves: `cartierDualBaseChangeIso`.
- SchemeAndStackFoundations: `cech_to_cohomology`, `torIndependent_baseChange`, `relativeDualizingModule_smooth`.
- AlgebraicTopology Stage 6.1; Completed UniversalCovers, HodgeStructures and RealAlgebraicGeometry.

The citation tool's 39 Lean-name leads are of two kinds:

- target names of those supplier roadmaps (`VanishingCycles.*`, `ClassicalDerived.*`, `ClassicalAlgebraic.*`, `spaceDQCoh.*`, `DeRham.*`, `ModuliDescent.*`, `ProjectiveBundles.*`), not library declarations;
- `TauCeti.Analysis.Fredholm.CompactPerturbation`, a module whose file exists at the pin.

**Ownership against the open pull requests.**

- Of the closest roadmaps in vocabulary, #1234 is R01. ComplexKahlerGeometry #1398 (`4f5ca964`) makes no exponential-sequence claim. #1807, #1808 and #1854 have no checkout in this brief; the tool search over all open heads finds no further owner of the exponential sequence or the frame-torsor bijection beyond #1234, #1285, #1186 and #1224 (R01).
- A tool search for competing ownership of Riemann existence, Artin comparison, GAGA, analytification, the holomorphic Poincaré lemma, Chow's theorem, Remmert, Riemann–Hilbert, Gauss–Manin or the sheaf–singular comparison finds only #196's `ComplexComparison` (another author, `4bd7237`). Its scope duplicates C-1.1 and C6. It is not in `ORDER.txt`, and it depends on CohomologicalPointCounting, which this roadmap may never cite. So, as recorded in an earlier round, this roadmap is the admissible owner. I agree and raise nothing.

**Merge order.**

- This roadmap is at `ORDER.txt:39`.
- Its suppliers that are not on main come earlier: DerivedDeRhamCohomology :22, CrystallineCohomology :23, AlgebraicModuliForArithmeticGeometry :34.
- Its named consumers come later: FormalConnectionsOpers :40, InverseGaloisAndArithmeticFundamentalGroups :53, LefschetzPencilsAndVanishingCycles :67, MotivesAndAlgebraicCycles :90, ShimuraVarieties :104, K3Surfaces :134, GeometricQuantization :152.
- DeRhamCohomologyAndDuality (:393) is not cited.

**Policy.**

- No LaTeX, `lemma`, pull-request number, round label, process word or machine path. The two occurrences of "removed" (:1890, :2643) are mathematical.
- Imports are `Mathlib` plus six existing `TauCeti.*` modules, each used.
- No `set_option`, sorry'd data or copied passage.

## Not verifiable

- K. Kato, *Logarithmic structures of Fontaine–Illusie* (1989), §§1.1–1.9 and 2.1–3.13 (C5.5, including the sampled analytic log-differentials target): the sources service found no legal copy (Johns Hopkins University Press volume).
- A. Dimca, *Sheaves in Topology* (2004), §§2.1–2.5, 3.2, 4.1 (sampled C6.1): paywalled.
- H. Hironaka, *Triangulations of algebraic sets* (1975), and Bochnak–Coste–Roy, *Real Algebraic Geometry*, Theorem 9.2.1 (sampled C6.0): no open host; paywalled.
- Kleiman's published numbering "9.6.16" (C3.2e): the AMS chapter is paywalled. The arXiv Theorem 6.16 on p. 58 is verified above.

## Source issues

- **Misprint** in deligne-lnm163 at II.5.3, printed p. 94: the paragraph that chooses the section `τ` of `ℂ → ℂ/ℤ` and displays (5.3.1) is printed with the number 4.3; it should be 5.3, as Proposition 5.4 ("τ comme en 5.3") refers to it; affects nothing.
