# Review of DiscreteSeriesCoefficientsAndAutomorphicMetrics (pull request #3027 at c832fa9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/DiscreteSeriesCoefficientsAndAutomorphicMetrics/`
**Verdict:** accepted

**Summary.** Accepted. The previous finding and its three small corrections are repaired. 10.1 and 10.2 now assume unitarity only on `K_∞¹ = K_∞ ∩ G(ℝ)¹`, and I checked this restriction on `GL₂`, on unitary similitude groups and on a group that fails the centre condition: it is correct, and it now covers `ω` and the Hodge summands that the family uses. There are three small corrections and one format note, none blocking. The corrections are: the origin label of 10.1 credits Mumford with the `K_∞¹` form, but his statement, made for an adjoint group, does not contain it; the label of 9.1 gives Müller (1989) a wider setting than his corollary has; and one sentence of the pull request's description is out of date. Nothing is left for the human reviewers.

## C01 — The origin label of 10.1 credits Mumford with the `K_∞¹` form, but his Main Theorem 3.1 is stated for an adjoint group and does not contain the bundle `ω` that the new hypothesis admits

Lines 494–496 call 10.1 published in the setting of AutomorphicBundles §5.3 (Mumford 1977). The Labels paragraph (lines 34–35) lists only "the form of 10.1 for general data" among the roadmap's own formulations, so a reader takes the `K_∞¹` form to be Mumford's. Mumford takes `G` semisimple adjoint and a representation of its maximal compact subgroup (mumford-1977 lines 579 and 672–676). The character giving `ω` on `X(N)` is used by the first Check of 10.1 and by both Checks of 10.2. It restricts to `e^{iθ}` on `K_∞¹ = SO(2)` and takes the value `−1` at `−1 ∈ SO(2)`, so it is not a representation of the maximal compact subgroup `SO(2)/{±1}` of `PGL₂(ℝ)`. Mumford's argument, run on the derived group, gives the theorem; his statement does not contain it.

The label could read "adapted from Mumford (1977), Main Theorem 3.1, stated for a semisimple adjoint group; here for representations unitary on `K_∞¹`". Alternatively, the `K_∞¹` form could join the own formulations at lines 34–35. If the author regards this form as published, the description's own rule (published theorems go to the general roadmaps) would put it in AutomorphicBundles §5.3a, which still assumes unitarity on `K_∞` (its line 1599); 10.1 would then be a corollary of it in full.

## C02 — Müller (1989), Corollary 8.8, gives the discrete clause of 9.1 only over `ℚ` and when `Z(ℝ)⁰ = A_G(ℝ)⁰`

The origin label of 9.1 (line 451) and its discrete route (line 473) cite Müller (1989) for the discrete clause for `K_∞`-finite `f`, for a connected reductive group over a number field, on `L²_disc([G]¹)`. Corollary 8.8 (muller-1989 lines 2102–2117, printed p. 84) is for a group over `ℚ`, on `L²_disc(Z(ℝ)⁰G(ℚ)\G(𝔸))`. That space is `L²_disc([G]¹)` only when `Z(ℝ)⁰ = A_G(ℝ)⁰`, which fails for `Res_{F/ℚ}GL_n` with `F ≠ ℚ`. AutomorphicSpectralTheory §6.4a, of which 9.1 is a corollary, makes the same remark. The stated result is unaffected, because Müller (1998) covers general `f`. The label could add "over `ℚ`, when `Z(ℝ)⁰ = A_G(ℝ)⁰`" after "Müller (1989)". This text has not changed since the previous review; I note it because the sentence after it did.

## C03 — The pull request's description still calls 10.1–10.2 corollaries of AutomorphicBundles §§5.3a–5.3b without restriction

Under "For reviewers", the description says that "DiscreteSeriesCoefficientsAndAutomorphicMetrics §§10.1–10.2 are corollaries of them". At this head they are corollaries only for representations unitary on `K_∞`. The cases unitary only on `K_∞¹`, which include `ω` and the Hodge summands the family uses, are stated and proved here (README lines 508–511 and 545–548). The sentence could read: "…are corollaries of them for representations unitary on `K_∞`, and state themselves the cases unitary only on `K_∞ ∩ G(ℝ)¹`."

## N01 — 7.5b has statements to prove but no method label

7.5b states five things to prove but carries no method label. The family index asks for `*Method of the formal proof:* none` when the formal proof has no such statement (index lines 196–198), and ten roadmaps of the family write that line. One line under the origin of 7.5b (line 286) would align it, with the Labels paragraph (line 29) changed to match.

## Questions for the author

- The Labels paragraph (lines 30–33) still says that [FormalProof] has a statement of 7.5c (trivial stabilisers) and of 10.1 (Hodge metrics). Neither section names a declaration, and the [FormalProof] entry (line 668) lists the targets that cite one without these two. Which declarations are meant? I did not open the formal proof's repository.

## Previous findings

- R01 — repaired: Conventions (line 21): "`K_∞¹ = K_∞ ∩ G(ℝ)¹` … `G(ℝ)¹` acts transitively on `X` and contains every arithmetic subgroup … (for `GL₂`, `K_∞ = ℝ_{>0}·SO(2)` and `K_∞¹ = SO(2)`)". The same hypothesis appears in headline (4), 10.1, 10.2, Downstream consumers and the docstring of `Suggested.lean`. ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties still paraphrases 10.1 with `K_∞` in its supplier contracts (its line 3139); that folder's review covers it.
- C01 — repaired: "(for finite-dimensional representations, with `d` the dimension, Weyl's dimension formula)"; the Bufetov–Gorin entry is gone from References.
- C02 — repaired: "*Origin:* this roadmap's own formulation for the five statements to prove; the definitions are conventions." The Labels paragraph now lists them among the own formulations.
- C03 — repaired: 6.8a reads "particular to this proof"; 9.1 reads "the cuspidal clause follows, `L²_cusp([G]¹)` being a closed subspace of `L²_disc([G]¹)` stable under `R(f)` and `R(f)^*`", and Gelfand and Piatetski-Shapiro are no longer named.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions, `K_∞¹` for `GL₂` | stabiliser of `h(i)`; `|det| = 1` | `K_∞ = ℂ^× = ℝ_{>0}·SO(2)`; `K_∞ ∩ {|det| = 1} = {a² + b² = 1} = SO(2)` | true | none |
| Conventions, compactness under the centre condition | PEL similitude group of CM `E/F`, `[F:ℚ] = d`; control `Res_{F/ℚ}GU`, `d = 2` | centre `≅ ℝ_{>0}×(S¹)^d`: ℝ-rank 1 = ℚ-rank 1, compact; control: ℝ-rank 2 > ℚ-rank 1, `(t, 1/t) ∈ K_∞¹`, `O_F^×` not discrete | matches the "compact when" clause | none |
| Conventions, transitivity, arithmetic subgroups | `GL₂`; general `G(ℝ) = G(ℝ)¹·A_G(ℝ)⁰` | `{det = ±1}` transitive on `ℍ^±`; `det γ ∈ ℤ^× = {±1}`; `A_G` central, fixes `X` | true | none |
| 10.1, `ω` on `X(N)` now admitted | character `(a, d) ↦ a` | centre `t ↦ t` (not unitary on `K_∞`), `e^{iθ}` on `SO(2)`; `‖dz‖² = −log|q|/2π`, connection `dq/(2q·log|q|)` | inside hypothesis, true | none |
| 10.1, Hodge summand `Lie_σ` | unitary similitude group | `t ∈ ℝ_{>0}` acts by `t`; on `K_∞¹`, `ν = ±1` forces `|t| = 1` | unitary on `K_∞¹`, not on `K_∞` | none |
| 10.1, control without the centre condition | `Res_{F/ℚ}GL₂`, `F` real quadratic | `(t, 1/t)` acts by `t^{(m₁+n₁)−(m₂+n₂)}`: unitary iff parallel central weight | hypothesis still meaningful | none |
| 10.1, origin against Mumford | mumford-1977 lines 579, 672–676; `ω` | adjoint `G`, σ of its `K`; `−1 ∈ SO(2)` acts on `ω` by `−1` | label wider than statement | C01 |
| 10.2, first Check | `X(3)`, `X(4)`, `X(5)`: `g = 0`, `c = 4, 6, 12` | `deg ω = (c − 2)/2 = 1, 2, 5`; `dim M₁(Γ(N)) = deg ω + 1 = 2, 3, 6` | true | none |
| 10.2, second Check | `X(3) × X(3)` | left `(deg ω)² = 1`; right `κ²·(−1)(−1) = 1`; `χ(ℙ¹×ℙ¹) = 4 = χ(ℙ¹)²` | true | none |
| 10.1, 10.2, corollary lines | AutomorphicBundles §§5.3a, 5.3b at head (lines 1593–1665) | both assume unitarity on `K_∞`; constant `(−1)^{dim X}·v`; the README claims only the `K_∞` case | consistent | C03 (description) |
| 9.1, cuspidal clause from the discrete one | AutomorphicSpectralTheory §4.4 `orthogonal` | `L²_disc = L²_cusp ⊕ L²_res`; `T|_W = P_W T ι_W`, `‖T|_W‖₁ ≤ ‖T‖₁`; `GL₁`: `L²_cusp = L²_disc = L²` | true | none |
| 9.1, Müller 1989 | muller-1989 lines 2102–2117 | Corollary 8.8, p. 84: over `ℚ`, on `L²_d(Z(ℝ)⁰G(ℚ)\G(𝔸))`; equals `[G]¹` case iff `Z(ℝ)⁰ = A_G(ℝ)⁰` | label wider than source | C02 |
| 8.3, Weyl step | `U(2)`, `λ = (3/2, −1/2)`, `s = 1` | `d(λ) = 2`, `d(λ + e₁) = 3`; formula `(λ₁ + 1 − λ₂)/(λ₁ − λ₂) = 3/2` | true | none |
| 7.5b, labels | lines 29–35, 286; family index lines 186–198 | five clauses labelled own formulation; Check `K_k 1 = 1/2` for `Γ = {±1}` | consistent; no method label | N01 |
| 6.8a, origin | family index lines 191–194 | "particular to this proof" = introduced by the formal proof; `SumBoundStatement` cited; `p = q = f = 1`: `s > 8` | consistent | none |
| Headline (4), Lean docstring | README lines 5, 21, 513, 550, 576; `Suggested.lean` lines 47–54 | same `K_∞¹` hypothesis in all six places | consistent | none |

The rows for statements this change does not touch stand as in the previous review, of `71bbefa`.

- Source locators checked against the text: 6 (mumford-1977 setting at line 579, Theorem 1.4 p. 242 at line 170, Main Theorem 3.1 p. 256 at line 681, Theorem 3.2 p. 262 at line 902, Proposition 3.4 p. 264 at line 993; muller-1989 Corollary 8.8 p. 84 at lines 2102–2117).
- Library declarations: `Suggested.lean` declares nothing, so no `#check` comparison applies. The changed docstring cites no new library name.
- Cross-roadmap citations resolved at this head: AutomorphicBundles §§5.3a, 5.3b; AutomorphicSpectralTheory §§4.4, 6.4a; the family index's labels and corollary convention (lines 186–206); the citations of 10.1 and 10.2 in ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (lines 802, 823, 1329, 1392, 1744, 3139) and SingularHermitianMetricsAndL2Methods (line 2872).
- Automatic checks: all pass except the check for files changed outside the roadmap folder (set aside below). Dependency check: `depcheck: 132 roadmaps, 1476 edges, 0 problem(s)`.
- Changes outside the folder: the diff against the merge base, with the pull request's own folders and the two family indexes excluded, is empty.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no output.
- Record: the change removes no heading, layer, section or Lean declaration, and no layer changes its subject. The 6 layers and 13 sections are kept under their ids.
- Ownership against open pull requests: no open pull request changes this roadmap or drops an id it cites. No other roadmap owns goodness or proportionality for representations unitary on `K_∞¹`.

Overlap check: read AutomorphicBundles, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, AutomorphicSpectralTheory, AutomorphicFormsOnReductiveGroups, ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups, BesselPoincareSeriesAndGramBounds and AutomorphicSpectralTheoryPartII. Shared objects and their owners: goodness and proportionality for `J` unitary on `K_∞` belong to AutomorphicBundles §§5.3a–5.3b, which 10.1–10.2 cite. Trace class on the cuspidal and discrete spectrum belongs to AutomorphicSpectralTheory §6.4a, which 9.1 cites. ProjectiveModelsAndPeriodBoundsOnShimuraVarieties owns growth bounds for the Hodge metric (its 6.2a), not goodness. The other roadmaps consume this one or share nothing with the changed passages.

Source independence: changed passages only. 9 passages compared with 2 sources (mumford-1977, muller-1989); no wording shared. Largest share: mumford-1977 and hc-1953, about 12 each of about 58 locators. The arrangement was not compared, because no layer was added, removed or reordered.

Research link: Layer 10 is Mumford's non-compact Hirzebruch proportionality (Mumford 1977), Layer 8 the formal-degree formula of Harish-Chandra (1966) and Atiyah–Schmid (1977), Layer 9 Müller's trace-class theorem (1989, 1998), and Layer 7 Gross's algebraic modular forms (1999). The family uses them in the formal proof announced by Alpöge (2026). This rests on the README's References and on mumford-1977 and muller-1989.

## Not verifiable

- [FormalProof] (the method labels of 6.8a, 7.5b, 7.5c and 10.1): its repository was not opened.
- Harris 1989 (origin of 10.1): only the publisher's page; no legal copy found.
- Müller 1998 (9.1): recorded as uncertified in the manifest.
- Dixmier–Malliavin 1978 (9.1): no legal copy (the publisher's page refused access).

Automatic checks set aside as false positives: the check for files changed outside the roadmap folder flagged 117 files. All of them lie in the other roadmap folders and the two family indexes that this pull request owns; nothing outside them changed.

## Source issues

- none

## For the human reviewers

- none
