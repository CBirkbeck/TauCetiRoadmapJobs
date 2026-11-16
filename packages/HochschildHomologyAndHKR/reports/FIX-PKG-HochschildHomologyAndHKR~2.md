# FIX-PKG-HochschildHomologyAndHKR~2

This round settles `REV-PKG-HochschildHomologyAndHKR`, which has one finding. The review's header
calls it F01 and its closing summary calls it R01; they are the same finding. The review's "For the
human reviewers" section lists nothing to change, and nothing was changed because of it. Its
"Source issues" (Ginz05 errata) are not findings. The README already records the one that matters,
Ginz05 (6.6.3), at §6.2.

## F01 (P2) — applied differently

`Suggested.lean` now states `homology_one_linearEquiv_kaehler` (§3.4) and
`homological_hkr_mvPolynomial` (§8.4, homology) on Tau Ceti's
`TauCeti.normalizedHochschildChains.chainComplex`. Both come with explicit values, not the review's
`Nonempty`: `[r₀ ⊗ r₁] ↦ r₀ dr₁`, and `ε^cl_n`. The docstring keeps only `Tor` as not statable.
The README gains matching §§3.4/8.4 clauses, *Needs*, Checks, contracts, Conventions and Dependencies.

### Verification

The claim is right. `TauCeti.normalizedHochschildChains.chainComplex k A :
ChainComplex (ModuleCat k) ℕ` exists at the pin
(`TauCeti/RingTheory/CyclicCohomology/Normalized/Chains.lean`, `def chainComplex`). It needs
`[CommRing k] [Ring A] [Module k A] [IsScalarTower k A A] [SMulCommClass k A A]`, which
`Algebra k R` supplies. Its degree-`n` term is `⨂[k]^{n+1} A` modulo the tensors with `1` in a
slot other than `0`. Its boundary (`b_tensor`) is the alternating sum of `TauCeti.hochschildFace`.
Face `i ≤ n` multiplies `a_i a_{i+1}`, and the last face is `a_{n+1}a₀ ⊗ a₁ ⊗ ⋯ ⊗ a_n`
(`hochschildFace_last`, `TauCeti/RingTheory/CyclicCohomology/Cochain.lean`).

§2.1's last API bullet identifies this complex with `N_•(A,A)`, and §2.1 makes `C_•(A,A) → N_•(A,A)`
a homotopy equivalence over every `k`. So the complex's homology is `HH_•(A,A)` by this roadmap's
own targets. The old sentence ("the pins have no Hochschild chain complex with bimodule
coefficients") does not apply to coefficients in `R` itself.

### Why the repair differs from the suggested one

The suggested `Nonempty (H₁ ≃ₗ[k] Ω¹)` and `Nonempty (H_n ≃ₗ[k] ⋀ⁿΩ)` are true, but they are
weaker than README §3.4 and §8.4. Those sections state specific maps: `[r₀ ⊗ r₁] ↦ r₀ dr₁`, and
`ε^cl_n` with a basis. The file's §7.6 headlines are already stated as `k`-linear equivalences with
prescribed values on generators, which determine them, so I stated both new theorems the same way:

- `homology_one_linearEquiv_kaehler`: `∃ e : H₁ ≃ₗ[k] Ω[R⁄k]`, and for every `r : Fin 2 → R`
  there is a cycle `z` with `iCycles z ≫ chainComplexXIso = tensor k R 1 r` and
  `e (homologyπ z) = r 0 • D (r 1)`.
- `homological_hkr_mvPolynomial`: `∃ e : ⋀[R]^n Ω[R⁄k] ≃ₗ[k] H_n` with `R = MvPolynomial (Fin m) k`.
  For every `r₀` and `r : Fin n → R` there is a cycle `z` whose underlying chain is
  `Σ_σ sign σ • tensor k R n (Fin.cons r₀ (r ∘ σ))` and with
  `e (r₀ • ιMulti (D ∘ r)) = homologyπ z`.

Each statement asserts that the chain is a cycle (the `∃ z`), so neither is vacuous. The values
span the source over `k`: `Ω` is spanned over `R` by the `dr`, and `⋀ⁿ` by the `ιMulti` of
`dr`-families. So the values determine `e`.

The terms of the pinned complex are not definitionally exposed in a `module` file. The first
attempt, `iCycles z = tensor …`, failed with a type mismatch. The statements therefore pass through
the pinned `TauCeti.normalizedHochschildChains.chainComplexXIso`, which is `Iso.refl`.

### Changes (old → new)

- **`Suggested.lean`.**
  - Imports: added `import TauCeti.RingTheory.CyclicCohomology.Normalized.Chains`.
  - New section `/-! ## Layer 3: Low degrees and square-zero extensions -/`, placed before Layer 4,
    with `homology_one_linearEquiv_kaehler`.
  - New section `/-! ## Layer 8: Polynomial algebras through the Koszul resolution -/`, at the end,
    with `homological_hkr_mvPolynomial`.
  - Module docstring:
    - New sentence: homology with coefficients in the algebra is read on the pinned normalised
      chains, identified with `N_•(R,R)` by §2.1.
    - "Stated here" gains both theorems, in README order.
    - The paragraph on prescribed values now also covers §3.4 and §8.4. It explains the
      `homologyπ`/`iCycles`/`chainComplexXIso` notation for classes.
    - "These two" became the explicit names `cohomological_hkr_hom_kaehler`, `cohomological_hkr`.
    - The "not statable" item now covers only `HHₙ ≅ Torₙ` (§4.5), with its two reasons unchanged:
      no bimodule-coefficient chains, and no `Tor` over noncommutative `Aᵉ`.
- **README Conventions, "The carriers of `Suggested.lean`".** New sentences say that `HH_•(R,R)`
  is read on `TauCeti.normalizedHochschildChains.chainComplex k R` and how a class is written. The
  `R`-structure remark now covers §§3.4, 7.6 and 8.4.
- **README, From Mathlib.** Added `HomologicalComplex.cycles`, `HomologicalComplex.iCycles` and
  `HomologicalComplex.homologyπ`.
- **README, From Tau Ceti, normalised-chains bullet.** Added
  `TauCeti.normalizedHochschildChains.tensor` and
  `TauCeti.normalizedHochschildChains.chainComplexXIso`, and the remark that `Suggested.lean`
  states §3.4 and §8.4 (homology) on this complex.
- **README §3.4.**
  - One clause naming `homology_one_linearEquiv_kaehler`.
  - *Needs:* §2.1 (only to read the stated form as `HH₁`), the three Mathlib homology names, and
    the four Tau Ceti names.
  - One new Check, on the slot convention.
- **README §8.4.**
  - One clause naming `homological_hkr_mvPolynomial`.
  - *Needs:* §2.1 for the stated form, the Tau Ceti names, `HomologicalComplex.iCycles`,
    `HomologicalComplex.homologyπ` and `exteriorPower.ιMulti`.
  - A new **Checks.** list with four items.
- **README Layer 3 and Layer 8 Dependencies.** Each names the pinned normalised chains as the
  carrier of the stated form.

### Same pattern elsewhere

I searched the whole roadmap for other headlines declared not statable for lack of a chain complex:

- §4.5 (`Tor`) needs an arbitrary bimodule `M` and `Tor` over `Aᵉ`; neither exists at the pins.
- §§2.1–2.2 (normalisation theorem) needs `C_•(A,M)` and `N^•(A,M)` with bimodule coefficients.
  The pinned cochain complex has dual-bimodule coefficients only.
- §6.4(d), the smooth case of `ε^cl_n` on the classical complex, would also be statable on the
  pinned chains. It is not a headline: it is the input that the declared gap
  `gap:smooth-hkr-antisymmetrisation` supplies to §7.6, not an end theorem of the Summary. Stating
  it would widen the scope, so I did not.

The other "not statable" items were re-read, and each lacks the carrier the docstring names.

### Ownership

`roadmaps grep 'normalizedHochschildChains'` finds no roadmap on main or at any open head using the
pinned chains. `roadmaps grep -i hkr --lean-only` finds no HKR statement in any other
`Suggested.lean`. The only other `HH_1 ≅ Ω¹` statement is RefinedTraceMethods §1.9, on derived
chains. The Scope section already separates it from §3.4's classical, flatness-free statement. The
smooth homology comparison on derived chains belongs to KTheoryFiniteLocalFields §4.0. §8.4's
polynomial case on the classical complex, which needs no smoothness input, is owned here. Both new
declarations are in `TauCetiRoadmap.HochschildHomologyAndHKR`, and no readable roadmap declares
these fully qualified names.

## Adversarial pass (every statement added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `homology_one_linearEquiv_kaehler` | `k = 0` | `R = 0` (since `1 = algebraMap 1 = 0`), `N₁ = 0`, `Ω¹ = 0`; `z = 0`, both sides `0` | holds | — |
| same | `R = k` | `N₁ = (k ⊗ k)/(k ⊗ 1) = 0`, `Ω¹_{k/k} = 0` | holds | — |
| same | `R = k[x]`, `k ≠ 0` | `[1 ⊗ x] ↦ dx ≠ 0`; `b(1⊗x⊗x) = 2x⊗x − 1⊗x²`, so `[1⊗x²] = 2[x⊗x]`; the values are `d(x²) = 2x dx` and `2x dx` | holds | new §3.4 Check |
| same, transposed slot | `[r₀⊗r₁] ↦ r₁ dr₀` on `k[x]` | `x ⊗ 1 = 0` in `N₁` (and `= b(x⊗1⊗1)` in `C₁`) but goes to `dx ≠ 0` | excluded by the stated value | new §3.4 Check |
| same, well-definedness | pinned `b` on `N₂` | `a₀a₁ da₂ − a₀ d(a₁a₂) + a₂a₀ da₁ = 0`; `r₀ ⊗ 1 ↦ r₀ d1 = 0` | holds | route sentence in §3.4 |
| same | `k = ℤ`, `R = 𝔽_p` (not flat) | `𝔽_p ⊗_ℤ 𝔽_p = 𝔽_p`, so every tensor is `c(1 ⊗ 1)` and `N₁ = 0`; `Ω¹ = 0` | holds (no flatness needed) | — |
| same | `R = k[x]/(x²)` over `𝔽₂`, `ℚ` | `Ω¹ = R dx/(2x dx)`: dimension 2 and 1; existing §3.4 Check | holds | — |
| `homological_hkr_mvPolynomial` | `n = 0` | `Perm (Fin 0) = {1}`, so the chain is `tensor ![r₀]`, `cycles 0 = X 0`, `H₀ = R/[R,R] = R`, `e(r₀ • 1) = [r₀]` | holds | §8.4 Check (`m = 0`) |
| same | `n = 1` | `e(r₀ dr₁) = [r₀ ⊗ r₁]`, the inverse of the first theorem's map (§6.4(c)) | consistent | — |
| same | `m = 0` | `R = k`, `Ω¹ = 0`, `⋀ⁿ0 = 0` for `n ≥ 1`; pinned `N_n(k) = 0` for `n ≥ 1` (every tensor has `1` in slot 1) | holds | §8.4 Check |
| same | `m = 1`, `n = 2`, `r = (X, X²)` | `⋀²(R dX) = 0`; `b(1⊗X⊗X²) = b(1⊗X²⊗X) = X⊗X² − 1⊗X³ + X²⊗X`, a cycle; it equals `b(1⊗X⊗X⊗X)`, so the class is 0 | holds | §8.4 Check |
| same | `m = 2`, `n = 2`, `k = 𝔽₂` | `e(dX₁∧dX₂) = [1⊗X₁⊗X₂ − 1⊗X₂⊗X₁] ≠ 0` (pairs to 1 with `∂₁∪∂₂`); `π^cl₂ε^cl₂ = 2 = 0` | holds; the inverse is not `π/n!` | §8.4 Check |
| same, unsigned chain | `2 ≠ 0` in `k`, `m = 2` | boundary `2(X₁⊗X₂ + X₂⊗X₁ − 1⊗X₁X₂)`, three distinct basis vectors of `R ⊗ R̄` with coefficients `±2`, nonzero, so no cycle | excluded by `sign σ` | §8.4 Check |
| same, `r ∘ σ` vs `r ∘ σ⁻¹` | reindex `σ ↦ σ⁻¹` | `sign σ⁻¹ = sign σ`, same sum | same chain | — |
| same | `k = 0` | all modules 0 | holds | — |
| same, truth | any `k`, `m` | §8.3: `R ⊗_{Rᵉ} ι` sends `e_I` to the antisymmetrised chain and is a homotopy equivalence over every `k`; §2.1 carries it to `N_•` | holds, no gap used | — |
| Docstring "not statable" (§4.5) | pin search | no chain complex with bimodule coefficients in Tau Ceti; Mathlib's `Tor` is for monoidal `ModuleCat R`, `R` commutative | accurate | narrowed to `Tor` |
| Conventions class notation | degree 0 | `ChainComplex` shape: `d 0 _ = 0`, so `cycles 0 = X 0` and the class of `r₀` is `homologyπ` of it; `chainComplexXIso` is `Iso.refl` (pin) | consistent | — |
| Context and binders | `#check @` on all 13 declarations | the new theorems carry only `k R` (`CommRing`, `Algebra`) and `k m n`; the file has no `variable` block | no lost binders | — |
| Generality | README vs Lean | README §3.4 and §8.4: `R`-linear on `C_•`; Lean: `k`-linear on `N_•` with determining values; both clauses say so | agree | clauses added |
| One-tactic probe | `simp`, `rfl`, `infer_instance` on both new theorems | 6 of 6 attempts leave the goal open or fail | not padding | — |

## Checks run

- **Elaboration.** Command: `lake env lean packages/HochschildHomologyAndHKR/Suggested.lean`, run
  from the content checkout. Result: 7 warnings, all `declaration uses 'sorry'`, at lines 119, 138,
  168, 205, 219, 236 and 256. No errors and no other warnings. The `Chains` object file was already
  built at the pin, so no `lake build` was needed.
- **Signatures.** I put `#check @name` for all 13 declarations in one scratch file and elaborated
  it once. The 11 existing types are unchanged from `scratch/signatures.md`. The two new types are
  as described above. Every binder each statement needs is in its own signature.
- **Dependency check.** Command:
  `tauceti-roadmap … gate --depcheck packages/HochschildHomologyAndHKR/README.md --name HochschildHomologyAndHKR --order merge-order/ORDER.txt --movable --content content`.
  Output: `depcheck: 242 roadmaps, 2265 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:`
  line. No roadmap supplier was added; the new inputs are Mathlib and Tau Ceti at the pins.
- **Citations.** `roadmaps resolve` on the README: cross-roadmap citations found nowhere: none.
  Lean names found nowhere: none. The tool did not check names outside TauCetiRoadmap on this host,
  so I opened each new library name at the pins:
  - Mathlib `HomologicalComplex.cycles`, `iCycles` and `homologyπ`
    (`Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean`).
  - Tau Ceti `TauCeti.normalizedHochschildChains.tensor`, `.chainComplex`, `.chainComplexXIso` and
    `.b_tensor` (`Chains.lean`).
- **README–Lean agreement.** Every Lean name of `Suggested.lean` occurs backticked in the README,
  and the README attributes no other name to this roadmap. There are no LaTeX delimiters and no
  machine paths.

## Notes for the maintainer

- **New names.** Two new declarations: `homology_one_linearEquiv_kaehler` and
  `homological_hkr_mvPolynomial`. No name was renamed or removed. No other roadmap cites this
  package, so nothing downstream changes.
- **Files not changed.** `sources.toml`: every work cited by the new text (Loday98 §§1.1 and 3.2,
  Ginz05 §8.1, HKR62's Theorem 3.1 computation) already lists §3.4 or §8.4 in `cited_for`.
  `design/plan.json`: no new supplier gap. The new statements use no roadmap supplier, and §8.4's
  route does not use `gap:smooth-hkr-antisymmetrisation`.
- **Locators re-read.** Ginz05 lines 1914–1926 (the `HH₁ = Ω¹` computation) and HKR62 lines 210
  and 268–279 (Theorem 3.1 and its Koszul computation) support the statements at the generality
  attributed to them.
- **Not checked.** Loday98 is `uncertified` and was cited by locator only.
- No suspicious instructions were found in the review text.
