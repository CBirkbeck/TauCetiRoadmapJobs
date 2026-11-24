# Review of ReductiveGroups (pull request #3027 at e47c8ec)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 574 changed lines since `b8f3652`. Every added section (§§7.1, 7C.6, 7a.1–7a.3, 7b.1, 7c.1, Layers 7h and 7i, §9D.1 and the Layer 9E extension) was checked by recomputing its Checks and degenerate cases, its Dudas–Michel, Steinberg 1965 and SGA 1 locators were read at the source, and `Suggested.lean` was elaborated; the mathematics holds. The one finding is about ownership: §7.1 and EndoscopicTransferAndUnitaryTraceComparison §1.3 both set the reductivity, connectedness and torus criterion for centralizers of semisimple elements as targets, although the scope paragraph calls §1.3 a consumer. There are six small corrections and two format notes, none blocking; one decision of the human reviewers was applied, and nothing else is left for them.

## R01 (P2) — §7.1 and EndoscopicTransferAndUnitaryTraceComparison §1.3 both own the semisimple-centralizer theorems; §1.3 is not the consumer the scope paragraph says it is

An implementer of EndoscopicTransferAndUnitaryTraceComparison is still asked to prove three theorems that ReductiveGroups now states in greater generality, so the same objects have two owners. In the scope paragraph (`TauCetiRoadmap/ReductiveGroups/README.md`, lines 50–53) §1.3 "is a consumer of §7.1, not a second supplier". At this head, though, `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md` line 142 still says "The centralizer facts used here are also targets … Extend the API by reductivity of the semisimple centralizer, connectedness for a simply connected derived group and the strongly regular torus criterion". Its *Needs:* line names ReductiveGroups Layers 2, 4, 6, 7 and 8 but not §7.1. Those three targets, stated over `F̄` in characteristic 0, are §7.1 (a), (c) and (d) in a special case. ReductiveGroups is the right owner: it supplies §1.3 and states the facts in every characteristic.

Smallest change: in EndoscopicTransferAndUnitaryTraceComparison §1.3, which this pull request already edits elsewhere, replace the target sentences of that paragraph with a citation of ReductiveGroups §7.1 (a), (c) and (d), and add §7.1 to its *Needs:* line. What is particular to §1.3 (the stable centralizer `I_δ` and descent to `F`) stays there.

## C01 — The scope paragraph misdescribes FourierDeligneTransform §2.1: it is not the commutative case of §7a.3 and does not consume it

Lines 47–49 say that FourierDeligneTransform §2.1 states "the Lang torsor of a commutative connected group for the `q`-Frobenius, the commutative case of §7a.3, and is a consumer of §7a.3". On `main` that section is stated for every smooth connected commutative group scheme of finite type over `F_q`, affine or not (its README, lines 147 and 560: generalized Jacobians are included). It takes surjectivity from ReductiveGroupsPartII §RG2.3.7 and cites no section of ReductiveGroups. §7a.3 is about affine groups, so an abelian variety over `F_q` is covered by FourierDeligneTransform §2.1 and not by §7a.3. Suggested wording: "FourierDeligneTransform §2.1 states the Lang torsor of a smooth connected commutative group of finite type, affine or not; for affine groups it is the commutative case of §7a.3."

## C02 — The module docstring of `Suggested.lean` does not list Layers 7h and 7i among the headlines that cannot be stated at the pins

The Summary now names Harish-Chandra series and Gelfand–Graev representations as a subject of the roadmap, and "How to read the build" promises that the docstring names the missing carriers for the other endpoints. A reader cannot tell whether the partition into Harish-Chandra series (7h.2), the endomorphism algebras (7h.3) and multiplicity one (7i.2) were judged unstatable or were overlooked. They lack the same carrier as Layers 7c–7f, an `F`-stable Levi complement of an `F`-stable parabolic subgroup as a closed subgroup scheme. Layer 7i also lacks the root subgroups that generate `U₀*`, which the docstring says are extracted only for specific matrix groups. One bullet for Layers 7h–7i saying this would fix it.

## C03 — §7.1 does not name its two Lean statements or say that they are about the reduced centralizer

`reductive_identityComponent_centralizer` and `geometricallyConnected_centralizer_of_simplyConnected` (`Suggested.lean`, lines 335 and 353) appear nowhere in the README, whereas the other headlines are named, for example `StructureAcceptance.exists_titsSystem_of_isBorel` in Layer 7. They state the reductivity of (a) and statement (c) for the subgroup cut out by the functions vanishing on the points that commute with `s`, which is `C_G(s)_red`. §7.1, by contrast, defines `C_G(s)` scheme-theoretically. The two agree because (a) makes `C_G(s)` smooth, which the Lean statements do not assert. One sentence in §7.1 naming the two declarations and this difference would be enough.

## C04 — The smoothness clause of §7.1 (a) follows from a theorem in the pinned Tau Ceti, which the route could cite

`BialgHom.smoothCommHopfAlgProperty_quotient_centralizerHopfIdeal` (`TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Centralizer/Smooth.lean`, line 290) proves that, over any base, the centralizer of a diagonalizable subgroup of a smooth affine group of finite type is smooth. For semisimple `s`, `C_G(s)` is the centralizer of the closed subgroup generated by `s`, a diagonalizable subgroup of a torus that contains `s`. Smoothness therefore needs no new proof. The Lie-algebra count of the route is still needed to identify `C_G(s)°` with the subgroup generated by `T` and the `U_α` with `α(s) = 1`. The route and the Tau Ceti supplier contracts should cite the declaration.

## C05 — The hypothesis "characteristic other than two" in §9D.1 is never used, and two consumers have to work around it

The route needs only that `K/k` is separable, so that `K ⊗_k K ≅ K × K`. In characteristic two the skew-Hermitian forms are exactly the Hermitian ones, and a trace-zero `δ` lies in `kˣ`, so the last sentence of the route still holds. Because §9D.1 excludes characteristic two, ReductiveGroupsPartII §RG2.3.5a (its README, line 4545) repeats the split-case argument for residue characteristic 2, and HermitianFormsAndLattices 0.2 keeps characteristic two as its own formulation. Dropping the hypothesis would let both cite §9D.1 alone; so would admitting `K = k × k`, which the first step of the route already handles. The scope sentence at lines 56–58 would then change with it.

## C06 — The description does not say that ReductiveGroups gains two suppliers

At this head, ReductiveGroups gains two suppliers with contracts: RepresentationTheory/InductionRestriction (Layers 0 and 2–4, for §7c.1 and Layer 7i) and RepresentationTheory/SemisimpleAlgebras (Layers 1–2, for §7h.3). The description mentions neither. A sentence would cover it: "ReductiveGroups gains RepresentationTheory/InductionRestriction (Layers 0 and 2–4) and RepresentationTheory/SemisimpleAlgebras (Layers 1–2), both on `main`, as suppliers."

## N01 — Several new citations have no locator

These are Steinberg 1968 and Carter in §§7a.1–7a.2, Lang 1956 and Steinberg 1968 in §7a.3, Harish-Chandra 1970 and Springer 1970 in §§7h.1–7h.2, and Steinberg 1968 for "the cell sizes for a non-integral `q`" in the Layer 9E paragraph. Give a theorem or section for each, or rely on the Dudas–Michel statements, which do have locators.

## N02 — The module docstring of `Suggested.lean` says "Layer 7.1's", but §7.1 is a section of Layer 7

## Questions for the author

- §7i.2 attributes the commutativity of `End(Γ_ψ)` for every connected reductive `G`, with connected centre or not, to Digne–Lehrer–Michel 1992, §2, and §7i.3 (b) attributes the restriction of `Γ_ψ` to Theorem 2.9 of the same paper. Which numbered statement of §2 gives the commutativity? No open copy of the paper could be reached, so these locators are unchecked.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §7.1 (a)–(d), sampled target | `GL_n` diagonal `s`; `PGL₂`, `s = diag(1,−1)`, char ≠ 2; `SL₂`, `s = −1`; a torus | `GL_n`: `C = ∏ GL_{m_a}`, connected; `PGL₂`: `C = T ⊔ wT`, `wtw⁻¹ = t⁻¹`, so regular but disconnected and non-commutative; `SL₂`: `C = SL₂` | holds; Checks agree |
| §7.1 (c), route | `s = z s′`, `G = Z°·G^der` | `C_G(s) = C_G(s′) = Z°·C_{G^der}(s′)`, the image of a connected group; `GL_n`: `SL_n` simply connected, centralizers connected | holds |
| §7.1, locators | steinberg-1965 2.7 (a), 2.8, 2.11, pp. 53–54 | 2.7 (a): `G_x°` reductive of rank r; 2.8: generated by T, `X_α` with `α(x)=1` and `σ_w` with `wx=x`; 2.11: a⇔b⇔e | supported, semisimple G as the README says |
| `reductive_identityComponent_centralizer` | trivial `H`; `s = 1`; `GL₂`, `s` regular | vanishing ideal gives `C_G(s)_red`; `s = 1`: `G° = G`, reductive; regular `s`: diagonal torus | faithful, silent on smoothness (C03) |
| `geometricallyConnected_centralizer_of_simplyConnected` | `PGL₂`; `GL_n` | `PGL₂`: derived group not simply connected, so the hypothesis fails as it must; `GL_n`: `SL_n` simply connected, conclusion true | faithful |
| 7C.6 (a)–(c) | `GL₂`, `a ≠ 0` and `a = 0`; a torus; `GL_n` | `[[1,a],[0,1]]`: `dim C = 2 = rank`; `a = 0`: `dim C = 4`; torus: `Δ = ∅`, `u = 1` regular; one Jordan block ⇔ `rank(u−1) = n−1` | holds |
| 7a.1 | `GL₂(F_q)`; `U₃(F_q)` | `q(q−1)² + q²(q−1)² = q(q−1)(q²−1)` = `card_GL_field` at n = 2; `U₃`: `q³(q²−1)(q+1)(1+q³)` with `ℓ(w₀) = 3` | holds |
| 7a.2 | `GL₂`, `w = s` | `ẇF(t)ẇ⁻¹ = t` gives `diag(a, a^q)`, `a^{q²} = a ≠ 0`: order `q²−1`; split type `(q−1)²` | holds |
| 7a.3 | `𝔾_a`, `𝔾_m`, `x ↦ x^p` | `x^q − x`, differential −1; `t^{q−1}`, kernel `μ_{q−1}`; absolute Frobenius bijective on points, differential 0 | holds |
| 9E for 7a.3 | `𝔾_m²`, char 2, `σ(x,y) = (y², x)` | `σ²(x,y) = (x², y²)`; `dσ(a,b) = (0,a) ≠ 0`, nilpotent, so `dσ − 1` invertible | holds |
| 7b.1, 7c.1 | `GL₃`, `Q = P_{(2,1)}`, `P_M = B₂ × GL₁` | `R(Ind_{B₂}1 ⊠ 1) = Ind_{B₃}1`, degree `(q²+q+1)(q+1)` = number of complete flags | holds |
| 7h.1 | `GL₂(F₂) ≅ S₃`; condition on `χ` | sign has no `U^F`-fixed vector, so it is cuspidal; trivial is not; sign has order `2 = p` and twists sign to trivial | holds; hypothesis on `χ` needed |
| 7h.2 | `GL₃`, `(GL₂×GL₁, σ ⊠ α)` with `σ` cuspidal | `*R_T` vanishes, `*R_{GL₂×GL₁}` nonzero: the Borel test alone fails, the maximal-parabolic test succeeds | holds |
| 7h.3 | `GL₂`, `GL₃` with `(T, 1)` | `GL₂`: `1 + St`, `|W| = 2`; `GL₃`: `1 + 2(q²+q) + q³ = (q²+q+1)(q+1)`, simple-module dims 1, 2, 1, total 6 | holds |
| 7i.1 | `SU₃` (type `²A₂`); `GL_n` | `|U^F| = q³`, `|U*^F| = q`, `q²−1` regular characters, `q³−q` regular unipotents; `GL_n`: `a_i ↦ a_i t_i/t_{i+1}`, transitive | holds |
| 7i.2 | `SL₂(F_q)`, q odd; `SL₂(F₃)`; `GL₂`; `D₈` | `q + (q−3)(q+1)/2 + (q−1)²/2 + q = q²−1`; `3+2+2+1 = 8`; `GL₂`: `(q−1)(q²−1)`; `D₈`: `End ≅ M₂(ℂ)` | holds |
| 7i.3 | `SU₃`, `J = ∅`; `GL₂`, `L = T`; `Z(L_J)` | `SU₃`: only `w₀` survives, giving `ℂ[F_{q²}^×]`; `GL₂`: `(q−1)(q−2) + (q−1) = (q−1)²`; `ℤΦ/ℤΦ_J` free, so torsion injects | holds |
| §9D.1 (C05) | n = 0, 1; `ℚ(i)`; char 2 | n = 1: `SU` trivial, `U = U(1)`; n = 0: `det` not onto; `|3+4i|² = 25`; char 2: every step of the route unchanged | holds; char ≠ 2 unused |
| R01: Endoscopic §1.3 against §7.1 | char 0, over `F̄` | §1.3's three targets = §7.1 (a), (c), (d) specialised; §1.3 *Needs:* lacks §7.1 | two owners |
| C01: FourierDeligne §2.1 against §7a.3 | abelian variety over `F_q` | covered by §2.1, which is not limited to affine groups; not covered by §7a.3, which is | sentence false |

- Source locators checked against the text: 26 in all. Dudas–Michel (13): Theorem 7.3 p. 24; Corollary 7.8 (i) and Proposition 7.10 p. 26; Proposition 7.12 (i)–(iv) p. 27; Proposition 8.10 p. 32; Proposition 9.5 p. 36; Definition 10.2 p. 41; Lemma 10.3 and Proposition 10.6 p. 42; Proposition 10.8 p. 43; Theorem 10.11 p. 45; (11.7) and Lemma 11.8 p. 48. Steinberg 1965 (12): 2.7 (a), 2.8 and 2.11; 3.1, 3.2 and 3.3; 4.1, 4.3, 4.5 and 4.6; 4.7 d). SGA 1 (1): Exposé II, Corollaire 4.5, p. 32, for the unverified "Exposés I–II".
- Library declarations opened at the pin (9): Tau Ceti `reductiveCommHopfAlgProperty` (Reductive/Basic.lean:71), `HopfAlgebra.IsSemisimplePoint` (Representation/SemisimplePoint/Basic.lean:81), `HopfIdeal.vanishingIdeal` (HopfIdeal/Points/Vanishing.lean:100), `FiniteTypeCommHopfAlgCat.identityComponent` (Connected/GroupScheme.lean:68), `simplyConnectedSemisimpleCommHopfAlgProperty` (SimplyConnected/Basic.lean:65), `geometricallyConnectedCommHopfAlgProperty` (Connected/CommHopfAlgCat.lean:59), `reductiveCommHopfAlgProperty.semisimple_derived` (Derived/Semisimple.lean:90), `BialgHom.smoothCommHopfAlgProperty_quotient_centralizerHopfIdeal` (DiagonalizableGroup/Centralizer/Smooth.lean:290), and Mathlib `Matrix.card_GL_field` (GeneralLinearGroup/Card.lean:122). No pinned theorem states either new Lean target.
- Cross-roadmap citations resolved (12 roadmaps). On `main`: InductionRestriction Layers 0, 2, 3, 4; SemisimpleAlgebras Layers 1–2; SchemeAndStackFoundations §§1.1, 1.15; FourierDeligneTransform §2.1. At this head: EtaleCohomologyFoundations F.0.1–F.0.2, EndoscopicTransfer §1.3, and the citations of the new sections in FiniteReductiveGroups, DeligneLusztigTheory, ReductiveGroupsPartII §RG2.3.5a and HermitianFormsAndLattices 0.2. Each cited ReductiveGroups section states what it is cited for.
- The record kept: all 25 layers at the merge base are present; Layer 9E is retitled with the same id and subject; the 16 deleted lines are all rewrites. No layer id is reused (7g stays retired); 2 Lean declarations are added and none removed.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1499 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean`, exit 0, 13 `sorry` warnings and nothing else. The elaborated signatures of the two new theorems carry every binder (`Field`, `IsAlgClosed`, `hH`, `hder`, `hs`) and match their README statements. Both need Steinberg's theorems; no single tactic closes either.

Overlap check: read ClassicalGroupsPartII, LieHighestWeightPartII and SurfaceGroupCharacterVarieties (open), ChevalleyGroups, GroupSchemesOverABase and FlagVarieties (main), and FiniteReductiveGroups. GroupSchemesOverABase §7.3 (regular locus over a base) consumes ReductiveGroups and does not state 7C.6. FiniteReductiveGroups and DeligneLusztigTheory cite §§7.1, 7a, 7C.6, 7h and 7i, so ReductiveGroups owns these. The only second owners are EndoscopicTransfer §1.3 (R01) and, in part, FourierDeligneTransform §2.1 (C01).

Source independence: changed passages only; 10 passages compared with 3 sources (dudas-michel, steinberg-1965, sga1), longest shared run about 4 words. Largest share: dudas-michel, 14 of about 51 in-text locators of the added passages. Contents of the new Layers 7h–7i and §§7a.1–7c.1 compared with dudas-michel §§7–11: independent. The order 7h.1 → 7h.2 → 7h.3 is forced by their *Needs:* lines, 7h.1 adds closure properties that source lacks, and Layer 7i has no counterpart in it.

Research link: Layers 7h–7i (Harish-Chandra 1970, Springer 1970, Howlett–Lehrer 1980; Gelfand–Graev 1962, Digne–Lehrer–Michel 1992) and §7.1 (Steinberg 1965, 1968) are the inputs of Deligne–Lusztig 1976's character theory of finite reductive groups, which DeligneLusztigTheory builds on. This rests on the README's references and dudas-michel §§10–11.

## Not verifiable

- Steinberg 1968, *Endomorphisms of Linear Algebraic Groups*, Theorem 8.1 (§7.1 (c)): AMS Memoir, no open copy. Steinberg 1965, Remark 2.10, p. 53, announces the result.
- Humphreys 1995 §§2.2, 2.11; Springer–Steinberg 1970; Borel §9.1; Deligne–Lusztig 1976 §1; Digne–Michel 1991 Chapter 14 and 2020: publisher paywalls (marked † in the README).
- Digne–Lehrer–Michel 1992, §2 and Theorem 2.9 (§§7i.2–7i.3): only the publisher's landing page was reached, and the repository search failed.
- Howlett–Lehrer 1980 (§7h.3): paywalled publisher; Dudas–Michel (11.7), Lemma 11.8 and Proposition 10.8 were checked instead.
- Platonov–Rapinchuk–Rapinchuk 2023, §2.3.3 and Proposition 2.35 (3) (§9D.1): paywalled publisher.
- Harish-Chandra 1970, Springer 1970, Gelfand–Graev 1962, Steinberg's *Lectures on Chevalley Groups*, Lang 1956 and Carter: not opened (no locator given, or paywalled).
- The seeded targets 1.1, 8.1 and 8.2 lie outside the change (untouched and unaffected) and were not reviewed.

## Source issues

- **Misprint** in dudas-michel at the proof of Proposition 10.6, p. 43: the set `N_G(L′, L)^F` is written with bound variable g but a condition on x; it should be the x in `G^F` conjugating `L′` onto `L`; affects nothing.
- **Misprint** in dudas-michel at §11.3, p. 48: the cocycle relation is written with `γ_{ww′}`, w and w′ undefined there; it should be `γ_{nn′}`, as the sentence before it uses; affects nothing.

## For the human reviewers

- The decision on sections leaving the RiemannHypothesisForDirichletLFunctions family was applied: the ReductiveGroups sections that FiniteReductiveGroups now cites (§§7.1, 7a.1–7a.3, 7b.1, 7c.1, 7C.6, 7h.1–7h.3, 7i.1–7i.3) state what they are cited for, and this folder does nothing beyond the decision.
