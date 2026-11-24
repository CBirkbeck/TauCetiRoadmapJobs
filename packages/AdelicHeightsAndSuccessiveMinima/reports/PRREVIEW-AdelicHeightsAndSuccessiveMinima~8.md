# Review of AdelicHeightsAndSuccessiveMinima (pull request #3027 at 71bbefa)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/AdelicHeightsAndSuccessiveMinima/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 287 changed lines since `aecb53a`. I checked the rewritten Layer 2 (the new statement of 2.5a, its route through ArakelovGeometryAndAbelianHeights §§1.5a–1.5b and its Checks), the new origin and method labels of 3.1 against Bombieri–Vaaler and against the formal proof's source and kernel export, and the trimmed `Suggested.lean`. The new mathematics is correct. Two findings block. First, section 2.5a and Layer 2 keep their ids but now cover another subject, and the statements they had on `main` have left this roadmap (P1). Second, the new headline (1) can be stated at the pins, but `Suggested.lean` neither states it nor says what it lacks (P2). There are also two small corrections and one format note, and three points for the human reviewers.

## R01 (P1) — Section 2.5a and Layer 2 keep their ids but now cover another subject, and the statements they had on `main` are gone from this roadmap

The coverage record is keyed by these ids, and every citation of "AdelicHeightsAndSuccessiveMinima §2.5a" now points at a different result. On `main`, SlopesOfHermitianVectorBundles cites 2.5a nine times for the two heights, their value at `A = 1` and the case `n = 1` (its README on `main`, lines 57, 61, 146, 150, 215, 261, 562, 639, 1196). At the merge base, Layer 2 "Adelic heights of vectors and subspaces" (line 21) and 2.5a (line 25) define the height of vectors and of subspaces over every finite extension `L/K`. They state four groups of properties: well defined, standard data, change of basis, extreme cases (lines 42–58), with three Checks (lines 87–92). At this head, Layer 2 (line 34) and 2.5a (line 38) state the Gram/index height of a lattice with a frame over a CM field instead. The old statements reappear, almost word for word, as DiophantineApproximationAndTranscendence §2.5a, a section this pull request adds to that roadmap (its README, lines 1410–1426). The scope paragraph (line 255) now names that section as their owner.

The smallest repair is to restore Layer 2's title and section 2.5a under its id, with its statements and Checks. The lattice-with-frame statement would then take a new id, for instance 2.5b. The move to DiophantineApproximationAndTranscendence has a reason: ArakelovGeometryAndAbelianHeights §1.5b needs these statements (its *Needs:* line), and this roadmap consumes §1.5b, so the proofs have to sit below both. The restored 2.5a could therefore say in one line that DiophantineApproximationAndTranscendence §2.5a proves them, and keep its statements as the record. The four Lean declarations can stay in that roadmap's `Suggested.lean`.

## R02 (P2) — Headline (1) can be stated at the pinned Mathlib, but `Suggested.lean` does not state it and does not say what it lacks

The README calls the lattice-with-frame height headline (1). An implementer has no formal acceptance test for it, and the module docstring says only that it "is not stated" (lines 18–19), without naming a missing carrier. Its first two clauses need nothing beyond Mathlib: independence of the lattice vectors, and invariance under an automorphism of `Λ` applied to frame and subspace together. A scratch file elaborates against the pins with only `sorry` warnings. It uses one predicate (a CM type: a `Finset (E →+* ℂ)` with `τ ∈ Φ ↔ ComplexEmbedding.conjugate τ ∉ Φ`) and one definition with a real body: the product over `Φ` of `((F τ)⁻¹ * Z_τ)ᴴ * ((F τ)⁻¹ * Z_τ)).det.re`, divided by `(span (𝓞 E) (range z)).toAddSubgroup.relIndex (Λ.toAddSubgroup ⊓ (span E (range z)).toAddSubgroup)` (Mathlib `NumberField.IsCMField`, `Mathlib/NumberTheory/NumberField/CMField.lean:70`; `relIndex`, `Mathlib/GroupTheory/Index.lean:62`). The theorems were:

```lean
theorem latticeFrameHeight_eq … (hΦ : IsCMType Φ) (hΛ : Λ.FG)
    (hspan : Submodule.span E (Λ : Set (Fin n → E)) = ⊤) (hF : ∀ τ ∈ Φ, IsUnit (F τ).det)
    (hz : LinearIndependent E z) (hz' : LinearIndependent E z') (hzΛ : ∀ i, z i ∈ Λ)
    (hz'Λ : ∀ i, z' i ∈ Λ) (hzz' : span E (range z) = span E (range z')) :
    latticeFrameHeight Φ Λ F z = latticeFrameHeight Φ Λ F z'
theorem latticeFrameHeight_map … (g : GL (Fin n) E) (hg : ∀ x, x ∈ Λ ↔ (g : Matrix _ _ E) *ᵥ x ∈ Λ) … :
    latticeFrameHeight Φ Λ (fun τ ↦ (g : Matrix _ _ E).map τ * F τ) (fun i ↦ (g : Matrix _ _ E) *ᵥ z i) =
      latticeFrameHeight Φ Λ F z
```

The fix is to state these two clauses. The docstring would then name only the clause that cannot be stated here: the comparison with `H_A` needs the definitions of DiophantineApproximationAndTranscendence §2.5a, which this file cannot import.

## C01 — The overview presents the adelic comparison as part of headline (1), but 2.5a reaches it only inside its route

The overview (line 5) says the quotient "is the subspace height `H_A(U)` …, raised to the power `[E:ℚ]`, for an adelic matrix `A` of `Λ` and `F`". In 2.5a the statements to provide are only the two bullets at lines 67–68. The identity `h_{Λ,F}(U) = H_A(U)^[E:ℚ]` appears only in the route (line 113), and the scope paragraph (line 253) does not list it among the roadmap's statements. The identity is true: the frame `F_τ = 2` gives `1/4 = (1/2)²`, and a non-principal ideal `𝔞` of `ℚ(√−5)` gives `N𝔞 = (N𝔞^(1/2))²`. A third bullet in 2.5a would fix this, for example "*Adelic form*: `h_{Λ,F}(U) = H_A(U)^[E:ℚ]` for every adelic matrix `A` of `Λ` and `F`". Alternatively, the overview could call the identity the route.

## C02 — For this folder, the description does not say that the number 2.5a now means something else

The description says "Section numbers are unchanged, since the roadmaps cite one another by section." Here the number 2.5a was kept, but its subject changed, its former statements moved to DiophantineApproximationAndTranscendence §2.5a, and the four declarations `adelicHeight`, `adelicSubspaceHeight`, `adelicSubspaceHeight_one` and `adelicSubspaceHeight_top` left this `Suggested.lean`. Text that would be right at this head: "In AdelicHeightsAndSuccessiveMinima, §2.5a now states the subspace height of a lattice with a frame over a CM field; the adelic heights it stated before, with the four declarations of its `Suggested.lean`, are DiophantineApproximationAndTranscendence §2.5a." If R01 is repaired, this sentence changes with it.

## N01 — The "Corollaries of general theorems" paragraph (lines 26–32) describes a future change to the proofs

The paragraph contains "As long as that general theorem is not in the library…" and "Once the general theorem is in the library, … the lemmas that only the first proof uses are removed". That is a plan for future edits, not timeless text. One option is to state only the convention: what a `*Corollary of:*` line names and which clauses it covers.

## Questions for the author

- Which roadmap uses the new 2.5a? At this head, no section of the family or of any other roadmap cites "AdelicHeightsAndSuccessiveMinima 2.5a". SlopesOfHermitianVectorBundles now takes the heights from DiophantineApproximationAndTranscendence §2.5a, and from this roadmap only 3.1. The search covered every README at this head, so I could not tell whether a consumer is intended.

## Verified sound

| Statement | Instance | Values computed on each side | Result |
|---|---|---|---|
| 2.5a well defined | `E = ℚ(i)`, `n = 1`, `Λ = ℤ[i]`, `F = 1`, `U = E` | `z = 1`: `1/1 = 1`; `z = 1+i`: Gram `2`, index `N(1+i) = 2`, so `1` | holds |
| 2.5a well defined, `Λ` not free | `ℚ(√−5)`, `Λ = 𝔞 = (2, 1+√−5)`, `F = 1` | `z = 2`: `4/2 = 2`; `z = 1+√−5`: `6/3 = 2`; both `N𝔞` | holds |
| 2.5a, `U = 0` | empty family | 0×0 Gram determinant `1`, index `[0 : 0] = 1`; convention `h = 1` | agrees |
| 2.5a route, change by `T` | `p = 1`, `T = 1+i` | Gram multiplied by `|1+i|² = 2`; index multiplied by `|N(1+i)| = 2` | quotient kept |
| 2.5a automorphisms | `Λ = ℤ[i]`, `F = 2`, `g = i` | `G = 2i`, `G⁻¹·τ(g z) = z/2`; Gram `1/4` on both sides | holds |
| 2.5a, `g(Λ) = Λ` needed | `g = 2`, `F = 1`, `U = E` | left: Gram `1`, index `[ℤ[i] : 2ℤ[i]] = 4`, so `1/4`; right `1` | fails without hypothesis; hypothesis is stated |
| 2.5a route, adelic form | `F = 2` on `ℤ[i]`; `𝔞` above with `A_𝔭 = π^(−v_𝔭(𝔞))` | `1/4 = (1/2)²`; `N𝔞 = 2 = (2^(1/2))²` | holds (C01) |
| 2.5a route, sub-bundle degree | Arakelov §1.5a Gram formula on `Λ ∩ U`, basis `z` | `deg = log index − Σ_{τ∈Φ} log Gram_τ = −log h`; §1.5b (ii) gives `−[E:ℚ] log H_A(U)` | consistent |
| 2.5a Check 2 | `A_τ = 1/2`, `A_𝔭 = 1` | `|det A|_𝔸 = |1/2|^(2/2) = 1/2`; `(1/2)² = 1/4 = h` | true |
| 2.5a remark, first absolute minimum | `n = 2, 3` | `2^((n−1)/2)` vs `√n`: equal at `n = 2`; `2 > 1.73` at `n = 3` | "not a consequence for `n ≥ 3`" true |
| 3.1 origin, BV Theorem 3 | BombieriVaaler1983 lines 325–356 (p. 18) | open, bounded, convex, symmetric `S_v`; `(λ_1⋯λ_L)^d V(S) ≤ 2^(dL)` | supports the upper bound for product bodies |
| 3.1 origin, BV Theorem 6, (3.16) | lines 511, 517–523 (pp. 22–23) | `S_v = αS_v` for `|α| = 1` at complex `v`; constant uses `L!`, `(2L)!` and the discriminant | supports "under (3.16), other constants" |
| Headline (2), lower bound | `K = ℚ`, `Λ = ℤ`, `B = [−1, 1]` | `2/1!·1 = 2` vs `μ_0·vol B = 1·2 = 2` | equality |
| Headline (2), not balanced | `ℚ(i)`, `ℤ[i]`, rectangle with `ε < 1/2` | needs `2 ≤ μ_0²·4ε = 4ε` | fails; balancedness needed and stated |
| 3.1 method label | `Formalism.FN.MinkowskiIIUpper`, `SuccMinFacts` | compact, convex, symmetric, `0 ∈ interior`, any Haar measure; `μ(K)·∏ succMin ≤ 2^m·covol`; attainment by an independent family | matches |
| 2.5a formal form | `GlobalTheory.T.heightSup_invariant_under_hermitianLattice_aut` | `IsUStab` (Hermitian form and `Λ`); supremum of `d^(−δ)` per dimension invariant under `lact γ` | matches; the general variant takes an arbitrary form |
| Headline (1) in Lean | scratch probe at the pins | elaborates; only `sorry` warnings | statable (R02) |

- Source locators checked against the text: 4. BombieriVaaler1983 Theorem 3 (line 355, p. 18), Theorem 6 (line 517, p. 23) and (3.16) (line 511, p. 22); Roy–Thunder 1996 §1 (pp. 3–5) and Proposition 4.2 with (4.1) (p. 11), in the GDZ open copy of J. reine angew. Math. 476.
- Formal-proof locators: 7 declaration names opened in the operator's local copy of the repository's `src/`. All 7 occur in the kernel export of its five main theorems. `MinkowskiIILower` does not occur there, which agrees with "only the upper bound and the attainment".
- Library declarations opened at the pins: 9. Mathlib `NumberField.IsCMField` (CMField.lean:70), `relIndex` (GroupTheory/Index.lean:62), `Matrix.gram` (GramMatrix.lean:40). Tau Ceti `deltaL` (Height/Twisted/Determinant.lean:45), `twistedHeight` (Height/Twisted/Basic.lean:182), the two Minkowski halves (GeometryOfNumbers/MinkowskiSecond.lean:626, 728), `Submodule.mixedImage` (MixedImage.lean:120), `exists_linearIndependent_comp_finrank_mul` (Extraction/Basic.lean:106).
- Cross-roadmap citations resolved at this head: 16. DiophantineApproximationAndTranscendence §§0.0, 2.5, 2.5a, 2.8; ArakelovGeometryAndAbelianHeights §§1.5a, 1.5b, 1.12, 1.14; SubspaceTheorem §§4.1–4.3; SuccessiveMinima §2.1; SlopesOfHermitianVectorBundles §§4.1, 4.3, 4.3a.
- Dependency check: `depcheck: 132 roadmaps, 1465 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- Automatic checks: the worker's run passed every check. My rerun flagged only the outside-folder check (set aside below). Every changed file lies in a folder the brief names as the pull request's own.
- Elaboration: `lake env lean` on `Suggested.lean` gave two `sorry` warnings (lines 55, 72) and nothing else. The elaborated signatures of the four declarations agree with 3.1, and that part of the file is unchanged by the diff.
- One-tactic probe: not run. The two theorems left in the file are the halves of Minkowski's theorem over `K`, untouched by the diff and not one-step consequences of the library.

Overlap check: read SlopesOfHermitianVectorBundles, SuccessiveMinima, SubspaceTheorem (and DiophantineApproximationAndTranscendence §2.5a, ArakelovGeometryAndAbelianHeights §§1.5a–1.5b). Shared objects and their owners: the minima over `K` (SubspaceTheorem §4.2), the real Minkowski halves (DiophantineApproximationAndTranscendence §0.0, Tau Ceti), the height `H_A` and its elementary properties (DiophantineApproximationAndTranscendence §§2.5–2.5a at this head; see R01). All are cited, and none has two owners. No open pull request other than this one changes or cites the folder.

Source independence: 9 passages compared with 3 sources (changed passages only): the two origin lines with Roy–Thunder §1 and Proposition 4.2 and with BombieriVaaler1983 Theorems 3 and 6; the 3.1 method label, the 2.5a statement paragraph and its paragraph on the formal form with the formal proof's statements; the labels paragraph, the corollary paragraph and the 2.5a route. Nothing is shared beyond formulae and names. Largest share: BombieriVaaler1983 and [FormalProof], 9 of 21 locators each. Contents not compared, because the change adds, removes or reorders no layer.

Research link: Layer 2's height is the twisted height of Roy and Thunder (1996, absolute Siegel's lemma), here in the Gram/index form of the Arakelov degree of a Hermitian sub-bundle. Layer 3 extends Bombieri and Vaaler's (1983) Minkowski theorem over number fields. SlopesOfHermitianVectorBundles §4.1 uses Layer 3. Rests on the README and on the two sources I read.

## Not verifiable

- Bombieri–Gubler, *Heights in Diophantine Geometry*, Appendix C.2: cited through SubspaceTheorem §4.2 in untouched text; not opened.
- [Announcement] (Alpöge, 20 November 2026): read in the operator's local copy only to confirm its date and subject; it carries no locator in this roadmap.

Automatic checks set aside as false positives: on my rerun, the check that a pull request edits nothing outside the roadmap under review (it keeps other roadmaps from being changed without their own review) listed the files of the other roadmap folders and family indexes this pull request also adds or revises; each of those is part of this same pull request with a review of its own, and no changed file lies outside them.

## Source issues

- none

## For the human reviewers

- Scope: 2.5a's form and the labels of 2.5a and 3.1 rest on [FormalProof], a Lean formalisation announced on 20 November 2026 in a personal remark (README lines 283–284). It is unrefereed. Its kernel export contains every declaration name the folder cites.
- Licence: the README names seven declarations and a file path of the public repository leanprover-community/riemann-hypothesis (lines 72–75, 159–161, 283). No Lean is copied. I did not establish the repository's licence.
- Policy: lines 26–32 let 2.5a, a CM-only special case of DiophantineApproximationAndTranscendence §2.5a and ArakelovGeometryAndAbelianHeights §1.5a, be proved by the formal proof's route before the general theorem is in the library. The binding principles exclude route-specific shortcuts. Whether this convention is acceptable is for humans to decide.
