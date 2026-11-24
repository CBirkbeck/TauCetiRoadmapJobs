# Review of VonNeumannAlgebras (pull request #3027 at 6f088b9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 44 changed lines since `b8f3652`. The change adds one item to Layer 9, V9.IntegrableDiscreteSeries (the projector of an integrable discrete series), with its route, a Dependencies line, a supplier contract and a reference; its statement, its conjugation convention and each step of its route were recomputed from Schur orthogonality and on C₂, C₃, S₃ and SL₂(ℝ), and they hold, the BanachAlgebras §§7.2–7.3 citations say what is used, and no layer or item of `main` is removed. There are no findings. The folder is unchanged since the previous review, which had no findings either; its one small correction (a second-countability hypothesis that the source, the supplier and the route do not need) and its one format note still apply and do not block. One item is left for the human reviewers: Barnes (1980), the only source of the added text, has no legal copy, so its locators and wording were not compared.

## C01 — V9.IntegrableDiscreteSeries assumes G second-countable, which its source, its supplier and its route do not need, while its consumer and the description say it is stated for every unimodular group

An implementer would prove Barnes's projector only for second-countable groups, and the consumer that cites the item for all unimodular groups would cite a statement the README does not make. The statement (line 2534) begins "Let G be a unimodular second-countable locally compact group", while its own locator (line 2545) says the result is "proved there for every unimodular locally compact group". The supplier has no such restriction: BanachAlgebras §7.2 says "There is no standing second-countability or sigma-finiteness assumption" (its README, line 1485), and this roadmap's supplier contract repeats that (line 5493). The route uses only Schur orthogonality, the convolution algebra `L¹(G)` and Bochner integrals against `e_π∈L¹`, none of which needs countability; a compact group such as `(ℤ/2)^ℝ`, unimodular and not second-countable, with every character integrable, is excluded by the wording and covered by the route word for word.

Two texts of this pull request read the item as general. RowTowerAndRallisIdentities 5.2a says VonNeumannAlgebras states it "for every unimodular locally compact group, and this section is its case of a second-countable group" (that README, lines 506–508, and again at 517 and 2636). The description says each added section is "stated in the generality of its source" and its list of exceptions does not name this one. The smallest repair is to delete "second-countable" at line 2534. If the hypothesis is meant (for instance because the formal degree "defined above" is set up only in the layer's second-countable setting), say so at line 2534 and add the item to the description's list of exceptions.

## N01 — `*` denotes both convolution and the involution in the route

In the route (lines 2548 and 2552), `e_π*=e_π` and `e_π*f**f*e_π` can be read in more than one way. Writing the involution as a superscript (`e_π^*=e_π`, `e_π * f^* * f * e_π`) would remove the ambiguity.

## Questions for the author

- Does Barnes state the range of `ρ(e_π)` for an arbitrary unitary representation ρ at Lemma 1, p. 233, as the locator says, with Proposition 1 on the earlier pp. 230–231? No legal copy of the paper could be read, so I could not tell which part of the statement is his and which is supplied by the route written here.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| V9.IDS: `π(e_π)` is the projection onto ℂw | general, from Schur orthogonality `∫⟪u,π(g)v⟫·conj⟪w,π(g)w⟫dg=d⁻¹⟪u,w⟫⟪w,v⟫` | `⟪u,π(e)v⟫=d·d⁻¹⟪u,w⟫⟪w,v⟫`, so `π(e)v=⟪w,v⟫w` | holds | none |
| V9.IDS: `e_π*e_π=e_π` | general; C₂, sign character, counting measure, `d=1/2` | general: `(e*e)(x)=d²·d⁻¹⟪π(x)w,w⟫=e(x)`; C₂: `e=(1/2,−1/2)`, `e*e=(1/4+1/4, −1/4−1/4)` | holds | none |
| V9.IDS: `e_π(g⁻¹)=conj e_π(g)` | unimodular G, modular factor `c≡1` in BanachAlgebras' `f*(x)=c(x)conj f(x⁻¹)` | `d⟪π(g⁻¹)w,w⟫=d⟪w,π(g)w⟫=conj e(g)` | holds | none |
| V9.IDS: the conjugate in `e_π` (convention witness) | C₃, `χ(g)=ω^g`, counting measure, `d=1/3` | with conjugate: `χ(e)=(1/3)Σω^{−g}ω^g=1`; without: `(1/3)Σω^{2g}=0` | conjugate needed and present | none |
| Route: `e_π*f*e_π=⟪w,π(f)w⟫e_π` | general; C₃ with `f=δ₁` | general: `(f*e)(x)=d⟪π(x)w,π(f)w⟫`, then `d²·d⁻¹⟪π(x)w,w⟫⟪w,π(f)w⟫`; C₃: both sides `ω·e` | holds | none |
| Route: `‖ρ(f)x‖²=‖π(f)w‖²‖x‖²` | general; C₂ regular, `x=(δ₀−δ₁)/√2`, `f=δ₁` | general: `⟪x,ρ(e f^* f e)x⟫=⟪w,π(f^*f)w⟫‖x‖²`; C₂: `1=1·1` | holds | none |
| V9.IDS: range of `ρ(e_π)` is `{Tw}` | S₃ standard σ, `d=1/3`; ρ regular, ρ trivial | regular: `tr λ(e)=6·e(1)=6·(1/3)=2`, the multiplicity; trivial: `Σ_g e(g)=0` | holds | none |
| Remark: weight 2 on SL₂(ℝ) is L² and not L¹ | lowest-weight coefficient `cosh(t/2)^{−k}`, Haar density `sinh t` | L²: `∫e^{(1−k)t}dt` converges for `k=2`; L¹: `∫e^{(1−k/2)t}dt=∫1dt` diverges | holds | none |
| Remark: compact G, dimension equals multiplicity | `T↦Tw` on `Hom_G(π,ρ)`, w cyclic; S₃ above | injective, so dimension `=dim Hom_G(π,ρ)`; S₃: 2 = 2 | holds | none |
| Generality of V9.IDS | `(ℤ/2)^ℝ`; README line 2545; BanachAlgebras line 1485; RowTower 5.2a line 507 | statement excludes it; source line, supplier and consumer include it | narrower than cited | C01 |
| Supplier: BanachAlgebras §§7.2–7.3 | BanachAlgebras README at this head, lines 1480–1500 and 1536–1581 | convolution `∫f(y)h(y⁻¹x)dμ(y)`, involution `c·conj f(x⁻¹)`; multiplicativity, reverse action, "intertwiner compatibility" (line 1581) | matches the *Needs:* line | none |
| 13.1 (seeded, untouched): Tomiyama locators | hiai-lectures line 2666 (p. 55); peterson-notes line 3948 (p. 98) | Hiai Thm 6.5 gives (ii) and (v) of Thm 6.4 for a C*-subalgebra; Peterson Thm 6.2.1 is the unital case | as cited | none |
| 13.2 (seeded, untouched): projection criterion for amenable II₁ factors | anantharaman-popa line 7413 (printed p. 166), line 7532 (Thm 10.3.4) | finite-rank projection P with `max‖uPu*−P‖₂<ε‖P‖₂`, as the README states | as cited | none |
| 13.2 (seeded, untouched): AFD and uniqueness locators | anantharaman-popa lines 8294, 8358 (printed pp. 186, 188), 7685 (p. 173); haagerup-2016 lines 49–52 (p. 2) | Thm 11.2.2, Rem 11.2.3, Def 11.1.1 and Thms 1.1–1.2 at the cited pages | as cited | none |

- Source locators checked against the text: 9, all in the seeded sample, which lies outside the change (Hiai Thm 6.5; Peterson Thm 6.2.1; Anantharaman–Popa Thms 10.3.1, 10.3.4, 11.2.2, Rem 11.2.3, Def 11.1.1, Prop 10.2.5; Haagerup 2016 Thms 1.1–1.2). Barnes 1980: 0 (no legal copy). No locator is flagged unverified in the README.
- Record: the headings and labelled items of the README at the merge base and at this head differ only by the added V9.IntegrableDiscreteSeries; 14 layers on both sides; the one deleted line (supplier contract) returns extended.
- Cross-roadmap citations resolved: BanachAlgebras §7.2 and §7.3 A7.IntegratedRepresentations (on `main`, untouched by this pull request); BanachAlgebras names VonNeumannAlgebras only as a downstream consumer (its line 1968), so no cycle. One consumer of the new item: RowTowerAndRallisIdentities 5.2a.
- Duplication: searched the roadmaps on `main` and the open heads for integrable discrete series and minimal idempotents; no second owner of the projector. BesselPoincareSeriesAndGramBounds uses integrable discrete series for a different statement (multiplicities for cocompact lattices).
- Library: Tau Ceti `integratedOperatorCLM` (`TauCeti/Analysis/CStarAlgebra/Action/Covariant/Normed.lean`, line 48) is the native integrated operator behind BanachAlgebras §7.3; the diff adds no Lean name and no backticked name of this roadmap's own.
- Automatic checks: all passed. Dependency check output: `depcheck: 129 roadmaps, 1439 edges, 0 problem(s)`. The pull request changes nothing outside the roadmap folders it owns.
- Elaboration: `lake env lean` on `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` gave 33 `declaration uses sorry` warnings and nothing else. The diff does not touch the file, so the one-tactic probe and the `#check` comparison were not repeated; the worker's elaborated signatures show no lost section binder.
- Pull request text: the description does not name this roadmap's item separately; its general sentence on the generality of the added sections is the subject of C01. No heading, layer or Lean declaration is removed.

Overlap check: read TracesOnCStarAlgebras, SelfAdjointSpectralTheory, SchattenClassesAndSchurMultipliers, BanachSpaceTheory, BochnerSpaces (open), AmenableTracesOnCStarAlgebras, CStarAlgebras, FactorRigidity (on `main`); the results list was empty; nothing shared with the change: the projector of V9.IntegrableDiscreteSeries is owned here, and `L¹(G)` with its integrated representations is owned by BanachAlgebras §§7.2–7.3, which is cited.

Source independence: changed passages only; 4 added passages (the statement, the route, the compact and SL₂ remark, the supplier and reference lines), 0 compared with their one source, Barnes 1980, whose text could not be read legally; the formulas are forced by the mathematics. No layer added, removed or reordered, so the arrangement was not compared. Largest share of the README's locators: anantharaman-popa, 38 of about 139 by a pattern count.

Research link: Layer 13 states the classification of injective factors (Connes; Haagerup 1987, 2016, uniqueness of the injective III₁ factor). The added projector (Barnes 1980), with Layer 9's formal degrees, is the general theorem behind RowTowerAndRallisIdentities 5.2a. Rests on the README's Summary and References and haagerup-2016 lines 49–52.

## Previous findings

- none: the previous review of this folder had no findings. Its small correction (second-countability) and its format note (the two uses of `*`) are not repaired; the folder is unchanged since. They are C01 and N01 above.

## Not verifiable

- Barnes 1980, Lemma 1 (p. 233) and Proposition 1 (pp. 230–231), cited in V9.IntegrableDiscreteSeries: the sources service found no legal copy (the DOI leads to a publisher page it cannot classify). The statement was checked by computation only.
- tomiyama-1957, Theorem 1 (13.1, seeded sample, untouched text): not re-read in this review; the previous review found the cached text unusable.
- arveson-1969, Theorem 1.2.3 (13.1): settled as uncertified, cited by locator.
- Takesaki I and III locators in 13.1–13.2 (Theorem IV.4.9; XV.3; XVI.1; XVII.3.12): no text held.

## Source issues

- none

## For the human reviewers

- Not tested: Barnes 1980 (Proc. Edinburgh Math. Soc. 23, 229–238, DOI 10.1017/S0013091500003114), the only source of V9.IntegrableDiscreteSeries (README lines 2534–2545), has no legal copy; its locators and the wording of the added passages were not compared with it.
