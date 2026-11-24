# Review of QuasiRiemannHypothesis (pull request #3027 at 8d0b573)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 81 changed lines since `592bdb1`. Accepted: the change is the new §5.4a (the characters of the abelian extensions `L/K`, `L` abelian over `ℚ`, are exactly the primitive characters of the norm-composed characters of `K`) with its contract, scope and reference lines; statements (a) and (b), the route and the four Checks were recomputed and hold, and Milne V, Example 3.2 and Proposition 3.3, p. 157, supports them as the text says. There are three small corrections and one format note, none blocking: a Tau Ceti declaration is credited to a roadmap layer that does not state it, the last Check names no character, and one sentence of the description does not fit §5.4a. The human reviewers have the scope and licence questions of the roadmap's main source and one question about the new reference.

## C01 — `PrimitiveRayClassCharacter.of_induced` is credited to LFunctions Layer 5, which does not state it

A reader who follows the *Needs:* line of §5.4a (lines 950–951) or the sentence added to the LFunctions contract (lines 2505–2507) to LFunctions Layer 5 finds `PrimitiveRayClassCharacter.of` there, but no statement that a character and the character it induces have the same primitive character: the LFunctions README, on main and at its open head, does not contain `of_induced`. The declaration is the pinned Tau Ceti's `TauCeti.LFunctions.PrimitiveRayClassCharacter.of_induced` (`TauCeti/NumberTheory/LFunctions/Hecke/Primitive.lean:169`, `of (χ.induced h) = of χ`).

The citation resolves if `of_induced` is listed in the From Tau Ceti contract beside `.of`, `.conductor`, `.character` (line 2453) and the *Needs:* line of §5.4a names it as a Tau Ceti declaration; the sentence added to the LFunctions contract can then go.

## C02 — The last Check of §5.4a names no character, so it restates (a), and its parenthetical also fits a cubic residue character that is norm-composed

Lines 944–946 take "a ray-class character of order `3` whose class field is not abelian over `ℚ`". Such a character is excluded by (a) from its description alone, so nothing is computed. The parenthetical "a cubic residue character" also describes `𝔞 ↦ (ω/𝔞)₃`, whose class field `F(ω^(1/3)) = ℚ(ζ₉)` is abelian over `ℚ`: its value at a prime of norm `N` is `ω^((N−1)/3)`, that is `ω, ω², ω, 1` at norms `4, 7, 13, 19`, the values of `χ ∘ N` for the cubic `χ` modulo `9` with `χ(2) = ω²`.

A Check that tells the two kinds apart: `(2/·)₃` takes the value `ω²` at `1 + 3ω` (in `𝔽₇`, `ω ↦ 2`, `2² = 4 = ω²`) and `ω` at `1 + 3ω²` (`ω ↦ 4`, `2² = 4 = ω`); both primes have norm `7`, where every `χ ∘ N_{K/ℚ}` takes the one value `χ(7)`. So `(2/·)₃` is not norm-composed, while `(ω/·)₃` is.

## C03 — The description says every section added to a general roadmap is a published theorem in its source's generality; §5.4a says its statement is not printed in its source

The description has "50 existing roadmaps receive 216 sections, each a theorem published before 20 November 2026 and stated in the generality of its source, with that source named". For this folder the added section is §5.4a, which says at lines 914–917 that (a) and (b) are Milne V, Proposition 3.3 applied to `ℚ(ζ_m)/ℚ` and "are not printed there as a statement"; the identification stood on main in GeneralizedRiemannHypothesisFromWindowBounds §5.6, which at this head cites §5.4a.

A clause that would be right: "QuasiRiemannHypothesis receives §5.4a, the identification of the characters of the abelian extensions `L/K`, `L` abelian over `ℚ`, with the primitive norm-composed characters of `K`: a consequence of Milne V.3.3, not printed there, moved from GeneralizedRiemannHypothesisFromWindowBounds §5.6."

## N01 — `heilbronn1967` is cited with the chapter's page range only (lines 917 and 2665–2667)

A section or theorem number for the factorization of the zeta function of an abelian extension would let a reader find it.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §5.4a (a) | `K = ℚ(i)`, `L = ℚ(ζ₁₂)`, `m = 12` | `Gal(ℚ(ζ₁₂)/K) = {1, 5}`, `φ(5) = −1`; extensions `(·/3)` and `(·/3)χ₋₄`; `χ₋₄(N𝔞) = 1` on `ℚ(i)`, same primitive character | holds; `χ` not unique, `of(χ ∘ N)` is | none |
| §5.4a (a), degenerate | `K = L = ℚ`, `m = 1` and `m = 2` | `φ = 1`; `χ = 1`; `1 ∘ N` at `(m)·∞` has primitive character trivial, conductor `1`, both sides | holds | none |
| §5.4a (b) | `K = ℚ(i)`, `m = 3`, `χ = (·/3)` | `K(ζ₃) = ℚ(ζ₁₂)`; restriction sends the nontrivial element to `2 mod 3`, `χ(2) = −1`; `φ̃` of conductor `(3)` = `of((·/3) ∘ N)` | holds | none |
| §5.4a, "exactly" | both inclusions | (a): every `φ̃` is `of(χ ∘ N)`; (b): every `of(χ ∘ N)` is a `φ̃` with `L = K(ζ_m)`, abelian over `ℚ` as a compositum | holds | none |
| §5.4a route, Frobenius | `m = 12`, `K = ℚ(i)`: `(2 + i)` of norm `5`, `(7)` of norm `49` | `Frob : ζ₁₂ ↦ ζ₁₂⁵`, `φ = −1 = (5/3)`; norm `49 ≡ 1`: `φ = 1 = (49/3)`; `milnecft2020` lines 7004–7027 | holds; locator p. 157 correct | none |
| §5.4a route, equality | `𝔐` a common multiple of `𝔣` and `(m)·∞` | agreement at primes `∤ 𝔐` gives agreement on `idealClass 𝔐`; `RayClassGroup.hom_ext` needs exactly that; `of_induced : of (χ.induced h) = of χ` on each side | holds | C01 (attribution) |
| §5.4a Check 2 | `κ = (·/5)`, `q = 5` | `L = ℚ(√5)`; `p = 2`: inert, `φ(Frob₂) = −1 = (2/5)`; `p = 11`: split, `1 = (11/5)` | holds | none |
| §5.4a Check 3 | `(1 + i)` in `ℚ(ζ₁₂)/ℚ(i)` | residue field `𝔽₂`, `x² + x + 1` irreducible: inert, `φ = −1`; `(2/3) = −1`; class number `1` and nontrivial, so conductor `(3)` | holds; agrees with the Check of §11.2 (line 2199: `η(1 + i) = −1`) | none |
| §5.4a Check 4 | `(2/·)₃`, `(ω/·)₃` on `F` | `(2/·)₃ = ω², ω` at `1 + 3ω`, `1 + 3ω²` (norm `7`); `(ω/·)₃ = ω, ω², ω, 1` at norms `4, 7, 13, 19` = `χ ∘ N`, `χ(2) = ω²` mod `9` | true as stated; computes nothing | C02 |
| §5.5 (b), consumer of §5.4 beside the change | `openai2026quasiRH` Prop. 11.3 | source line 3788, p. 84, `σ₀ ∈ [1/2, 1)`, `K = F`; (11.2) at line 3810, p. 85; README: `σ₀ ≥ 0`, any abelian `K`, cited "for `K = F`" | locators correct; unchanged by §5.4a | none |

- Earlier review: it raised no finding; its three small corrections and its format note stand at this head, which is the head it read (C01–C03, N01 here).
- Source locators read against the text: 4 (`milnecft2020` V Example 3.2 and Proposition 3.3 with its proof, p. 157, lines 7004–7027; `openai2026quasiRH` Proposition 11.3, p. 84, and (11.2), p. 85). Of the seeded sample only §5.5 lies beside the change; the other fourteen targets are in text the change neither touches nor affects.
- Library declarations opened at the pinned Tau Ceti: 9. `rayClassArtinMap` (`NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Reciprocity.lean:128`), `rayClassArtinMap_surjective` (:161), `rayClassArtinMap_idealClass` (:216, an equality of conjugacy classes, for a maximal ideal prime to the modulus); `abelianConductor` (`…/AdmissibleModulus/Basic.lean:193`), `isAdmissibleModulus_abelianConductor` (:208); `kroneckerWeber` (`…/ClassFields/KroneckerWeber.lean:178`); `RayClassGroup.hom_ext` (`NumberTheory/NumberField/Global/RayClass/Integral.lean:244`); `RayClassCharacter.induced` (`…/RayClass/Character/Basic.lean:91`); `PrimitiveRayClassCharacter.of` and `of_induced` (`NumberTheory/LFunctions/Hecke/Primitive.lean:135, 169`).
- Cross-roadmap citations resolved on main: ClassFieldTheory C.6 (line 305; it states `ζ_m ↦ ζ_m^ℓ`), Layer 12 (line 1435; ray-class reciprocity, splitting law and surjectivity at 1468–1473), §13.1 (line 1527); LFunctions Layer 5 (line 929; `of`, not `of_induced`: C01). GeneralizedRiemannHypothesisFromWindowBounds (line 1027) and ConsequencesOfTheRiemannHypothesisForDirichletLFunctions (§0.3 and seven further places) cite §5.4a at this head.
- The README at the merge base and at the head have the same 11 layers; no layer or item is removed or retitled; the 8 deleted lines each return extended; one heading is added (§5.4a). Nothing outside the folder is changed except the pull request's other roadmap folders.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 132 roadmaps, 1477 edges, 0 problem(s)`.
- `Suggested.lean` (not changed by the pull request): elaboration gives 10 `declaration uses sorry` warnings and nothing else; the 11 elaborated signatures agree with the README statements; the one-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`, `norm_num`) closes none of the 10 theorems. §5.4a adds no headline and no backticked name of the roadmap's own.

Overlap check: read ZerosOfLFunctions (main; it uses the ray-class Artin map for Chebotarev, not this identification), LFunctions (main and open head; owns `PrimitiveRayClassCharacter`, consumed here), RiemannHypothesisStatementsAndConsequences (uses `of_induced`, does not state §5.4a), GeneralizedRiemannHypothesisFromWindowBounds (held the identification on main in §5.6; at this head cites §5.4a), ConsequencesOfTheRiemannHypothesisForDirichletLFunctions (cites §5.4a), ClassFieldTheory and AnalyticNumberTheoryPartI §2.42 (neither states it). The identification has one owner, this roadmap's §5.4a.

Source independence: changed passages only; 4 passages compared with 1 source (the paraphrase of Proposition 3.3, the Frobenius step of the route, the description of Example 3.2 and the reference entry, against `milnecft2020` lines 7004–7027), none shared beyond formulas and standard names; largest share `openai2026quasiRH`, 68 of 173 citations by key; contents not compared, the change adding, removing and reordering no layer. `heilbronn1967` could not be read.

Research link: Layer 10 is the first stage of the `7/8` theorem of the OpenAI preprint (2026), retold by Liu (2026); Layer 11 gives Vinogradov's conjecture (Tao 2015); Layers 6 and 8 use Blomer–Goldmakher–Louvel (2014) and Dunn–Radziwiłł (2024); §5.4a is class field theory (Milne 2020, V 3.2–3.3). Rests on the README and `milnecft2020`.

## Not verifiable

- `heilbronn1967` (Cassels–Fröhlich, *Algebraic Number Theory*, 1967, chapter VIII): not among the texts held for this roadmap, and its manifest has no entry for it; not read. It is cited for background only, not for (a) or (b).
- The fourteen sampled targets outside Layer 5's change (1.1, 2.5, 3.2, 4.5, 4.6, 6.1, 6.2, 6.3, 6.5, 8.1, 8.5, 10.2, 10.6, 11.1) were not re-read: the change does not affect them.

## Source issues

- none

## For the human reviewers

- Scope: the headline `11/12` half-plane rests on `openai2026quasiRH`, which README lines 19–20 call "an unrefereed preprint", and on `liu2026improved`; the README names no refereed source for it. Not changed by this pull request.
- Licence: `heilbronn1967`, added by this pull request (README lines 917, 2665), has no entry in the roadmap's sources manifest; its text was not read and its status is unrecorded.
- Scope: §5.4a's statement is, by its own words (line 917), not printed in its source; it is derived from Milne V, Proposition 3.3.
