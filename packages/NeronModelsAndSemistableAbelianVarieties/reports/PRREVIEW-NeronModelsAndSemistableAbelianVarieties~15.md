# Review of NeronModelsAndSemistableAbelianVarieties (pull request #2708 at ac35abe)

**Verdict:** accepted

**Summary.** Accepted: no findings. The head is the one the previous review read, so its two small corrections are still open (a Conrad locator in 5.2 and in the `GoodIsogeny` docstring, and the description's gloss of the criterion without the perfect-residue-field hypothesis). The fifteen sampled targets recompute as true and their readable locators match, except that the Darmon–Diamond–Taylor remark cited for Ogg's formula in 5.3e does not state it (a third small correction), and one Fontaine page range starts a page early (one format note). Two questions for the author; two licence facts are left for the human reviewers.

## C01 — The 5.2 locator and the `GoodIsogeny` docstring cite a good-reduction passage on pp. 9–10 of Conrad's notes that is not there

A reader who opens Conrad at pp. 9–10 for isogeny invariance of good reduction finds the definition of semistable reduction, Theorem 4.2 and Proposition 4.3; good reduction occurs there only in the sentence that the inertial criterion generalises Néron–Ogg–Shafarevich (conrad-semistable line 358), and p. 10 does not mention it at all. Proposition 4.1(1), pp. 8–9, transfers semi-abelian identity fibres across an isogeny; good reduction then follows through the equal toric ranks of 3.2 and the toric-rank-zero clause of 3.1.

Replace "and pp. 9–10" in 5.2 (README line 3270) and "and the good-reduction discussion, pp. 9–10" in the docstring (Suggested.lean line 110) by, for example, "Conrad, Proposition 4.1(1), pp. 8–9, with 3.2 and `toric_zero` of 3.1". The route of 5.2 through 5.1 is unaffected.

## C02 — The description states the criterion without the perfect-residue-field hypothesis that 3.9a puts on its converse

"What was wrong" glosses the criterion as "a curve of genus at least two over the fraction field of a discrete valuation ring has nodal, equivalently stable, reduction exactly when its Jacobian has semistable reduction". Section 3.9a (README lines 1910–1916) asserts the equivalence only for perfect `k`, and Stacks Remark 55.18.2 calls the general case only presumable (stacks-models line 3978). Insert "with perfect residue field" after "discrete valuation ring" in that parenthetical.

## C03 — The remark cited for Ogg's formula at `p ≥ 5` in 5.3e does not state the formula

In 5.3e (README lines 3724–3725) the sentence "for `p ≥ 5`, `v(Δ_min) = f(E) + m − 1`" is located at Darmon–Diamond–Taylor, §2.2, Remark 2.14, p. 58. That remark says only that the conductor of `ρ_{E,ℓ}` at `p` agrees with the local conductor of `E` "given by a formula of Ogg", proved by Saito at `p = 2`, and refers on to Silverman's *Advanced Topics*, Ch. IV, §§10–11 (ddt lines 2179–2183); neither the identity with the number of components `m` nor the restriction `p ≥ 5` is there. A reader checking the tame case finds no statement. The identity itself is true and the section's second half proves it in every characteristic from Saito's theorem, whose locators (Liu, Introduction, p. 51, and §2.1, pp. 58–59) do match. Either cite the place in Silverman that Darmon–Diamond–Taylor point to, with its theorem number, or drop the separate `p ≥ 5` sentence, since the general statement that follows contains it.

## N01 — One Fontaine range starts a page early

In 5.3 (README line 3355) "Exposé VIII, … §§2.3.2–2.3.7, pp. 335–339": §2.3.2 begins on p. 336 (fontaine-viii line 502, after the foot of p. 335 at line 498); p. 335 carries §2.3.1. The References entry already gives 336.

## Questions for the author

- Which step of the converse route in 3.9a uses that `k` is perfect? Each input it names (StableReduction Layers 7–8, 3.3, 3.9, the Isom scheme and descent of SchemeAndStackFoundations §4.15, Deligne–Mumford 1.13 at geometric points) is stated for an arbitrary discrete valuation ring. If none does, a sentence saying the hypothesis is kept only because the sources state it would help; I did not check each supplier at that generality, so this stays a question.
- In 5.3e Saito's formula is stated for a *complete* discrete valuation ring with perfect residue field. Liu's introduction (liu-1994 line 30) sets it up for any discrete valuation ring with perfect residue field. Is completeness in Saito's Theorem 1, or added here? I could not read Saito 1988 (paywalled).

## Verified sound

| Statement | Instances tried | Values, one side | Values, other side | Result |
|---|---|---|---|---|
| 1.8 abelian schemes are Néron; `HasGoodModel` | `A = 0`; split Tate curve; generic iso not required to respect group laws | `Spec R` is a model; Tate curve: identity fibre `𝔾_m`, not proper | A scheme iso `X_K ≅ A` becomes a group iso after one translation (rigidity) | True; BLR §1.2 Prop 8 not readable |
| 3.1 semistable predicate | good, split Tate, additive | `(t,a) = (0,1)`, `(1,0)` | additive: `𝔾_a`, `u = 1`, not semi-abelian | Conrad def p. 6 (line 247), §4 p. 9 (line 343), henselisation line 356: match |
| 3.2 isogeny | `[p]` on additive `E/ℚ_p`; `[p]` on Tate curve; `E_q → E_{q^n}` | `[p] = 0` on `𝔾_a`, kernel of dimension 1 | `[p]` on `𝔾_m`: kernel `μ_p`, degree `p`; `#Φ = ord q` vs `n·ord q` | Conrad Prop 4.1(1) pp. 8–9 (lines 322–335), p. 12 (line 493): match |
| 3.6 Weil orthogonality | ranks; `m = 1`; good reduction | `rk T_f(A) = t + 2a`, `rk T_t(A^∨) = t`, sum `2g` | `m = 1`: all groups trivial; good: `F_m = A[m]`, toric part `0` | Conrad Thm 5.5 p. 18 (line 753): match; Faltings–Chai not readable |
| 3.13 Raynaud extension | good; split Tate; `T_R = 0` | `T = 0`, `G = B` | `G = 𝔾_m`, `B = 0`; only split extension | Raynaud §4.2 (i)–(iv) pp. 302–303, Thm 4.2.2 p. 304, Def 4.2.3 p. 305; `p > 0` at line 188: match |
| 4.6 component pairing, sign | `n = 5`, `(r,s) = (1,1), (1,2)`; `n = 1`; `r ↦ r + n` | `1/5`, `2/5`; zero group | shift changes value by integer `s`; `(−τ)(−σ) = τσ` | Werner §4 p. 212 (lines 284–287), pp. 212–213 (298–309), Prop 5.1 p. 213 (314–325): match |
| 4.11 odd-factor torsors | `f` irreducible of degree `2g+2`; `f` with rational root | no odd-degree factor: `W_m[2](K) = ∅` | linear factor: nonempty | BGW Prop 22(3)–(4) p. 11 (lines 456–462): match |
| 5.0b Frobenius polynomial | `g = 1`; real roots `±√q`; `g = 0` | `X²(q²/X² − aq/X + q) = q(X² − aX + q)` | `∏(q − α_i X) = q^g ∏(X − q/α_i)`; `g = 0`: `1 = 1` | Milne I 10.20 p. 50, II 1.1 p. 75, IV 3.5 p. 141, Cor 3.6 p. 142: match |
| 5.1a potential good reduction | good; Tate curve; `y² = x³ − x` over `ℚ₂` | trivial; infinite unipotent | `j = 1728` integral, `Δ = 64`, bad, finite inertia image | True; Serre–Tate not readable |
| 5.3 period comparison | `ℚ_p(1)`; Tate `q = π⁵`, `e = 2`, then `e_L = 4`; `y² + y = x³` over `ℤ₂`; `q = 5, 30` over `ℚ₅` | `φ(t⁻¹) = p⁻¹t⁻¹`, arithmetic Frobenius `q_K`; `N_K = 5`, `N_p = 5/2`, `N_L = 10` | `#E(𝔽₂) = 3`, `a = 0`, `t² + 2`; `log 6 ≡ 5 mod 25`, `c_q = −λ(q)` | Fontaine III 5.2.1 p. 158 (`N = a·N₀`), 1.8.6 p. 135; Coleman–Iovita pp. 2–3; Brinon–Conrad p. 126: match |
| 5.3 relation `r N r⁻¹ = p^{a(g)} N` | arithmetic and geometric Frobenius | `φ^{−a} N φ^{a} = p^{a} N` from `Nφ = pφN` | geometric Frobenius: factor `q_K⁻¹` | True |
| 5.3e Ogg and Saito | good; `I_n`; `II`; `I₀*`, `p ≥ 5`; `y² = x³ − x` over `ℚ₂` | `χ(X_k̄) = m − 1 + ε`: `0`, `n`, `2` | `6 = 2 + 5 − 1`; `6 = 5 + 2 − 1` | True; Liu p. 51, §2.1 pp. 58–59 match; C03 |
| 5.3i Mathlib local polynomial | `y² = x³ − x` at 5; split and nonsplit; additive | `#E(𝔽₅) = 8`, `a₅ = −2`, coefficient `+2` | geometric Frobenius on `(V^∨)^I` is `δ(Frob) = ±1`: `1 ∓ X`; additive `1` | DDT Props 2.11–2.13 pp. 57–58 match; Mathlib `localPolynomial` has these four cases |
| 6.0 independence and specialisation | `Y² = T` at `T = 2`, `T = 1`; `P = ℤ_ℓ`; base `ℂ` | `C₂`; split | closed subgroup onto `ℤ/ℓ` is `ℤ_ℓ`; every fibre split over `ℂ` | Richard–Yafaev Thm 4.9(1)–(2) p. 17; Noot §§1.2–1.3 p. 163; InverseGalois IG.2.8 (transcendence basis): match |
| 6.2 character sequences | block-diagonal maps; injective verticals | cokernel is the direct sum | snake: `0 → coker u₁ → coker u → coker u₂ → 0` | True; SGA 7 IX and the Yuan–Zhang erratum not readable |
| 6.5 / `EquationGoodComparison` | `y² + y = x³` over `ℤ₂`; `ord Δ = 12` non-minimal | `Δ = −27` unit: all three hold | excluded by `IsMinimal`; `HasGoodReduction` extends `IsMinimal` | True; BLR §1.5 not readable |
| 3.9a first Check | `y² = (x² − p)(x−1)(x−2)(x−3)`, `p ≥ 5` | tangent cone `y² + 6x²`, `−6 ≠ 0`; equation `≡ −6p mod m²`: regular | normalisation `w² = (x−1)(x−2)(x−3)`; `t = a = 1` | True |
| 3.9a second Check | nontrivial torsor under good `E/ℚ_p` | `Jac C = E` semistable, `t = 0` | nodal model ⇒ tree, one genus-1 vertex ⇒ smooth model ⇒ `𝔽_p`-point ⇒ `C(ℚ_p) ≠ ∅` | Non-example correct |
| 3.9a locators | Deligne–Mumford; Stacks 0CEK | 1.13 p. 85, 1.14–1.17 pp. 85–87, 2.3 p. 88, 2.4 p. 89 | "perfect … presumably … general" (stacks-models line 3978) | Match; C02 |
| 2.9 wild Checks | `y² = x³ + 32` over `ℤ₂`; `y² = x³ + 9` over `ℤ₃` | `v₂(−432·32²) = 14`; minimal (`t'² ≡ 2 mod 4` has no solution); branch `II*` | `v₃(b₆) = 2`, `b₈ = 0`, `v₃(Δ) = 7`: branch `IV` | True |
| 4.5, 4.7 cokernels | `[n]`; `2I₂`; `diag(1,4)`; cycle of `n`; `I₀*` | `ℤ/n`; `(ℤ/2)²`; `ℤ/4` | `ℤ/n`; `(ℤ/2)²` with multiplicity 2 at the centre | True |
| 5.3g–5.3h conductors | twists over `ℚ₂`; 11a1 | `2a(χ) = 4, 6`; bound `2 + 6 = 8` | `Δ = −11⁵`: `N(E[5]) = 1`, `N(E[3]) = 11` | True |
| 5.2 / `GoodIsogeny` | `[p]` on good `E`; `E_q → E_{q³}`; `[0]` | (good, good); (bad, bad) | image of `M_{A,k}` has dimension `g`, so `M_{B,k}⁰` is proper | True for every DVR; C01 |
| `LocalExistence` (1.7) | `A = 0`; `𝔾_m` | `Spec R`: both Hom sets singletons | `𝔾_m` not an `AbelianVariety` (proper required) | True; five binders intact |
| `DedekindExistence` (1.9) | `S = Spec ℤ`, `A = 0`; a field | `S` itself | `topologicalKrullDim = 1` excludes fields | True |
| Grothendieck's criterion (headline) | Tate curve; `y² = x³ + p` | unipotent nontrivial inertia; semistable | inertia image of order 6; additive | True; not statable, named in the docstring |
| `Φ_A ≅ coker u♯` (headline) | Tate curve, `ord q = n` | `coker [n] = ℤ/n` | `Φ = ℤ/n` | True; not statable, named in the docstring |

- Earlier review: it had no findings. Its C01 and C02 are unrepaired (the head is unchanged) and are repeated above; its question on perfectness is repeated.
- Source locators checked against the text: 43, in 16 sources (conrad-semistable 7, werner-1997 4, fontaine-iii 4, fontaine-viii 2, raynaud-1motifs 3, ddt 4, milne-av 4, milne-avs-xnotes 1, coleman-iovita 3, brinon-conrad 1, liu-1994 2, bgw 1, richard-yafaev 1, noot-1995 1, deligne-mumford 4, stacks-models 1).
- Library declarations opened at the pins: Mathlib `WeierstrassCurve.integralModel`, `IsMinimal`, `HasGoodReduction`, `hasGoodReduction_iff_isElliptic_reduction` (Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:62, 275, 324, 327), `localPolynomial`, `LFunction` (…/EllipticCurve/LFunction.lean:43, 79); Tau Ceti `AbelianVariety` (TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95), `smooth_projModelOver` (…/EllipticCurve/Scheme/Smooth.lean:211), `frobeniusTrace` (…/EllipticCurve/PointCount.lean:101), `toAbelianVariety_toOver` (…/EllipticCurve/Scheme/AbelianVariety.lean:72). No Néron-model or good-model declaration exists at either pin.
- Cross-roadmap citations resolved on main for the sampled sections: AbelianSchemesAndArithmeticModuli A0.1, A1.1–A1.2, A1.8, A2.2–A2.3, A3.2, A4.1–A4.3, A4.5, A4.8, A6.10–A6.12; SchemeAndStackFoundations §§0.12–0.14, 3.6, 4.8–4.10, 4.15; InverseGaloisAndArithmeticFundamentalGroups IG.2.4, IG.2.6, IG.2.8; ArithmeticGaloisRepresentations §§2.4–2.5, 3.1, 6.1–6.3, 6.4a, 7.6; NoncommutativeAndEquivariantIwasawa §F.6; PadicPeriodRings §§4.1–4.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3.0, R07.4.27; CrystallineCohomology CR.2.1, CR.2.3, CR.3.4; SmoothRepresentationsOfLocalGroups SR.5.2; SelmerIwasawaCohomology §4.26; StableReduction Layers 7–8; NumberFieldArithmetic (completed).
- Automatic checks: all passed; none set aside.
- Elaboration: `lake env lean` on Suggested.lean gives exactly four `sorry` warnings and nothing else. The elaborated types of the five declarations agree with the README statements; no binder is lost.
- One-tactic probe on a copy of the file (`simp`, `rfl`, `infer_instance`, `simp [HasGoodModel]`, `constructor <;> simp`): none of the four theorems closes. Nothing is padding. The headline theorems statable at the pins are stated; the others are named in the module docstring with the missing carriers.
- The pull request changes only this folder's README (131 lines added, 35 removed), adds one heading, removes none, and leaves Suggested.lean unchanged; its description says so. The other open pull request that changes this README conflicts with it, and the description gives the order (that one first).

Dependency check output:

```text
depcheck: 182 roadmaps, 2080 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

Overlap check: read StableReduction, RelativeJacobiansAndIntegralCurveModels, AbelianSchemesAndArithmeticModuli and ArithmeticGaloisRepresentations (main), and FaltingsFinitenessAndIsogenyTheorems and StableReductionPartII (open). Néron models, semistable reduction, potential good reduction and the curve–Jacobian criterion are owned here: StableReduction says the criterion is not its target, RelativeJacobiansAndIntegralCurveModels, ArithmeticGaloisRepresentations and FaltingsFinitenessAndIsogenyTheorems cite this roadmap for them, AbelianSchemesAndArithmeticModuli leaves them to it, and StableReductionPartII imports §4.13 and does not state the criterion. Nothing shared.

Source independence: 22 passages compared with 16 sources, none shared beyond forced terms (longest run five words, against deligne-mumford); largest share conrad-semistable, 40 of about 340 locators; contents compared with conrad-semistable §§2–5: independent (its sections are spread over 2.3 and 3.1–3.12, Layers 1, 4, 5 and 6 have no counterpart, and the order 3.5 → 3.6 → 3.11 is forced by their Needs lines). Bosch–Lütkebohmert–Raynaud and SGA 7 IX, the next two, could not be read.

Research link: 3.9a is Deligne–Mumford (1969), Theorem 2.4; 4.6 is Werner (1997) on Grothendieck's pairing; 5.3 rests on Coleman–Iovita (1999) and Fontaine (1994); 6.10–6.13 feed Boxer–Calegari–Gee–Pilloni (2021, 2025). Rests on the README and on deligne-mumford, werner-1997, coleman-iovita and fontaine-iii, which I read.

## Not verifiable

- Bosch–Lütkebohmert–Raynaud, *Néron Models* (1.8, 6.5, `LocalExistence`, `DedekindExistence`): paywalled book, no legal copy; not opened.
- SGA 7 I, Exposé IX (4.6, 6.2): recorded as uncertified; not requested again.
- Faltings–Chai (3.6, 3.13): paywalled book; not opened.
- Serre–Tate 1968 (5.1a): the journal page is not in a readable class; not opened.
- Saito 1988 (5.3e): paywalled; the statement was read only through Liu's account.
- Yuan–Zhang, Erratum (6.2): no open copy found by the sources service.
- Katz–Messing, Savitt 2005 and Serre's *Topics in Galois Theory* (5.3, 6.0): not fetched; the statements they support were recomputed or checked through the cited supplier sections.
- The four `sorry` theorems of Suggested.lean were elaborated, not proved.

## Source issues

- **Misprint** in conrad-semistable at the paragraph after Lemma 5.4, p. 18: the source says the finite part has corank `2g − (2t + a) = t`; it should be `2g − (t + 2a) = t`; affects nothing.
- **Misprint** in conrad-semistable at Theorem 4.2, p. 9: the source says the integral closure of `R` in `K`; it should be in `K'`; affects nothing.
- **Misprint** in conrad-semistable at Proposition 4.1(2), p. 8: the source prints the conclusion that `f` is an isogeny twice; it should print it once; affects nothing.

## For the human reviewers

- Licence: the References link Tate's *Algorithm* (Lecture Notes in Mathematics 476) to a scan on a site that is not the author's (README, the Tate entry of References). Whether that link may stand is yours to decide.
- Licence: the Provenance section (README lines 4707–4791) names two Apache-2.0 Lean repositories as prior art for 1.8, 1.9, 5.0a, 2.8, 6.5 and 6.6 and says `HasGoodModel` differs from their good-reduction predicate. I did not open those repositories.
