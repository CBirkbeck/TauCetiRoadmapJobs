# Review of ReductiveGroups (pull request #3027 at 6f088b9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 584 changed lines since `b8f3652`. Every added or changed passage (§§7.1, 7C.6, 7a.1–7a.3, 7b.1, 7c.1, Layers 7h and 7i, §9D.1, the Layer 9E extension and the two new Lean theorems) was recomputed on its Checks and degenerate cases, its Dudas–Michel, Steinberg 1965 and SGA 1 locators were read at the source, the pinned declarations it names were opened, and `Suggested.lean` was elaborated; the mathematics holds and no finding remains. The earlier small corrections are all repaired, and the deferred ownership finding is settled by the change this pull request makes to EndoscopicTransferAndUnitaryTraceComparison §1.3. There is one format note, not blocking; one decision of the human reviewers was applied and nothing else is left for them.

## N01 — The SGA 1 locator of §7a.3 can be made exact

"SGA 1, Exposés I–II" is marked as unchecked. The differential criterion the route uses is Exposé II, Corollaire 4.5 (`sga1` line 1592: for `Y` smooth, `f` is smooth at `x` exactly when `X` is smooth at `x` and the map of differentials is universally injective there). Citing it would let the dagger go.

## Previous findings

- R01 — not repaired: deferred (D01)
- C01 — repaired: the scope paragraph now reads "smooth connected commutative group of finite type over `F_q`, affine or not; for affine groups its torsor statement is the commutative case of §7a.3", which is what FourierDeligneTransform §2.1 on `main` states.
- C02 — repaired: the module docstring of `Suggested.lean` has a bullet "Layers 7h–7i: …" naming the missing `F`-stable Levi complement and the root subgroups that generate `U₀*`.
- C03 — repaired: §7.1 names both declarations and says they concern "the reduced subgroup `C_G(s)_red`; it is `C_G(s)` because (a) makes `C_G(s)` smooth, which the Lean statements do not assert".
- C04 — repaired: the route of §7.1 and the Tau Ceti supplier contracts cite `BialgHom.smoothCommHopfAlgProperty_quotient_centralizerHopfIdeal`; the route now uses the Lie-algebra count only for the dimension bound.
- C05 — repaired: §9D.1 begins "Let `k` be a field, `K/k` a separable quadratic field extension", the route adds the characteristic-two sentence, and the scope sentence follows.
- C06 — repaired: the description now says "ReductiveGroups gains RepresentationTheory/InductionRestriction (Layers 0 and 2–4, for §7c.1 and Layer 7i) and RepresentationTheory/SemisimpleAlgebras (Layers 1–2, for §7h.3), both on `main`, as suppliers."
- N01 — repaired: the citations without locators are gone from §§7a.1–7a.3, 7h.1–7h.3, 7i.1–7i.2 and Layer 9E; §7a.1 and Layer 9E now cite Dudas–Michel, the paragraph after Example 7.9 and the proof of Proposition 7.12 (iii), both read at the source. The remaining unlocated one is N01 above.
- N02 — repaired: the docstring says "§7.1's reductivity".
- The question on Digne–Lehrer–Michel 1992: the README now marks §2 and Theorem 2.9 as unchecked (†); it stays under "Not verifiable".

## Deferred findings

- D01 — resolved: EndoscopicTransferAndUnitaryTraceComparison §1.3 at this head cites ReductiveGroups §7.1 (a), (c), (d), (e), says they are not its targets, and lists §7.1 in its *Needs:*.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §7.1 (a)–(e), sampled target | `GL_n` diagonal `s`; `PGL₂`, `diag(1,−1)`, char ≠ 2; `SL₂`, `s = −1`; `s` central | `∏ GL_{m_a}`, connected; `T ⊔ wT`, regular, disconnected, non-commutative; `SL₂`; `C = G` | holds; Checks agree |
| §7.1 route, smoothness step | closure `D` of `⟨s⟩` in `T`; `R`-points | `C_G(s)(R) = C_G(D)(R)`: `O(D)⊗R → ∏R` injective; `dim C ≤ dim 𝔤^{Ad s} = dim H`, `H ⊂ C°`, so `C° = H` | holds |
| §7.1 (c), (d) routes | `s = zs′`; commutative `C` | `C_G(s) = C_G(s′) = Z°·C_{G^der}(s′)`; `C ⊂ C_G(T) = T ⊂ C°` | holds |
| §7.1 locators | steinberg-1965 2.7 a), 2.8, 2.9, 2.10, 2.11 | lines 198–234: printed pp. 53–54; semisimple `G`, as the README says; 2.10 announces (c) | supported |
| `reductive_identityComponent_centralizer` | `s = 1`; regular `s` in `GL₂`; hypothesis `hH` | `C = G`, `G° = G` reductive; diagonal torus; pinned reductive = smooth, geometrically connected, no unipotent normal subgroup | faithful to (a) |
| `geometricallyConnected_centralizer_of_simplyConnected` | `PGL₂`; `GL_n`; torus | `PGL₂` derived group not simply connected, hypothesis fails; `SL_n` simply connected, `∏GL_{m_a}` connected; derived group trivial, `C = T` | faithful to (c) |
| 7C.6 (a)–(c) | `GL₂`, `a ≠ 0`, `a = 0`; `P_i` bound; orbit count | `dim C = 2 = rank`; `dim C = 4`; `dim L_i = rank + 2 > rank`; `dim U₀ − |Δ| = dim U₀*` | holds |
| 7a.1 | `GL₂(F_q)`; `U₃(F_q)` | `q(q−1)² + q²(q−1)² = q(q−1)(q²−1)`; `|B^F| = q³(q²−1)(q+1)`, times `1+q³` = `|U₃(q)|` | holds |
| 7a.1 new locators | dudas-michel after Ex. 7.9; Prop. 7.12 (ii)–(iv) | lines 1219–1222: `F`-stable pair `T ⊂ B`; 1243–1247: decomposition, order, Sylow | supported |
| 7a.2 | `GL₂`, `w = s`; stabilizer set | `diag(b^q, a^q) = diag(a, b)`: `b = a^q`, `a^{q²} = a`, order `q²−1`; `v⁻¹wF(v) = w ⇔ vw = wF(v)` | holds |
| 7a.3 | `𝔾_a`, `𝔾_m`; `ℒ(γg)`, `ℒ(hg)` | `x^q − x`, differential −1; `t^{q−1}`; `ℒ(γg) = ℒ(g)`; `ℒ(hg) = g⁻¹ℒ(h)F(g)` | holds |
| 7b.1, 7c.1 | `GL₃`, `Q = P_{(2,1)}`, `P_M = B₂×GL₁` | `Ind_{B₃}1`, degree `(q²+q+1)(q+1)` = number of complete flags | holds |
| 7h.1 | `GL₂(F₂) ≅ S₃`; `χ = χ_pχ_{p′}` | sign nontrivial on `U^F`, cuspidal; sign·sign = trivial, not cuspidal; `χ_p` trivial on `p`- and `p′`-elements | holds; condition on `χ` needed |
| 7h.2, 7h.3 | `GL₂`, `GL₃`, `(T, 1)` | `1 + St`, `|W| = 2`; `1 + 2q(q+1) + q³ = (q²+q+1)(q+1)`, `1²+2²+1² = 6 = |S₃|` | holds |
| 7i.1 | `SU₃`; `GL_n` | `|U₀^F| = q³`, `|U₀*^F| = q`, `q²−1` regular characters, `q³−q` regular unipotents; `a_i ↦ a_i t_i/t_{i+1}` | holds |
| 7i.2 | `SL₂(F_q)` odd `q`; `GL₂`; `D₈` | `q + (q−3)(q+1)/2 + (q−1)²/2 + q = q²−1`; `(q−1)[q + q² − q − 1] = (q−1)(q²−1)`; `4 = 2·2`, `End ≅ M₂(ℂ)` | holds |
| 7i.3 | `GL₂`, `L = T`; `SU₃`, `J = ∅`; `Z(L_J)` | `(q−1)(q−2) + (q−1) = (q−1)²`; only `w₀` survives, dimension `q²−1`; `ℤΦ/ℤΦ_J` free, torsion injects | holds |
| §9D.1 without char ≠ 2 | n = 0, 1; `ℚ(i)`; char 2 | `h(e₁x, e₁y) = e₁e₂h = 0`; char 2: `c(δ) = −δ = δ`, so `δ ∈ kˣ`, Hermitian = skew-Hermitian; `|3+4i|² = 25` | holds in every characteristic |
| Layer 9E | `𝔾_m²`, char 2, `σ(x,y) = (y², x)` | `σ² = (x², y²)`; `dσ(a,b) = (0,a)`, nilpotent, nonzero, `dσ − 1` invertible | holds |
| Layer 9E new locator | dudas-michel proof of 7.12 (iii) | lines 1252–1256: Frobenius case from the affine space `U_w`, other cases admitted | supported |

- Source locators checked against the text: 24. Dudas–Michel (15): Theorem 7.3 p. 24; Corollary 7.8 (i), the paragraph after Example 7.9 and Proposition 7.10, p. 26; Proposition 7.12 (i)–(iv) and its proof, p. 27; Proposition 8.10 p. 32; Proposition 9.5 p. 36; Definition 10.2 p. 41; Lemma 10.3 and Proposition 10.6 p. 42; Proposition 10.8 p. 43; Theorem 10.11 p. 45; (11.7) and Lemma 11.8 p. 48. Steinberg 1965 (8): 2.7 a), 2.8, 2.9, 2.11, pp. 53–54; 3.1, 3.2, 3.3, pp. 54–55; 4.1–4.7 located. SGA 1 (1): Exposé II, Corollaire 4.5.
- Library declarations opened at the pin (6): Tau Ceti `BialgHom.smoothCommHopfAlgProperty_quotient_centralizerHopfIdeal` (`DiagonalizableGroup/Centralizer/Smooth.lean`:290, any base ring, `[Algebra.Smooth R H]`), `reductiveCommHopfAlgProperty` (`Reductive/Basic.lean`:71), `simplyConnectedSemisimpleCommHopfAlgProperty` (`SimplyConnected/Basic.lean`:65), `reductiveCommHopfAlgProperty.semisimple_derived` (`Derived/Semisimple.lean`:90), `HopfIdeal.vanishingIdeal` (`HopfIdeal/Points/Vanishing.lean`:100), `HopfAlgebra.IsSemisimplePoint` (`Representation/SemisimplePoint/Basic.lean`:81). No pinned theorem states either new Lean target.
- Cross-roadmap citations resolved. On `main`: InductionRestriction Layers 0, 2, 3, 4; SemisimpleAlgebras Layers 1–2; SchemeAndStackFoundations §§1.1, 1.15; FourierDeligneTransform §2.1; EtaleCohomologyFoundations F.0.1–F.0.2 (already cited at the merge base, so not a new supplier). At this head: EndoscopicTransferAndUnitaryTraceComparison §1.3 and DeligneLusztigTheory, which cites Layers 7a–7e, 7h, 7i and 9E as a consumer.
- The record kept: all 25 layers at the merge base are present; Layer 9E is retitled with the same id and subject; 2 layers and 2 Lean declarations are added, none removed. No file outside the roadmap folders is changed.
- Automatic checks: all passed. Dependency check: `depcheck: 129 roadmaps, 1470 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean`, exit 0, 13 `sorry` warnings and nothing else. The elaborated signatures of the two new theorems carry every binder (`Field`, `IsAlgClosed`, `hH`, `hder`, `hs`). Both need Steinberg's theorems; decided by reading the pinned definitions that no single tactic closes them.
- The description's sentences about ReductiveGroups (the two new suppliers, §9D.1, the two centraliser theorems on the reduced subgroup, EndoscopicTransfer §1.3 as a consumer) agree with this head.

Overlap check: read ClassicalGroupsPartII, LieHighestWeightPartII and SurfaceGroupCharacterVarieties (open), ChevalleyGroups, GroupSchemesOverABase and FlagVarieties (main), and FiniteReductiveGroups; nothing shared. FiniteReductiveGroups, DeligneLusztigTheory and EndoscopicTransferAndUnitaryTraceComparison §1.3 cite §§7.1, 7a, 7C.6, 7h and 7i as consumers, and FourierDeligneTransform §2.1 owns the commutative, not necessarily affine, Lang torsor.

Source independence: changed passages only; 10 passages compared with 3 sources (dudas-michel, steinberg-1965, sga1), none shared (longest common run about 8 words, the minimal-Levi step that the argument forces). Largest share: dudas-michel, 9 of 25 citing lines of the added text. Contents of Layers 7h–7i compared with dudas-michel §§10–11: independent; the order 7h.1 → 7h.2 → 7h.3 is forced by their *Needs:* lines and Layer 7i has no counterpart there.

Research link: Layers 7h–7i and §§7.1, 7a.1–7a.3 are the Harish-Chandra and Gelfand–Graev theory (Steinberg 1965; Digne–Lehrer–Michel 1992; Dudas–Michel 2015) that Deligne–Lusztig 1976's character theory of finite reductive groups is built on, which DeligneLusztigTheory consumes. This rests on the README's references and dudas-michel §§7–11.

## Not verifiable

- Steinberg 1968, Theorem 8.1 (§7.1 (c)): AMS Memoir behind a paywall; Steinberg 1965, Remark 2.10, announces the result.
- Humphreys 1995 §§2.2, 2.11; Borel §9.1; Deligne–Lusztig 1976 §1; Digne–Michel 1991 Chapter 14 and 2020: publisher paywalls, marked † in the README.
- Digne–Lehrer–Michel 1992, §2 and Theorem 2.9 (§§7i.2–7i.3): publisher paywall, marked † in the README.
- Platonov–Rapinchuk–Rapinchuk 2023, §2.3.3 and Proposition 2.35 (3) (§9D.1): publisher paywall; the statement was checked by computation only.
- The seeded targets 1.1, 8.1 and 8.2 lie in untouched text the change does not affect and were not reviewed.

## Source issues

- none

## For the human reviewers

- The decision on sections leaving the RiemannHypothesisForDirichletLFunctions family was applied: the ReductiveGroups sections that FiniteReductiveGroups and OrbitMeasuresOnAdelicGroups now cite (§§7.1, 7a.1–7a.3, 7b.1, 7c.1, 7C.6, 9D.1, Layers 7h–7i) state what they are cited for.
