# FIX-PKG-LocalLanglandsCorrespondenceForG2~6

Findings of REV-PKG-LocalLanglandsCorrespondenceForG2~5 (two findings). Edited: `packages/LocalLanglandsCorrespondenceForG2/README.md` only. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P2) — applied differently

The ownership conflict is real, but the suggested gap is unnecessary. The ClassicalGroups revision the review cites has merged into main (main commit `848b62d0`, "ClassicalGroups: rational classification and explicit GT bases"). Main's `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md` §6.2, lines 1139–1145 ("For the Spin covers …"), now states the lifted Spin(2r) → Spin(2r−1) branching for rows all in ℤ + ½, with the D_r → B_(r−1) rule λ₁ ≥ μ₁ ≥ ⋯ ≥ λ_(r−1) ≥ μ_(r−1) ≥ |λ_r| and the fixed norm-one vector q = (u_r+v_r)/√2. It also says that "the spin branching itself, with half-integral rows, is a target of this section and §6.7". `roadmaps grep` finds this text only on main, and `roadmaps overlaps ClassicalGroups` reports no open pull request that changes or drops it. Declaring `gap:classical-half-integral-spin-branching` would therefore ask a supplier for a target it already states, so I declared no gap and imported the result from main.

Old → new: §0.1 "Prove that under Spin₇(ℂ) ⊂ Spin₈(ℂ) … restricts to 1 ⊕ q … s", together with its own *Route* → ι is defined, and V₈ ∘ ι ≅ 1 ⊕ q and S₈^± ∘ ι ≅ s are cited as ClassicalGroups §6.2 at r = 4, at the weights (1,0,0,0) and (½,½,½,±½), with §6.7. The Route is deleted. The target keeps only the parameter consequences, now including V₈ ∘ ι ∘ φ̃ ≅ 1 ⊕ q ∘ φ̃ and S₈^± ∘ ι ∘ φ̃ ≅ s ∘ φ̃. That is the form §2.1 (Check "Restricted to Spin₇(ℂ) …") and §2.2 consume. I also added a Check that computes the interlacing rows.

Other places changed by the same repair:
- Scope and ownership, the imports bullet (the restriction is now listed there as ClassicalGroups §6.2, §6.7).
- Exact supplier contracts, "From Tau Ceti roadmaps on main": new RepresentationTheory/ClassicalGroups §6.2 bullet with the exact rule consumed.
- How to read the build: "branching" → "the parameter forms of the imported branching rules".
- Layer 0 Dependencies: ClassicalGroups §§6.2, 6.7 added.

The §0.1 section number, its other parameter isomorphisms and its numerical Checks are kept.

## F02 (P3) — applied

The defect is confirmed. For φ̃(Frob) = i(j(diag(−1,1,−1))), the spin spectrum is 1⁴(−1)⁴, and negating it gives the same multiset (traces 0 and 0).

Old → new: §0.1 Check "two Spin₇-valued parameters differing by … have … all 1 versus all −1" → the general rule plus two examples:
- Rule: twisting leaves q ∘ φ̃ unchanged and sends the spin eigenvalues λ₁,…,λ₈ to −λ₁,…,−λ₈.
- φ̃ trivial: spin traces 8 / −8, vector traces 7 / 7.
- Negative control, the finite-image φ̃ above: spin traces 0 / 0, vector traces −1 / −1. The q- and s-images are equal, so there is one weak class.

The same construction appeared in three more places, all repaired:
- §2.2 Check 2: the claim that SpinLift is not determined by the standard data is now witnessed at the trivial parameter.
- §2.5 Checks 1 and 3: the earlier Check used an unramified σ, which is outside §2.5's generic-discrete-series hypothesis. It now uses St_PGSp₆, whose parameter 1 ⊕ Sym⁶ becomes χ ⊗ (1 ⊕ Sym⁶) (traces 8 / −8).
- §10.3 Check 2: now names the unramified σ with trivial parameter. That σ is generic, so it lies in Irr♥ by MetaplecticAutomorphicForms §3.41.

The §0.6 and §0.7 Checks already name the trivial parameter explicitly and need no change.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| §0.1 V₈ ∘ ι ≅ 1 ⊕ q (ClassicalGroups §6.2, r = 4) | λ = (1,0,0,0); B₃ torus (t₁,t₂,t₃); central −1 | Rows: μ₁ ∈ [0,1], μ₂ ∈ [0,0], μ₃ ∈ [|0|,0], so μ ∈ {(1,0,0),(0,0,0)}, dimensions 7 + 1. Torus: V₈ eigenvalues t_i^(±1), 1, 1 = those of q plus 1. Trace at −1: 8 = 1 + 7. | Holds; Check added |
| §0.1 S₈^± ∘ ι ≅ s | λ = (½,½,½,½) and (½,½,½,−½); torus; central −1; wrong model "the two half-spins restrict differently" | Each λ forces μ = (½,½,½) (μ₃ ∈ [|±½|, ½]), dimension 8. The 8 weights of each parity project bijectively onto (±½,±½,±½). Trace at −1: −8 = tr s(−1). B₃ → D₃ goes the other way, with rows (½,½,±½), giving 4 + 4. | Holds; the wrong model is excluded by the single row |
| §0.1 independence of the nonisotropic vector | Q(v) = c ≠ 0 rescaled to Q = 1 | SO₈(ℂ) is transitive on {Q = 1} (Witt's theorem, with a reflection in the stabilizer O₇ correcting the determinant). An inner automorphism lifts to Spin₈ and fixes each half-spin class. | Holds; sentence added |
| §0.1 wrong embedding (lift of s : Spin₇ → SO₈) | central −1 | It maps to a central element acting by −1 on V₈, so V₈ restricts to s (trace −8) and not to 1 ⊕ q (trace 8). | Existing Check retained |
| §0.1 parameter forms with N | principal SL₂ of Spin₇, ρ∨ = (3,2,1) | Spin weights ±3±2±1 = 6,4,2,0,0,−2,−4,−6, so s ∘ φ̃ = 1 ⊕ Sym⁶. V₈ ∘ ι ∘ φ̃ = 1 ⊕ q ∘ φ̃ = 1 ⊕ Sym⁶, and S₈^± ∘ ι ∘ φ̃ = 1 ⊕ Sym⁶. N rank 6 on each. This agrees with St_PGSp₆ → St_PGSO₈ with parameter Sym⁶ ⊕ 1 (§2.5 Examples). | Consistent across §§0.1, 2.1, 2.5 |
| §0.1 twist rule (F02) | φ̃ = 1; φ̃(Frob) = i j diag(−1,1,−1); χ(Frob) = −1 | Trivial φ̃: spin 1⁸ → (−1)⁸, traces 8 / −8; vector 7 / 7. Finite-image φ̃: v spectrum 1,−1,1,−1,−1,1,−1 (trace −1); spin 1⁴(−1)⁴ → (−1)⁴1⁴, traces 0 / 0; vector −1 / −1. det diag(−1,1,−1) = 1, so the element lies in SL₃. | General rule holds; the constant-spectrum claim holds only for φ̃ = 1; negative control added |
| §0.1 negative control, weak class | same finite-image φ̃ | Both images are unramified with N = 0 and semisimple Frobenius, with equal spectra, so they are isomorphic. Hence one weak class (§0.6). | Claimed only up to weak class |
| §2.2 Check 2 | σ unramified with trivial parameter, and its twist | Spin eigenvalues 1⁸ → (−1)⁸; standard eigenvalues 1⁷ → 1⁷. | Existential claim witnessed |
| §2.5 Checks 1 and 3 | σ = St_PGSp₆ (generic discrete series); f₁ in place of f₂ | Parameter 1 ⊕ Sym⁶ → χ ⊗ (1 ⊕ Sym⁶): trace at (Frob,1) 8 → −8. The f₁ route predicts 8 → 8. | Now within §2.5's hypothesis |
| §10.3 Check 2 | σ unramified generic, with trivial parameter, in Irr♥ | The f₂ route gives spin eigenvalues 1 → −1; the f₁ route predicts no change. | Holds |

## Checks run

- **Elaboration.** `lake env lean packages/LocalLanglandsCorrespondenceForG2/Suggested.lean`, run from the content checkout, exited 0. The only diagnostics were `declaration uses 'sorry'` at 118:8 and 137:8. The used `TauCeti.Algebra.Octonion.Basic` object file existed, so nothing was built.
- **Signatures.** I elaborated a scratch copy with `#check @` for all five declarations: `octonionAut`, `octonionRep`, `sumSquaresSeven`, `griess_conjugacy` and `spin7_not_acceptable`.
  - `octonionRep` keeps `[Group Γ]`.
  - `griess_conjugacy` keeps both `IsSemisimpleRepresentation` hypotheses and the intertwining hypothesis `∃ e, ∀ γ x, e (ρ γ x) = ρ' γ (e x)`.
  - `spin7_not_acceptable` keeps `Finite Γ` and the ∀γ IsConj ∧ ¬∃g form.

  No binder was lost and no signature changed. `Suggested.lean` is untouched, and no Lean name was added, removed or renamed.
- **Dependency check** (the prescribed `gate --depcheck`), output exactly:

```text
depcheck: 245 roadmaps, 2241 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line. The new supplier, RepresentationTheory/ClassicalGroups, is on main.
- **Citations.** `roadmaps resolve` on the README reports no cross-roadmap citations and no Lean names found nowhere.

## Ownership

- The Spin₈ → Spin₇ branching is now owned by ClassicalGroups on main (§6.2 for the integral and half-integral rows, §6.7 for the construction). This roadmap no longer states it.
- `roadmaps overlaps ClassicalGroups` shows no open pull request changing that roadmap.
- No new object is owned here.
- Ownership against all other open pull requests was not re-checked this round beyond the two findings.

## For the maintainer

- The review's proposed `gap:classical-half-integral-spin-branching` is not declared. The text it asks for is on main (ClassicalGroups §6.2, "For the Spin covers"), so the gap list stays at the same fourteen slugs.
- The `design/plan.json` target `LocalLanglandsCorrespondenceForG2:LG.0/branching` still words the Spin₈ restriction as a statement of this roadmap. That field is outside this job's editable scope (only the top-level `gaps` list is), and the README now cites ClassicalGroups for it.
- No name that other roadmaps cite changed: §0.1 keeps its number and heading.
- No source was fetched or requested, and `needs-references.toml` was not written.
