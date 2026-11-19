# Review of GL2ModularityLifting (pull request #1071 at 53ba61a)

**Verdict:** needs changes

**Summary.** Changes are needed: one finding. The mathematics of this head stands up to the checks made (the three findings of the previous review are repaired, the imported theorems agree with their supplier's targets, the sampled source locators match), but the statements of §6.15, §8.6 and §8.7 are still the source's theorem written out clause by clause, the same defect the previous round raised for §5.18 and §6.16. There are one small correction and one format note, neither blocking, and two points for a human to decide.

## R01 (P2) — The statements of §6.15, §8.6 and §8.7 follow the source's theorem clause by clause

The roadmap is published under the project's licence, so its statements have to be in its own words; these three are the source's sentences with a few words exchanged, in the source's order and with its numbering of hypotheses.

- §8.7 (line 2022) against Tung's Theorem 4.7 (tung-odd lines 765–770): the same opening clause, the same three numbered hypotheses in the same order, including the aside that modularity of `ρ̄` makes `ρ` and `ρ̄` odd, and the same conclusion. Shared runs of 9 and 9 words ("a totally real field in which p splits completely"; "ρ comes from a Hilbert modular"), and the whole statement differs from the source's in about eight words.
- §8.6 (line 2000) against Kisin's Theorem (2.2.18) (kisin-fm lines 2222–2236): hypotheses (1)–(3) are the source's three, in order; (1) shares a run of 13 consecutive tokens ("becomes semi-stable over an abelian extension of `F_v` and has distinct Hodge–Tate weights") and (2) one of 8.
- §6.15 (line 1593) against the case `p = 2` of Khare–Wintenberger II Theorem 9.7 (kw2 lines 4075–4084): the source's sentence order, with a shared run of 10 words ("either crystalline of weight 2 or semistable non-crystalline of weight 2") and its closing proviso about the residual representation not being finite above 2 kept as a parenthesis.

A scan of every README line against the eighteen source texts found no other statement this close; §5.18 and §6.16, raised last round, are now in the roadmap's own words.

Reworded statements with the same content:

- §6.15: "Take `p = 2` and a totally real field F in which 2 is unramified, and splits completely when `ρ̄|D_2` is irreducible. Assume the image of `ρ̄_F = ρ̄|G_F` is not solvable, that `(β)` holds, and that `(α)` holds when `k(ρ̄) = 2`. Then every totally odd, finitely ramified lift `ρ_F : G_F → GL_2(𝒪)` of `ρ̄_F` is modular, provided that at each place above 2 it has weight 2 and is crystalline or, if `ρ̄` is not finite at the places above 2, semistable and not crystalline."
- §8.6: "Assume LL1–LL3 and CC4–CC5. Let p be an odd prime that splits completely in the totally real field F, and let `ρ : G_{F,S} → GL₂(𝒪)` be continuous with `ρ̄` modular and absolutely irreducible on `G_{F(ζ_p)}`. Suppose that at each place v above p the two Hodge–Tate weights of `ρ|G_{F_v}` differ, that `ρ|G_{F_v}` is semistable after restriction to an abelian extension of `F_v`, and that `ρ̄|G_{F_v}` is not an extension of a character `χ` by `ωχ`, split or not. Then `ρ` is modular up to a global character twist …" (the rest of the paragraph as it stands).
- §8.7: "Let p be odd and split completely in the totally real field F. If `ρ : G_{F,S} → GL₂(𝒪)` is continuous, its reduction `ρ̄` is modular and stays absolutely irreducible on `G_{F(ζ_p)}`, and each local restriction `ρ|G_{F_v}`, `v | p`, is potentially semistable with two different Hodge–Tate weights, then a twist of `ρ` is attached to a Hilbert modular eigenform. Oddness of `ρ̄`, and hence of `ρ` (as in §7.10), comes with the modularity of `ρ̄` and is not a separate hypothesis." (the attribution and the remarks on `p = 3` as they stand).

## C01 — §5.9 cites the residually irreducible ordinary target for a totally real statement that the target does not make

A reader who follows the citation to check the hypotheses listed in §5.9 finds a different theorem. §5.9 (lines 1164 and 1172) speaks of "every hypothesis of ClassicalSerreModularity `I.1/residually-irreducible-ordinary-lifting` over the totally real field", including "no induction from a quadratic field with a complex place", and the contract under OrdinaryAutomorphicFormsAndModularityLifting (line 2910) calls it "that totally real theorem". At that roadmap's head the target is titled "Residually irreducible ordinary lifting over ℚ", is stated over `ℚ`, and includes the case induced from `ℚ(√−p)` as a proof target (its README line 337); only the opening sentence of its §I.1 says that the two theorems are proved over totally real fields, and no target states the totally real form with hypotheses. Nothing else here depends on §5.9, so no result is affected.

The smallest change: in §5.9 and at line 2910, cite the target for `F = ℚ` as it reads, and for `F ≠ ℚ` either name the statement that carries the totally real hypotheses (the Skinner–Wiles Main Theorem inside `I.1/pseudo-deformation-rings-and-pro-modularity`, or OrdinaryAutomorphicFormsAndModularityLifting §5.8) or state the overlap over `ℚ` only.

## N01 — Several code spans swallow an adjacent word, and two bold markers are broken

For example "`a β-witness`" (line 146), "`ρ : G_F → GL_2(𝒪) a` lift" (line 1300), "`A ρ` with" (line 2144), "`p = 3 a` local residual ratio" (line 2449), "`p = 2.**`" (line 2723) and "**Tung, odd `p**`" (line 2948). The mathematics is unaffected; the spans should close before the English word.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.4 (sample) | `p = 3`, `Nv ≡ −1`, unramified residual | `χ̄_p(Frob_v) = −1`: `γ`, `−γ` both give `{a, −a}`; excluded in §1.1; kw2 lines 2794–2822, 3716–3745 | sound | none |
| §1.13 (sample) | `j = 0`; `j > 0` | base change of a surjection; quotient by `y` gives `π`; kw2 lines 3716–3719 (Lemma 9.1, framed map) | sound | none |
| §2.2 (sample) | `Q = ∅`; image `𝒪 × 𝒪` | recovers `𝕋_ψ(U)`; one branch gives `𝒪`; kw2 lines 3016–3023, 3754–3758 | sound | none |
| §3.3 (sample) | `b = 2, r = 3`; `p = 2` | `m^6 ⊂ m^{(3)}`; finite ambient ring, subsequence; kw2 lines 3979–3986 | sound | none |
| §5.16 (sample) | supplier target, hypothesis by hypothesis | `p > 2`, `2 ≤ k ≤ 2p−1`, cyclotomic irreducibility, `End = 𝔽`, weight-k seed: all five in the supplier's statement | sound; Durham text unread | none |
| §6.7 (sample) | `t = 0`, `t = 1` | trivial; degree 2; `(ρ, λ) ↦ (λ⁻¹ρ, λ)` as kw2 lines 4000–4008 | sound | none |
| §6.11 (sample) | dimension count | `(d+1) + (h+j+t−d) = h+j+t+1`; minus t gives `h+j+1`; kw2 lines 4009–4018 | sound | none |
| §6.15 (sample) | Theorem 9.7 at `p = 2` | unramified at 2, split if locally irreducible, nonsolvable, `(α)` if `k(ρ̄)=2`, `(β)`, totally odd: kw2 lines 4075–4084 | sound; wording | R01 |
| §6.16 (sample) | KW I Theorem 4.1(1); supplier at `p = 2` | odd, crystalline weight 2, or semistable with `k(ρ̄) = 4`: kw1 lines 270–273; supplier asks residual weight 2 resp. 4 | sound | none |
| §7.8 (sample) | six exclusions; `p = 3` orientation | Kisin `(ωχ ∗; 0 χ)`, abelian; (1.2.7) `(1 ∗; 0 ω) ⊗ χ = (ω ∗; 0 1) ⊗ χω` as `ω² = 1`; Emerton `χ ⊗ (1 ∗; 0 ω)` | sound | none |
| §8.4 (sample) | Lemma B.5.2 | nonzero iff every `μ ≠ 0`; fibre `≥ 2^{|R|}`; support all of `Spec R̄^i_∞` (gee-kisin lines 1901–1930) | sound | none |
| §8.8 (sample) | DP Theorem 1.4 | odd, finitely ramified, `ℚ(√p*)`, de Rham `{0, k−1}`, `k > 1`, `ρ̄ ≅ ρ̄_f`: dp lines 140–147 | sound | none |
| §10.7a (sample) | `F = ℚ`; `ℚ(√5)`; degree 4; `S = {3, 7}` | unit ranks 0, 1, 3; Galois rank 1; `dim ≤ 2 + δ_F = 2` (pan lines 3554–3558, 5089); pro-3 quotient `ℤ₃ × ℤ/3` | sound | none |
| §10.13 (sample) | `d = 4`; node ring | `x₀y₁ − x₁y₀`, ordinary `(x₀, x₁)`, `p > 3` (pan lines 5216–5219); intersection `≥ d + 2 = 6` (line 5518) | sound | none |
| §10.14 (sample) | Pan Theorem 7.1.1 | abelian, p split, `χ̄₁/χ̄₂` extends and is `−1` at c, locally irreducible de Rham, `p = 3` ratio `≠ ω^{±1}`: pan lines 4995–5009 | sound | none |
| `odd_involution_descent` | trivial group; `χ₁ ⊕ χ₂`; non-split quadratic image; discrete K | `T(1) = 2 ≠ 0 = T(c)` vacuous; `χ₁ = (T(g) + T(cg))/2 ∈ K`; a field has no `c ≠ ±1` with `c² = 1`; entries are `Σ c_k T(g g_k)` | sound | none |
| `cht_soluble_prescribed_completions` | `S = ∅`; all `L_v = F_v`; complex v; real v with `ℂ` | `E = F`; `n = [E:F]`; `L_v = ℂ` forced; `ℝ ⊗ E ≅ ℂ^{[E:F]/2}` | sound | none |
| §5.18 | reduction of crystalline `{0, k−1}`, `k ≤ p+1`; `N ≠ 0` twist | Serre weight `k`, or 2 or `p+1` at `k = p+1`, or `p` at `k = p`: all in `[2, p+1]`; twist gives `(γχ_p ∗; 0 γ)` | sound | none |
| §5.7, §5.11, §6.10 | supplier target, three forms | residue field `𝔽_p`, `p = 5` clause; `ℚ(√p*)`; (H): each matches the supplier's sentence | sound | none |
| §8.6 | `y² = x³ − x` at 7; Kisin (2.2.18) | `#C(𝔽₇) = 8`; `ω₂⁶` of order 4 on inertia of `ℚ₇(ζ₇)`; hypotheses (1)–(3) as kisin-fm lines 2225–2236 | sound; wording | R01 |
| §8.7 | Tung Theorem 4.7 | three hypotheses and conclusion as tung-odd lines 765–770 | sound; wording | R01 |
| §9.2, §9.3 | `I₂` against `diag(1, −1)` mod 2; sources | determinants `+1`, `−1`; Tung 8.0.3(3) prints the bar (tung-dyadic line 1801); Paškūnas (iv) (paskunas-2adic) | sound | none |
| §5.9 | supplier target read | stated over `ℚ`, includes `ℚ(√−p)`; README says totally real, complex-place induction excluded | citation | C01 |
| LC | supplier target; `S = {3, 7, ∞}` | every odd p, every number field, S with infinite places; integral `H²` is `ℤ/3`, divisible limit 0 | sound | none |
| §4.4 Check | `𝒪[[x,y]]/(xy, x(x−π))` | minimal primes `(x)`, `(y, x−π)`, dimensions 2, 1; `(x) ∩ (y, x−π) = (xy, x(x−π))`; special fibre has `(x)` only | sound | none |
| §10.3, §10.11 Checks | incidence systems; `k[[a,b,c,d,z₁..z₆]]/(ab, cd)` | good sets `{1,2,3}`, `{1}`; four components of dimension 8, every partition meets in 7, `(a,c) ∩ (b,d)` in 6 | sound | none |
| §3.1, §3.2, §6.7a, §7.11, §12.3 Checks | `s=1,p=3,m=2`; `h=1,p=2,a=2`; `ℤ₂[[x]]/(x(x−2))`; `−2` in `ℤ₃`; `V₅(11a1) ⊗ ε` | `r_m = 18`; exponent 8 at level 5; `ℤ₂ ⊕ 𝔽₂`; `−2 ≠ ±4^m`; `ω ⊕ ω²`, weights `{1, 2}` | sound | none |

- Source locators read at the text: 42 in 12 sources (kw2 10, kw1 1, kisin-fm 4, emerton-lgc 3, paskunas-bm 1, hu-tan 1, tung-odd 2, gee-kisin 3, dp 4, pan 10, tung-dyadic 2, paskunas-2adic 1).
- Library declarations opened at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`): 20, each in the file the contract names (for example `weakApproximation_denseRange`, `TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean` line 208; `oddPrimeDiscriminant_mod_four_eq_one`, `.../Prime/Discriminant/Basic.lean` line 138; `NumberField.Units.finrank_modTorsion`, `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean` line 457).
- Cross-roadmap citations resolved at heads or on main: ClassicalSerreModularity's nine targets; GlobalGaloisDeformations §§4.10–4.11, 5.1–5.5, 6.1–6.8 with the five `HeckeGaloisDatum` names; IntegralIwasawaTheory §§4.1, 4.4 with four names; OrdinaryAutomorphicFormsAndModularityLifting §§5.1a, 5.3, 5.8, 5.9; AutomorphicGaloisRepresentations §§2.10, 3.10–3.14, 4.8, 6.10–6.12, 7.1, 7.3; and the section ids of nine roadmaps on main.
- Dependency check: `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The automatic checks all passed. No change outside the folder.
- `lake env lean` on `Suggested.lean`: two `sorry` warnings (lines 49, 88) and nothing else. `#check @name` on the five declarations: the file has no `variable` block and no binder is lost. One-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`) closes neither theorem; the three definitions only make §1.7 statable.
- Headline theorems: Theorem 9.7 over F (§§5.4, 6.15), Kisin's (3.5.7) and 2-adic theorems (§§5.10, 6.9), §5.8, §5.18(ii), §§8.7, 9.2, 10.14 with their cases over `ℚ`, Layer 12. None is statable at the pins and the docstring names the missing carriers layer by layer. Stated: §0.1 and §1.7.
- Earlier findings: R01 repaired (§§5.7, 5.11, 6.10, 6.16 and branch (i) of §5.18 now open "Import ClassicalSerreModularity §I.2 …", and Scope lists them as that roadmap's); R02 repaired ("the same holds for totally odd lifts when the residual image is not solvable"); R03 repaired (longest run shared with kw1 is now under 8 words); C01–C03 and N01 repaired; C04 repaired in the prose (the generated depends-on block still lists ModularCurvesPartII, which the README no longer cites).

Overlap check: read ClassicalSerreModularity, SerreModularityByCompatibleSystems, CompletedCohomologyAndLocalGlobalCompatibility, OrdinaryAutomorphicFormsAndModularityLifting, PotentialModularityAndCompatibleSystems, PotentialAutomorphyInfrastructurePartII, SerreWeightAndLevelOptimisation, GlobalGaloisDeformations, LocalGaloisDeformationRings; shared: Theorem 4.1, Kisin's potentially Barsotti–Tate theorem and (H), owner ClassicalSerreModularity §I.2, imported here; soluble base change, totally real form owner ClassicalSerreModularity `I.0`, general number-field form here (§1.7), difference stated; `HeckeGaloisDatum`, owner GlobalGaloisDeformations §6.7; Pan's Theorem 4.1.7, owner CompletedCohomologyAndLocalGlobalCompatibility, carried here as CC4, with the nice-prime predicate of §10.1 owned here and imported there.

Source independence: 9 statements compared by hand with 7 sources, and every README line and docstring scanned against 18 texts for shared runs of 8 words and for 5-word coverage; three statements shared (§6.15 with kw2, §8.6 with kisin-fm, §8.7 with tung-odd: R01); largest share kw2, 57 of 179 locators; contents compared with kw2: independent (Layers 1–6 draw on its §§7–10 out of order, with Kisin and Gee interleaved).

Research link: Layers 1–6 are the lifting theorems of Khare–Wintenberger (2009) and Kisin (2009) behind Serre's conjecture; Layers 7–12 are those of Kisin (2009), Hu–Tan (2015), Tung (2021), Pan (2022) and Skinner–Wiles (1999) that Dieulefait–Pacetti (2023) use. Rests on the README summary and on kw1, kw2, dp, pan, tung-odd, tung-dyadic.

## Not verifiable

- Kisin, Modularity for some geometric Galois representations (§5.16, Proposition (3.13) and Theorem (3.14)): the cited author DVI is not a readable document for the sources service and a search by title found no legal copy; §5.16 was checked against the supplier target it imports.
- Kisin, Moduli of finite flat group schemes, and Kisin, Modularity of 2-adic Barsotti–Tate representations: no text in the sources cache; not in this round's sample beyond §6.9's cross-references.
- Page numbers given for Kisin's author DVI of the Fontaine–Mazur paper: only the published text was readable, where (2.2.17) is (2.2.18).
- Lichtenbaum, Proposition 9.6; Paškūnas, Montreal functor, Corollary B.20; Gee, Automorphic lifts of prescribed types, Theorem 4.6.9: not opened this round; no remark depends on them.
- Supplier and consumer heads were read through the roadmap tools; line numbers given for other roadmaps are those of their README at the head named.

## Source issues

- **Misprint** in tung-dyadic at Theorem 8.0.3(3), p. 38: the source says the reduction of ρ is totally odd; it should say ρ itself is totally odd, `det ρ(c_v) = −1`, since the reduction modulo 2 cannot see the sign; affects a stated result.
- **Gap** in dp at Theorem 1.7, pp. 4–5: the source says the determinant is a character ψ times a power of the cyclotomic character, with no condition on ψ; it should require ψ of finite order, as Skinner–Wiles do; affects a stated result.
- **Error** in dp at the proof of Theorem 1.4, p. 4: the source says Emerton's Theorem 1.2.1 removes Kisin's Hypothesis (1.2.6); it should cite his Theorem 3.3.22, since Theorem 1.2.1 assumes promodularity and keeps a local exclusion; affects the proof.
- **Gap** in kw2 at Lemma 7.2, proof step (i), p. 61: the source says for odd p the character `γ_v` is fixed because the residual representation is; it should assume `N(v) ≢ −1 mod p` or residual ramification at v, as `γ_v` and `−γ_v` then reduce alike; affects the proof.

## For the human reviewers

- **Scope.** Every theorem of Layers 7–12 is conditional on named hypotheses (LL1–LL3, CC1–CC5) that this roadmap does not prove (`README.md`, "Conditional arithmetic hypotheses"); SerreModularityByCompatibleSystems states that it discharges them.
- **Not tested.** Three cited texts of Kisin (the Annals paper, the 2-adic paper, the Durham paper) are cited by author DVI files that the sources service cannot read; wording and locators of §§5.1, 5.6, 5.10, 5.16, 6.8, 6.9 were not compared with them.
