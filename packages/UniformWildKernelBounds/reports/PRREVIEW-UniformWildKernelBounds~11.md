# Review of UniformWildKernelBounds (pull request #2892 at a598d4f)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/UniformWildKernelBounds/`
**Verdict:** needs changes

**Summary.** Needs changes, for one finding in the text added since the last review: the new statements on Hilbert modular forms in 3.22 (conventions, (e)–(h)) define the adelic forms, their Fourier coefficients and Hecke operators afresh and prove (g) on an integral Hecke-stable lattice of Hilbert forms, although roadmaps on main and an open one already state these objects and none is cited. The other new statements (3.15(c₀), (c₀′), 3.20(d₁)–(d₅), (e₀)–(e₂), 3.22(b′), (d₁)–(d₃), 4.5 (m1)–(m6)) agree with the declarations of [FormalProof] that were opened, and the fifteen sampled targets hold up. There are one small correction (the description predates this head) and three format notes; the scope and licence questions about [FormalProof] remain for the human reviewers.

## R01 (P2) — The Hilbert modular forms of 3.22(e)–(h) are defined here a second time, and the route of (g) rests on an integral Hecke-stable lattice of Hilbert forms that no target, supplier or library declaration provides

An implementer of 3.22 would build a second carrier for Hilbert modular forms, with a normalisation of its own and no comparison to the existing one, and would then be stuck in (g): the Deligne–Serre lemma is cited in the form "commuting operators on a finite free module over a discrete valuation ring" (the contract for AlgebraicModularFormsAndSerreWeights §5.10, line 4117), and the route of (g) (line 2470) applies it to forms of parallel weight `k + 1`, level `𝔠∏_{w|ℓ} w` and character `ω` "with integral coefficients" without saying which finite free module with Hecke action this is.

How I know. The paragraph "Hilbert modular forms: conventions for (e)–(h)" (lines 2324–2347) defines a holomorphic Hilbert modular form as an automorphic form on `GL₂(𝔸_F)` right invariant under `K₁(𝔫)` with central character and the two differential conditions at the real places, its constant terms and Fourier coefficients `c(𝔪)`, and the Hecke operator at `w`, and asserts that this operator acts by `c(𝔪) ↦ c(w𝔪) + ω(w)(Nw)^{k−1}c(𝔪/w)`. On main, GL2AutomorphicRepresentationsAndTransfer R16.1.6 (*Finite-level automorphic functions*, README line 278) is that adelic carrier, with central character, `K_∞`-types and finite Hecke actions, for every number field; IntegralIwasawaTheory §9.3 (line 1278) owns the Hilbert cusp spaces with their "integral q-expansion lattice", Hecke algebra and normalized coefficients at ideals, which is the module (g) needs; and the open roadmap HilbertModularForms, earlier in the merge order, states the nebentypus spaces in the carrier of R16.1.6 (§2.7, with central law `η(z)⁻¹|z|^{k₀−2}`, not the `ω(z)` used here), the normalized coefficients (§2.4) and the same coefficient formula for `T_𝔭` (§5.4). The `*Needs:*` line of 3.22 names none of them (it cites IntegralIwasawaTheory §9.3 for the Hasse lift of (f) only), the supplier contracts cite GL2AutomorphicRepresentationsAndTransfer for R17.4.13 and R17.6.4 only, and the Scope section does not mention Hilbert modular forms at all.

The smallest change: keep the statements (e)–(h) and the normalisation of [FormalProof], but say in the conventions paragraph that the forms are the `K₁(𝔫)`-invariant, central-character-`ω` vectors of GL2AutomorphicRepresentationsAndTransfer R16.1.6 with the holomorphy conditions written there, give the dictionary to the existing coefficients and Hecke operators (the character is the inverse of the nebentypus of the other convention, and the operator "normalised for the weight `k`" is the classical `T_w`), cite the owner of the coefficient formula instead of asserting it, and name in the route of (g) the integral lattice on which Deligne–Serre is applied (IntegralIwasawaTheory §9.3, if its levels and characters cover `𝔠∏_{w|ℓ} w` and `ω`; otherwise state what is missing as a target here). Then add these to the `*Needs:*` line of 3.22, to the supplier contracts and to "It does not own".

## C01 — The description lists the statements without a route as they were before this head, and does not name the two suppliers the head adds

A reader of the description would look for unrouted statements at 3.15(c) and 3.22(d) and find routes there. The description says "the Selmer counts 3.15(c); the seeds 3.20(d) … the rank-three seeds 3.22(d)". At this head (c) of 3.15 is derived from the new (c₀), (c₀′), which carry the phrase "whose route is not given here" (line 1131); 3.22(d) has a route from (b′), (d₁), (d₂) (line 2456), and the unrouted statements are parts of 3.22(b′), (d₁)–(d₃) and (e), (f), (h) (lines 2348–2386), 3.20(d₁)–(d₅), (e₀), (e₁) and the second sentence of (e₂). The README's own Summary (line 55) has the new list. The head also adds BaseChangeAndGaloisRepresentationsForUnitaryGroups §§14.1, 16.1 (a new contract section) and IntegralIwasawaTheory §9.3 as suppliers, which the prose does not mention.

Text that would be right: replace the list by the one of the README's Summary, and add "The route of 3.22(d₂) uses BaseChangeAndGaloisRepresentationsForUnitaryGroups §§14.1, 16.1, and that of 3.22(f) IntegralIwasawaTheory §9.3". The sentence that the family index is carried "with identical content" by every pull request of the family is also no longer exact: the index here differs in one sentence from the copy in the pull request that carries the whole family (see N01).

## N01 — The References still say that the window bound and case analysis of [FormalProof] "are reconstructed in Layers 1–7" (line 4166), and the family index here still says "The family follows the formal Lean proof" (index `README.md`, line 10). The pull request that carries the whole family already has the replacement wording for the index ("The results that the family states are those of the formal Lean proof"); copying that sentence here makes the two copies identical again. For the References, "stated as targets in Layers 1–7" would do.

## N02 — 1.1 is still stated "for every `e ≠ 0`" (line 262, and the Checks at lines 276 and 370), while BernoulliBoundsForClassGroupEigenspaces §6.17, which the Conventions cite for `Ш¹(F, ℓ, e)`, defines it for `e ≥ 1`. Either say in the Conventions that the same definition is used for every `e ≠ 0` in 1.1, or state 1.1 for `e ≥ 1`.

## N03 — The Conventions say that `AV/` abbreviates `src/Development/AutomorphicArithmetic/AutomorphicVarieties/` (line 145), while the References now give every path relative to `src/` and all unabbreviated paths begin `Development/…`. Drop the `src/` from the abbreviation.

## Questions for the author

- Carried from the two previous reviews, the text being unchanged: in the Check of 4.3 and the Example at line 3440, is `diag(Ψ′, 1, Ψ′⁻¹)`, `Ψ′ = ψχ_ℓ^{−28}`, a point of the ring `R_ℓ = 𝔘/P` of 4.1 at `ℓ = 29`? What stopped the check: 4.1 (local chart)(ii) characterises only the points that reduce to the diagonal lift over a finite local algebra, and this point does not.
- In 3.15(c₀) the point `ρ` is asked to satisfy (N1); the declaration cited (`UpperTheory.V.Pa.b1abs`) has no hypothesis by that name beside (N4), the eigenvalues and detection. Is (N1) part of what a normalized point of a frame is there, or an addition of the README? Either is a true statement; what stopped the check is that the structure of normalized points was not opened.

## Previous findings

The previous review, of `112cb9d`, was an acceptance with no finding and no small correction; its two format notes are accounted for.

- N01 — not repaired in this folder ("are reconstructed in Layers 1–7", line 4166; the index sentence, line 10 of the family index); written again as N01.
- N02 — not repaired ("For every `e ≠ 0` and `m ≥ 0` prove", line 262); written again as N02.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 1.3 Centres | `X = ℤ_ℓ`, `g = α ∈ 1 + ℓℤ_ℓ`, `u = 1 + ℓ`; `g = 0`; `X = ℤ/ℓ`; `e = 0`, `g = 1`; `ℓ = 2` | `v(u^{eℓ^j}α^{ℓ^j} − 1) = j + 1 + v(e − s)`, `s = −log α/log u ∈ ℤ_ℓ`; `coker(−1) = 0`; `1 ≤ j + c`; `∞ = ∞`; `c ≥ 2` in the cited `IsLevel` | holds; equals `exists_centres_level` |
| 3.1 Counting | `K = ℚ`, `n = 1`; twist direction | at most `φ(M)(2H + 1)` characters; `|det|^{(1−n)/2}` differs from `|det|^{(n−1)/2}` by an integer power, same class | holds |
| 3.6 Framed presentations | `X = 0`; automorphisms `1 + ε·diag(a, 0, −a)` | usual `dim H¹_c`, `dim Ob` count; frames with `α_{v₀} = 1` kill them | consistent |
| 3.11 Check (F2) | `ℓ = 137`, `Ψ̄` of order 4, conductor 17 | `137 = 8·17 + 1`; `137 ≡ 1 mod 4`; `4 ∣ 136`; characters `χ⁴, χ¹²` mod 17 are even | Check true |
| 3.14 the two classes | Greenberg–Wiles for `κ = Ψ̄^{−a}η_K` | global and archimedean terms 1 (`κ` odd, `κ ≠ ω`); `S∖{w}`: 1; at `w`: `#H¹/#H⁰ = |k|` | Selmer exceeds dual by 1 |
| 3.21(c) count | weights `−2, …, 2` | real place `−0, −1, −1, −1, −0`; `ℓ`: `0, 0, 0, +2, +1`; `h⁰ = 1` in weight 0 | `0, −1, 0, +1, +1` as stated |
| 3.23 twist | `K = ℚ(i)`, `ℚ(√−3)`; `t ∉ G_K` | `ε(i)² = −1`, order 4; `ζ₃ − n` has valuation 1 < 2, so no unit `≠ ±1` is an integer mod `N`; `Ver(t) = t²` | holds; third Check true |
| 4.4 gradings and counts | entries `(1,2), (2,3), (1,4), (1,3)`; `E₃₁ + E₄₂`; local chart; global excess | weights `(1,0), (−1,1), (1,1), (0,1)`; `J X` symmetric; `8 + 4 + 2 = 14 = 10 + 4`; `α, β, θ: +1`, `Ψ: 0`, `Ψ⁻¹: −1`, weight 0: 0 | total 2 on `R`, 1 on `A`, as stated |
| 4.4 (a′) | block determinants | exponents `e + 2` and `e`: `|det₁| = Q²|det₂|` against `|y| < Q|z|` | contradiction as claimed |
| 4.7 | (i) restriction to `L⁺`; (iv) against `twist'_alt`, `automorphy_up_base_change` | injective on `H¹_f` in characteristic 0; declarations exist in the cited file | consistent |
| 4.8 weights | exponents `(e+1, e, 1, 0)`; `(e−1, −1, −e−1)` | `a = (−3, −3, −e−1, −e−1)`, dominant iff `e ≥ 2`; `a = (e−1, 0, 1−e)` | as in 5.7 and 5.4 |
| 5.1 `h(ℚ(√ℓ)) < ℓ` | `ℓ = 5`; `ℓ = 13`; supplier form at `n = 2`, `b = √ℓ` | `2.236·1.829 = 4.09 < 5`; `γ + 1/√13 = 0.855 < 1`; `h ≤ b(log b + γ + 1/b)` | holds |
| 5.2 Case Z | `(ℓ−1) ∣ e`; `(ℓ−1) ∣ 2e`, `∤ e`, `e` even | `H¹(W[ℓ])` and `H⁰(W)/ℓ` both of dimension 1; `(ℓ−1)/2` even so `ℓ ≡ 1 mod 4`, `H⁰(ℚ_ℓ, W) = 0` | holds; equals `PropZ` (`5 ≤ ℓ`, `2 ≤ e`, even) |
| 5.3 One character | (M1)–(M5) against 3.3 | pattern `0, −1, 0, +1, +1`; `ξ(a_σ) = tr ρ_ξ(σ) − t` | consistent with 3.3, 3.4 |
| 5.6 Check | `χ` cubic mod 7, `ℓ = 5`, `e = 2` | `p_K = 11`, `p₁ = 13`, `f₀ = 2`, `n₀ = 3`, `2¹⁴ < 29120 ≤ 2¹⁵`, conductor `455`, order 6 | Check true |
| 5.7 Cases II, III | against `CountShape`, `CaseII`, `CaseIII`, `nII`, `nIII` | bound `(ℓNe)^C`, `ℓ ≠ 2`, `0 < e < t`; thresholds identical | equals the formal form |
| 6.5 minus part | `M′ = 5`, `a = 3`; `E = ℚ(μ₇)`, `ℓ = 3`, `e = 1`; constant | `ε₃ = 0, −1, 1, 0`; `1 − 43² = −2³·3·7·11`, `B_{2,χ} = 2`, `(8 − 4ζ₃)/7` (norm `112/49`), so `v₃(Δ) = 3`; `30·8 = 240` | Checks true; equals `StickBound` |
| 3.5 Check (17) | `m = 6`, `ξ(5) ≡ 11`; `m = 7`, all 16 roots in `𝔽₂₈₉` | half-sum `≡ 0` only at `11`; no zero at `m = 7` | Check true |
| 3.15(c₀) (GW), (LC), (UC) | against `GWBare`, `LocCount`, `UnrCount`, `TWGrp`, `b1abs`; Galois case | classical formula in cocycles gives the inequality with slack `1/#H⁰(M′)`; exponent `n·d + n·q` | faithful; direction right |
| 3.15(c₀′) (1)–(6) | against `CohAx`, `ObstructionBoundFromDuality` | (3) is Tate's formula `#H⁰#H²/#H¹ = ∏#M^{c_i}/#M^d` | faithful |
| 3.20(e₀) window | irreducible principal series; converse | unitary generic: exponents in `(−½, ½)` after the twist by `t`; open interval of ratio `Nw` excludes ratio `Nw` | holds |
| 3.22(b′)(v), (d) | eigenvalues of `ad⁰ρ(s)`; parities | needs `|α/β| ≠ p^{±1}, p^{±1/2}`; `(χ′η_K)(−1) = (−1)^{j+1} = (−1)^{m+1}` | consistent |
| 3.22(e)–(g) | against `HilbertEisOne`, `HilbertOne`, `OneUse`, `PropMHol`; cuspidality | `1 + ω = 1 + η₁η₂` gives `(η₁ − 1)(η₂ − 1) ≡ 0`; a group is not a union of two proper subgroups | statements faithful; owner missing (R01) |
| 7.3 | sum of 6.5 over `e < t` | `ℓ ≤ o_χ`, `n ≤ N`, `Σ(e+1) ≤ t²` | polynomial in `Nt` |
| 7.4, 7.6 | exponents | `J = 2J_{2.4}`: `X^{δ/J} = X^{(δ/2)/J_{2.4}}`; `Y₀^{ε/4} = X^{ε/(4J)} ≤ X^{(ε/2)/J}` | hypotheses match |
| 7.5 | `X = 2^{Jk₀}` | `k = ⌈log₂ Y⌉ ∈ [k₀, Jk₀/2 + 1]`; `2^{2k−2} ≤ Y²` | holds for `J ≥ 2` |

- Source locators: all 206 file paths and 274 (declaration, file) pairs of the README resolve at the first commit of the repository of [FormalProof]; 22 declarations were opened and compared with the statements (rows above).
- Cross-roadmap citations resolved: family siblings at the head of the pull request that carries the family (HeckeIdealsAndTaylorWilesRelations §§3.13a, 4.2a, 9.9; ReducibilityIdealsAndUltrafilterPatching §§4.8, 4.9, 6.10, 6.11, 6.13, 6.15, 6.16; BernoulliBoundsForClassGroupEigenspaces §§6.17, 6.18, 9.7, 11.1; FrobeniusRestrictedRieszSums §0.4; BaseChangeAndGaloisRepresentationsForUnitaryGroups §§14.1, 16.1); on main IntegralIwasawaTheory §9.3, ArithmeticGaloisDuality R02.4.2–R02.4.4, ClassFieldTheory Layers 5, 7, 11, PotentialAutomorphyInfrastructurePartII §§0.8, 0.9, 3.5, EndoscopicTransferAndUnitaryTraceComparison §6.26, ExplicitNumberFields §§0.3, 5.3. The consumers cite §7.6, which exists.
- Dependency check: `depcheck: 133 roadmaps, 1502 edges, 0 problem(s)`; no UPWARD or CYCLE line. Outside the folder the pull request changes only the family index.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: no message; it declares nothing, so there is no signature to compare and no one-tactic probe to run.
- Headlines: 7.3 (with 7.2), 7.4 with its budget form 7.6, and 7.5; none statable at the pins, each named in the docstring with what it lacks; the docstring's hypotheses agree with 7.3–7.6.
- This folder is identical to its copy in the pull request that carries the whole family; the family index differs in one sentence.
- Read in full this round: the change set, Layers 0–2 and 5–7, the sampled sections of Layers 3 and 4, and the passages those depend on. The unchanged remainder of 3.15–3.20, 3.22 and 4.1–4.6 was read for consistency with the new clauses, not recomputed.

Overlap check: read HeckeIdealsAndTaylorWilesRelations, BernoulliBoundsForClassGroupEigenspaces, BaseChangeAndGaloisRepresentationsForUnitaryGroups, CongruenceModulesOfThetaLifts (open, family), HilbertModularForms and IntegralIwasawaTheoryPartII (open), PotentialAutomorphyInfrastructurePartII, OrdinaryAutomorphicFormsAndModularityLifting, GL2AutomorphicRepresentationsAndTransfer, IntegralIwasawaTheory (main). Shared: adelic Hilbert modular forms with their Fourier coefficients, Hecke operators and integral lattice, owned by GL2AutomorphicRepresentationsAndTransfer R16.1.6, IntegralIwasawaTheory §9.3 and HilbertModularForms (R01). Not shared: the weight change 3.22(h) (non-parallel weights; OrdinaryAutomorphicFormsAndModularityLifting §2.11 is a parallel Hida specialization), the weight-one Eisenstein series 3.22(e) (the open roadmaps state weights `≥ 2`), the adjoint lift between definite unitary groups 3.22(d₃) (GL2AutomorphicRepresentationsAndTransfer R17.4.13 is the lift on `GL₂`). No open pull request changes this roadmap or drops an id it cites.

Source independence: 22 passages compared with 1 source ([FormalProof], Lean declarations at its first commit), none shared: the source has no prose and the README states each in words; largest share [FormalProof], 285 of about 295 locators; contents compared with its directory tree: independent (Layer 3 cites 19 of its directories and Layer 4 eleven, and `HeightAndVanishing` is cited from Layers 0, 5, 6 and 7).

Research link: an unconditional substitute for Vandiver-type vanishing of `K_{2e}(𝒪_F){ℓ}` (Soulé 1979, 2003), through Ferrero–Washington (1979), Kato (2004) and residually reducible automorphy lifting (Skinner–Wiles 1999, Thorne 2015, Allen–Newton–Thorne 2020, Newton–Thorne 2023); the "weakening of Vandiver" of the announcement. Rests on the README's Summary and References.

## Not verifiable

- Kato 2004, Theorem 14.2, Deligne–Serre 1974, Lemme 6.11, and the other published theorems named in the References: not opened this round; none is in the sample or in the changed text.
- [Announcement]: not read again; the changed text does not cite it.
- The proofs of [FormalProof] were not rebuilt: its statements were read, at the first commit of its public repository.

## Source issues

- none

## For the human reviewers

- Scope: the main source is [FormalProof], an unpublished, unrefereed Lean development announced on 20 November 2026 (README line 4166). No refereed source states the bounds 7.3–7.6.
- Licence: the family index (line 16) records that the repository of [FormalProof] says the proof was published without a license and is mirrored for verification only. The README cites 274 of its declaration names with file paths; this review read its statements there.
- Licence: the statements added at this head (3.15(c₀), (c₀′), 3.20(d₁)–(d₅), 3.22(b′)–(h)) restate declarations of [FormalProof] hypothesis by hypothesis, in prose; whether that is reuse of its expression is for a human to judge.
