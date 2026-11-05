# Review of ArtinRepresentations (pull request #1711 at 67a9da9)

**Verdict:** accepted

Incremental re-review of the 90 lines changed since 6802a8f: the three previous findings, the passages the diff adds (the weight-one acceptance theorem and its README paragraph and Checks, the §9.2 ramification API and Checks, the container Check, the conventions wording), everything that cites them, the gate, the elaboration and the adversarial rows for every changed statement. No blocking finding remains.

## R01 (P3) — Name the supplier of the ramified local factors in the §8.2 route

**Location:** `TauCetiRoadmap/ArtinRepresentations/README.md:1795–1797`, “Consume the Deligne–Serre attachment of AutomorphicGaloisRepresentations §2.10, transport it through Layer 1's finite Galois factorization, and compare its full local factors with §3.4's Euler product.”

**Claim:** The representation supplied by AutomorphicGaloisRepresentations §2.10 comes with local factors at every prime, so comparing them with §3.4 proves `weight_one_full_artin_comparison` including the primes dividing `N`.

**Witness:** AutomorphicGaloisRepresentations §2.10 at its open head (README line 1419) supplies only the arithmetic good polynomial `X² − a_p X + ψ(p)`, unramifiedness outside `N`, and irreducibility in the cuspidal case; it states nothing at `p ∣ N`. For `η(z)η(23z)` the factor at 23 is `1 − X` (computed: `a₂₃ = 1`), and no target of §2.10 produces it.

The ramified factors are owned elsewhere and are already in this section's `*Needs:*` line: ModularityAndLanglandsExtensions §1.2 (README line 486 at its open head) upgrades exactly the §2.10 representation of a weight-one newform to all-place matching of full `L`-factors through GL2AutomorphicRepresentationsAndTransfer R17.5.5, and ModularForms Layer 4 (main, README lines 231–234) gives the bad-prime eigenvalues and Euler factors of the newform. So the prerequisite is owned; only the route sentence misattributes it.

**Repair:** Replace the route sentence by one that names the inputs: §2.10 for the good-prime polynomials and irreducibility; ModularityAndLanglandsExtensions §1.2's all-place upgrade (GL2AutomorphicRepresentationsAndTransfer R17.5.5) for the factors at `p ∣ N`, read through §2.2's convention that the arithmetic Artin factor is the dual's geometric one; ModularForms Layer 4 for the newform's bad-prime coefficients; then compare with §3.4. On the instance above the repaired route yields `1 − X` at 23 on both sides. No change to the Lean statement.

## Previous findings

- R01 — repaired: `Suggested.lean:199` states `weight_one_full_artin_comparison` on `HeckeRing.GL2.Newform N 1` with `[NeZero N]`, an irreducible `Representation ℂ (E ≃ₐ[ℚ] E) (Fin 2 → ℂ)` and equality of `finiteArtinLSeries` with the `LSeries` of the q-expansion on `Re s > 1`; README lines 442–444 and 1790–1798 document it; the docstring now separates the conductor-level refinement. The route wording is the new P3 above.
- R02 — repaired: README line 1944, “ramifiedSet ρ̄ as the finite set of places v at which IsUnramifiedAt ρ̄ v fails”; bullets at 1965–1968 give the union with the **ramified** places above ℓ and separate the complement of IsGoodPrime; the trivial mod-3 line is the negative control (1985–1987).
- R03 — repaired: README line 2302, “The trivial complex line is irreducible, has Artin field ℚ and trivial projective image, and has containerDegree = [G:G] = 1”; the conventions row (line 280) now says “irreducible two-dimensional”.

## Verified sound

### Gate, dependency check, elaboration

- The worker's gate at 67a9da9 passes every scanner and the targeted build (`build=0`, `outside-folder=0`, `stray-files=0`, `sorry-data=0`, `set_option=0`, `imports=0`, `readme-ids-missing=0`, final `OK`). `git diff --stat origin/main...HEAD` outside the folder is empty.
- The independent dependency check with `--movable` returned

      depcheck: 204 roadmaps, 1615 edges, 0 problem(s)

  with no UPWARD or CYCLE line. The new `*Needs:*` item (Layer 1.2) is internal.
- `lake env lean` on `TauCetiRoadmap/ArtinRepresentations/Suggested.lean` at the pins finished in 10 s with exactly eleven `declaration uses sorry` warnings (the ten of the previous head plus line 199) and no other diagnostic. The new import `TauCeti.NumberTheory.ModularForms.Newforms.Newform` exists at the pinned Tau Ceti and is used.
- `#check @weight_one_full_artin_comparison` on a scratch copy elaborates to `∀ (N : ℕ) [NeZero N] (f : HeckeRing.GL2.Newform N 1), ∃ E x, ∃ (NumberField E) (IsGalois ℚ E), ∃ ρ, ρ.IsIrreducible ∧ ∀ s, 1 < s.re → finiteArtinLSeries ℚ E ρ s = LSeries (fun n => coeff n (qExpansion 1 f.toCuspForm)) s`, the README's statement at lines 1790–1794 exactly (nonzero natural level, finite Galois number field, irreducible plane, `Re s > 1`). No binder was lost: the theorem has no section variables. The sixteen other signatures are unchanged from the previous head (`signatures.md`, 17 declarations, none with a lost binder).
- One-tactic probe: on the same scratch copy the new theorem's `sorry` was replaced by `first | simp | infer_instance | rfl`; all three alternatives fail (the goal is the existential above). Not padding. The ten previous probes are carried from the review at 6802a8f (zero closed).

### Headline inventory

Eleven stated headlines: the ten of the previous review plus the full weight-one L-series comparison. The docstring now lists as not statable: the completed functional equation, conductor–discriminant identity, local and global root numbers, orthogonal obstruction comparison, elliptic root numbers (no conductor or Weil–Deligne epsilon carrier), the weight-one conductor-level refinement (no Artin conductor carrier), and Stark comparisons (no regulator carrier). I confirmed that `Conductor.artinConductor` and the other conductor names of README line 132 are supplier targets absent from the pins (the worker's 26 unresolved leads are the same list as at the previous head; all are own, supplier or database names). The weight-one conductor equality `𝔣(ρ) = N` is therefore correctly left to §5.2 (README line 1276, Deligne–Serre 4.6(a)).

### Seeded source sample, where it falls in the changed passages

| Sampled target | Text inspected | What the evidence supports |
|---|---|---|
| §7.6 Klein's classification and the projective type (conventions row, line 280) | Beauville's statement as read in the previous review; the algebra: an abelian image has no irreducible plane | The reworded exclusion “an irreducible two-dimensional ρ never has cyclic projective image” is correct: cyclic projective image means the image lies in `ℂ^× · ⟨g⟩`, which is abelian, so a two-dimensional representation is reducible. The old wording (“an irreducible ρ is never cyclic”) wrongly excluded the trivial line. |
| §9.3 Frobenius matrices and the display (the code now cited in §9.2) | `lmfdb` web_modlgal.py, `frobenius_matrices_pretty`, cache line 210 | The display lists primes below 100 not dividing `conductor · ℓ`. This supports the §9.2 bullet that the excluded set is the conductor support together with **all** places above ℓ, and that exclusion is not ramification. |
| §8.2 weight-one dictionary (the new paragraph, not in the seeded list but the subject of the diff) | `deligneserre1974` lines 262–274 (Thm 4.1, pp. 513–514), 265–266 (footnote: Artin's conventions, arithmetic Frobenius), 293–298 (Thm 4.6, p. 514: (a) Artin conductor equals `N`, (b) `L(s,ρ) = Σ a_n n^{−s}`), 299–301 (Cor. 4.7), 308–356 (proof, pp. 515–516) | Theorem 4.6 is on a primitive cusp form, matches the `Newform` carrier (new, normalized, eigen away from the level: Miyake's primitive form), gives the full Dirichlet series including `p ∣ N`, and uses the arithmetic Frobenius, as `finiteLocalPolynomial` does. Locators “4.6(a)” and “4.6(b), p. 514” are exact. |

The other thirteen seeded targets fall in unchanged passages; their checks are carried from the review at 6802a8f.

### Computed adversarial rows for the changed statements

| Statement | Instance | Values on the two sides / wrong-model control | Result; change |
|---|---|---|---|
| `weight_one_full_artin_comparison`, good primes | `f = η(z)η(23z)` (level 23, nebentypus χ₋₂₃), ρ the S₃ standard representation | Series computed from `q∏(1−qⁿ)(1−q²³ⁿ)`: a₂=−1, a₃=−1, a₄=0, a₅=0, a₆=1, a₈=1, a₁₆=−1. Expansions: `1/(1+X+X²) = 1 − X + 0X² + X³ − X⁴`, `1/(1−X²) = 1 + 0X + X²`. Products agree at 2, 4, 8, 16, 5, 25. | Retain; the Check's a₂, a₄, a₅, a₂₅ are exact. |
| same, ramified prime | same `f` at 23 | a₂₃ = 1 and a₂₄ = a₈a₃ = −1 from the series; `V^I` is the line fixed by a reflection, Frobenius acts by 1 there: `P₂₃ = 1 − X`, `1/(1−X)` gives a₂₃ = a₅₂₉ = 1. A definition discarding ramified primes gives a₂₃ = 0. | Retain; the factor at 23 is included on both sides. |
| same, reducible wrong output | the trivial plane `1 ⊕ 1` | `P₂ = (1−X)²`, `1/(1−X)² = 1 + 2X + 3X²`: a₂ = 2 ≠ −1; every line invariant, `IsIrreducible` false. | Retain irreducibility in the conclusion. |
| same, empty input | `N = 1`, or any `N` with no weight-one newform | `Newform N 1` is empty (a nonzero weight-one form needs odd nebentypus and `N ≥ 23` over ℚ); the statement is vacuously true, not false. | Retain. |
| same, convergence | `Re s > 1`, `|a_n| ≤ d(n)` (Cor. 4.2: a_p is a sum of two roots of unity) | `LSeries` is an absolutely convergent `tsum` (term 0 at n = 0 agrees with a₀ = 0 of a cusp form); `finiteArtinLSeries` is a `tprod` of factors `1 + O(p^{−σ})`, multipliable. Neither side is a junk value. | Retain the `1 < s.re` hypothesis. |
| same, Frobenius convention | arithmetic versus geometric Frobenius on the tetrahedral example at p = 2 | Arithmetic gives `1 − X + ζ₃X²`-type factor matching ω(2) = ζ₃ (previous review, boundary Check); geometric would compare `f` with its Galois conjugate. Deligne–Serre's footnote fixes the arithmetic convention, and `finiteLocalPolynomial` uses `IsArithFrobAt`. | Retain. |
| same, carriers at the pins | `Newform.lean:85,:104–109`, `Irreducible.lean:29`, `LSeries/Basic.lean:74,:164`, `QExpansion.lean:171` | `Newform N 1` bundles cusp form, χ, good eigenconditions, `isNew`, `isNorm`, `ne_zero`; `IsIrreducible` is `IsSimpleOrder (Subrepresentation ρ)`; `qExpansion 1 f` has coefficient `a_n`. The README's supplier bullet (lines 375–378) describes the structure exactly, including “no bad-prime eigencondition”. | Retain. |
| §9.2 ramifiedSet as the non-unramified places | trivial mod-3 line | inertia image {1} at every prime; prime-to-3 conductor 1; `ramifiedSet = ∅`; complement of IsGoodPrime = {3}. The old union gave {3}. | Repaired; retain the negative control. |
| §9.2 union formula | mod-5 cyclotomic character | prime-to-5 conductor 1; inertia at 5 has order 4; `ramifiedSet = {5}` = conductor support ∅ ∪ ramified places above 5 = {5}; excluded set {5}. | Retain. |
| §9.2 value away from ℓ | χ₋₄ modulo 3 | inertia image at 2 is {1,−1} (−1 ≠ 1 in 𝔽₃), at 3 is {1}; Artin exponent 2 at 2 so prime-to-3 conductor (4); `ramifiedSet = {2}`; excluded set {2,3}. | Retain. |
| §9.2 complement of IsGoodPrime | general ρ̄ | ¬(v ∤ ℓ ∧ unramified) = (v ∣ ℓ) ∨ (v ∤ ℓ ∧ ramified) = places above ℓ ∪ conductor support; matches the display's exclusion of `p ∣ conductor·ℓ` (web_modlgal.py line 210). | Retain. |
| §9.2 isomorphism invariance | an equivariant isomorphism `e` | `e ∘ ρ̄(g) = ρ̄'(g) ∘ e`, so `ρ̄(g) = 1` iff `ρ̄'(g) = 1` for every inertia element; both predicates and the set are preserved. | Retain. |
| §9.2 finiteness of ramifiedSet | any continuous ρ̄ with finite image | the splitting field is a finite extension, ramified at finitely many places; the “finite set” wording is justified by Tau Ceti's `finite_ramifiedPrimes` cited at line 910. | Retain. |
| Container Check (line 2302) | trivial line; trivial plane | line: irreducible, `[G:G] = 1`, Artin field ℚ, projective image trivial; plane: every line invariant, reducible, outside §7.7's domain. | Repaired; retain. |
| Conventions row (line 280) | the trivial line; the S₃ standard representation | line: projective image trivial (cyclic) and irreducible, so the old wording was false for it; standard: projective image S₃, not cyclic. | Repaired; retain. |
| §5.2 conductor-level refinement | `η(z)η(23z)` | Artin conductor of the S₃ representation 23 = level 23; nebentypus χ₋₂₃ of conductor 23 divides 23. Deligne–Serre 4.6(a) at line 295. | Retain as a README target (no conductor carrier). |

### Carried adversarial rows

The 126 rows of the review at 6802a8f for the untouched statements (§§1.1–1.6, 2.1–2.4, 3.1–3.6, 4.1–4.4, 5.1, 6.1–6.5, 7.1–7.9, 8.1, 8.3, 9.1, 9.3–9.5 and the worked examples) are carried forward unchanged; their computed values stand as recorded there, including the local polynomials `1+X+X²`, `1−X²`, `1−X` of the conductor-23 representation that the new Checks reuse, the Klein orbit counts, the Q₈ indicator −1, the quartic root number ≈ 0.8507 + 0.5257i, and the mod-2 table of 37.a1. Nothing in the diff changes an input of those rows.

### Pinned declarations and cross-roadmap citations opened this round

| Location | Evidence |
|---|---|
| `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:85–101, 104–109` | `EigenformAwayFromLevel` and `Newform` as described above; weight is `ℤ`, so `Newform N 1` is weight one. |
| `Mathlib/RepresentationTheory/Irreducible.lean:29` | `IsIrreducible` = `IsSimpleOrder (Subrepresentation ρ)`: excludes the zero space and the trivial plane. |
| `Mathlib/NumberTheory/LSeries/Basic.lean:74, 164` | `term` is 0 at n = 0; `LSeries` is the `tsum`. |
| `Mathlib/NumberTheory/ModularForms/QExpansion.lean:171` | `qExpansion h f` has Taylor coefficients of the cusp function; `h : ℝ`, here `1`. |
| AutomorphicGaloisRepresentations §2.10 (open head, README line 1419) | good polynomial, unramified outside `N`, cuspidal irreducibility; no bad-prime factor (R01). |
| GL2AutomorphicRepresentationsAndTransfer R17.5.1 (:2242), R17.5.5 (:2266), R17.5.9 (:2329), R16.6.6 (:1319) at its open head | dihedral automorphy; all-place upgrade of weak matching with full `L/ε`; solvable odd Artin ↦ weight-one newform with `L(s,f) = L(s,ρ)`; the primitive weight-one dictionary. |
| ModularityAndLanglandsExtensions §1.2 (:486), §1.9 (:640) at its open head | strong Artin at every place via R17.5.5, with the explicit Check that the Deligne–Serre representation of a weight-one newform matches `π_f`; `A₅` images over totally real fields. |
| `TauCetiRoadmap/ModularForms/README.md:231–234` (main) | Layer 4: newform decomposition with conductor, bad-prime eigenvalue classification, strong multiplicity one, Atkin–Lehner. |
| `TauCetiRoadmap/ArtinRepresentations/README.md:1276` | §5.2 states `𝔣(ρ) = N` for the weight-one form as the conductor refinement, with Deligne–Serre 4.6(a). |

All suppliers named by the changed passages are earlier in the merge order or on main; none is cited by pull-request number. Ownership of the full weight-one comparison: no roadmap on main or at the listed open heads states a Lean theorem equating a newform L-series with an Artin Euler product (GL2AutomorphicRepresentationsAndTransfer's `odd_solvable_artin_weight_one` is the converse direction at good primes, as its README lines 2334–2338 say), so this roadmap is the owner of the acceptance statement.

## Not verifiable

- The LMFDB column name `conductor_primes` (README line 1966) does not occur in the cached `web_modlgal.py`; the display code uses `conductor` and `base_ring_characteristic`. The mathematical content of the bullet does not depend on the name.
- The items recorded at 6802a8f stand unchanged: `neukirch1999`, `serrerep`, `serrelocal`, `tate1979`, `tate1984`, `chinburg1983`, `frohlichqueyrut1973`, `halberstadt1998`, `frohlich1985`, `klein1884` are publisher-only or unresolved; the minimum-container database definition is uncertified; the octic field identification in the tetrahedral worked example is not certified by the recomputed discriminants. None of these is touched by the diff.

## Source issues

- none

The two errata recorded at 6802a8f (Beauville Prop. 1.1 at r = 2; Martinet Ch. II §1 induction identification) are unchanged and already in the register.
