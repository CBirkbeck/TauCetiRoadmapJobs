# FIX-DESIGN-SpectralSequencesAndConvergencePartII~4: repair report

Files changed: `packages/SpectralSequencesAndConvergencePartII/design/README.md`: §4.1 degree-zero Check
rewritten, one negative-control Check added, and one clause added to the Mathlib supplier contract for
`CategoryTheory.Functor.leftDerivedZeroIsoSelf`. `packages/SpectralSequencesAndConvergencePartII/design/plan.json`:
target 4.1 test `degree_zero` rewritten, new test `degree_zero_needs_right_exactness` (kind `non-example`), so
88 plan tests in all. `sources.toml` is unchanged because no new work is cited. No target, layer or Lean name was
added, renamed or removed. The 4.1 theorem keeps its generality.

## REV-DESIGN-SpectralSequencesAndConvergencePartII~3/F01 (P2) — applied

Confirmed (evidence below). Old Check: "In degree `0` both sides are the tensor product (`Functor.leftDerivedZeroIsoSelf`)".
New Check: `Tor_0` and `Tor'_0` are both `H_0 Tot(P ⊠ Q)`, and they equal `X ⊗ Y` when `X ⊗ −` and `− ⊗ Y` preserve finite colimits.
This holds in `ModuleCat R` by the `MonoidalClosed` adjunction and the braiding, with a `ℤ/4, ℤ/6` value. The dual-tensor
counterexample was added as a negative control, in both files.

### Evidence

- **Pinned hypothesis.** Mathlib `Mathlib/CategoryTheory/Abelian/LeftDerived.lean` line 338 opens the section
  `variable (F : C ⥤ D) [F.Additive] [PreservesFiniteColimits F]`. `Functor.leftDerivedZeroIsoSelf` (line 359) is
  declared inside it. `Mathlib/CategoryTheory/Monoidal/Tor.lean` defines `Tor`/`Tor'` under `MonoidalCategory`,
  `Abelian`, `MonoidalPreadditive` and `HasProjectiveResolutions` only. Nothing there makes `tensorLeft X`
  right exact.
- **Counterexample, recomputed.**
  - Setting: `R = 𝔽₂[x,y]/(x²,y²)` with basis `1, x, y, xy`. The `xy`-coefficient pairing has the reverse-identity
    Gram matrix: the pairs `(1,xy), (x,y), (y,x), (xy,1)` give 1 and all others give 0. So `R ≅ DR` as `R`-modules.
  - Projectives: finite projectives are `R^n` because `R` is local. So `P ⋆ V = D(D(R^n) ⊗_R DV) ≅ D((DV)^n) ≅ V^n`,
    naturally in `V`, and the same holds on the other side. The theorem's hypothesis therefore holds.
  - Socle formula: `U ⋆ k = D(DU/𝔪·DU)` is the set of `u ∈ U` with `𝔪u = 0`, which is `soc(U)`.
  - `X = R/(xy)` has basis `1, x, y`, and `soc X = ⟨x, y⟩` has dimension 2.
  - `Tor_0(X,k)`: tracking `R² →(x,y) R` through `X ⋆ (−)` gives `X² → X`, `(a,b) ↦ xa + yb`, with cokernel
    `X/𝔪X = k`.
  - `Tor'_0(X,k)`: `R →(×xy) R` gives `soc R → soc R`, which is multiplication by `xy` on `k·xy` and so is 0.
    Its cokernel is `k`.
  - So `Tor_0 ≅ Tor'_0 ≅ k`, but `X ⋆ k ≅ k²`.
- **Pattern search.** I checked every other identification of a zeroth derived functor with the underived functor:
  - §2.2 (README "`F(A) → R⁰F(A)` is an isomorphism for all `A` if and only if `F` is left exact", plan test
    `degree zero`): this already carries the exactness hypothesis and has a negative control (`− ⊗ ℤ/2`).
  - §2.6 "`L_0F(A) ≅ F(A)`": here `F` is right exact by the standing hypothesis of §2.6.
  - §3.4: right exact `F`, `G`.
  - Conventions witness `E₂^{0,0} = ℤ/2 ⊗ ℤ/2` and §§4.2–4.4: all in `ModuleCat R` with `R` commutative, where
    tensoring is right exact.

  None needs a change. The only related fix is the supplier-contract line for `leftDerivedZeroIsoSelf`, which now
  states its assumption.

### Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| 4.1 theorem `Tor n ≅ Tor' n` at `n = 0` (unchanged) | Dual tensor `⋆` above; `ModuleCat ℤ` with `ℤ/4, ℤ/6` | Under `⋆`: rows `P_• ⋆ Q_j → X ⋆ Q_j` are exact because `− ⋆ Q_j` is exact; `Tor_0 = Tor'_0 = k`. Over `ℤ`: `coker(ℤ/4 →(×6) ℤ/4) = ℤ/2` and `coker(ℤ/6 →(×4) ℤ/6) = ℤ/2`. | Balance holds in degree 0 without right exactness; no change to the theorem. |
| New degree-zero Check (`Tor_0 = ⊗` under finite-colimit preservation) | `ModuleCat ℤ`; zero module `Y = 0`; `X = R` the unit | `ℤ/4 ⊗ ℤ/6 = ℤ/gcd(4,6) = ℤ/2`, equal to both cokernels above. `Y = 0`: the resolution is 0 and `Tor_0 = 0 = X ⊗ 0`. `X = R`: `Tor_0(R,Y) = coker(Q_1 → Q_0) = Y = R ⊗ Y`. | Agrees with the theorem and with `leftDerivedZeroIsoSelf`. |
| Claim "`X ⊗ −` left adjoint, `− ⊗ Y ≅ Y ⊗ −`" in `ModuleCat R` | Pinned `Mathlib/Algebra/Category/ModuleCat/Monoidal/Closed.lean:42` (`instance : MonoidalClosed (ModuleCat R)`); `Mathlib/CategoryTheory/Monoidal/Closed/Basic.lean:85` (`(tensorLeft A).IsLeftAdjoint`); `ModuleCat/Monoidal/Symmetric.lean` (braiding) | A left adjoint preserves all colimits; the braiding gives a natural isomorphism, and finite-colimit preservation passes along it. | Correct at the pin; `R` commutative, as in the Conventions. |
| New negative-control Check | `X = R/(xy)`, `Y = k`; also `X = R` and `X = k` | `X = R/(xy)`: `Tor_0 = Tor'_0 = k`, `X ⋆ k = k²` (fails). `X = R`: `Tor_0(R,k) = R/𝔪 = k`, and `R ⋆ k = soc R = k·xy`, dimension 1 (agrees). `X = k`: `Tor_0(k,k) = k/𝔪k = k`, and `k ⋆ k = soc k = k` (agrees). | Separates exactly the right-exactness failure. The map `soc R → soc X` is 0 although `R → X` is onto, which shows that `X ⋆ −` is not right exact. |
| Supplier contract line for `leftDerivedZeroIsoSelf` | Pinned `LeftDerived.lean:338–359` | The section variables are `[F.Additive] [PreservesFiniteColimits F]`. | Clause "for additive `F` preserving finite colimits" added. |

## Checks run

- Dependency check (exact command of the brief):

  ```text
  candidate: SpectralSequencesAndConvergencePartII is not in the merge order yet; checked as if placed after ArithmeticGaloisDuality (the intake inserts it when its design is accepted)
  depcheck: 240 roadmaps, 2177 edges, 0 problem(s)
  ```

  It reports no UPWARD and no CYCLE line. Not being in the merge order is expected at the design stage.
- Citation resolver on `design/README.md`: "Cross-roadmap citations found nowhere: None. Lean names found nowhere:
  None." It also says that Lean names outside TauCetiRoadmap were not checked by the tool. I opened the
  Mathlib declarations named in the new text at the pin myself: `Functor.leftDerivedZeroIsoSelf`, `MonoidalClosed`
  and its `ModuleCat R` instance, and `MonoidalPreadditive (ModuleCat R)` at `ModuleCat/Monoidal/Basic.lean:449`.
- `plan.json` reparsed as valid JSON after the edit. The README has no LaTeX delimiters and no new process wording.
- `#check` elaboration: the package has no `Suggested.lean` at this stage, so there was no declaration to elaborate.
  No Lean name changed.

## Ownership and sources

- Ownership: no construction was added. The new Checks concern Mathlib's `Tor`, which this roadmap already
  consumes, so there is no ownership question against main or the open pull requests.
- Sources: no new citation and no `needs-references.toml` entry. The 4.1 locator (weibel1994 Theorem 2.7.2,
  uncertified) is unchanged.

## Notes for the maintainer

- No name that other roadmaps cite changed. The 4.1 statement is unchanged, so its consumers (§4.3 and §4.4)
  are unaffected; they work in `ModuleCat R`, where the degree-zero identification holds.
- The review's "For the human reviewers" section is unchanged:
  - The base roadmap SpectralSequencesAndConvergence must be accepted and placed before this Part II.
  - The four uncertified works remain uncertified.
