# FIX-DESIGN-SpectralSequencesAndConvergencePartII~6

Findings of `REV-DESIGN-SpectralSequencesAndConvergencePartII~5` (three, all P3). Files edited:
`packages/SpectralSequencesAndConvergencePartII/design/README.md` and
`packages/SpectralSequencesAndConvergencePartII/design/plan.json`. `sources.toml` is unchanged: no new
source is cited, since the new citations are pinned library declarations.

## F01 (P3) — applied

Old → new. §2.3 *Needs:* "2.1; Mathlib …" → "1.5 (finite case, for the total complex), 2.1; Mathlib …".
§4.3: "base §§1.3, 3.4 (for the two-column sequence)" added. §6.2: "5.2 (for multiplicativity only)"
added. plan.json: §2.3 already listed `target:1.5`. I added `§1.3` and `§3.4` of the base to target
4.3, and `target:5.2` to target 6.2.

Verification. §2.3's *Total complex* bullet cites "(1.5, finite case, applied to the columns)". §4.3's
two-column bullet is the deduction that §4.2(a) makes "(base §§1.3, 3.4)": every `d_r` with `r ≥ 2`
runs between columns `r` apart, so it vanishes and `E₂ = E_∞` (base §1.3). Base §3.4 then turns the
finite two-step filtration into the short exact sequence. §6.2's *Multiplicativity* bullet cites
"(5.2; …)".

None of the additions creates a cycle. 1.5 needs only 1.3 and the base. 5.2 needs 5.1 and the base.
The base sections were already suppliers. Base §3.6's *Two columns* item gives the same sequence, but
only for columns `{0, 1}`. Columns `{−1, 0}` would need a reindexing that the base does not state.
So, as §4.2 does, I cite §§1.3 and 3.4.

**The same pattern elsewhere.** I compared every `*Needs:*` line with the targets, base sections and
library names used in its statement, API bullets and route, but not in its Checks. I found and
repaired five more lines:

- §3.3: added "3.1 (the condition on the pairs)" and "2.5 (its naturality in the complex and in the
  functor, for naturality in the functors)". The statement quantifies over "pairs satisfying 3.1's
  condition", and the route uses "2.5's naturality in the complex … in the functor". In plan.json,
  target 3.3 gains `target:2.5` and `target:3.1`.
- §2.2: added Mathlib `CategoryTheory.NatTrans.rightDerivedFunctorPlus`. Its API bullet uses this
  declaration. plan.json already listed it.
- §3.1: added Mathlib `CategoryTheory.Functor.IsRightDerivedFunctor`. The definition of `t` uses its
  universal property. It is at the pin in `Mathlib/CategoryTheory/Functor/Derived/RightDerived.lean`.
  The pinned instance `F.rightDerivedFunctorPlus.IsRightDerivedFunctor F.rightDerivedFunctorPlusUnit
  (CochainComplex.Plus.quasiIso C)` is in `RightDerivedFunctorPlus.lean`. I added the name to the
  Mathlib supplier contract, next to `rightDerivedFunctorPlus`, and to plan target 3.1.
- §1.1: added Mathlib `HomologicalComplex₂.HasTotal`. Its API bullet uses it; the declaration is at
  `Mathlib/Algebra/Homology/TotalComplex.lean`, and the contract already listed it. Added to plan
  target 1.1.

Leads I checked and left alone:

- §2.3's "(2.6)" points forward to 2.6, which states projective Cartan–Eilenberg resolutions. It is
  not an input of 2.3, and adding it would create the cycle 2.3 → 2.6 → 2.3.
- §1.2's "(1.3)" is a forward pointer.
- §2.5's "as in 2.4" fixes notation only.
- The other numeric hits are source numbers, not targets: "(2.4.1)" and "Théorème 2.4.1" are in
  grothendieck1957; "Example 2.3", "Proposition 4.1", "Corollary 4.2" and "Example 4.3" are in
  may-primer.
- The Layer *Dependencies* lines already contain every added item: Layer 2 contains Layer 1, Layer 4
  contains base §§1.3 and 3.4, and Layer 6 says "Layer 5 for multiplicativity".

## F02 (P3) — applied

Old → new. The consumer line said "(the change-of-rings and hyperhomology sequences of its declared
gap on graded Tor spectral sequences)". It now says:

> its composite Tor sequence `Tor^{R̄}_i(k, Tor^R_j(R̄, M)) ⇒ Tor^R_{i+j}(k, M)` and its hyperhomology
> sequence of a bounded-below chain complex of right modules tensored with a left module, over a
> graded, possibly noncommutative algebra, are instances of 3.4 (`R̄ ⊗_R −` then `k ⊗_{R̄} −`) and of
> 2.6 (`− ⊗_R M`) in the abelian categories of graded modules; Layer 4 does not state them, and that
> roadmap takes them from its own named supplier.

plan.json `consumers` is changed to match.

Verification. InverseGaloisAndArithmeticFundamentalGroupsPartII, read at its open head, does not cite
this roadmap. In its *Exact supplier contracts* it asks DGAInfinity Layer 5 for these sequences
(gap:dga-graded-tor-spectral-sequences), "for a connected nonnegatively graded `k`-algebra `R`, not
necessarily commutative". This README's scope excludes graded Tor, and §4.4(a) takes `R` and `S`
commutative. So the old line contradicted the scope.

DGAInfinity is on main and does not state these sequences, which is why that roadmap declares a gap.
Calling DGAInfinity "the owner" would therefore be inaccurate, so the line points to that roadmap's
own supplier contracts instead.

Instance check for the new text:

- **3.4.** Graded left `R`-modules have enough projectives: graded free modules. `F = R̄ ⊗_R −` is
  right exact and sends `R(n)` to `R̄(n)`, which is projective and so `k ⊗_{R̄} −`-acyclic. Also
  `G ∘ F ≅ k ⊗_R −`. Hence `E²_{p,q} = L_pG(L_qF(M)) = Tor^{R̄}_p(k, Tor^R_q(R̄, M))`.
- **Degenerate cases.** For `R̄ = R`, `L_{q>0}F = 0`: the page is the single row `Tor^R_p(k, M)`, which
  is the abutment. For `R̄ = k`, `L_{p>0}G = 0`: the page is the column `Tor^R_q(k, M)`.
- **2.6.** A bounded-below chain complex is cohomologically bounded above, which is 2.6's
  hypothesis. With `− ⊗_R M` right exact, `E²_{p,q} = Tor^R_p(H_q K, M)`.

No Layer 4 statement is used, so the scope sentence stands unchanged.

## F03 (P3) — applied

Old → new. *From Tau Ceti* gains `TauCeti.ExactStructure.FiniteResolution.horseshoe`
(`TauCeti/CategoryTheory/Exact/Resolution/Horseshoe.lean`) and
`TauCeti.ExactStructure.abelian_isProjective_iff` (`Exact/Projective.lean`), consumed as they stand.
§2.1's projective bullet now names Tau Ceti's horseshoe as the finite case for objects; 2.1 adds
unbounded length, complexes and the relative form (b). The Tau Ceti bullet in *Scope and ownership*
gains the same item, and plan target 2.1's dual API gains the same sentence.

Verification at the pin. The pinned Tau Ceti is `2fd255d`, matching `lake-manifest.json`.

- `structure Horseshoe` is at line 49 of `Horseshoe.lean`. Its fields are `resolution`, the chain
  maps `ι` and `π`, `zero`, `ι_aug`, `π_aug`, `split n` (a splitting in each degree) and
  `length_le : resolution.length ≤ max r₁.length r₃.length`.
- `def horseshoe` is at line 235. It takes `hS : E.Conflation S` and finite `E.isProjective`
  resolutions of `S.X₁` and `S.X₃`, in any `ExactStructure` on a preadditive category with a zero
  object and binary biproducts.
- `abelian_isProjective_iff` is at line 218 of `Exact/Projective.lean`. For
  `TauCeti.ExactStructure.abelian`, relative projectives are exactly Mathlib's `Projective` objects.

The pattern search found no other place that says only the one-step horseshoe is at the pin. The
Layer 2 *Dependencies* line names the one-step injective horseshoe that Layer 2 actually uses; the
finite projective horseshoe is a comparison, not an input, so neither that line nor 2.1's *Needs*
changes.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §2.1, finite projective horseshoe = Tau Ceti | `0 → ℤ →(×2) ℤ → ℤ/2 → 0`; `r₁ = ℤ` (length 0), `r₃ = (ℤ →(×2) ℤ)` (length 1) | middle terms `ℤ ⊕ ℤ` in degree 0, `0 ⊕ ℤ = ℤ` in degree 1; length `1 ≤ max(0, 1)`; `0 → ℤ → ℤ² → ℤ → 0` exact | holds | none |
| same | `A = 0` | middle resolution `≅ r₃`, length `= r₃.length` | holds | none |
| same | `A`, `C` projective (length 0) | `C` projective, so the sequence splits: middle `A ⊕ C`, length 0 | holds | none |
| same, injective side | infinite injective resolution `ℤ/2 → ℚ/ℤ →(×2) ℚ/ℤ → ⋯` over `ℤ/4` | Tau Ceti's resolutions are finite, so this is not covered; 2.1(a) covers it | the bullet's "adds unbounded length" is needed | none |
| Contract: `RF` is `IsRightDerivedFunctor` | pinned instance at `CochainComplex.Plus.quasiIso C` | class: `RF.IsLeftKanExtension α` for a localisation `L` | text matches | none |
| §4.3 two columns via base §§1.3, 3.4 | `Tor_{≥2} = 0`, columns `p ∈ {−1, 0}` | `d_r` has bidegree `(r, 1−r)`, `r ≥ 2`: the source or target column is outside `{−1, 0}`, so `d_r = 0` and `E₂ = E_∞`; two-step filtration gives `0 → E₂^{0,n} → Hⁿ → E₂^{−1,n+1} → 0`; for `K = L = ℤ/2[0]`, `H^0 = H^{−1} = ℤ/2` | holds | none |
| §6.2 multiplicativity needs 5.2 | `M = ℤ[x]/(x²)` in degree 0, `d = 0`, `f = p` | `p` injective on `ℤ ⊕ ℤx`; `k = 0` since `H^1(M) = 0`, so every `d_r = 0`; `E_r = M/pM = 𝔽_p[x]/(x²)` with its product, which is 5.2's page-1 pairing on `H(gr^s) = M/pM` | holds | none |
| §3.3 naturality needs 2.5 and 3.1 | `α = id_F`, `β = id_G` | the induced chain maps are identities, so the page-2 components are `R^pG(R^q id) = id`, as the Check says | holds | none |
| Consumer line, 3.4 instance | `R̄ = R`; `R̄ = k`; `R = k[t]`, `R̄ = k`, `M = k` | `E²` = row `Tor^R_p(k, M)`; column `Tor^R_q(k, M)`; `k[t]`: `Tor^{k[t]}_q(k, k) = k` for `q = 0, 1`, column 0 only, abutment `k` in degrees 0 and 1 | holds | none |
| Consumer line, 2.6 instance | `K = R[0]`, `M` arbitrary | `E²_{p,0} = Tor^R_p(R, M) = M` at `p = 0`, else `0`; abutment `R ⊗_R M = M` | holds | none |

## Checks

Dependency check (after all edits):

```text
candidate: SpectralSequencesAndConvergencePartII is not in the merge order yet; checked as if placed after ArithmeticGaloisDuality (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2171 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

`roadmaps resolve` on the edited README found no cross-roadmap citation and no Lean name missing
everywhere. That tool did not check Lean names outside TauCetiRoadmap, so I checked the four newly
cited library names by hand at the pins:

- `CategoryTheory.Functor.IsRightDerivedFunctor`: `RightDerived.lean:54`, namespace
  `CategoryTheory.Functor`;
- `HomologicalComplex₂.HasTotal`: `TotalComplex.lean:46`;
- `TauCeti.ExactStructure.FiniteResolution.horseshoe`: `Horseshoe.lean:235`;
- `TauCeti.ExactStructure.abelian_isProjective_iff`: `Projective.lean:218`, inside `namespace
  ExactStructure` and outside the `Functor` section.

plan.json parses, and its formatting (one-space indent) is preserved, so the diff shows only the
changed entries. There is no `Suggested.lean` at the design stage, so no elaboration or `#check`
comparison was run.

Ownership: no new construction is stated. The added text cites existing owners: Tau Ceti for the
finite horseshoe, and that roadmap's own supplier for the graded Tor sequences.

## For the maintainer

- No id of this roadmap changed, and no name that other roadmaps cite changed.
- InverseGaloisAndArithmeticFundamentalGroupsPartII asks DGAInfinity for graded Tor spectral
  sequences (gap:dga-graded-tor-spectral-sequences). Those sequences are instances of this roadmap's
  generic 3.4 and 2.6 in graded module categories. Whether that roadmap's gap should be supplied that
  way once this roadmap merges is that roadmap's decision; nothing here depends on it.
- The human-reviewer note still stands: the base, SpectralSequencesAndConvergence, is a board design
  that is not yet accepted.
