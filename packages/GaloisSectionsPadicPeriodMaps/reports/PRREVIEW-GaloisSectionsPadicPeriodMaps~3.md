# Review of GaloisSectionsPadicPeriodMaps (pull request #1739 at 074a8b2)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement that was recomputed holds, including the three places where the README deliberately states something other than Betts–Stix (the Frobenius argument for finiteness of `End(D)`, the `#Σ` form of alternative (c) of the trichotomy, and the bounded-degree class sets `T_i`); in each the README is right and the source is not. Both findings of the previous review are repaired. There are five small corrections and four format notes, none blocking, and one question left to the human reviewers (whether the end theorem counts as statable on the fundamental group that Tau Ceti already has).

## C01 — The module docstring says the pins lack arithmetic étale fundamental groups; they do not

An implementer who reads the first, twelfth and thirteenth items of the docstring of `TauCetiRoadmap/GaloisSectionsPadicPeriodMaps/Suggested.lean` (lines 13, 24, 25) will conclude that the carrier has to be built, and will not look for it. At the Tau Ceti pin, finite étale schemes over a connected scheme form a Galois category with the geometric fibre as fibre functor (`TauCeti/AlgebraicGeometry/FiniteEtale/Galois/Category.lean`, lines 106 and 111; `FiniteEtaleScheme.fiber`, `TauCeti/AlgebraicGeometry/FiniteEtale/Fiber.lean`, line 117), so `π₁^ét(S, x)` is `Aut (FiniteEtaleScheme.fiber x)`; pullback is compatible with fibres (`pullbackCompFiberIso`, same file, line 179); and for `S = Spec K` the group is identified with `Gal(Ω/K)` (`galContinuousMulEquivAutFiber`, `TauCeti/AlgebraicGeometry/FiniteEtale/Galois/FundamentalGroup.lean`, line 219).

What the pins do lack is the homomorphism of fundamental groups induced by a morphism together with the fundamental exact sequence, section classes and their restriction to completions, the section of a local point, and the genus of a curve (no `genus` is declared under `AlgebraicGeometry` in either library). Saying that in the three items makes the docstring true; the conclusion that §§0.5, 9.3 and 9.4 are not stated can stay.

## C02 — Two statements are cited to Betts–Stix where the README, correctly, says something else

A reader who opens the source at the locator finds a different argument or a different inequality and cannot tell which is intended. (i) The Check of §2.2 (line 435) attributes "the Frobenius condition is essential" to the proof of Proposition 2.16, and §2.4 (line 465) cites that proof for a route through `φ`. The source's proof uses only that the endomorphisms commute with `G_v` (bs lines 603–615), which, as the README's own example `K_v = ℚ_{p²}` shows, gives a trace to `K_{v,0}` and not to `ℚₚ`. (ii) §6.8 (lines 935 and 939) cites Proposition 6.7 for alternative (c) with `#Σ/(d + 1)`; the source states `dim A/(d + 1)` (bs line 2364), which fails for `A = ℚ_{p²}` with trivial action and `V = A ⊗ H¹(E)`: `Σ = ∅`, so (a) and (b) are impossible and (c) would read `0 ≥ 1`.

The README's versions are the true ones. One clause at each locator is enough: "the source's proof invokes the Galois action only; the Frobenius step is added here", and "the source states (c) with `dim A`; its proof gives `#Σ`". §7.1 already does this for the bounded-degree sets.

## C03 — Several `*Needs:*` and Dependencies lines omit an input that the section itself uses

An implementer who schedules from these lines will start a section before one of its inputs. §2.2 applies MordellLawrenceVenkatesh §0.5 in its route (line 418) but its `*Needs:*` (line 441) does not list it. §2.3 applies MordellLawrenceVenkatesh §0.18 (line 453); its `*Needs:*` (line 459) lists §4.3 only. §3.1 uses Chebotarev for the infinitely many self-conjugate places (line 505), and the supplier contract says Layer 10 supplies this, but neither the `*Needs:*` of §3.1 (line 516) nor the Dependencies of Layer 3 (line 574) names Chebotarev. The last API bullet of §5.2 uses §2.3 and the first of §7.4 uses §6.3; neither is in the `*Needs:*` line (lines 724, 1082). The Dependencies of Layer 0 (line 164) omit ComplexComparisonPartII §§C6.0, C6.2, which §§0.3 and 0.5 need, and those of Layer 4 (line 669) omit AdicEtaleGeometry §§A1.1, A1.3 and InverseGaloisAndArithmeticFundamentalGroups §IG.0.3, which §4.1 needs. Add the missing items.

## C04 — The description says the Lean file states definitions and theorems; it states none

The description's "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning" suggest a file with statements. At this head `Suggested.lean` contains a module docstring and an empty namespace: no declaration and no `sorry`, and it elaborates with no output. Text that would be right: "the Lean file states no declaration; its docstring names the fourteen headline families and what each lacks at the pins; it builds with no warning".

## C05 — §8.1 cites the four-isotropic-Lagrangian contract for the proportion of small orbits

In the remark of §8.1 (line 1172) the sentence "the result MordellLawrenceVenkatesh Layer LV.7 and the four-isotropic-Lagrangian contract states the Lawrence–Venkatesh version for unramified sets and Frobenius orbits" points at a contract about tuples of Lagrangians, which says nothing about orbit sizes; the `*Needs:*` line (line 1195) repeats it. The statement meant is MordellLawrenceVenkatesh §7.1, the proportion of Frobenius orbits of size below 8 on an unramified finite `G_K`-set. Cite §7.1 in both places and drop the contract there.

## N01 — The Summary states the end theorems without the curve

Line 3 says the Selmer-section image and the finite-descent projection are finite "for a number field with no CM subfield" and never names the smooth projective curve of genus at least 2 they belong to. One clause would add it.

## N02 — Two API bullets of §1.1 define isotropic and Lagrangian submodules without naming them

Lines 187–188 read "A submodule W ≤ V with ω(W, W) = 0" and "An isotropic W equal to its own orthogonal"; the terms used from §2.3 on are never attached to them. "An isotropic submodule: …" and "A Lagrangian submodule: …" would do.

## N03 — §2.1 cites two ranges for one equivalence

The statement (line 374) cites PadicHodgeTheory §§3.4–3.5 and 5.3 for the equivalence with the colimit of finite-level filtered modules; the API bullet (line 386) cites §§3.3–3.5.

## N04 — A Check that separates `#Σ` from `dim A` in §6.8

The two Checks of §6.8 use split algebras, for which the two forms of (c) agree. The example `A = ℚ_{p²}` with trivial action, `V = A ⊗ H¹_ét(E)`, `d = 1` (`Σ = ∅`; the `#Σ` form reads `0 ≥ 0`, the `dim A` form `0 ≥ 1`) would tell them apart.

## Previous findings

- R01 of the previous review (the labels "Theorem A" and "Theorem B" left without a referent): repaired. §9.4 now reads "The section conjecture is not assumed; the statement is an unconditional prediction of it", §9.5 "As in §9.4; …" and "Apply §9.4 with the identical field and genus hypotheses", and Downstream consumers "Section 9.4 constrains …; §9.5 gives …". The four remaining occurrences (lines 84, 136, 1331, 1348) all name the source's theorems.
- R02 of the previous review ("the orbit lemma"): repaired. The Check of §7.1 now ends "by the orbit criterion of §2.3"; the phrase "orbit lemma" no longer occurs.
- The head also removes the former §9.2 (the Mordell consequence). No reference to §9.2 remains in the README or the Lean docstring, and the one roadmap on main that mentions this roadmap (GaloisActionOnEtaleCohomology, Downstream consumers) names no section.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| §0.1 restriction of sections | `Ẑ(1) ⋊ C₂`; `Spec K`; complex place | `(a,c)² = (a − a, 1)`; `(−2,1)(2,c)(2,1) = (−2,c)`; one-point section sets | Holds; none |
| §0.5 Harari–Stix | `Y(K_v) = ∅`; rational point; hs Theorem 2.1 (i)⇔(iii), `S = ∅`, `U` trivial | Both sets empty; diagonal point ↔ its section; hs lines 391–410 | Holds; none |
| §1.3 relative pair | `E×E → E → E` via `[2]`; Legendre | `H⁰` regular representation of `E[2]`: rank 4, invariants 1; `H¹` rank 8; `SL₂` of dimension 3 | Holds; matches bs §7.1 |
| §1.4 pair of a section | `y² = x³ − x`, sections of `0` and `(0,0)` | `x(2Q) = (x²+1)²/(4(x³−x))` vanishes at `±i`; `(1−i)² = −2i`; invariants 4 and 2 | Holds; none |
| §1.7 adelic locus | Rational point; constant family; `Y(A_K) = ∅` | Fibre pair interpolates; constant pair interpolates all; empty | Holds; bs Definition 6.1 |
| §2.1 filtered discrete modules | Index `r`; unit; `ℚₚ → ℚₚ(1)` | `r²` against `r`; `End(1) = ℚₚ`; `σ(λ) = pλ` forces `λ = 0` | Holds; N03 |
| §2.3 orbit criterion | `G_m²` on `P¹`, jumps `{0,1}` | Orbits `[1:0]`, `[0:1]`, the rest: dimensions 0, 0, 1 ≤ 2 | Holds both ways; none |
| §§2.2, 2.4 `End(D)` | `K_v = ℚ_{p²}`, `D = ℚₚⁿʳ` | `G_v`-equivariant endomorphisms `ℚ_{p²}` (dimension 2 > `d² = 1`); with `φ`: `ℚₚ` | README right, source proof incomplete; C02 |
| §3.2, §3.4 weight identities | `ℚₚ(−1)`; `H¹` of an abelian variety of dimension `g`; `V = 0` | `r_v = 1 = 2/2`; `g = 1·1·2g/2`; `0 = 0` | Holds; none |
| §4.1, §4.2 transport | Residue field `𝔽₂`; `n = 0`; `z² = t` over `ℚ₃` | Two residues used, none left; degrees 2 and 3 generate; 2 a nonsquare mod 3 | Holds; bs Theorem 3.22, Lemma 3.23 |
| §5.3 period comparison | `y = y₀` | `Φ(y₀) = F¹H¹_dR`, `M^{≤1}(Φ₀) = H^{≤1}_pH` | Holds; bs Proposition 4.11 |
| §5.4 decomposition | Dimensions (1,2) split; degrees (1,2), `d = 1`; `d = 0` | `1 + 3 = 4`, rank 6; `1 + 2 = 3`, rank 6; a point | Holds; bs (4.3), Lemma 4.12 |
| §6.4 `S`-goodness of interpolants | Diagonal rational point | Unramified, pure of weight `i` outside `S`; jumps in `{0,1}` above `p` | Holds; bs Lemma 6.4 |
| §6.7 algebra of a fibre | Closed point of degree 4 | One orbit of size 4; `#Σ = dim H⁰` | Holds; bs Remark 6.6 |
| §6.8 trichotomy | `A = ℚₚ`; `A = ℚ_{p²}`, `d = 1`; the rearrangement | `1 ≥ 1/(d+1)`; `0 ≥ 0` true, `0 ≥ 1` false; `m#Σ ≤ (m−1)(#Σ−s) + 2ms ⇒ (m+1)s ≥ #Σ` | `#Σ` form holds; C02, N04 |
| §7.1 class sets `T_i` | `Y′ = Y ⊔ Y`, dimensions 1 and 2; `√2, −√2` factors | `B = 6` against `2d₁δ = 4`; `X² − 2` integral, factors not rational | Holds; gap declared |
| §7.3, §7.4 type (a) | `(d,r) = (1,4), (1,3), (2,4)` | `3 < 4`; `3 = 3`; `10 < 12`; difference `d` at `r = 4` | Holds; bs Lemma 6.13 |
| §7.6 type (b) factor | `d = 1`, lines `e, f, e+f, e+2f`; four equal lines | No common line; `W = span(e)` meets all four | Holds; bs Lemma 6.17, Sublemma 6.18 |
| §8.1 small-orbit proportion | `C₄` example; degrees 3 and 4 | `4/8 > 1/5`; `3/7` | Holds; C05 |
| §8.2 count `n_v` | `ℚ₅`, `ℚ₇`, `ℚ₂` | `3+1+3 = 7`; `3+4 = 7`; `7+4 = 11` | Holds; none |
| §8.4 exclusion of type (c) | `g = 2`, `q_v = 5`, `q = 83` | `k = 41`; `82 ≥ 63`; 3, 5, 31 ∤ 82; `63/13448 < 1/124`; `164 > 124` | Holds; bs Proposition 6.20 |
| §8.6 pairs `(v, q)` | `g = 3`, `q = 11, 23`; `ℚ(√5, ζ₁₁+ζ₁₁⁻¹)` | `0.0163 < 1/26`; `0.0031 < 1/56`; `q_v ≡ ±1` mod 5 and mod 11 | Holds; bs Remark 6.23 |
| §9.1 finiteness of the locus | Family `X_q` of §8.5 | Locus inside finite ∪ finite ∪ ∅ | Holds on the declared gaps |
| §9.3 Selmer localisations | `ℚ(i)`: `(3)`, `(1+i)`, `(2±i)` | Fixed, fixed, exchanged by conjugation | Covered, covered, not covered |
| §9.4 no CM subfield | `ℚ`, `ℚ(∛2)`, `ℚ(i)` | Degrees 1, 3 admit no CM subfield; `ℚ(i)` is CM | Holds; bs Theorem A |
| §9.5 finite descent | `Y(K_v) = ∅`; one rational point | `0 = 0`; equal singletons by §0.5(b) | Holds; bs Theorem B |
| §9.6 obstruction reading | bs Remark 1.3, footnote 1, Remark 1.5 | (1°), (2°), `K_v`-rational centres, 100 % by Remark 6.23(I) | Matches bs lines 116–127, 153–159 |
| `Suggested.lean` docstring | Tau Ceti pin, étale fundamental group | `Aut (FiniteEtaleScheme.fiber x)` exists; no induced maps, sections or genus | Reason misstated; C01 |

- Source locators checked against the text: 73 in bs (every locator of the fifteen sampled targets and of Layers 2, 3 and 6–9, with number, page and hypotheses), 3 in hs (Introduction, Theorem 2.1, Remarks), 5 in stoll (§2, Lemma 5.8, Proposition 5.9, Definition 6.1 for "very good", Conjecture 9.1), 2 in stix08 (Theorem 45, Remark 46). No locator is flagged as unverified in the README.
- Library declarations opened at the pins: 14 in Mathlib (among them `Field.absoluteGaloisGroup`, `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean` line 42; `hasSum_zeta_four`, `Mathlib/NumberTheory/ZetaValues.lean` line 458; `Nat.forall_exists_prime_gt_and_eq_mod`, `Mathlib/NumberTheory/LSeries/PrimesInAP.lean` line 443; `NumberField.IsCMField`, `Mathlib/NumberTheory/NumberField/CMField.lean` line 70), all in the files the README names; 5 in Tau Ceti (`TauCeti.Symplectic.groupScheme`, `TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean` line 120, and the four of C01).
- Cross-roadmap citations resolved: 23 roadmaps, 60 section or layer ids, each opened on main or at the head of its open pull request (AnabelianGeometryAndNonabelianChabauty §7.1 and its four named statements; HeightsRationalPointsAndObstructions §§2.3, 2.3a, 2.4, 2.11, 2.11a, 3.1, 3.5, 3.17d, 6.4; MordellLawrenceVenkatesh §§0.4–0.18, 1.2–1.16, 2.1–2.11, 3.1–3.19, 4.1–4.3, LV.7, LV.8, LV.10; CohomologyComparisons §§6.4–6.7; the rest on main). None missing.
- Declared gaps: all eight appear with the same slug and sentence under the supplier contracts; none asks for what its supplier already states (MordellLawrenceVenkatesh §1.2 is the non-symplectic integral lemma, §7.4 the five-Lagrangian statement, §8.14 is over `K` only, §2.1 has constant dimension; no roadmap states an unconditional least-prime bound; PadicHodgeTheory has no horizontal period ring).
- Automatic checks: all passed on this head. Dependency check: `depcheck: 214 roadmaps, 2305 edges, 0 problem(s)`, no UPWARD or CYCLE line. The diff outside the folder is empty.
- Elaboration of `Suggested.lean`: exit 0, no output. The file has no declaration, so the `#check` inventory and the one-tactic probe have no case.
- Headline theorems (README Summary and Layer 9): §9.1, §9.3, §9.4, §9.5, with §§0.5, 1.8, 2.1, 2.4, 3.2, 3.4, 4.3–4.5, 5.3, 6.8, 7.4–7.8, 8.4–8.5 behind them. Each is named in the module docstring as not statable; none is stated through a stand-in.
- Pull request text: title and every sentence of the summary and the prose read against the head; it adds a new roadmap, so nothing is removed or renumbered against the base; one sentence is stale (C04).

Overlap check: read MordellLawrenceVenkatesh, MordellLawrenceVenkateshPartII, AnabelianGeometryAndNonabelianChabauty and PadicHodgeTheory; nothing shared. Searched every open head and main by object (Selmer sections, self-conjugate places, modified adelic points, filtered discrete modules, horizontal semistable periods): the modified adeles of HeightsRationalPointsAndObstructions §3.17d (torsors under an abelian variety) and ArithmeticGaloisDuality §R02.4.6 (tori) are different carriers, as the Scope section says; this roadmap owns the proper-scheme carrier.

Source independence: 28 passages compared with 4 sources, none shared beyond short forced statements (longest common run 11 words, the second `S`-goodness condition); largest share bs, 65 of 68 locators; contents compared with bs: independent (bs §7 is split between Layers 0–1 and placed first, bs §2 is divided between Layers 2 and 3, bs §5 has no layer, bs §6 is divided among Layers 6–9; the order of Layers 2–9 is forced by the `*Needs:*` lines of §§4.5, 5.3, 6.8, 7.4 and 9.1).

Research link: Layer 9 is Theorems A and B of Betts–Stix (2022; Annals of Mathematics 2025), which refine the method of Lawrence–Venkatesh (2020) and pass to finite descent through Harari–Stix (2012) and Stoll (2007); rests on the README's references and on bs §1, hs Theorem 2.1 and stoll §2 as read.

## Not verifiable

- The board package LawrenceVenkateshMethod could not be read (the request for its README returned "not found"), so ownership against it was not checked.
- The description's account of earlier review rounds is a statement about process, not about the head; not checked.

## Source issues

- **Gap** in bs at Proposition 2.16(1), proof, p. 12: the source says commuting with the Galois action alone yields a trace identity over `ℚₚ`; it should be over `K_{v,0}` unless commutation with Frobenius is also used; affects the proof.
- **Error** in bs at Proposition 6.7(c), p. 46: the source says the count of small-index points is at least `dim A/(d+1)`; it should be `#Σ/(d+1)`, which is what its proof gives (the two agree for split `A`); affects a stated result.
- **Gap** in bs at the proof of Proposition 6.9, p. 49: the source says a coefficient fibre of an `S`-good pair meets Definition 6.11, which requires integer Frobenius polynomials; it should bound the eigenvalue degrees or prove rationality of the factor; affects the proof.
- **Gap** in bs at Remark 2.20, p. 14: the source says finite order of the restricted idele character times its conjugate makes the square of one local component finite; it should account for all places above the place of the CM field, for instance by norm descent; affects the proof.
- **Misprint** in bs at §6.3, the definition before Proposition 6.15, p. 49, and its proof, p. 51: the source says the degree-one retwist alone is isomorphic to a pair; it should be the pair `M^{≤1}(Φ)`; affects nothing.

## For the human reviewers

- The Lean file states nothing. Tau Ceti at the pin has `Aut (FiniteEtaleScheme.fiber x)` and `pullbackCompFiberIso` (`TauCeti/AlgebraicGeometry/FiniteEtale/Fiber.lean`, lines 117, 179) but no induced maps, section classes or genus; whether §9.4 is statable on these is yours to decide.
