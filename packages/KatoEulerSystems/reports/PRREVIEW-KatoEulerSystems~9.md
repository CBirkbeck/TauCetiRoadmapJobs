# Review of KatoEulerSystems (pull request #3027 at 0b5086d)

**Verdict:** needs changes

**Summary.** A review of the change against `main`: 35 changed lines since `aecb53a`. I checked the new §4.1a against Brown–Ghate, Ribet 1985, Ghate–González-Jiménez–Quer and Loeffler at their locators, its supplier citations on `main`, the dependency check, the automatic checks and the elaboration of the unchanged `Suggested.lean`; the statement of 4.1a is correct, with the source's hypotheses. One finding blocks: the second Check of 4.1a gives `a₅² = −8` for the weight-three form of level 38, which cannot hold because that coefficient is a rational integer (it is −1, and −8 is `a₃²`); the source has the same misprint. Two small corrections (the Ribet citations and a missing locator in the second paragraph; a proof route written on the source's algebra rather than the roadmap's) and two format notes, one of them on untouched text, do not block; nothing is left for a human to decide.

## R01 (P2) — The second Check of 4.1a says `a₅² = −8` for the form in `S₃(38, χ₋₁₉)`, but a₅ of that form is a rational integer; the value −8 is a₃².

A Check is the reader's test of the theorem. This one gives a coefficient that the inner-twist relation of the same section rules out, so anyone who recomputes it, or builds a test from it, gets a contradiction.

For p ∤ N the inner twist (complex conjugation, `χ₋₁₉`) gives `ā_p = χ₋₁₉(p)·a_p`. Since `81 = 4·19 + 5`, 5 is a square mod 19 and `χ₋₁₉(5) = +1`. So a₅ is fixed by Γ, lies in `F⁰ = ℚ` and is a rational integer, and `a₅² ≥ 0`. The LMFDB newform 38.3.b.a, the only orbit in `S₃^new(38, χ₋₁₉)` (coefficient field `ℚ(√−2)`), has `a₅ = −1` and `a₃ = 2√−2`, with `χ₋₁₉(3) = −1`, so `a₃² = −8`. The other coefficients listed there agree with this: `a₄ = a₂² = −2` and `a₆ = a₂a₃ = −4`. Brown–Ghate print the same `a₅² = −8` in Example 4.3.4 (p. 1674), which is a misprint (see Source issues). The conclusion of the Check still holds: `a₅ = −1` is a 5-adic unit, so B is split at 5.

The smallest repair, at line 1303: replace "`a₅² = −8` is a 5-adic unit" with "`a₅ = −1` is a 5-adic unit". You could also add "and `a₃ = 2√−2` with `a₃² = −8` is a 3-adic unit, so B is split at 3 too". Keep the Brown–Ghate locator for the ramification at 2 and ∞.

## C01 — In the second paragraph of 4.1a, the Ribet citation points to the wrong paper, and the identification of the Brauer class of X with that of B has no locator.

The text cites "(Ribet; Momose)" (line 1292) for X being the endomorphism algebra in weight two. The only Ribet paper this change adds to the references is the 1980 Paris seminar paper, Theorem 6. According to Brown–Ghate (p. 1656, BrownGhate2003 line 1243) and Ghate–González-Jiménez–Quer (p. 703, GhateGonzalezQuer2005 line 135; p. 711, line 425), Theorem 6 is the weight-two case of 4.1a itself. The identification `X ≅ End⁰(A_f)` is from Ribet's Math. Ann. 1980 paper, Theorem 5.1, and Momose 1981, Theorem 4.1 (GhateGonzalezQuer2005 line 84; Brown–Ghate p. 1617).

The statement that the class of X is that of B (line 1292) is true, but it has no locator. Ribet 1985, §3, pp. 190–191 (Ribet1985 lines 234–252) defines Momose's algebra as the quaternion algebra with the Brauer class of X and identifies it with the commutant of X.

Suggested repair:
- Write "(Ribet, Math. Ann. 1980, Theorem 5.1; Momose 1981, Theorem 4.1)".
- Cite the Paris paper as "Ribet 1981, Theorem 6, for k = 2" beside Brown–Ghate in the first paragraph.
- Add "(Ribet 1985, §3, pp. 190–191)" after "is that of B".

## C02 — The proof route of 4.1a lets the source's algebra X act on the crystalline realization of the motive. The roadmap builds neither X nor the motive's endomorphisms, and the inputs on its *Needs:* line support a different argument that the text does not give.

Following the sketch as written needs Brown–Ghate's Theorem 2.3.8 (X inside the endomorphisms of Scholl's motive), and no layer or supplier provides it. The listed inputs, 4.1 and `AutomorphicGaloisRepresentations` §5.1, are enough, by the following argument.

1. Let `t = [F : F⁰]` and `V_(λ₀) = ⊕_(λ|λ₀) V_λ`. This space has dimension 2t over `F⁰_(λ₀)`.
2. By 4.1, `ρ_f(H)` lies in `B_(λ₀)^×`. So the commutant C of `B_(λ₀)` in `End_(F⁰_(λ₀))(V_(λ₀))` is central simple of degree t, has class `−[B_(λ₀)]`, and commutes with `ρ_f(H)`.
3. At an ordinary λ, §5.1 there gives `0 → V⁺ → V → V⁻ → 0` with V⁻ unramified. Take τ in inertia ∩ H with `χ_p(τ)^(k−1) ≠ 1`; τ acts by that scalar on V⁺ and trivially on V⁻. So `V⁺_(λ₀)` is an eigenspace of `ρ_f(τ)`, and C preserves it.
4. C therefore acts on `V⁻_(λ₀)`, which has dimension t. Over `M_(t/2)(D)`, with D a quaternion division algebra, every nonzero module has dimension a multiple of 2t. So C splits, and B splits with it.

Would you state this argument on the roadmap's own objects, and keep the Brown–Ghate sentence as the source's form of the proof? Alternatively, keep Brown–Ghate's slope argument with C in place of X and the `D_cris` of §5.2.

## N01 — No Check of 4.1a shows that the ordinarity hypothesis is needed.

Brown–Ghate, Example 4.3.3 (p. 1674) would give one: for the form of orbit size 4 in `S₂(469, χ₄₆₉)`, 5 ∤ 469 and `a₅ = 0`, and X (so B) is ramified at 5. Their Example 4.3.2 would also do: `S₂(57, χ₅₇)`, where `a₅²χ₅₇(5)⁻¹ = 5` has odd valuation and B is ramified at 5.

## N02 — Untouched text: in "From EtaleCohomologyFoundations and Polylogarithms" (line 3259), `ClassicalAlgebraic.finiteTrace` is in code font, but it is a proposed name that EtaleCohomologyFoundations §0.8 writes in prose, and no declaration of that name exists at the pins.

Write it in prose ("the finite trace of EtaleCohomologyFoundations §0.8"), or say that it is that roadmap's proposed name.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 4.1a: B splits at λ₀ when p ∤ N and a_p is a λ-unit | Γ trivial; k = 2; p = 2 ∤ N; p ∣ N; a_p = 0; a_p ≠ 0 not ordinary | Brown–Ghate 3.3.1 (p. 1656): p ∤ N, v(a_p²ε(p)⁻¹) = 0, k ≥ 2, non-CM, no restriction on p, as README; GGJQ p. 703: true for p = 2; Ex. 4.3.3: a₅ = 0, ramified at 5 | holds as stated | N01 |
| Ordinarity at λ vs at λ₀ | λ and γλ over the same λ₀ | `a_p^γ = χ_γ(p)a_p`, and χ_γ(p) is a root of unity, so a_p is a λ-unit iff it is a γλ-unit; Brown–Ghate: "one, equivalently all" | holds | none |
| `[X] = [B]` in `Br(F⁰)` | degrees | dim_(F⁰) X = t², dim_(F⁰) V = 2t, so the commutant has dimension (2t)²/t² = 4; Ribet 1985 §3: D has the class of X | holds | C01 (locator) |
| Check 1 (Γ trivial) | t = 1 | `B ⊂ M₂(F)`, dimension 4 over F⁰ = F, so B = M₂(F) is split everywhere | true | none |
| Check 2: `a₅² = −8` | inner-twist relation; LMFDB 38.3.b.a | χ₋₁₉(5) = (5/19) = +1 (9² ≡ 5), so a₅ ∈ ℤ; LMFDB: a₅ = −1, a₃ = 2√−2, a₃² = −8; README: a₅² = −8 | false | R01 |
| Check 2: B ramified at 2 and ∞, split at 5 | parity; sign at ∞ | {2, ∞} has an even number of places; k = 3 is odd, so X is definite at ∞ (GGJQ p. 703); a₅ = −1 is a unit, so split at 5 | true | none |
| Route via the commutant (C02) | dimensions | dim V_(λ₀) = 2t; deg C = t; dim V⁻_(λ₀) = t < 2t, the least module dimension of M_(t/2)(D) | the route closes from 4.1 + AGR §5.1 | C02 |
| *Needs:* AGR §§5.1–5.2 | on main at 4b0f689 | §5.1: k ≥ 2, p ∤ N, a_p a λ-unit, filtration with unramified quotient; §5.2: φ-polynomial `X² − a_pX + ψ(p)p^(k−1)`, slopes 0 and k−1 when a_p is a unit | resolves | none |
| 4.1 (2) as 4.1a cites it | ramification bound | Loeffler Thm 2.2.2 p. 6 cites GGJQ Cor. 4.7 p. 714 (v divides disc E·2N·∞), matching README `2N·disc(F/ℚ)·∞` | consistent | none |
| Headline `ellipticCyclotomicFiniteGeneration` | m = 1; m = 2 | m = 1: field adjoin ℚ{x : x = 1} = ℚ, Mordell–Weil; m = 2: ℚ(μ_(2^∞)) | consistent; unchanged | none |
| Headline `ellipticCharacterPoints_finite` | m = 1; m = 2 | m = 1: K = ℚ, augmentation kernel 0, part = E(ℚ), F = L(E,s); m = 2: factor at 2 at s = 1 is (3 − a₂)/2 ≠ 0 since \|a₂\| ≤ 2√2 | consistent; unchanged | none |

- Source locators checked against the text: 8. Brown–Ghate Thm 2.3.8 (p. 1630), Thm 3.3.1 (p. 1656), Ex. 4.3.3–4.3.4 (p. 1674); GGJQ p. 703, p. 711, Cor. 4.7 (p. 714); Ribet 1985 §3 with Thm 3.1 (pp. 190–191); Loeffler Thm 2.2.2 (p. 6).
- Seeded sample: all 15 targets are in untouched text that the change does not affect. Only 4.1 is cited by the change, and it was checked at the locators of clause (2).
- Cross-roadmap citations resolved: AutomorphicGaloisRepresentations §§5.1–5.2 on `main` (unchanged by this pull request, and already in this roadmap's supplier contracts). BernoulliBoundsForClassGroupEigenspaces in this pull request cites §4.1a (line 1022) and §7.9; both exist.
- Record against the merge base: 8 layers at `aecb53a` and at the head; no layer or item removed, renumbered or retitled; one new id (4.1a), not reused.
- Overlap check: searched ModularIwasawaMainConjectures, ModularIwasawaMainConjecturesPartII, AutomorphicCongruences, CMRankZeroConverse, RankOneConverse (open), NonordinaryCMSpecialValues, PadicFamilies and EllipticCurveModularityPartII (main), and all open heads, for inner twists, Momose's algebra and Brauer classes of modular endomorphism algebras. Nothing is shared with 4.1a; its only other user is BernoulliBoundsForClassGroupEigenspaces, which cites it and does not restate it.
- Dependency check: `depcheck: 132 roadmaps, 1484 edges, 0 problem(s)`. No UPWARD or CYCLE line; no supplier added (AutomorphicGaloisRepresentations was already a supplier).
- Automatic checks: every check passes except the check for edits outside the folder (set aside below). `lake env lean` on `Suggested.lean`: only the two `declaration uses sorry` warnings (lines 50 and 75). The file is unchanged since the merge base, and its elaborated signatures match the README.
- External data: the q-expansion of the LMFDB newform 38.3.b.a (a₂ = √−2, a₃ = 2√−2, a₄ = −2, a₅ = −1, a₆ = −4).
- Pull-request text: the description names §4.1a as a section that BernoulliBoundsForClassGroupEigenspaces 13.1 cites, and it is a published theorem stated in the generality of its source. Nothing in the text is contradicted by the head, and no supplier of this roadmap changes.

Source independence: changed passages only. 6 passages compared with 4 sources (Brown–Ghate, Ghate–González-Jiménez–Quer, Ribet 1985, Loeffler); the longest shared run is 4 words, in the restatement of Example 4.3.4, and the mathematics forces it. Largest share: Kato2004, about 127 of 172 locator mentions in the README. Arrangement not compared: the change adds a section inside Layer 4 and adds, removes or reorders no layer.

Research link: §4.1a is Brown–Ghate's 2003 splitting theorem (Ribet 1981 in weight two) for the endomorphism algebra of a modular motive. With 4.1 (Momose 1981, Ribet 1985, Loeffler 2017), it gives Kato's admissibility hypothesis at ordinary places, an input of Kato 2004, Theorems 12.4 and 14.2. This rests on the README (4.1, 4.1a) and the sources read.

## Not verifiable

- Ribet, *Endomorphism algebras of abelian varieties attached to newforms of weight 2* (Progr. Math. 12, 1981), Theorem 6: no legal copy found through the sources service (open repositories, and the author's page refused access). Its content is taken from Brown–Ghate p. 1656 and GGJQ p. 703.
- Momose 1981, Theorem 4.1, and Ribet, Math. Ann. 1980, Theorem 5.1 (named in C01): not opened. They are attributed as GGJQ p. 703 and Brown–Ghate p. 1617 attribute them.

Automatic checks set aside as false positives: the check for edits outside the roadmap folder flagged 116 files, all in the other roadmap folders this pull request revises (each has its own review); nothing outside those folders changes.

## Source issues

- **Misprint** in BrownGhate2003 at Example 4.3.4, p. 1674: the source says the fifth coefficient of the weight-three level-38 form squares to −8; it should be a₅ = −1 (a₅² = 1), since −8 is a₃²; affects nothing.

## For the human reviewers

- none
