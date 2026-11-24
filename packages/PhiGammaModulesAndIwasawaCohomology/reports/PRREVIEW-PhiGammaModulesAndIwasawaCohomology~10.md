# Review of PhiGammaModulesAndIwasawaCohomology (pull request #3027 at 855180d)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 141 changed lines since `74a09b7`. The folder's text is the one the previous review read; the new §§6.4–6.6 were checked again at every locator against Berger's *Limites de représentations cristallines* (with its errata) and Wach 1996, the sign and weight conventions were recomputed against the source's opposite convention, and every Check was recomputed. No statement is false or unsupported, so there is no finding. Accepted, with three small corrections and two format notes, none blocking; all five were raised before and the text has not changed. Nothing is left for a human to decide beyond noting that a decision was applied.

## C01 — §6.0's filtered comparison now depends on the later §6.4, but §6.0's Needs line does not say so, and §6.4 names only its part (1)

An implementer who builds Layer 6 in order proves §6.0 first and only afterwards learns that its filtered comparison waits for §6.4. §6.4's Needs line (lines 2635–2636) says the filtered comparison of §6.0 "is deduced from (1)", and the Dependencies paragraph says the source deduces it from §6.4. In the source the deduction uses both parts: Théorème III.4.4 takes its map from Proposition II.2.1 (Berger-Wach-2004 line 767), and compares the filtrations through Théorème III.3.1 (line 786), whose statement rests on the exponents `r_j` computed in Proposition III.2.1, that is on §6.4 (2). §6.0's own Needs line (lines 2425–2426) still lists only §§1.0–1.3 and PadicPeriodRings.

The smallest repair: add "§6.4 (1)–(2), for the filtered comparison" to §6.0's Needs line, and change "deduced from (1)" to "deduced from (1) and (2)" in §6.4. Since §6.4 cites §6.2, whose Needs pass through §6.1 and so through §6.0, it would also help to narrow §6.4's citation to "§6.2 (the definition of `N_Wach,rig^+(V)`, for `F = ℚ_p`, `p` odd)", so that the loop is visibly one of sections and not of statements.

## C02 — §6.4's Needs line does not name the step that places `D_cris(V)` inside the Robba realization

The proof of Proposition II.2.1 starts from the theorem of Berger's differential-equations paper (this roadmap's Berger-diffeq, Théorème 3.6) that `D_cris(V) ⊂ D_rig^†(V)` for positive crystalline `V` (Berger-Wach-2004 lines 467–469 and 481), and statement (2) uses that `B_rig,F^+` admits elementary divisors, which the source also takes from that paper (lines 296–297). §6.4's Needs line lists only §6.0, §6.2 and PadicPeriodRings §§4.1–4.3. PadicPeriodRings §4 has no Robba ring, and I did not find the inclusion stated in NoncommutativeAndEquivariantIwasawa §F.6, so an implementer of §6.4 (1) has no named owner for its first step.

The smallest repair: state the two inputs in §6.4 with their locators (Berger-diffeq Théorème 3.6 and §4.2), or name in the Needs line the sections of this roadmap from which they are to be derived.

## C03 — The description does not say that this roadmap gains three sections

The description says "49 existing roadmaps receive 196 sections" and names the largest recipients, but never names PhiGammaModulesAndIwasawaCohomology or Wach modules. A reader does not learn that this roadmap on `main` gains §§6.4–6.6 (138 added lines), a new source (Wach-1996), and new clauses in its overview and scope. One sentence would do, for example: "PhiGammaModulesAndIwasawaCohomology gains §§6.4–6.6 (Berger's comparison of a Wach module with `D_cris` over the open disc, the action of `Γ_F` modulo `φ^{s−1}(q)`, and Wach's crystallinity criterion), which WachLatticesOverTheCyclotomicTower 6.4 and 6.5 cite."

## N01 — The overview's new clause adds a list of section numbers (lines 54–55)

The rest of the overview guides by layer. "Layer 6 also compares Wach modules with `D_cris` over the open disc and proves Wach's crystallinity criterion" would keep it free of section numbers.

## N02 — Untouched text: in the References (line 3450) the key Berger-Wach-2004 names Wach, although Berger wrote the paper alone

Now that Wach-1996 stands beside it, a reader may take the paper for joint work. A key such as Berger-2004 would avoid this, if the author wishes; the key is used throughout the README.

## Verified sound

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| §6.4 header: `t = π∏φ^{s−1}(q)/p` | `p = 2`, first factor | `q/2 = (π+2)/2 = 1` at `π = 0`; partial product `((1+π)^{p^n}−1)/(p^nπ) → log(1+π)/π` | holds (Exemple I.3.3, p. 10) | none |
| §6.4 header: `B_F^+/φ^{s−1}(q) = B_rig,F^+/φ^{s−1}(q) ≅ F_s` | `p = 3, s = 1` | `q = π²+3π+3` Eisenstein; value at `ζ₃−1` is `ζ₃²+ζ₃+1 = 0` | holds (Remarque I.3.1, p. 9), `Γ_F`-compatible | none |
| §6.4 weights convention | source vs README | source: `r_j` = opposites of weights, `ℚ_p(1)` weight `+1`; README: `ℚ_p(1)` weight `−1`, `r_j` = weights | same integers `r_j` | none |
| §6.4 (1) | `V = ℚ_p(−1)` | invariants of `B_rig^+·πe₋₁`: `fπ ∈ ℚ_p·t`, giving `ℚ_p·te₋₁ = D_cris`; `πe₋₁` not invariant | holds (II.2.1, p. 14) | none |
| §6.4 (2) | `V = E`; `ℚ_p(−1)`; rank count | divisors `1`; `t/π`; number of divisors `= rank_{B_F^+} N(V) = [E:ℚ_p]·dim_E V = m` | holds (II.3.1, III.2.1) | none |
| §6.4 Check `[F:ℚ_p] = 2`, `(k₀,k₁) = (5,0)` | `E ⊇ F` | cokernel `(B/f₀ ⊕ B/f₁)^{[E:F]}`, `f₀, f₁` coprime with product `(t/π)⁵` ⇒ divisors `1, (t/π)⁵`, each `[E:F]` times; total `[E:ℚ_p] = m` | agrees with (2) | none |
| §6.4 consequence, all crystalline `V` | `V = ℚ_p(1)` | `N = π⁻¹e₁B^+`, `D_cris = t⁻¹e₁`; ratio `t/π`; `π` divides `t`, so both are units of `B_rig^+[1/t]` | holds | none |
| §6.5 (sampled) | `ℚ_p(−1)`, `s = 1`, `γ ∈ Γ_1` (so `χ(γ) ≡ 1` mod `p`) | `γ(π)/π` at `ζ_p−1`: `(ζ_p^{χ(γ)}−1)/(ζ_p−1) = 1` ⇒ eigenvalue `χ(γ)⁻¹`, `r = 1`; wrong sign gives `χ(γ)` | holds (III.2.2, p. 18: `Diag(χ(γ)^{−β_{n,j}})`, `β_{n,j} = r_j`) | none |
| §6.5 route | `γ ∈ Γ_s` | `(t/π)/γ(t/π) = χ(γ)⁻¹·γ(π)/π → χ(γ)⁻¹`; source gets characteristic polynomial, then semisimplicity from `θ∘φ^{−n}` into `(C⊗V)^{H_F}` (p. 19) | sketch matches a sound route | none |
| §6.6 statement | Wach p. 380 item 4, Remarque a) p. 381, `r = 0` | free rank-`d` `Γ`-stable `N` in the finite-height module, `Γ` trivial on `N/πN` ⇒ crystalline; `(g−1)N ⊆ πN` gives `gN ⊆ N` | supported | none |
| §6.6 positivity step | `x = 1/π`, `T = ℤ_p` | minimal valuation `v` of a `φ`-stable finitely generated module mod `p`: `p·v ≥ v` ⇒ `v ≥ 0`; `φ(1/π)/(1/π) = 1/q ∉ A^+` | holds | none |
| §6.6 Check, `Γ` condition | `N = πO_E[[π]]`, `χ(γ) = 1+p` | `φ(π) = qπ`, `φ^*N = qN`, `h = 1`; `(γ−1)π` has linear coefficient `p ≠ 0`, not in `π²O_E[[π]]`; `N ≠ O_E[[π]]` | Check true and discriminating | none |
| §6.6 Check `ℤ_p(−1)` | `N = πe₋₁ℤ_p[[π]]` | `φ(n) = qn`, `h = 1`; `(γ(π)/π)χ(γ)⁻¹ ≡ χ·χ⁻¹ = 1` mod `π`; weight `1 ∈ [0,1]` | holds | none |
| §6.6 errata clause | Berger's errata, item on Définition III.4.1 | definition over `B_F^+` needs the étale condition after extension to `B_F`; §6.6 assumes `N` spans the étale `D(T)` | consistent | none |
| §6.0 filtered comparison (untouched, affected) | proof of III.4.4 | uses II.2.1 and III.3.1; §6.0 Needs omits §6.4 | build order | C01 |
| §6.4 Needs | proof of II.2.1 | starts from `D_cris(V) ⊂ D_rig^†(V)`; not in the Needs line | input unnamed | C02 |
| Headline `wittProjective_of_flat_phi` (unchanged) | `n = 1`; `p = 2, n = 2, M = ℤ/2` | `W₁(R) = R`, hypothesis flat over `𝔽_p` is empty and the Frobenius does the work; `ℤ/2` over `ℤ/4` not flat, excluded | elaborates; signature as README | none |

- Source locators checked against the text: 14 (Berger-Wach-2004: Exemple I.3.3, Remarque I.3.1, Lemme I.3.2, Propositions II.1.1, II.2.1, II.3.1, III.2.1, III.2.2, Définition III.4.1, Proposition III.4.2, Théorème III.4.4, Corollaire III.4.5; Berger's errata, item on III.4.1; Wach-1996 Théorème p. 380 with Remarque a) p. 381).
- Library declarations: the change adds no Lean; the two elaborated signatures were compared with the README statement and no binder is lost.
- Cross-roadmap citations resolved: PadicPeriodRings §§1.1–1.5 and 4.1–4.3 on `main` (headings at lines 76–204 and 404–457); within this roadmap §§1.0, 6.0–6.2; WachLatticesOverTheCyclotomicTower's citations of §§6.4–6.6 at this head (its lines 59–61, 212, 271).
- Record: the README at the merge base has 8 layers; the head removes or retitles none and adds three sections under Layer 6.
- Automatic checks: all passed. Dependency check output: `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/Suggested.lean` gives `declaration uses sorry` (line 65) as the only warning. The file is unchanged by the pull request; the one-tactic probe was not repeated.
- Previous review: it had no finding; its three small corrections and two format notes stand as C01–C03, N01, N02, the folder being unchanged since.
- Changes outside the folder: only in the roadmap folders and family index files that are this pull request's own.

Overlap check: read TriangulineVarietyAndItsLocalModel, PadicHodgeRegulators, PadicHodgeTheory, NoncommutativeAndEquivariantIwasawa, PadicLocalLanglandsForGL2Qp, WachLatticesOverTheCyclotomicTower; the objects of §§6.4–6.6 have one owner, this roadmap (WachLatticesOverTheCyclotomicTower cites them as corollary sources); nothing else shared.

Source independence: changed passages only; 9 passages compared with 3 sources (Berger-Wach-2004, Berger's errata, Wach-1996), none shared beyond formulas and statements of a dozen words; largest share KPX, 86 of 111 keyed locator mentions; contents not compared, the change adding, removing or reordering no layer.

Research link: Layers 3–7 are the finiteness, duality and triangulation theorems of Kedlaya–Pottharst–Xiao (2012); Layer 6's Wach modules (Wach 1996, Berger 2004) underlie the Iwasawa theory of modular forms of Lei–Loeffler–Zerbes (2010, 2011). Rests on the README's References and on Berger's and Wach's texts as read.

## Not verifiable

- none in the changed passages; the sampled sections outside the change (0.2, 2.3, 2.5, 2.6, 3.4, 4.4, 4.5, 5.0, 5.2, 5.3, 5.5, 7.2, 7.2a, 7.8) are untouched and unaffected, and were not re-read against their sources.

## Source issues

- **Gap** in Berger-Wach-2004 at Définition III.4.1, p. 21: the source defines a Wach module over `B_F^+` without an étaleness condition; it should require that the extension to `B_F` be an étale `(φ,Γ)`-module; affects a stated result; corrected in print at the author's errata, section 2.
- **Gap** in Berger-Wach-2004 at Théorème III.4.4, p. 22: the end of the proof passes from the image of an element lying in the filtration modulo `π` to the element itself; it should add the induction with `γ − χ(γ)^j`; affects the proof; corrected in print at the author's errata, section 2.

## For the human reviewers

- The decision on published theorems leaving the family's roadmaps was applied: §§6.4–6.6 here state what WachLatticesOverTheCyclotomicTower's `Corollary of` lines cite. That README's lines 7 and 947 still say "Layer 8" and "§§8.1 and 8.3", which this roadmap does not have.
