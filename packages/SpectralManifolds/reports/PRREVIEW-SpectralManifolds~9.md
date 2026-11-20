# Review of SpectralManifolds (pull request #2657 at 061e40a)

**Verdict:** accepted

**Summary.** Accepted: there are no findings. The 58 changed lines repair the four small corrections of the previous review, and the new statement of the duality axiom in §9.2, with the sign `(−1)^d` on the second zigzag, agrees with the source it now cites (Brodzki–Mathai–Rosenberg–Szabo, Definition 2.2), which also settles the question the previous review left open. Two small corrections (one sentence of the pull request's description, one wording in §11.6) and two format notes carried over remain, none blocking. Licence and coverage facts are left for the human reviewers.

## C01 — The description says every numbered section has a source at the claim; eleven have none

The description reads: "Their paragraphs become 68 numbered sections `### k.n`, each with a source at the claim and a *Needs:* line". At this head all 68 sections have a *Needs:* line, but §§1.1, 1.7, 7.3, 7.4, 7.5, 9.5, 11.1, 11.2, 11.3, 11.4 and 11.6 cite no published source (they cite other sections, roadmaps and library declarations only), and the description itself says further down that §§7.3–7.5 no longer cite Connes 2008. A reader of the description would expect a literature locator in each section. Text that would be right: "68 numbered sections `### k.n`, each with a *Needs:* line and, where a published result is used, its source at the claim".

## C02 — §11.6 still calls the products of the noncommutative torus with finite models almost-commutative for every `θ`, which its repaired Example now restricts to `θ ∈ ℤ`

The Example of Layer 11 (lines 2020–2022) now says the product with `(M_n(ℂ), M_n(ℂ), 0, J(x) = x*)` is "almost-commutative when `θ ∈ ℤ`", which is right: `𝒜_θ` is commutative exactly then. The body of §11.6 (lines 2001–2002), in a section where "Irrationality of `θ` is not imposed", still says "Products with finite models (§10.2) give explicit almost-commutative examples", so the section and its Example now disagree on the term. Would "give explicit product examples (almost-commutative when `θ ∈ ℤ`)" serve in the body?

## N01 — §9.2 (lines 1591–1592) still attributes the exterior product, the flip and the parity-reduction signs to "OperatorKTheory K6's" while citing §§3.4, 5.1 and 6.2 of that roadmap, which lie in K3, K5 and K6; "K3–K6's" would match.

## N02 — Two section-level locators could be exact, as noted before: the local Lorentz estimate of §4.5 is Connes 2008, Theorem 9.9 (the text cites §9), and the analytic Spin conclusion of §8.5 is Ćaćić 2012, Corollary 2.7 (the text cites §§1.1, 2.1–2.4).

## Previous findings

The previous review (of `898e083`) had no findings; its small corrections, format notes and question are accounted for here.

- C01 (previous) — repaired: §10.3 now reads "the products are those of Dąbrowski–Dossena §4, which does not treat associativity or the swap"; §4 of that paper is the product construction.
- C02 (previous) — repaired: the §4.4 Check now justifies `0` by "the integral of its interpolation against `du/u` stays bounded, so its log-mean tends to `0`".
- C03 (previous) — repaired: §§9.1–9.3 cite Brodzki–Mathai–Rosenberg–Szabo 2008 (§2.5, Definitions 2.2 and 2.11, Example 2.5); §§4.1–4.2 cite Voiculescu 1979, §1, pp. 5 and 6. All were read at the locators.
- C04 (previous) — repaired: the Example reads "a real triple over `𝒜_θ ⊗ M_n(ℂ)`, almost-commutative when `θ ∈ ℤ`"; the body of §11.6 now disagrees with it (C02 above).
- N01 (previous) — not repaired: "OperatorKTheory K6's exterior product … (§§3.4, 5.1, 6.2 of that roadmap)"; repeated as N01.
- N02 (previous) — not repaired: §4.5 cites "Connes 2008, §9" and §8.5 cites "Ćaćić 2012, §§1.1, 2.1–2.4"; repeated as N02.
- Question on §9.2 (previous) — answered: the axiom now asks for `β ⊗_(Aᵒᵖ) Δ_D = 1_A` and `β ⊗_A Δ_D = (−1)^d 1_(Aᵒᵖ)`, as in the cited Definition 2.2.

## Verified sound

| Statement | Instances tried | Roadmap side (computed) | Other side | Result; change |
| --- | --- | --- | --- | --- |
| §9.2 duality axiom (changed) | `d` even; `d` odd; `β ↦ −β`; graded flip with `i = j = d` | zigzags `(1, (−1)^d)`; `−β` gives `(−1, −(−1)^d)`, product of the two signs stays `(−1)^d`; flip sign `(−1)^(d·d) = (−1)^d` | BMRS Def 2.2, (2.20): `∆∨ ⊗_B ∆ = 1_A`, `∆∨ ⊗_A ∆ = (−1)^d 1_B`, `B = Aᵒ`; text after (2.25): sign from graded commutativity | agrees; `(1, 1)` is unreachable for odd `d` |
| §9.1 fundamental class (sample, changed) | circle, `d = 1` | `Δ_D ∈ KK_1(A ⊗_min Aᵒᵖ, ℂ)` from `F_D = D(1 + D²)^(−1/2)`; restriction along `a ↦ a ⊗ 1` is `[D]` | BMRS §2.5: commuting actions, `[D, b°]` bounded; Def 2.11: `∆_D ∈ K^d(A ⊗ Aᵒ)` from `(A ⊗ Aᵒ, H, D)` | holds |
| §9.3 Spinᶜ dual class (changed) | closed Spinᶜ `X`; circle | `C(X)` has a fundamental class with dual; circle satisfies the axiom with sign `−1` on the second zigzag | BMRS Example 2.5: `X` complete oriented, Spinᶜ ⇒ `C₀(X)` strong PD algebra | holds; consistent with Layer 9 Examples |
| §4.4 Check (changed) | `(−1)^N`; `2 + (−1)^N`; constant `1` | `∫₁^R (−1)^⌊u⌋ du/u = Σ (−1)^N log(1 + 1/N) → log(2/π) ≈ −0.45`, bounded; log-means `0`, `2`, `1` | `Mf(R) = (log R)⁻¹ ∫₁^R f du/u` of §4.4 | holds |
| §§4.1–4.2 locators (changed) | `p = 1`; finite-dimensional `H` | `‖T‖_(1,1) = Σ μ_j` trace norm; `B = Id` eventually, `[Id, t] = 0`, modulus `0` | Voiculescu §1, p. 5: weights `j^(−1+1/p)` on decreasing rearrangement; p. 6: liminf over finite-rank positive contractions | holds |
| §10.3 graded swap (sample, changed) | `U = (σ₁ + σ₂)/√2`, `M = σ₂` | `Uσ₁U⁻¹ = σ₂`, `Uσ₃U⁻¹ = −σ₃`, `Uσ₂Ū⁻¹ = −σ₂` (`ζ = −1`) | Dąbrowski–Dossena §4 (4.1 even–even, 4.2 even–odd, 4.3 odd–odd): products only | holds; attribution now right |
| §11.6 Example (sample, changed) | `θ = 0`; `θ = 1/2`; `n = 1` | `U₂U₁ = U₁U₂` iff `e^(2πiθ) = 1`; `θ = 1/2` gives `U₂U₁ = −U₁U₂`; `n = 1`: the torus triple itself | Ćaćić 2011: commutative base `C∞(X)` | Example holds; C02 for the body |

The rows of the previous review for the statements this change does not touch stand as in the previous review, of `898e083`.

- Source locators checked against the text this round: 8. BMRS §2.3 (BrodzkiMathaiRosenbergSzabo2008 line 737), Definition 2.2 (lines 742–751), the text after (2.25) (lines 777–779), Example 2.5 (lines 803–806), §2.5 (lines 896–930), Definition 2.11 (lines 931–933); Voiculescu §1 printed p. 5 (Voiculescu1979 lines 93–98) and p. 6 (lines 123–130); Dąbrowski–Dossena §4 headings (DabrowskiDossena2010 lines 290–411).
- Cross-roadmap citations in the changed passages resolved on main: OperatorKTheory §3.4 (in K3), §5.1 (in K5), §6.2 (in K6); IndexTheory I2–I7 unchanged.
- Library declarations: none in the changed passages; `TauCeti.Semigroups.hilleYosida_generation_iff` and the `LinearPMap` resolvent files named by the description were confirmed at the pin.
- Automatic checks: every check passed when run again on this head. Dependency check output: `depcheck: 182 roadmaps, 2078 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives two `sorry` warnings (lines 68, 83) and nothing else; the file is unchanged since `898e083`, so the binder check and one-tactic probe of the previous review stand.
- Description against head: 68 `k.n` sections, 65 Check blocks, 110 Checks, nine conventions, 13 reference entries with all 12 of main's kept and BMRS added; every supplier subsection names a roadmap main already cited; no Lean declaration removed (only docstrings changed). One sentence fails (C01).

Overlap check: read NoncommutativeGeometry, IndexTheory and SpinGeometry (on main; their open revision drops no id cited here); nothing shared beyond what the previous review recorded, the change adds no object and no supplier.

Source independence: changed passages only; 6 passages compared with 3 sources (BMRS, Voiculescu 1979, Dąbrowski–Dossena), none shared beyond formulas and standard names; largest share Connes2008, 42 of 102 in-text citations; the change adds, removes or reorders no layer, so the contents comparison of the previous review stands: independent.

Research link: Layers 4–6 prove Connes' spectral characterization of manifolds (Connes 2008, Theorems 11.3–11.5) with Voiculescu's multiplicity theorem (1979, Theorem 4.5); Layers 7–8 carry Ćaćić's reconstruction for almost-commutative triples (2011, Corollary 2.19; 2012, Corollary 2.7) and Plymen's Spinᶜ dictionary (1986); Layer 10 is Dąbrowski–Dossena's products (2010). Rests on the README's sources, read at their locators.

## Not verifiable

- Rudin, Theorems 2.11 and 2.15 (§3.2), Nestruev, Chapter 11 (§3.3), Loday §4.2 (§10.4) and Trèves, Chapter 51 (§§3.6, 10.6): books with no legal open copy; untouched by this change.
- Hörmander 1968 (§7.6), Ando 1988 and Birman–Koplienko–Solomyak 1975 (§7.9): not fetched; untouched by this change.
- Voiculescu 1979 is an image-only scan read by OCR: the page and the shape of the two definitions were confirmed, the formulas only as far as they are legible.
- The sign of §9.2 was compared with the cited definition, not derived from OperatorKTheory K6's product, which states the graded flip but no duality convention.

## Source issues

- none

## For the human reviewers

- Licence: Swan 1962 was read (previous round) from the AMS back-issue PDF at ams.org, served without login; the sources service does not classify that host. Voiculescu 1979 and Plymen 1986 come from jot.theta.ro, with no stated licence.
- Manifest coverage: the sources cache holds 6 of the 15 works the README cites (Connes 2008, Ćaćić 2011, Plymen 1986, Voiculescu 1979, Brodzki–Mathai–Rosenberg–Szabo, Dąbrowski–Dossena).
- Not tested in any round: the book locators (Rudin, Theorems 2.11 and 2.15; Nestruev, Chapter 11; Loday, §4.2; Trèves, Chapter 51), Ando 1988, Birman–Koplienko–Solomyak 1975 and Hörmander 1968.
