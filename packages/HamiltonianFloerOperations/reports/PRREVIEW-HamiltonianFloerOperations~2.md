# Review of HamiltonianFloerOperations (pull request #2590 at 662b427)

**Verdict:** accepted

**Summary.** Accepted with no findings: every new locator in FOOO, Fulton–Pandharipande, Lu and Pardon is at its cited theorem and page and supports the statement as written, §8.4 now owns the ℂPⁿ line count, and every degree, sign and Check I recomputed holds. Two small corrections remain, neither blocking: some theorem targets, among them the index formula of §2.4, still carry no locator, and the ℂPⁿ computation names neither its symplectic form nor the comparison its route needs. There is one format note. For the humans: the Piunikhin–Salamon–Schwarz chapter has no legal open copy and is missing from the sources manifest.

## C01 — Some theorem targets still have no locator, including the index formula of §2.4, which FOOO states

A reader who wants to check these statements against the literature has nothing to open: the Fredholm index of §2.4 (lines 368–370), the continuation, commutativity and associativity homotopies of §6.3, the unit of §6.4, and the cup-product identification of §8.1. Last round's request for locators is now met for the headline inputs (§3.1, §3.2, §3.4, §5.4, §6.2, §7.4, §8.4), but not for these.

For §2.4 the dimension formula is FOOO, Proposition 11.6 (4), p. 62 (FOOO2017 lines 2953–2956), stated for the output cap glued from the input caps, so A = 0. FOOO grades cohomologically: its boundary map raises µ by one (FOOO2017 line 1111), so µ = −μ. With no marked points its formula µ₃ − µ₁ − µ₂ − n becomes μ₁ + μ₂ − μ₀ − n, which is §1.3's expected index at A = 0. The smallest change is "(FOOO, Proposition 11.6 (4), p. 62, in that source's grading)" after the index in §2.4. For §6.3, §6.4 and §8.1, the repair is a locator to whichever text proves them on the branch in question.

## C02 — The ℂPⁿ computation does not name the symplectic form on ℂPⁿ or the comparison that lets its route use the integrable structure

§8.4 (lines 931–942) evaluates the line count with the standard integrable complex structure. So it computes the Gromov–Witten invariant of a form that this structure tames, such as the Fubini–Study form, and only through GromovWittenTheory §2.3. That section is where the invariant is shown not to depend on the tame structure (its first bullet). The value c₁(L) = n + 1 used in Layer 1's Examples (line 262) and in the §8.4 Check (line 945) is also a property of the standard structure. As written, "on ℂPⁿ" (Summary, line 27; §8.4, line 921) names no form, and the route says nothing about a form that does not tame the standard structure.

The repair would be "on ℂPⁿ with its Fubini–Study form" in those two places, and GromovWittenTheory §2.3 added to the *Needs:* line of §8.4 (line 947) and to the GromovWittenTheory contract.

## N01 — "which works out ℂP¹ and ℂP² only in its Checks" (line 924): GromovWittenTheory also works them out in its Layer 7 Examples (its README on main, lines 673–674); "only in its Checks and Examples" would be exact.

## Earlier findings

- R01 (no locators): partly repaired. Locators now stand at the claims of §3.1 (lines 414–416), §3.2 (434–435), §3.4 (488–489), §5.4 (630–633), §6.2 (688), §7.4 (856–859) and §8.4 (924–937), and the References give theorem and page for each work. What remains is C01.
- R02 (ℂPⁿ line count unowned): repaired. "The line count ⟨x, x^n, x^n⟩_L = 1 is a target of its own" (line 931) owns regularity, the dimension 4n + 2 and the transverse count, with GromovWittenTheory §3.1 and §4.3, ComplexKahlerGeometry §5.10 and §7.2, and CharacteristicClasses §2.4 as suppliers, all on main.
- Earlier C01 (aspherical computation without ℚ): repaired ("computations over ℚ", line 26; the Lean docstring, lines 20–22).
- Earlier C02 (DGFloer §5.4 ambiguity): repaired ("DGFloer §7.C.4 on the classical branch and §5.4 above on the rational branch", lines 715–716; the *Needs:* lines 842 and 869–870).
- Earlier C03 (the point): repaired. Convention 1 calls the point "a separate model" (lines 65–67), and §8.1 no longer asks for a proof about it.
- Earlier C04 (automorphisms of ℙ¹): repaired ("other than the identity fixes three distinct points", lines 281–282).
- Earlier C05 (degree argument): repaired ("a + b + c = n + d(n + 1)", lines 926–929).
- Earlier N01 (four or five neighbours): repaired ("five neighbours", line 30).

## Questions for the author

- Is Theorem 5.1 of the Piunikhin–Salamon–Schwarz chapter the ring isomorphism itself, or the gluing statement from which Lu, Remark 1.2 (Lu2004 lines 201–207) derives it? §7.4 calls it "the ring statement". I could not open the chapter: no legal copy turned up through the sources service or a web search.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §1.1 S² × S² Check | areas 1, 2; B = (−2, 1) | ω(B) = −2 + 2 = 0; 2c₁(B) = 2(−4 + 2) = −4; joint kernel {a + 2b = 0, 2a + 2b = 0} = 0 | holds |
| §1.1 orientation Check | recap D₁ by B | correct A: +2c₁(B) − 2c₁(B) = 0; opposite A′: +2c₁(B) + 2c₁(B) = 4c₁(B) | holds |
| §1.2 ℂP¹ Check | T = e^(−L), c₁(L) = 2 | raw degree −4, ν = ω(L) > 0; Σe^(−kL) valuations kω(L) → ∞ ∈ Λ; Σe^(kL) → −∞ ∉ Λ | holds |
| §1.3 regrading Check | C^k = CF_(c±k) | product degree a + b + c − n (plus), a + b + n − c (minus); differential −1, +1; only c = n, minus sign | holds |
| §1.4 comparison Check | ℂP¹, q^A ↦ e^(∓A) | deg q^L = 4; e^(−L) raw −4, cochain +4 = 2 + 2; e^(+L) cochain −4 | holds |
| §2.1 automorphisms | Möbius maps fixing 0, 1, ∞ | (az + b)/(cz + d) fixing all three forces b = c = 0, a = d: identity | holds |
| §2.3 curvature Check | (ℝ², dq∧dp), K = q ds + p dt | X_q = −∂_p, X_p = ∂_q, {q, p} = 1, R_K = 0 − 1 = −1; constant-map density ω(X_q, X_p) = 1 | holds |
| §2.4 index (sample) | small Morse, max, p, p, A = 0; FOOO 11.6(4) with µ = −μ | n + (i − n) − (i − n) − n = 0; FOOO µ₃ − µ₁ − µ₂ − n = μ₁ + μ₂ − μ₀ − n | holds; no locator (C01) |
| §3.1 energy identity (sample) | density expansion; ∂u = x₁ + x₂ − x₀ | e = u*ω + d(K(u)) − R_K(u); ∫u*ω = ω(A) − ωD₀ + ωD₁ + ωD₂ | holds; FOOO (3.9) p. 27, L11.10 p. 65 verified |
| §3.1 cylinder Check | K = H dt, u_s = ∇H on autonomous solutions | E = A_H(x₊) − A_H(x₋) ≥ 0; input at s → +∞ larger | holds |
| §3.2 support (sample) | C = 0; actions 3, 2, 1 | ω(A) ≥ −4; ν < 0 gives E ≤ 4; glued output action A₀ − ω(A) ≤ A₁ + A₂, FOOO P11.9 | holds; FOOO data K = (H₁∗H₂)dt has R = 0 |
| §3.3 cutoff Check | constant ρ ∈ [0, 1] | R_ρK = ρR_K + (ρ − ρ²){K_s, K_t}; max ρ − ρ² = 1/4 at ρ = 1/2 | holds |
| §3.4 compactness (sample) | FOOO P11.6 (1), (3), p. 62 | Hausdorff compactification; normalised boundary = three breaking types (11.11)–(11.13) | holds |
| §4.2 exclusion (sample) | c₁-zero, simple spheres | image of simple spheres dimension 2n + 2c₁ − 4 = 2n − 4: codimension 4 > 3 swept by 0/1-dim families | consistent; no locator |
| §4.3 gluing (sample) | ends of 1-dim pants spaces | three breakings give d m₂, m₂(d·, ·), m₂(·, d·), the terms of FOOO L11.8 | consistent; no locator |
| §4.5 T² Check | α, β degree 1; point class | m₂(α, β) = pt = −m₂(β, α); (−1)^(2b) = 1 detects nothing | holds |
| §4 Examples, monotone | rigid coefficient | c₁(A) = (μ₀ − μ₁ − μ₂ + n)/2; E ≤ A₁ + A₂ − A₀ + τc₁(A) + C | holds |
| §5.3 trace systems (sample) | construction, no numerical claim | cited ImplicitAtlases §4.2 (l. 544), §4.3 (560), §5.2 (608), §5.3 (623) present on main | consistent; no locator |
| §5.4 rational package | Pardon D10.4.1, fn 35; Lu T1.1 | ℚ[[π]] Floer homology; cover by image of ω ⊕ c₁ = Γ; Lu's Γ = H_S²/(ker c₁ ∩ ker ω) | holds |
| §6.1 dense periods Check | S² × S², areas 1, √2 | b = 1: (−1, 1), 0.414, c₁ 0; b = 3: (−4, 3), 0.243, −2; b = 5: (−7, 5), 0.071, −4 | holds |
| §6.2 Leibniz Check | a, b degree 1, da = x, db = y | naive D²(a⊗b) = 2x⊗y; Koszul x⊗y − x⊗y = 0; FOOO sign (−1)^(deg G · deg′ x) | holds; FOOO L11.8 verified |
| §6.4 unit Check | one maximum | μ = 2n − n = n, cochain 0; μ = n − ind gives −n, cochain 2n | holds |
| §6.5 independence (sample) | reference cap D₀ → D₀ + B | e^(−A)(x₀, D₀) = e^(−A−B)(x₀, D₀ + B): product unchanged | consistent; no locator |
| §7.1 T² left dual | GromovWittenTheory §7.2 | e^β = α gives α ⋆ 1 = α; right dual e^β = −α gives −α | holds |
| §7.2 neck Check (sample) | L(R) = R − 1 | right derivative 1, left 0 at R = 1; ρ(0) = 0, K₀ = 0 | holds; no locator |
| §7.4 multiplicative PSS (sample) | §7.3 identity | F₀(G₀T − Q_M) − (F₀G₀ − 1)T = T − F₀Q_M; homotopy F₀K − H₀T | holds; FOOO T11.11, Lu R1.2 verified |
| §8.2 recapping | D₀ → D₀ + B; D₁ → D₁ + B | A → A + B: ×e^(−B); A → A − B: ×e^B; generators ×e^(±B); product fixed | holds |
| §8.3 small Morse (sample) | Tau Ceti TimeIndependent.lean:114 | γ′ = ∇_g H with g = ω(·, J·) = J X_H; action decreases input → output | consistent; no locator |
| §8.4 quantum relation | n = 1, 2, 3 | a + b + c = n + d(n + 1); n = 3: d = 1 needs 7 = 1 + 3 + 3; d = 2 needs 11 > 9 | holds; FP §10 pp. 47–48 verified |
| §8.4 line count | ℂPⁿ, H, p, q | dim_ℂ = n + (n + 1) + 3 − 3 = 2n + 1 = codim of H × p × q; unique line, marks distinct | holds; form unnamed (C02) |
| §8.4 H¹ supplier | ComplexKahlerGeometry §5.10, §7.2 | H¹(O(k))* ≅ H⁰(O(−k − 2)) = 0 for k ≥ −1; covers O(2), O(1), O(0), O(−1) | holds |
| §8.4 Check | ℂPⁿ | deg x^(n+1) = 2n + 2 = 2c₁(L) | holds |
| §8.5 T² exchange (sample) | unsigned exchange | α⌣β = β⌣α = −α⌣β gives 2α⌣β = 0 ≠ 0 over ℚ | holds; no locator |
| Headline 1: product algebra | ℂP¹, class-L pants | raw degree −n; index −1 − 1 − 1 − 1 + 4 = 0; unit raw n, cochain 0 | holds |
| Headline 2: multiplicative PSS | ℂP¹ | QH side x ⋆ x = q^L, degree 4; HF side e^(−L)·1, cochain degree 4 | holds |
| Headline 3: computations | aspherical; ℂPⁿ | Γ = 0, Λ = ℚ, only A = 0; x^(n+1) degree 2n + 2 both sides | holds; C02 |

- Source locators checked against the text: 13 of 14. FOOO2017 lines 1203–1257, 2935–2959, 3025–3032, 3037–3039, 3043–3061, 3080–3081; FultonPandharipande1996 lines 605–615, 1438–1442, 2703–2713; Lu2004 lines 198–207; Pardon2016 lines 4436–4438, 4626–4631. PSS Theorem 5.1 could not be read.
- Library declarations opened at the pins: CoefficientComparison.lean:59–176, TimeIndependent.lean:94 and 114, PairOfPants/Basic.lean:69. All 107 backticked Mathlib and Tau Ceti names in the README resolve to a declaration at the pins, and 93 of them are in the Tau Ceti contract. There is no manifold-level spherical class, Floer complex or quantum cohomology at the pins, as the Lean docstring says.
- Cross-roadmap citations resolved on main:
  - GromovWittenTheory §0.1, 0.2, 2.3, 3.1, 4.3, 5.2, 6.1, 7.1, 7.2, also present at its open head;
  - ComplexKahlerGeometry §5.10 and §7.2; CharacteristicClasses §2.4;
  - ImplicitAtlases §1.1–1.2, 4.2–4.3, 5.2–5.3, 5.6, 6.1–6.4, 7.1–7.4;
  - HeegaardFloer §1.3, 1.4, 1.5, 1.9, 1.9a, 2.2, 3.1, 3.4, 3.5, 4.2–4.6d;
  - AnalyticStableMaps §3.7; MorseNovikov §1.1, 1.2, 1.5; AlgebraicTopology §6.2–6.4;
  - MorseTheory Layers 1, 2, 6; DifferentialGeometry Layers 0–3, 9; DGAInfinity Layers 0–1;
  - DGFloer 7.C.1, 2a, 2b, 3, 3a, 3c, 4, 5b, 6, also present at its open head.
- Dependency check: `depcheck: 200 roadmaps, 2199 edges, 0 problem(s)`. There is no UPWARD or CYCLE line, and every supplier is on main.
- Automatic checks: the gate passes every check at this head.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file declares nothing, so there were no `#check @name` signatures to compare. It has a single `import Mathlib`, no `set_option` and no sorry'd data.
- Headline theorems: the product algebra with continuation isomorphisms; multiplicative PSS over ℚ; the aspherical and ℂPⁿ computations over ℚ. None is statable at the pins, because HF and QH of a manifold are missing. The docstring names each headline and what it lacks, and there is no padding.
- Pull-request text against the head: 23 Checks in 19 sections, 12 conventions, "about ninety" Tau Ceti names (93), 11 removed declarations, five old `Mathlib.*` imports. The "(Hk)" ids cited by GromovWittenTheory (H1) and HeegaardFloer (H7) on main still resolve. No sentence is contradicted.

Overlap check: I read the scope of DGFloer (on main and at its open head), GromovWittenTheory (on main and at its open head), FukayaTheory, SymplecticFieldTheory and AnalyticStableMaps. Ownership against open pull requests was checked by searching every open head. These objects are shared:
- capped complexes, continuation and module PSS: owned by DGFloer;
- the closed quantum product, its left-dual convention, and the ℂP¹ and ℂP² rings (as Checks and Examples only): owned by GromovWittenTheory;
- genus-zero stable-map compactness: owned by AnalyticStableMaps;
- the Lagrangian m₂: owned by FukayaTheory and excluded here;
- contact and Reeb buildings: owned by SymplecticFieldTheory and excluded here;
- the pair-of-pants product, multiplicative PSS, and the ℂPⁿ relation with its line count: owned here, and planned in no other roadmap on main or at any open head.

SymplecticFieldTheory (line 94 on main) says that this roadmap consumes its buildings, which this README does not; that sentence is SymplecticFieldTheory's to correct.

Source independence: 18 passages compared with 4 sources: the 13 readable locators, plus Convention 5 (Lu2004 lines 71–80), §2.1 (FOOO2017 lines 2838–2856), the §8.4 dimension paragraph (FultonPandharipande1996 lines 2703–2713), the §7.4 PSS sentence (Lu2004 lines 201–207) and the Lean docstring (Lu2004 lines 10–13). A 7-word shared-run scan of the whole README against all four texts found only bibliographic titles in common. The largest share is FOOO2017, with 6 of 14 locators. Contents compared with FOOO2017 (§§1–35, a memoir on spectral invariants in which §11 alone treats the pants product): independent. Each Dependencies line needs only lower layers, and that forces the layer order. PSS1996 could not be read.

Research link: Layers 6–7 are the pair-of-pants product and the ring isomorphism of Piunikhin–Salamon–Schwarz (1996). FOOO (2011/2017, §11, Theorem 11.11) use it to prove the triangle inequality for spectral invariants with bulk. Lu (2004, Theorem 1.1, Remark 1.2) and Pardon (2016, §10) supply the setting of Layers 5 and 7 on every closed target. This rests on the README's sources and the texts I read.

## Not verifiable

- PSS1996, Theorem 5.1 (§7.4): no legal open copy found through the sources service or a web search (author pages, open repositories). It is cited by its locator, as Lu identifies it.
- The seeded targets §2.4, §4.2, §4.3, §4.5, §5.3, §6.1, §6.5, §7.2, §8.3 and §8.5 carry no locator, so there was no source text to check them against. Their mathematics was recomputed in the table.

## Source issues

- **Misprint** in FOOO2017 at Proposition 11.6 (3), display (11.13), p. 62: the second input of the first factor carries the cap of the first input; it should carry its own cap, w₂; affects nothing.

## For the human reviewers

- Licence: the Piunikhin–Salamon–Schwarz chapter (README References, lines 1251–1254), cited for Theorem 5.1 in §7.4, has no legal open copy that I could find, and the roadmap's sources manifest has no entry for it, certified or uncertified.
