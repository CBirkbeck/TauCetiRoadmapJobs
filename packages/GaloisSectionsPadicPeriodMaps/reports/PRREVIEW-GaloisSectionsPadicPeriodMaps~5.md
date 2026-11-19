# Review of GaloisSectionsPadicPeriodMaps (pull request #1739 at 5fdc42d)

**Verdict:** accepted

**Summary.** Accepted: a full review of this head found no finding. Every statement of the fifteen sampled sections agrees with its source at the locator given, the computed Checks hold, every cited supplier section exists where it is cited, and none of the eight declared supplier gaps asks for something already provided. There are two small corrections and five format notes, none blocking; one question is left for the human reviewers (whether the end theorem counts as statable on the fundamental group Tau Ceti already has).

## C01 — The file named for `adicCompletion` is a deprecated shim at the pin

In the Mathlib paragraph of the supplier contracts (line 1402) the completion at a finite place is cited as `IsDedekindDomain.HeightOneSpectrum.adicCompletion` in `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean`. At the pinned Mathlib that file contains only two imports and `deprecated_module (since := "2026-10-09")` (line 11); the structure is declared in `Mathlib/RingTheory/DedekindDomain/AdicValuation/Completion.lean`, line 51. An implementer who opens the named file finds no declaration. Name the second file.

## C02 — The counterexample with `ℚ̄ₚ^×`-values in §3.2 is cited to a proposition that does not contain it, and is worded as holding for every prime

In the remark after the statement of §3.2 (line 524): "With ℚ̄ₚ^×-values the statement is false when K has a CM subfield: for K = Q(i), p ≡ 3 mod 4 and v = (p), the character … (bs, Proposition 2.19, p. 13)". Proposition 2.19 (bs line 647) only states the hypothesis `χ: G_K → ℚₚ^×`; the example is the roadmap's own, and a reader who follows the locator does not find it. The example itself is correct (weight 1 is odd at the self-conjugate place `(p)`), but it depends on `p`: for `p ≡ 1 mod 4` the two components of the same CM character are `ℚₚ^×`-valued with weights 0 and 1 at the two conjugate places, sum `1 = n`, and nothing fails. Would "can fail" for "is false", with the locator moved to the sentence on the `ℚₚ^×` hypothesis, say what is meant?

## N01 — The Summary states the end theorems without the curve

Line 3 says the Selmer-section image and the finite-descent projection are finite "for a number field with no CM subfield" and does not name the smooth projective curve of genus at least 2. One clause would add it.

## N02 — Two API bullets of §1.1 define isotropic and Lagrangian submodules without naming them

Lines 187–188 read "A submodule W ≤ V with ω(W, W) = 0" and "An isotropic W equal to its own orthogonal"; the terms used from §2.3 on are never attached to them.

## N03 — §2.1 cites two ranges for one equivalence

The statement (line 374) cites PadicHodgeTheory §§3.4–3.5 and 5.3 for the colimit description of `MF(φ, N, G_v)`; the API bullet (line 386) cites §§3.3–3.5.

## N04 — A Check that separates `#Σ` from `dim A` in §6.8

The Checks of §6.8 use split algebras only. The example `A = ℚ_{p²}` with trivial action and `d = 1` (`Σ = ∅`: `0 ≥ 0` holds, `0 ≥ 2/2` fails) would show why alternative (c) counts `#Σ`.

## N05 — LocalFieldsRamification is cited by its former layer numbers

Line 1498 and the `*Needs:*` lines of §§4.2, 8.1, 8.2 cite "Layers 0, 2 and 4" and "Layer 1, Power classes". That roadmap now has Layers 0–2 with other contents (its Layer 2 is Hasse–Arf) and resolves the old numbers through its table "Former layer numbers", so the citations are valid; citing the names the table gives (*Unramified extensions*, *Absolute Galois group*, *Power classes*, §0.3) would spare the reader the lookup.

## Previous findings

The previous review, of `8a6331b`, had no finding and no small correction; its four format notes were not taken up and are written again above as N01–N04 (line 3; lines 187–188; lines 374 and 386; the Checks of §6.8). The 186 lines changed since then remove the line locators into the source extraction, name EtaleCohomologyFoundations §F.0.A2 as the owner of the exact sequence in §§0.1 and 1.4, add ArithmeticGaloisRepresentations §4.1 for the real places, add the embedding-independence bullet of §0.3 and its scope sentence on real and total localisation. Each was read against the supplier: §F.0.A2 states exactness for a geometrically connected quasi-compact quasi-separated scheme over a field; §4.1 states that complex conjugations at a real place have order 2 and form one conjugacy class; both agree with the use made of them.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| §0.1 restriction; split extension Check | `Ẑ(1) ⋊ C₂`, conjugation by `(n,1)` | `(n,1)(2,c)(−n,1) = (2n+2, c)`; `n = −2` gives `(−2,c)`; `(2,c)² = (0,1)` | Holds |
| §0.2 local injectivity | `ℚₚ`; `ℝ` | stix08 Thm 45 (line 1109, p. 22): no divisible points gives injectivity; `A(ℝ)⁰` divisible, so fails over `ℝ` | Holds; locator right |
| §0.3 Selmer sections (sampled) | quadric `z²−x²−y²=1`; `Y(ℝ)=∅` | complex locus ≃ `S²`, `π₁` trivial, one real section class, two real components; empty real locus gives empty Selmer set | Holds; bs Def. 1.1 at line 36, p. 1 |
| §0.4 modified adeles, finite descent locus | `P¹`; `Spec K ⊔ Spec K`; `Spec K[ε]/ε²` | stoll Lemma 5.8(1) p. 19; two points per factor; one point per factor; image of a real component under a finite étale map is a whole component | Holds; Stoll's pages 4, 14, 16, 19, 20, 38 right |
| §0.5 Harari–Stix (sampled) | `U` trivial, `S = ∅`; both inclusions of (b) | hs Thm 2.1 (i)⇔(iii), line 391, p. 11; lift of `P_•` to `X(A)^ét`, then `c` with `loc_v c = P_v`; conversely choose `P_u` at every place | Holds |
| §1.4 pair of a section (sampled) | `E: y²=x³−x`, `[2]`, points `0` and `(0,0)` | `x(2Q)=(x²+1)²/(4x(x²−1))`; roots `±i`; `(1−i)² = −2i = i³−i`; orbits 1,1,1,1 against 2,2; invariants 4 against 2 | Holds; bs §7.2 p. 56 |
| §1.7–1.8 adelic locus and Selmer inclusion | constant family; rational point | every adelic point interpolated by `(ℚₚ, H¹(A₀))`; bs Thm 7.1 p. 54, Prop. 7.2 p. 56 | Holds |
| §2.1 `D_pH`, induction | unit; `ℚₚ(1)`; index 2 | `End(1)=ℚₚ`; `σ(λ)=pλ` has no solution; dims 2, 4, 2 (lax only) | Holds |
| §§2.2–2.4 `End(D)`, bounds | `K_v=ℚ_{p²}`, `D=ℚₚⁿʳ`; `d=1`; `D=0` | Galois-fixed scalars `ℚ_{p²}` (dim 2 > 1), with `φ`: `ℚₚ`; `d(2d+1)+1 = 4 = dim GSp₂`; `Aut=1`, `Aut^GSp=G_m` | Holds; Frobenius step needed (source issue) |
| §3.1 self-conjugate places (sampled) | `ℚ`; `ℚ(i)` at 2, 3, 5; `ℚ(2^{1/3})` | no CM subfield: all; 3 inert fixed; 5 = (2+i)(2−i) exchanged; (1+i) fixed, ramified | Holds; bs Def. 2.17, Rem. 2.18 p. 13 |
| §§3.2–3.4 weight identity | `χ_cyc⁻¹`; `H¹` of abelian variety; `V=0` | weight 2, jump 1 = 2/2; both sides `g`; `0 = 0` and average undefined; `ℚₚ(1)`: `(C_p(r)(1))^G ≠ 0` iff `r = −1` | Holds; convention matches bs footnote 7 |
| §4.1 transport on polyannuli (sampled) | `n=0`; cover `z²=t` over `ℚ₃` at `t=1,2` | `G_R=G_v`; 2 is a non-residue mod 3, fibre character quadratic; `∇z = z·dt/2t`, no horizontal basis | Holds; hypothesis excludes the sign system |
| §§4.2–4.3 polydisc reduction, horizontal transport (sampled) | residue fields `𝔽₂, 𝔽₃, 𝔽₄` | 0, 1, 2 residues left after removing two; degrees 2 and 3 generate since gcd = 1 | Holds; bs Thm 3.22 pp. 28–29, Lemma 3.23 p. 29 |
| §5.1 symplectic pair of `H_pH` (sampled) | elliptic fibre; `⟨−1⟩` | `F^i(V⟨n⟩)=F^{i+n}V` (bs line 1397): unit jump 0 moves to 1 = jump of `ℚₚ(−1)`; ranks (1,2) | Holds; bs §4.1.3 p. 35 |
| §5.2 retwists | ordinary fibre, lines `e, f, e+f`; graph of `diag(1,−1)` | `(t_H,t_N)`: `e` (1,0) not admissible; `f`: (0,0),(1,1); `e+f`: (0,0),(0,1); trace form `(1+det D)ω = 0`, not `A`-stable | Holds |
| §5.4 period domain | split base, `d=(1,2)`; degrees (1,2), `d=1` | `1+3=4`, rank 6; `1+2=3`, rank 6 | Holds |
| §6.4 projected adelic locus (sampled) | diagonal rational point | bs Lemma 6.4, footnotes 20–21, p. 44: local fibres unramified pure integral off `S`, de Rham above `p` | Holds |
| §6.6 non-symplectic locus | `g=3`, `q=11, 23`; `d=1`; `d=2` with nonsquare `c` | `2.5·10=25`, `2.5·22=55`; `L=∧²V`; `b=a₁²=c·a₂²` impossible | Holds |
| §6.7 algebra of a fibre (sampled) | one point of degree 4; `ℚ_{p²}` | one orbit of size 4, `#Σ = 4 = dim`; `Σ=∅`, `dim = 2` | Holds; bs Rem. 6.6 p. 46 |
| §6.8 trichotomy (headline) | `A=ℚₚ`; `A=ℚ_{p²}`, `d=1`; inequality | `1 ≥ 1/(d+1)`; `0 ≥ 0` true, source's `0 ≥ 1` false; `m#Σ/2 ≤ (m−1)(#Σ−s)/2+ms` gives `(m+1)s ≥ #Σ` | `#Σ` form holds (source issue) |
| §7.1–7.3 type (a) | `(d,r)=(1,4),(1,3),(2,4)`; `Y′=Y⊔Y`, `d=(1,2)`; `E:y²=x³−x` at 5 | 3<4, 3=3, 10<12; `B=6` against `2d₁δ=4`; `#E(𝔽₅)=8`, `a₅=−2`, `(X²+2X+5)²` | Holds |
| §7.4 type (a) period locus (sampled) | all residue degrees < 4; degree-4 base with non-CM `E` | locus empty; index 4, ranks (4,8), Hodge point in the locus | Holds; bs Prop. 6.9 pp. 48–49 |
| §7.6 type (b) Lagrangians (sampled) | `d=1`, `r=3,4`; all lines equal | no common line for distinct lines; common line when equal | Holds; bs Lemma 6.17 p. 50, Sublemma 6.18 p. 51 |
| §7.7 type (b) period locus (sampled) | `Y′=Y`; `ℚ₅`, unramified degree 4, CM curve | index 1 < 4, empty; `a₅=−2` unit, `ℚ(i)` split at 5, stable weight-1 line, average 1 ≥ 1/2 | Holds; bs Prop. 6.15 p. 49 |
| §8.1 small orbits (sampled) | degree 5; degrees 3 ⊔ 4; `C₄` example; `∅` | 0; 3/7; 4/8 > 1/5 with fibres 4,1,1,1,1; `0 ≥ 0` true and `0/0` avoided | Holds; bs p. 52, footnote 22 |
| §8.2 `n_v` | `ℚ₅`, `ℚ₇`, `ℚ₂` | 3+1+3 = 7; 3+(9−1)/(3−1) = 7; 7+4 = 11; bound `2^t+6^t`, `t=N+2` (LocalGaloisGroups Layer 7: `d(G_K) ≥ N+2`, line 1103) | Holds |
| §§8.3–8.5 Kodaira–Parshin parameter | `g=2,k=5,q_v=7`; `q_v=5,q=83`; `q_v=2,q=11` | gcds 1,1,1; 175 of 625; `k=41`, `d_q=123`, `63/13448 < 1/124`, `5·33 ≡ 1 mod 41`; 42 → 3, 7 ∤ 10 | Holds |
| §8.6 coverage | `g=3` over `ℚ`; `K=ℚ(√5, ζ₁₁+ζ₁₁⁻¹)` | `4ζ(6)·8/22³ ≈ 0.0031 < 1/56`; `2ζ(6)·8/10³ ≈ 0.0163 < 1/26`; `q_v ≡ ±1` mod 5 and mod 11 everywhere | Holds; README narrower than the source (source issue) |
| §9.1 (headline) | self-conjugate `v`, `q` of §8.5 | finite ∪ finite ∪ ∅; bs Thm 6.5 p. 44 | Holds |
| §§9.3–9.4 (headline) | `ℚ`; `ℚ(i)` | every prime covered, 2 included; (3), (1+i) covered, (2±i) not; bs Thm A at line 44 | Holds |
| §9.5 finite descent (headline, sampled) | hypotheses against §9.4 | same field and genus; bs Thm B at line 66, p. 2; uses §0.5(b) only at finite places | Holds |
| §9.6 obstruction reading (sampled) | (1°), (2°) | bs Rem. 1.3 and footnote 1, p. 3 (centres `K_v`-rational); Rem. 1.5 pp. 3–4 | Holds |
| C01 `adicCompletion` | pinned Mathlib | named file: `deprecated_module`, line 11; `structure adicCompletion` at `AdicValuation/Completion.lean` line 51 | Path to change |
| C02 remark of §3.2 | `ℚ(i)`, `p ≡ 3` and `p ≡ 1 mod 4` | inert: weight 1 odd at self-conjugate `(p)`; split: weights 0, 1, sum `1 = n` | Example right; wording and locator |

- Source locators checked against the text: about 60 (bs about 50, hs 4, stoll 6 including Proposition 5.9, stix08 2), covering every locator of the fifteen sampled sections; all agree. The README flags no locator as unverified.
- Library declarations opened at the pin: 15 (thirteen Mathlib names of lines 1402–1404, twelve in the files named and `adicCompletion` not, C01; `TauCeti.Symplectic.groupScheme` at `TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean` line 120; `TauCeti.FiniteEtaleScheme.fiber` at `TauCeti/AlgebraicGeometry/FiniteEtale/Fiber.lean` line 117).
- Cross-roadmap citations resolved: every section cited, in 23 roadmaps (20 on main, 3 at the heads of their open pull requests: MordellLawrenceVenkatesh, HeightsRationalPointsAndObstructions, CohomologyComparisons). None missing. Statements opened and compared: AnabelianGeometryAndNonabelianChabauty §7.1 (injectivity criterion), EtaleCohomologyFoundations §F.0.A2, InverseGaloisAndArithmeticFundamentalGroups §IG.1.3 (line 1335, finite type, characteristic zero), ArithmeticGaloisRepresentations §4.1, LocalGaloisGroups Layer 7, LocalFieldsRamification §0.3 and its former-numbering table, HeightsRationalPointsAndObstructions §§3.5, 3.17d, MordellLawrenceVenkatesh §§1.2, 7.1, 8.13, the sign convention of PadicHodgeTheory (line 671) and CohomologyComparisons (line 100).
- Declared gaps: eight, each with the same slug and supplier under the supplier contracts. None is already provided: MordellLawrenceVenkatesh §1.2 is the non-symplectic integral lemma, its Layer LV.7 needs five Lagrangians and unramified sets, its §8.13 describes fibres at `K`-points only; no roadmap on main or open states Linnik's least-prime bound (SieveMethodsAndPrimePatterns §2.9 is the least quadratic non-residue; ExplicitPrimeCounting §6.5 is conditional).
- Dependency check: `depcheck: 199 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD or CYCLE line. The change outside the roadmap folder is empty. All automatic checks passed on this head.
- Elaboration of `Suggested.lean`: exit 0, no output. The file has no declaration, so the `#check` inventory and the one-tactic probe have no case.
- Headline theorems: §9.1, §9.3, §9.4, §9.5, with §§0.5, 1.8, 2.1, 2.4, 3.2–3.4, 4.3–4.5, 5.3, 6.8, 7.4–7.8, 8.4–8.5 behind them; each is named in the module docstring (fourteen items) as not statable, none stated through a stand-in. Tau Ceti at the pin has no de Rham representations, no `D_pst`, no section classes.
- Pull request text: title, summary block and prose read against the head. It adds a new roadmap (84 headings added, none removed, no declaration); "states no declaration", "fourteen items", "no warning", the three files and "Part II of AnabelianGeometryAndNonabelianChabauty" agree with the head. No stale sentence.

Overlap check: read MordellLawrenceVenkatesh, MordellLawrenceVenkateshPartII, AnabelianGeometryAndNonabelianChabauty, PadicHodgeTheory; nothing shared. Searched by object over every open head and main: Selmer sections, Harari–Stix, the principal trichotomy, spherical polyannuli and horizontal semistable periods occur in no other roadmap; modified adelic points occur only for tori (ArithmeticGaloisDuality §R02.4.6) and for torsors under abelian varieties (HeightsRationalPointsAndObstructions §3.17d), both named in the scope section; the comparison compatibilities of Betts–Stix Propositions 3.19–3.20 are owned by CohomologyComparisons §§6.4–6.7 and de Rham pairs by PadicHodgeTheory §7.3, both cited. Ownership against the package LawrenceVenkateshMethod under review on the job board was not checked: its files were not available.

Source independence: 20 passages compared with 4 sources (the fifteen sampled statements, and the wording of §§1.3, 2.1, 4.2, 4.4 and 6.8 with its proof plan), none shared beyond formulas and definitions that can be written in one way; largest share bs, 100 of 107 locators; contents compared with bs: independent (Layer 0 rests on hs, stoll and stix08; Layer 1 is bs §7 placed first; bs §2 is split into Layers 2 and 3; bs §5 is no layer; bs §6 is split into Layers 6–9; the order of Layers 2, 4, 5, 6, 7 is forced by the `*Needs:*` lines of §§4.1, 5.1, 6.3, 7.1).

Research link: Layer 9 is Theorems A and B of Betts–Stix (2022; Annals of Mathematics 2025), which adapt the method of Lawrence–Venkatesh (2020) to Galois sections and reach finite descent through Harari–Stix (2010) and Stoll (2007); rests on the README's references and on bs §1, hs Theorem 2.1, stoll §2 and §5 as read here.

## Not verifiable

- The description's account of earlier review rounds is a statement about process, not about the head; not checked.
- The generated dependency and merge-order blocks of the description are outside the check of the text.
- The sources behind the supplier contracts that the README cites only through other roadmaps (Shimizu, Scholze, Lawrence–Venkatesh) were not opened: no locator into them is given here.

## Source issues

- **Gap** in bs at Proposition 2.16(1), proof, p. 12: the source says commuting with the Galois action alone yields a trace identity over `ℚₚ`; it should be over the maximal unramified subfield of `K_v` unless commutation with Frobenius is also used; affects the proof.
- **Error** in bs at Proposition 6.7(c), p. 46, and Proposition 1.8(c), p. 6: the source says the count of small-index points is at least `dim A/(d+1)`; it should be `#Σ/(d+1)`, which is what its proof gives (they agree for split `A`); affects a stated result.
- **Gap** in bs at the proof of Proposition 6.9, p. 49: the source says a coefficient fibre of an `S`-good pair satisfies the integrality of Definition 6.11; it should allow algebraic-integer Frobenius eigenvalues of bounded degree, since a `ℚₚ`-factor of an integer polynomial need not be rational; affects the proof.
- **Gap** in bs at Remark 6.23(I), p. 54: the source says the cyclotomic field is linearly disjoint from the Galois closure once `r₀` exceeds the odd prime divisors of its degree; it should also exceed the primes ramified in that closure; affects nothing.
- **Error** in bs at Remark 6.23(III), p. 54: the source says for any genus-3 curve the least admissible `q` is 23, respectively 11; it should say over `ℚ`, since some fields have every residue cardinality `≡ ±1` mod 5 and 11; affects nothing.

## For the human reviewers

- The Lean file states nothing. Tau Ceti at the pin has `Aut (FiniteEtaleScheme.fiber x)` and `pullbackCompFiberIso` (`TauCeti/AlgebraicGeometry/FiniteEtale/Fiber.lean`, lines 117, 179) but no induced maps, section classes or genus; whether §9.4 is statable on these is yours to decide.
