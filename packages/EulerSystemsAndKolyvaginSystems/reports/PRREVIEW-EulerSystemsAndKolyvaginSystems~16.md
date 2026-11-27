# Review of EulerSystemsAndKolyvaginSystems (pull request #3188 at 32082bb)

**Verdict:** accepted

**Summary.** An incremental re-review of the 32 lines changed since `e209bb2`: accepted, with no finding. The sixteen rewritten cross-references each name a heading that exists, and fifteen of them name the layer or supplier section that states what the citing sentence uses (checked by computation below); the sixteenth, in Layer 8.5, names a supplier section that does not cover the coefficient ring `Λ`. There are two small corrections and one format note, none blocking; the dependency on the open SelmerIwasawaCohomology revision, the licence of one linked copy and the unread memoir remain for the human reviewers.

## C01 — Layer 8.5 cites SelmerIwasawaCohomology §2.13 for a Selmer structure over `R = Λ`, which that section does not define

In the definition of a `Λ`-adic Selmer structure in Layer 8.5 (line 4520) the text now reads "is a Selmer structure over `R = Λ` (SelmerIwasawaCohomology §2.13 (Dual Selmer structures))". A reader who follows the pointer finds a definition whose hypotheses line is "`T` finitely generated over `O`", on main and at the head of that roadmap's open revision alike; `𝐓 = T ⊗_O Λ` is not finitely generated over `O` (already `Λ/(γ − 1)^n` has `O`-rank `n` for every `n`). This README says the same of §2.13 in Layer 0.1 (line 53: "For `M` finitely generated over the ring of integers of a finite extension of `ℚ_p`, the coefficients of SelmerIwasawaCohomology §2.13"). No stated result depends on the pointer, since the sentence goes on to give the data of `F_Λ` in full.

The notion over a complete noetherian local ring with finite residue field, `Λ` included, with the Selmer module by its kernel formula and the dual structure, is Layer 0.1 of this roadmap. Naming it would make the pointer true: "is a Selmer structure over `R = Λ` in the sense of Layer 0.1 Selmer triples and squarefree conductors".

## C02 — The description counts sixteen references that now name a layer or section; fifteen do

The description says: "Sixteen further references of the same kind, throughout the README, now name the layer of this roadmap or the supplier section they mean". Fifteen do. The sixteenth, in Layer 8.19 (line 5087), was replaced by the convention itself ("with the convention `Ind(0) = 0` at `c = 0`"), which is correct and is stated in the same paragraph. The sentence would be right as: "Fifteen further references … now name the layer or supplier section they mean, and one, in Layer 8.19, states the convention `Ind(0) = 0` it referred to".

## N01 — Two references by label remain, as the description says

Line 987 ("the counterexample in arbitrary-subquotient counterexample") and line 5600 (a list of seven underscore-separated names that no heading or declaration defines) are unchanged; a reader who searches for them finds nothing. The description reports both as undetermined, so this is for a later change.

## Previous findings

- The previous report had no finding (no R-numbered point) and no small correction. Its format note N01 is repaired: all seven references it listed (lines 468, 2039, 2496, 2765, 4520, 5478, 5695) now name a layer or supplier section. The repair of line 4520 names a section that does not cover `Λ` (C01).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.10 route (line 468): local term at `q ∤ p∞` bounded, by SelmerIwasawaCohomology §2.14 | `T = ℤ_p`, trivial action, `q ≠ p` | `H⁰(K_q, μ_{p^k})` and `H¹_ur(K_q, μ_{p^k}) = μ_{p^k}/(Fr − 1)` both of length `min(k, v_p(Nq − 1))`; difference 0 | §2.14 (i) `dim H¹_ur = dim V^{G_K}` is the input used | none |
| 2.6 (line 1525): the two Euler polynomials congruent mod `N(q) − 1`, by Layer 2.1 | rank 1, `Fr_q = u` | Mazur–Rubin `1 − ux`; Rubin `1 − N(q)^{-1}ux`; difference `N(q)^{-1}(N(q) − 1)ux`, and `N(q)` is a unit | Layer 2.1 (line 1353) states `a_i^{Rubin} = N(q)^{-i}a_i^{MR}` and the congruence | none |
| 3.8 (line 2039) and 4.7 (line 2765): the identity `res D_M(n) = a³z` and the two operators, in Layer 3.7 | `a = 1`; `f = id` | 3.5: `d_a = a³` for `f = id`, so `1` at `a = 1`; 3.7 (lines 1984, 1994) states `res_F(D_M(n)) = a³z` and `A_ℓ v = B_ℓ u`, kernels and cokernels killed by `π^{B₁}` | Layer 3.7 holds both the identity and the two operators | none |
| 3.20 (line 2496): setting of Layer 3.17 | `n = ℓq` in the sum of 3.17 | identity permutation gives `κ_{ℓq}`; the transposition, sign −1, gives `−κ_1 ⊗ ρ_ℓ(P_ℓ(Fr_q^{-1})) ⊗ ρ_q(P_q(Fr_ℓ^{-1}))` | equals `κ′_{ℓq}` of 3.20 (iii) | none |
| 4.10 (line 2885): no loss, as in Layer 1.21 | `H¹(Ω/K, W) = H¹(Ω/K, W^*) = 0` | `n_W = n_W^* = 0`; 1.21 gives nonvanishing localisations with no error term | consistent | none |
| 4.16 (line 3073): `ℋ′(n)` from the structure theorem of Layer 4.12 | `R` of length `k`, `χ(T) = r`, `λ = λ(n, T^*) < k`, `s = 0` | `H¹_{F(n)} ≅ R^r ⊕ H^*` with `length H^* = λ`; `m^λ` kills `H^*`; `m^λR^r = (R/m^{k−λ})^r` | free of rank `χ(T)` over `R/m^{k−λ}`, as 4.16 states | none |
| 4.16 (line 3075): Layer 4.11 after the path theorems | locally cyclic, hub `v` | 4.11: `Γ(S) → S(v)` injective, surjective iff trivial monodromy | gives `Γ(ℋ′)` free of rank one | none |
| 4.20 (a) (line 3206): `κ_1 ∈ ℋ′(1)` by Layer 4.16 | `n = 1` | `G_1` trivial, `ℋ′(1) = m^{λ(1,T^*)}H¹_F(ℚ, T)`; `Γ(ℋ′) = Γ(ℋ)` under Theorem 4.4.1's conditions | `length H¹_{F^*} = λ(1, T^*) ≤ sup{i}` | none |
| 8.5 (line 4520): Selmer structure over `Λ`, by SelmerIwasawaCohomology §2.13 | `𝐓 = Λ`, `O = ℤ_p` | `Λ/(γ − 1)^n` has `O`-rank `n`, unbounded; §2.13 assumes `T` finitely generated over `O` | section does not cover `𝐓` | C01 |
| 8.5 (line 4530): norm-coherent families unramified, by SelmerIwasawaCohomology §3.5 | `v ∤ p` with infinite decomposition group | §3.5 (ii): `(c_F)_λ ∈ H¹_ur(F_λ, T)` for `T` finitely generated over `ℤ_p`, `d ≥ 1` | `T` free of finite rank over `O` qualifies | none |
| 8.7 (line 4615): reflexive hull free, by PadicMeasuresIwasawaAlgebras §4.2 | `Λ = ℤ_p[[X]]`, `H = (p, X)` | `H` torsion-free, not free; `H** = Λ`; `Hom(H, Λ) = Hom(Λ, Λ)` | §4.2 states freeness of reflexive modules in dimension two | none |
| 8.19 (line 5087): `Ind(0) = 0` | `c = 0` | `gcd(0, …, 0) = 0`; the literal formula gives `char(0) = Λ` | convention as in the same paragraph and line 5117 | none |
| 8.30 (line 5374), 8.33 (line 5478), 8.39 (line 5695) | headings 8.37, 8.10, 8.8 | 8.37 states `ind_Λ(c) ⊂ char(X∞)`; 8.10 defines `a_τ`; 8.8 defines the conditions at `p` and `loc^s_{Σp}` | each names the layer that states what is used | none |

The rows for the untouched statements of the folder stand as in the previous review, of `e209bb2`.

- Source locators checked against the text: 0; the change adds, removes or alters no locator.
- Seeded sample: 2.6, 3.8, 3.20 and 8.30 contain a changed sentence, each a cross-reference with no locator, checked in the rows above; the other eleven targets lie in no changed passage.
- Headings resolved in the README: 10 (Layers 1.21, 2.1, 3.7, 3.17, 4.11, 4.12, 4.16, 8.8, 8.10, 8.37), each with the title the new text gives.
- Cross-roadmap citations resolved: 4 (SelmerIwasawaCohomology §§2.13, 2.14, 3.5 on main and at the head of its open revision, with the same titles; PadicMeasuresIwasawaAlgebras §4.2 on main). No open pull request drops an id cited here or changes this roadmap.
- Dependency check: `depcheck: 94 roadmaps, 1058 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Automatic checks at `32082bb`: all pass; no file changed outside the folder.
- Elaboration of `Suggested.lean` (unchanged): two warnings, both `declaration uses sorry` (102:8, 120:8); no library declaration opened, since the change touches no Lean statement.
- Record: no layer or item removed, retitled or renumbered against the merge base (headings: 0 removed, 2 added, both supplier-contract subsections).

Overlap check: read HeegnerPointEulerSystems, SelmerIwasawaCohomology (`main` and the cited revision), EulerSystemsCyclotomicMainConjecture; the change shares no object with them (it alters sixteen cross-references only); Selmer structures on finitely generated `O`-modules stay owned by SelmerIwasawaCohomology §2.13 and the structure theory of `Λ`-modules by PadicMeasuresIwasawaAlgebras §4.2, both cited here.

Source independence: changed passages only; 16 passages compared with 0 sources, none shared (each is a cross-reference to a heading of this README or of a supplier and carries no source wording); largest share Rubin, Euler Systems, 102 of 343 linked locators, cited by no changed sentence and not opened; arrangement not compared (no layer added, removed or reordered).

Research link: the roadmap is the Euler- and Kolyvagin-system descent of Rubin (2000), Mazur–Rubin (2004, 2016), Howard (2004) and Burns–Sakamoto–Sano (2018), consumed by Heegner-point, cyclotomic-unit and Kato-class bounds; the change ties its Selmer structures to Selmer complexes. Rests on the README overview and References.

## Not verifiable

- The citations of Mazur–Rubin 2004 corrected in the earlier commits of this pull request: the memoir is paywalled and the copy the README links is on a third party's page, which was not read. This round's change touches none of them.
- The description's account of how the text was drafted and reread cannot be checked from the head.

## Source issues

- none

## For the human reviewers

- **Merge order.** The README cites SelmerIwasawaCohomology §§2.22a, 2.23a and 2A.8 (lines 53, 250, 337, 450, 5867 and the `*Needs:*` lines), defined only at the head of that roadmap's open revision, which the description names under "Depends on". That revision merges first.
- **Licence.** `README.md` Layer 0.1 (lines 43–49) and later: the Mazur–Rubin "Kolyvagin systems" link is a copy on a third party's institutional page, not an author's page or the publisher.
- **Not tested.** Mazur–Rubin 2004 could not be read legally; about two thirds of this revision's 32 citation corrections concern it and rest on the author's comparison. Rubin's "Euler Systems", the source with the largest share of locators, is cited by no changed sentence and was not opened.
