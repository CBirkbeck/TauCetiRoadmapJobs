# Review of AutomorphicGaloisRepresentations (pull request #1007 at 34d87ef)

**Verdict:** needs changes

This is an incremental re-review of the 97 lines changed since f8d3cf8. It finds one P3 and nothing blocking. The P3 was introduced by the rewrite of the `Suggested.lean` docstring that repaired the previous R01. The previous R01 is repaired. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with the single `sorry` as its only warning.

## R01 (P3) — The docstring calls every slash operator on `A_{κ,r}` a single weighted substitution; on the smaller stages it is a matrix of them

**Location:** `TauCetiRoadmap/AutomorphicGaloisRepresentations/Suggested.lean`.
- Lines 30–31 name "the analytic weight modules A_{κ,r} of README §§0.2a–0.2b".
- Lines 37–39 then say: "each slash operator f ↦ j_κ(γ)·f(w_γ) is a Tau Ceti weighted substitution `TauCeti.MvPowerSeries.restrictedWeightedSubstCLM`".

**Claim:** This is true only on the unit-radius module `R⟨z_σ⟩` of README §0.2a. The README's own supplier paragraph limits it to that case (line 232: "Each slash operator of §0.2a is such a map").
- `restrictedWeightedSubstCLM` is a map `IsRestricted.subring r →L[R] IsRestricted.subring s`, from one restricted-series algebra to another (`TauCeti/RingTheory/MvPowerSeries/TateAlgebra/WeightedSubst.lean:90`).
- On a stage `r<1`, README §0.2b (line 859) writes `A_{κ,r}` as a finite product of Tate algebras, on which each element acts "with the permutation of discs and the rescaled substitution".
- With algebraic factors `L_{n,s}` the action is also tensored with a finite matrix.

So on those stages a slash operator is a finite matrix of weighted substitutions, not one.

**Witness:** Take `p=3`, `s=1` (README §0.2b Check, line 878: three discs) and trivial weight, so that `A_{κ,1/3}≅R⟨w⟩³`.
- `γ=((1,1),(0,1))` acts by `(f₀,f₁,f₂)↦(f₁,f₂,f₀)`, which is a permutation of the factors.
- `A_{κ,1/3}` contains the idempotent `1_{3ℤ₃}` (Check at line 880). `R⟨w⟩` over a field has no nontrivial idempotent, so this module is no single restricted-series algebra.

**Repair:** In lines 37–39, replace "each slash operator f ↦ j_κ(γ)·f(w_γ) is a Tau Ceti weighted substitution `TauCeti.MvPowerSeries.restrictedWeightedSubstCLM`," with:

> on the unit-radius module of README §0.2a each slash operator f ↦ j_κ(γ)·f(w_γ) is a Tau Ceti weighted substitution `TauCeti.MvPowerSeries.restrictedWeightedSubstCLM`, and on the stages of README §0.2b it is a finite matrix of such substitutions, indexed by the discs and by a basis of the algebraic factors,

**Tested on the witness:**
- With `p=3`, `s=1` and `γ=((1,1),(0,1))`, the operator is the 3×3 permutation matrix whose entries are weighted substitutions with weight 1:
  - disc 0 gets `h=w` from disc 1, since `w_γ(3w)=1+3w`;
  - disc 1 gets `h=w` from disc 2;
  - disc 2 gets `h=1+w` from disc 0, since `w_γ(2+3w)=3(1+w)`.
- Each `h` has Gauss norm 1, so the hypothesis `‖h i‖ ≤ r i` holds at unit radius.
- A scalar entry `c` of an algebraic-factor matrix gives `c·W(g,h)=W(cg,h)`, which is again a weighted substitution.

## Previous findings

- R01 — repaired: lines 30–35 now name the missing carriers as "the analytic weight modules A_{κ,r} … as right Δ_P-modules, whose action law is the cocycle theorem … and the Banach form spaces with U_P as a row-compact endomorphism". They say the level forms are a submodule of functions on the finite adelic units.

The new R01 above is a problem that this repair introduced. The previous report marked no finding "not actionable", so nothing is re-raised.

## Verified sound

### Gate, dependency check, Lean

- **Gate**, rerun on this head: every check is 0, then `OK`, exit 0. The rerun's summary line omits `build`. The worker's gate at this head reports `build=0`, and my elaboration below succeeds.
- **Dependency check:** the output is `depcheck: 237 roadmaps, 2447 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Files:**
  - `git diff --stat origin/main...HEAD` outside the folder is empty.
  - The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0. Its only warning is `declaration uses 'sorry'` at line 87.
- **Signatures:** I ran `#check @` on both declarations in one scratch file.
  - `ordinaryGoodPrimes : {N : ℕ} → [NeZero N] → HeckeRing.GL2.Newform N 2 → Set (HeightOneSpectrum (𝓞 ℚ))`.
  - `fixedSquarefreeForm_ordinary_density_one` keeps `[NeZero N]`, `Squarefree N` and `f.χ = 1`.
  - No binder was lost, and both types agree with README §7.7. Only the docstring changed in this file; I changed nothing.
- **Signature tool:** `signatures.md` lists a spurious declaration `for` at line 32. That docstring line begins with the word "theorem" ("theorem for the automorphy factors"), which the tool misparsed. Elaboration shows only the two real declarations.
- **One-tactic probe** on the §7.7 theorem, rerun on a scratch copy:
  - `simp` makes no progress;
  - `rfl` fails;
  - `infer_instance` gives "type class instance expected".

  It is not padding.
- **Form:** one module docstring and `namespace TauCetiRoadmap.AutomorphicGaloisRepresentations`.
  - There is no `set_option`, `lemma`, `#eval` or sorry'd data.
  - The imports are `Mathlib` and the two `TauCeti.*` modules the file uses.
  - The docstring's pins equal `lake-manifest.json` (Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`).
- **Process words, never-cite list, LaTeX:** a grep of the added lines for process words and pull-request numbers finds nothing. A grep of README and Lean for each never-cite roadmap finds nothing. The gate's `latex` check is 0.

### Changed passages

- **Supplier paragraph** (README lines 226–241), checked against the Tau Ceti pin:
  - `restrictedWeightedSubstCLM` (`WeightedSubst.lean:90`) requires `[NormedCommRing R] [IsUltrametricDist R] [CompleteSpace R]`, positive radii `Fact (0 < r i)` and `Fact (0 < s j)`, `g` and `h i` restricted at `s`, and `hh : ∀ i, ‖h i‖ ≤ r i`. That matches "series restricted at positive polyradii … Gauss norm at most the radius of `X_i`".
  - `restrictedWeightedSubstCLM_comp` (line 115) composes in the order the README states; computed in the table.
  - `charPowerSeries` (`PrModule/Basic.lean:91`) is `1` off property (Pr) and otherwise the principal-minor series through a chosen presentation.
  - `IsPrCompact.charPowerSeries_eq` (line 148) assumes `[NormOneClass R] [IsUltrametricDist R] [CompleteSpace R] [TauCeti.NormedRing.IsTate R]` and holds for every presentation `r.comp i = id` through `C₀(J,R)`, exactly as stated.
  - `TauCeti.HasPr` (`PotentiallyONable.lean:89`, in namespace `TauCeti`), `TauCeti.NormedRing.IsTate` (`PseudoUniformizer.lean:150`) and `ContinuousLinearMap.IsPrCompact` (`RowCompact/PrModule.lean:105`) all have the names as cited.
  - `PseudoUniformizer.norm_one` shows that `IsTate` forces `‖1‖=1`, so "‖1‖=1 and a multiplicative pseudo-uniformizer" matches the Lean binders.
  - The README's "Each slash operator of §0.2a" is correctly scoped to the unit radius, unlike the docstring (R01).
- **§0.2a `*Needs:*`** (lines 842–845) and **§0.2e `*Needs:*`** (lines 1153–1158): all four added names exist at the pin. `roadmaps grep` finds them in no other roadmap.
- **§0.2e Fredholm series** (lines 1056–1072). Take `i = ev` into `⊕_iA` and `r = ev⁻¹∘E`. Then:
  - `r∘i = id`;
  - `i∘U_P∘r = (B|_{⊕A^{Γ_i}})∘E = BE` by §0.2d;
  - `U_P` is row compact by §0.2d's compactness through `E`.

  So `charPowerSeries_eq` gives the block-model determinant and independence of certificate and representatives, as written. The theorem's model space is `C₀(J,R)` for any discrete `J`. A Tate-algebra factor at any radius is topologically isomorphic to `C₀(ℕ^Σ,R)` through rescaling by elements of `K`, which suffices because (Pr) needs only continuous retracts. The splitting and radius independence stay targets, so nothing is overclaimed.
- **Build paragraph** (lines 663–666): it names the same objects as the docstring (§§0.2a–0.2b weight modules over `Δ_P`, §0.2c form spaces, the controlling operator).
- **Docstring, period rings** (lines 22–25): `Mathlib/RingTheory/Perfectoid/BDeRham.lean:75,88` defines `BDeRhamPlus` (an `AdicCompletion`, `deriving CommRing`) and `BDeRham` (a `Localization`).
  - No other Mathlib file and no Tau Ceti file mentions either, so there is no Galois action or filtration.
  - Neither pin has `Bcris`, `Acris` or Hodge–Tate period objects (grep: none).
- **Docstring, determinant laws** (lines 54–57):
  - `PolynomialLaw.IsMultiplicative` is at `TauCeti/RingTheory/PolynomialLaw/Multiplicative.lean:71`.
  - `PolynomialLaw.IsHomogeneousOfDegree` is at `…/PolynomialLaw/Homogeneous.lean:73`.
  - Mathlib's pin has only `PolynomialLaw/Basic.lean`, so "Tau Ceti" is the right attribution.
  - The remaining missing carriers for Layer 6 hold. §6.8 needs the actual Hilbert/quaternionic cohomology multiplicity module, and no Shimura-curve cohomology or Galois deformation functor is at the pins.
- **Docstring, Layer 0 analytic targets** (lines 26–41): the missing objects are named correctly.
  - The `Δ_P`-module structure needs the action law, and `U_P` on level forms needs it to be well defined.
  - Tau Ceti has no slash or Möbius action on restricted series. `TauCeti/Algebra/Field/LinearFractional.lean` is the field identity only, and no `IsRestricted` file mentions `GL (Fin 2)` or `Matrix (Fin 2)`.
  - The only defect is R01's scope.

### Seeded source sample

Only 0.2e falls in the changed passages. 0.2c is cited by the changed §0.2e. The README flags no locator as unverified (grep for "unverified" and "uncertified": none).

| Target | Locators checked | Result |
|---|---|---|
| 0.2e | CompactOperators (main) §1.5 "Determinants on (Pr) modules", README line 418: `H_u` by a retract extension, with independence by §1.4 cyclicity. §1.4 "Cyclicity and invariance", line 400. Layers 3–4: projectors and slopes. Tau Ceti `charPowerSeries` and `IsPrCompact.charPowerSeries_eq`, read above. The counting bound was verified in the previous report and is unchanged. | Supported. The locator for the slope summand is a remark below. |
| 0.2c | Buzzard-Eigenvarieties §10 pp. 70–73, Prop. 11.1 p. 75, Lemma 12.1 p. 78, verified in the previous report. The text is unchanged. The projector `E` and property (Pr) used by the new §0.2e are its "Stabilisers and property (Pr)" paragraph. | Supported |

The other sampled targets (0.5, 1.4, 3.1, 3.3, 3.9, 3.15, 4.2, 5.2, 5.4, 6.3, 6.4a, 6.10, 7.5) are unchanged since f8d3cf8 and were not re-read. I added one computed row for §6.3, because the changed docstring sentence concerns Layer 6.

### Adversarial table

New rows, for the statements this head changes:

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Supplier: composition order of `restrictedWeightedSubstCLM_comp` | `(g,h)=(1+X,5X)`, `(g′,h′)=(X,X²)`, `f=X` | `W(g,h)∘W(g′,h′)` sends `X` to `125X³+125X⁴`, and so does `W(g·g′(h),h′(h))`. The reverse composite `W(g′,h′)∘W(g,h)` gives `5X³+5X⁵`. | True |
| Supplier: slash of §0.2a is `W(j_κ(γ),w_γ)` with `‖w_γ‖≤1` | `γ=((1,0),(p,1))`; `diag(p,1)`; `((1,1),(0,1))`; non-member `((1,0),(1,1))` | `z/(pz+1)` has coefficients `(−p)^{m−1}`, Gauss norm 1. `pz` has norm `p⁻¹`. `z+1` has norm 1. `z/(z+1)` has coefficients `(−1)^{m−1}`, which do not tend to 0, so `hh` fails, matching §0.2a's Check that `c=1` is excluded. | True |
| Supplier: the action law reduces to the cocycle and `w_{γδ}=w_γ∘w_δ` | `γ=((1,1),(5,1))`, `δ=((2,0),(5,3))`, `k=3`, `z=7/10` | `w_γ(w_δz)=79/135=w_{γδ}(z)`. `j(γδ,z)=19683/8=j(γ,w_δz)·j(δ,z)`. The right action matches the composition order. | True |
| Supplier: the Banach–Tate algebras of §0.2a have `‖1‖=1` and a multiplicative pseudo-uniformizer | `R=K`; `K[ε]/ε²` with the max norm; the norm `2|x|` on `K`; `R=0` | `ϖ=p` gives `‖px‖=p⁻¹‖x‖` in the first two cases. With `2|x|`, `‖1‖=2` and `norm_one` refutes `IsTate`, so the stated convention excludes it. `R=0` has `‖1‖=0` and is excluded, and every series over it is trivial anyway. | True |
| §0.2e: `H_κ` is the determinant of `BE` | One class with trivial stabiliser, trivial weight, `U_v=diag(ϖ,1)`. Stabiliser `{±1}` acting by `−1`. Two certificates. `p=2`. | First case: `E=id`, extension `z^m↦ϖ^mz^m`, `H=∏(1−ϖ^jT)`, which is §0.2e's Check. Sign case: `E_i=(1+slash(−1))/2=0`, `M=0`, `BE=0`, `H=1`, which is the "form space zero" Check; `B` without `E` gives `det(1−TB)≠1`. Two certificates: `B≠B′` but `BE=B′E` (§0.2d Check). At `p=2`, `1/2∈K` and `‖E_i‖≤2`. | True |
| Docstring: each slash on `A_{κ,r}` (§§0.2a–0.2b) is one weighted substitution | `p=3`, `s=1`, `γ=((1,1),(0,1))` | `(f₀,f₁,f₂)↦(f₁,f₂,f₀)` on `R⟨w⟩³`. The idempotent `1_{3ℤ₃}` lies in `A_{κ,1/3}`, while `R⟨w⟩` over a field has none. | False at `r<1` (R01) |
| Docstring: `BDeRham*` are bare rings | `#check @BDeRhamPlus` | `(R) → [CommRing R] → (p) → [Fact p.Prime] → [Fact ¬IsUnit ↑p] → [IsAdicComplete …] → Type`. The file derives only `CommRing`, and no other file uses it. | True |
| Docstring: determinant laws are multiplicative laws homogeneous of degree 2 | `det` on `M₂`; trace; `det²`; degree 1 | `det(sX)=s²det X` and `det(XY)=det X det Y`. The trace has `tr(1)=2≠1`, so it is not multiplicative. `det²` has degree 4. Tau Ceti's `algHomEquiv` makes degree-one multiplicative laws algebra maps, so the degree fixes the rank. | True |
| Docstring: Layer 6 still not statable | §6.8's `T_m`; §6.3 Checks | §6.8 needs a cohomology multiplicity, absent at the pins. `Γ₀(88)`, old space of 11a1: in the basis `f(q^{2^i})`, `U₂` has char poly `x²(x²+2x+2)`, and the module is cyclic on `f(q⁸)`, so this is also the minimal polynomial; `u(u²+2u+2)≠0` has square 0. 11a1 at `ℓ=5`: `a₂=−2≡3=1+2`, `a₃=−1≡4`, `a₇=−2≡3≡1+7`, `a₁₃=4≡14`, so `ρ_𝔪≅1⊕χ̄₅`. | True |
| Build paragraph against the docstring | objects named | Both name the §§0.2a–0.2b weight modules over `Δ_P`, the §0.2c form spaces and `U_P` (§0.2d). | True |

Rows carried from the previous report (PRREVIEW r7, at f8d3cf8), for statements this head leaves untouched:

| Statement | Instances | Values on each side (previous report) | Result |
|---|---|---|---|
| §0.2a dyadic Check | `u=3`, `5`, `−1`; `w=1` | `v₂(log 3)=v₂(log 5)=2`. `exp(log 3)=−3`. `exp(log(−1))=1`, against `−1` for `u↦u`. | True |
| §0.2c unit Check | `ℚ(√2)`, `ε=1+√2`; `w=1,2`; `(2,0)`, `(3,1)` | `N(ε)=−1`, so `ε` acts by `−1` at `w=1` and by 1 at `w=2`; `ε²` acts by 1. `σ₁(ε)²≈5.83` has infinite order. | True |
| §0.2c stabilisers contain `𝒪_F^×` | `Γ_i=U∩x_i⁻¹D^×x_i` | A central `u` has `c=0` and `d=u` a unit. | True |
| §0.2e bound with `⌊·⌋₊` | `(H,v,h)=(2,1,1)`, `(3,1,2)`, `(1,1,½)`, `(2,1,−1)` | Largest `n`: 6<8, 15<18, 2<3, 0<4. Brute force found 0 violations. | True |
| §0.2f Bol over any field | `𝔽₂`, `j=0`, `r=2`; `j=r=1` | `D²(N²L⁻¹)=0` over `𝔽₂`. `D(N²L⁻²)=2(ad−bc)NL⁻³`. | True |
| §0.2f small-slope criterion | `e_v=2`, `r_τ=1`; `v_p(μ)=¼`, `¾` | `|c/μ|=p^{−¼}<1`, so the series converges. `p^{¼}>1` is excluded. | True |

Rows that r7 carried from PRREVIEW r6 (at 0ae744f), still untouched:

| Statement | Instances | Values on each side (r6) | Result |
|---|---|---|---|
| Conventions `λ_p` | `E₄`; `2Δ`; `Δ(3τ)` | `a₂(E₄)=2160=9·240`. `a₂(2Δ)=−48`. `λ₂(Δ(3τ))=−24`. | True |
| §1.7 attachment and rigidity | `E₄` at 2; `Δ` against `Δ(3τ)` | Trace `9=λ₂`. The `λ_p` agree for `p≠3`, with `k=12`. | True |
| §0.1 | `ε_p`, `K=ℚ_p`, `ϖ=p` | `φ=p⁻¹=q⁻¹`. | True |
| §0.2a right action | `diag(p,1)`, `((1,0),(p,1))`, `z=1` | `f(p/(p+1))` against `f(p/(p²+1))`. | True |
| §0.2a scalars | `2I`, odd `p` | `2^k`, or `2^{k+2}`. | True |
| §0.2b | `p=3`, `s=1` | Three discs. `z=(a+3b)+9w′`. | True |
| §0.2c level/radius Check | `F=ℚ`, degree `k` | `p^s(k+1)` on both sides. | True |
| §0.2c `C_U` | `N=5` | Order `2=φ(5)/2`. | True |
| §0.2d certificates | Buzzard p. 69 | `(Tφ)(c_i)=Σ_tφ(c_j)|(ux_t)`. | True |
| §0.2e Checks | `∏(1−p^jT)`; `exp(3w)−1`; `ℚ₃(√−3)` | `n(n−1)/2`. Gauss norm `1/3`. `ζ₃∈1+ϖO`. | True |
| §1.1 Check | `y²=x³−x` over `𝔽₁₇`, `p=3` | `a₁₇=2`. One 4-cycle. | True |
| §1.3 Check | `n=3`, `r=2` | `|Γ₂|=648`. | True |
| §3.3a | 11a1 at 3 | `X²+X+3`. | True |
| §3.15 Check | `y²=x³−x` at 5 | `a₅=−2`. `|−1±2i|²=5`. | True |
| §4.11 | `W=ρ|G_K⊗η⁻¹` | `t_H=t_N=0`. | True |
| §6.4a Check | ramified `p∈Σ` | `p²` against `p³`. | True |
| §6.7 Checks | 11a1 at 7, 19 | `a₇=−2`, unit root. `a₁₉=0`, none. | True |
| §6.11 Check | `p=3`, `Nv≡−1` | The sign ambiguity is kept. | True |
| §7.3 | `Δ` at 2 | `24≤90.5`. | True |
| §7.7 and Lean (headline) | 11a1 at 3, 19, 11 | `−1∉(3)`, `0∈(19)`, `11∣11`. CM is excluded by squarefree level. | True |

### Library declarations opened at the pins

- **Tau Ceti:**
  - `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/WeightedSubst.lean`, lines 90, 98, 105, 115, 128 and 137;
  - `TauCeti/Analysis/Normed/Operator/Nonarchimedean/PrModule/Basic.lean`, lines 91, 148, 180 and 198;
  - `TauCeti/Analysis/Normed/Ring/PseudoUniformizer.lean`, lines 133–163;
  - `TauCeti/Analysis/Normed/Module/Bases/PotentiallyONable.lean:89`;
  - `TauCeti/Analysis/Normed/Operator/RowCompact/PrModule.lean:105`;
  - `TauCeti/RingTheory/PolynomialLaw/Multiplicative.lean:71`;
  - `TauCeti/RingTheory/PolynomialLaw/Homogeneous.lean:73`;
  - `TauCeti/Algebra/Field/LinearFractional.lean`.
- **Mathlib:**
  - `Mathlib/RingTheory/Perfectoid/BDeRham.lean`, lines 75 and 88;
  - `Mathlib/RingTheory/PolynomialLaw/`, which contains `Basic.lean` only.

### Cross-roadmap citations resolved

- **CompactOperators** (main): §1.4 at README line 400 and §1.5 at line 418, as above.
- **LocallyAnalyticDistributions** (open head): §4.2 "Fredholm determinants on orthonormalizable and (Pr) modules" exists.
- **IntegralHeckeAndGaloisDeterminants** (open head), the resolver's two leads:
  - `Determinant.exists_realization_of_henselian` is at `Suggested.lean:205`;
  - `existsUnique_isCoefficientChange_of_compact` is at line 365, inside `namespace Determinant`, which opens at line 347.
- The resolver reports no cross-roadmap citation found nowhere.

### Ownership and overlaps

- **Overlaps:** `overlaps.md` reports no open pull request changing this roadmap and no dropped or revision-only id. I checked both against the tool's output.
- **New objects:** the changed passages own no new object. They consume Tau Ceti declarations, and `roadmaps grep` finds the four new names in no other roadmap.
- **Scope:** ownership of §§0.2a–0.3 is unchanged by this head and was not re-examined.

### Remarks on untouched text (no change requested)

- **§0.2e slope-summand locator.** §0.2e lines 1067–1070 cite LocallyAnalyticDistributions §4.2 for the finite projective slope summand and the finiteness of `𝕋`'s image. §4.2 is the Fredholm determinant. The summands are its §4.14 "Polynomial invertibility and finite projective spectral summands" and §4.16, or CompactOperators §3.4. The sentence is only rewrapped.
- **§0.2a norm bound.** §0.2a line 763–764 says the operator has norm at most one when `‖j_κ(γ)‖≤1` and `‖w_γ‖≤1`. That is an instance of `TauCeti.MvPowerSeries.norm_restrictedWeightedSubstCLM_apply_le` (`WeightedSubst.lean:105`).
- **CompactOperators §1.4 at the pin.** §1.4, cited for radius independence, is realised at the pin by `ContinuousLinearMap.IsPrCompact.charPowerSeries_comp_comm` (`PrModule/Basic.lean:180`) and `…charPowerSeries_conj` (line 198). Citing the owner roadmap is the pattern the earlier reviews accepted.

## Not verifiable

- **T. Saito, *Modular forms and p-adic Hodge theory*, Theorem 1 (`SaitoMFPH`):** recorded as uncertified (paywalled) and cited by its locator; that is settled.
- **Jacobs, equation (1.5.13), p. 19:** the extracted text loses the sign of the exponent of `(cz+d)`, as recorded in the earlier reports. It is unchanged and outside the changed passages.

## Source issues

- none
