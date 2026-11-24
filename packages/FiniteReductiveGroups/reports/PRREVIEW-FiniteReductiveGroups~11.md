# Review of FiniteReductiveGroups (pull request #3027 at c832fa9)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FiniteReductiveGroups/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 2192 changed lines since `74a09b7`. Every passage the diff changes was checked against the merge base and the earlier review's findings, along with the sampled locators that have a legal copy (Steinberg 1965, the Stacks Project, Carayol 1984) and the supplier sections at this head; the dependency check and the elaboration were run again. The earlier findings are repaired, and so is the deferred D01: the convention now deduces each special case from the general theorem, and 4.8, 5.4 and 5.7 are stated over every finite field. One finding remains: 2.1 restates as its own target the definitions of regular characters and of the Gelfand–Graev representation for every `G^F`, which ReductiveGroups §7i.1 (b), added in this pull request, states at the same generality, and 2.1 does not cite it (R01). There are three small corrections and one format note. Two points are left for the human reviewers: the formal proof the family cites, and the unread source Green 1955.

## R01 (P2) — 2.1 restates the definitions of regular characters and of the Gelfand–Graev representation for every `G^F`, which ReductiveGroups §7i.1 (b) states at the same generality, and does not cite it

With two owners, an implementer of 2.1 builds a second notion of regular character and of `Γ_ψ` beside ReductiveGroups'. The scope section contradicts itself on the point. Its first bullet for Layer 2 (line 2759) claims "regular characters, Gelfand–Graev representations and their multiplicity one (2.1, 2.2; …)". Its list of what the roadmap does not own (lines 2810–2812) gives the "Gelfand–Graev representations … of every finite reductive group" to ReductiveGroups Layer 7i.

At this head, ReductiveGroups §7i.1 states all of the following, and its Layer 9E extends the section to Steinberg endomorphisms:
- the subgroup `U₀*` and the factors `U_O`;
- the isomorphism `U₀^F/U₀*^F ≅ (U₀/U₀*)^F ≅ ∏_O U_O^F`;
- regular characters, defined as trivial on `U₀*^F` and nontrivial on every `U_O^F`;
- `Γ_ψ = Ind_{U₀^F}^{G^F} ψ`, of degree `|G^F|_{p′}`;
- a route through the commutator laws and Lang's theorem for `U₀*`.

The merge base had no Layer 7i in ReductiveGroups: this pull request creates the second statement. 2.1 (lines 605–617) states the same definitions and facts for every `G` and proves them by the same route. Yet:
- 2.1's *Needs:* line (line 619) and the Layer 2 Dependencies (line 1104) do not name §7i.1;
- the scope's list of restated statements (lines 2797–2802) does not include 2.1.

The same situation in 2.4, 5.2, 5.5, 5.6, 5.11 and 6.1 was settled in this round by citation. Only the clause on `GL_n` is not in §7i.1: there the regular characters are `u ↦ ψ₀(Σ a_i u_{i,i+1})` with every `a_i ≠ 0`, and `T^F` permutes them transitively.

The smallest change:
- in 2.1, after the general definitions, write "This is ReductiveGroups §7i.1 (b), extended to Steinberg endomorphisms in ReductiveGroups Layer 9E", as 0.2 does for §7a.2, and keep the `GL_n` clause and its route as this roadmap's;
- add §7i.1 to 2.1's *Needs:* line;
- in Scope and ownership, add "2.1 but for its `GL_n` clause" to the restated statements, with owner ReductiveGroups §7i.1, so that the Layer 2 bullet claims only the `GL_n` case.

## C01 — The scope claims the vanishing of the proper Harish-Chandra restrictions of `J_n(θ̃)`, which CharacterTheory §9a.8 (b) states, and lists the same clause of 5.6 (b) as restated

A reader cannot tell which section owns this clause. The Layer 4 bullet of "The roadmap owns" (line 2771) includes "Harish-Chandra restrictions … cuspidality … of Green's class functions `J_n(θ̃)`". The first sentence of 4.5 (b) (line 1438) and the first clause of 4.9 (line 1606) state `*R_L^G J_n(θ̃) = 0` for every proper rational Levi subgroup. CharacterTheory §9a.8 (b) states this in the same words, and 5.6 (b), which states it for `R_{T_{(n)}}^G(θ)`, is among the restated statements (line 2798). Adding "the vanishing of the proper Harish-Chandra restrictions of `J_n(θ̃)` in 4.5 (b) and 4.9" to the restated list, with owner §9a.8 (b), would settle it; the bullet keeps the pairing of 4.5 (d) and the rest.

## C02 — The description does not say that this roadmap's suppliers change

After this change the README no longer cites any of:
- OrbitMeasuresOnAdelicGroups §4.1;
- InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3;
- SchemeAndStackFoundations §§1.1, 1.15, 1.24.

It newly cites all of:
- EtaleDualityAndPerverseSheaves §7.6;
- CharacterSumsOverFiniteFields §3.1a;
- ReductiveGroups Layers 7h, 7i and 9F;
- CharacterTheory Layer 9a;
- SmoothRepresentationsOfLocalGroups SR.7.

The description names none of this. One sentence under its part 2 would cover it, for instance "FiniteReductiveGroups now takes Deligne–Lusztig theory from ReductiveGroups Layer 9F, Green's theory from CharacterTheory Layer 9a and Lefschetz numbers from EtaleDualityAndPerverseSheaves §7.6, and no longer cites OrbitMeasuresOnAdelicGroups, InverseGaloisAndArithmeticFundamentalGroups or SchemeAndStackFoundations."

## C03 — The description says each section with a narrower form in the proof now states that form, but 0.1, 0.3 and 2.2 keep the general theorem

The description says "the section now states the proof's form and the general roadmap the general theorem, except where … it is only a remark". In this roadmap, 0.1, 0.3 and 2.2 state the general theorem, of which the formal proof has only the case of `GL_n` (Conventions, lines 167–168). Adding "and FiniteReductiveGroups 0.1, 0.3 and 2.2, which keep the general statement restated from ReductiveGroups" to the exceptions would make the sentence true.

## N01 — 3.2 cites "The Stacks Project, Lemma 59.97.2" (lines 1150, 3039); chapter-numbered lemma labels shift as the Stacks Project grows, and the statement is Tag 0F14, which is stable. Citing the tag would keep the locator valid.

## Earlier findings

- R01 — repaired. The definition of `ch_m` is back in 5.4 (lines 1915–1925), with "the `V_m` are pairwise orthogonal and span all class functions" and "`⟨χ_λ, R_{L_m}^G σ_m⟩ = ∏_O f^{λ(O)}`". The clause of 1.1 is back at lines 433–437: "a condition on a linear character equivalent to triviality on all unipotent elements … and to `χ` having order prime to `p`". Of the 123 Checks on main, 122 are here. The one not restored is the second-route Check of 4.7, which went with its route, as that finding allowed.
- R02 — repaired. 3.2 now reads "Let `k` be an algebraically closed field, `ℓ` a prime invertible in `k`, `X` a proper smooth scheme and `Y` a proper scheme over `k`. Then …", and EtaleCohomologyFoundations §F.4.5 proves Künneth with rational coefficients, as the new *Corollary of:* line says.
- R03 — repaired. It was deferred as D01, and this head settles it (below).
- R04 — repaired for every section it named. 2.4 (a)–(d), 5.2 but for its separation clause, 5.5, 5.6, 5.11 (a), (b) and the first part of (c), and 6.1 are in the restated list (lines 2797–2802). 4.4 now takes `J_n(θ̃)` from CharacterTheory §9a.8 (b). The leftovers are R01 and C01 above.
- C01 — repaired: "for cuspidal characters `σ_i` of `GL_{d_i}(𝔽_p)` … with `Σ_{i∈I} d_i = a`" (lines 1439–1441).
- C02 — repaired: "The `K₁`-invariants `σ` and the contragredient, which no cited source states in this form, are derived … in SmoothRepresentationsOfLocalGroups SR.7.2" (lines 2490–2491).
- C03 — repaired: the Layer 4 Dependencies (lines 1717–1720) say which items of Layer 5 are used and why the dependencies are acyclic item by item.
- C04 — not repaired: the description still does not state the supplier change (C02 above).
- C05 — repaired: the description's merge-order block lists "`FiniteReductiveGroups`: #3036 → this pull request".
- N01 — repaired: the Summary no longer carries `[FormalProof]` or section lists.

## Deferred findings

- D01 — resolved: lines 171–180 and the family index now deduce each Corollary-of case from the general theorem; 4.8, 5.4 and 5.7 are stated over every finite field.

## Questions for the author

- On main, 4.10 and 4.11 were stated for every Steinberg endomorphism. They are now stated for the `q`-Frobenius of an `𝔽_q`-structure, with Remarks saying the other case has no route. Does Digne and Michel (2020) give `Q_T^G(u) = 1` at regular unipotent elements for every Steinberg endomorphism? The README cites that book for 4.3 and 4.6 in that generality, and a source there would let the Remark of 4.10 name it instead of a gap. I could not read the book.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 0.3 Jordan decomposition, centralisers | `g` of order 6, `p = 2`; `GL₂`, `s = diag(a, b)`; elliptic `s` | `s = g⁴` (order 3), `u = g³`; `C(s) = T₁ ≅ (𝔽_q^×)²`; `C(s) ≅ 𝔽_{q²}^×` | holds; Steinberg 2.7 (a), 2.8, 2.11 (pp. 53–54) agree | none |
| 0.4 count, kernel dimensions | `q = 2, n = 2`; `GL₃`, `g = J₂(1) ⊕ J₁(1)` | `X²+X+1`, `X²+1`: `2 = 4 − 2`; `dim ker(g−1) = 2`, `dim ker(g−1)² = 3` = formula | holds | none |
| 0.5 regular unipotent elements | `GL₂`, `[[1,a],[0,1]]`; `SU₃` | `a ≠ 0`: one fixed line, one Borel; `q³ − q` regular elements of `U₀^F` | holds; Steinberg 3.1, 3.2, 3.3 (pp. 54–55) agree | none |
| 1.1 restored clause | `GL₂(𝔽₂) ≅ S₃`: `1`, `sgn` | `sgn`: `−1` on `U^F`, order `2 = p`, nontrivial on unipotents; `1`: all three conditions hold | equivalence holds both ways | none |
| 2.1 regular characters, `Γ_ψ` | `SU₃`; `GL₂` | `q² − 1` regular characters; `GL₂`: `q − 1` of them, degree `(q−1)(q²−1)`; identical to ReductiveGroups §7i.1 (b) | holds; second owner | R01 |
| 3.1 Lefschetz numbers | `𝔾_m`, `g = 1` and `x ↦ x⁻¹` | `L = 0`, `R(∞) = −1 + 1 = 0`; `L = 2`, fixed points 2 (`p ≠ 2`), 1 (`p = 2`) | holds; DL, Dudas–Michel not read | none |
| 3.2 Künneth, now unconditional | `X = Y = ℙ¹` | `dim H² = 2 = 1·1 + 1·1`, `H¹ = 0`, `H⁴ = 1`; Stacks Tag 0F14: `X` proper, `Y` qcqs, torsion coefficients | holds | N01 |
| 4.1 (b) restored Check | `SL₂/𝔽₂`, nonsplit `T`, `K = 𝔽₄`; `GL₃/𝔽₂`, `w = (12)` | `|X_B(K)| = 5 − 3 = 2`; `dim U ∩ F(U) = 3 − 1 = 2` | holds | none |
| 4.3 character formula | `GL₂`, elliptic `s` with eigenvalue `z`; split regular `s` | `R_{T_s}(θ)(s) = θ(z) + θ(z^q) = −σ_θ(s)`; value `0` | holds | none |
| 4.4 restored Check | surface `ab = c + c⁻²`, `c ≠ 0`, over `𝔽_{2^k}` | `(Q−1)² + 3Q` (`k` even), `(Q−1)² + Q` (`k` odd) `= 4^k + (−2)^k + 1`; `χ_c = 3` | holds | none |
| 4.5 (b) with `d_i` | `GL₄(𝔽_p)`, `a = 2`, `σ₁, σ₂` cuspidal of `GL₂` | subsets with `Σ d_i = 2`: two terms; reading `deg σ_i = p − 1` gave none for `p ≠ 3` | holds | none |
| 4.5 new Checks | `GL₂`, `f = St`, `T₁`; `G = T = 𝔾_m/𝔽₃`; `L = T₁` | `⟨St, 1 + St⟩ = 1` vs `(q−1)⁻²(q(q−1) + (q−1)(q−2)) = 2`; 2 points; index set `W`, order 2 | hold | none |
| 4.6 new Check | `SL₂³`, `F` cycling | `N_∅(w) = 2` if `w₁w₂w₃ = 1`, else `0`; `N_S = 1`; `ε_Gε_{T_w} = det w` | holds | none |
| 4.8 label over every `q` | `GL₂(𝔽₄)` | 12 labels; `(X−a)²`: 2 characters ×3, split ×3, irreducible ×6: `15 = k₂(4)` | holds | none |
| 4.5 (b), 4.9 vanishing vs CT §9a.8 (b), 5.6 (b) | `n = 2` | `*R_T J₂(θ̃) = 0` stated in all three places; only 5.6 (b) listed as restated | holds; ownership unclear | C01 |
| 4.10 values of `J_n` | `GL₂` at `1`, `u`, `a`, elliptic, split | `1 − q`; `1`; `θ̃(a)(1 − q)`; `θ̃(z) + θ̃(z^q)`; `0`: the values of `R_{T_s}` | holds; Green 1955 not read | none |
| 5.3 comparison with `GL₂` | four class families | central `(q−1)θ(a)`; `a·u`: `−θ(a)`; elliptic `−(θ(u) + θ(u^q))`; split `0` | agree with the pinned values | none |
| 5.4 squarefree label, every `q` | `p = 2`, `X²+X+1`; `q = 4`, two linear; `q = 4`, irreducible quadratic | `sgn`, `3/3 = 1`; `45/9 = 5 = q + 1`; `45/15 = 3 = q − 1` | holds | none |
| 5.4 restored `ch_m` | `n = 2`, `m = 2·{1}`; orbit of size 2 | `ch(h₂) = 1`, `ch(e₂) = St`; `(−1)³R_{T_s}(θ) = σ_θ`, `−σ_θ` without the sign | holds; equals CT §9a.6 | none |
| 5.6 uniformity, Green functions | `n = 2` unipotent; `Q_{T_{(2)}}(1)` | `½(R_{T₁}(1) + R_{T_s}(1)) = 1`; `−ψ₂(q)/(q² − 1) = 1 − q` | holds | none |
| 5.7 every `q` | `GL₂(𝔽₄)`, `GL₂(𝔽₂)` | `12 = 16 − 4` generic characters; 15 characters, one label each; the `z_m` sum to `1` | holds | none |
| 5.8 weights | `q = 3`, `n = 2` | `1/4 + 3/8 + 3/8 = 1`; non-squarefree total `3/8 ≤ 2/3` | holds | none |
| 5.10 Gauss sums | `n = 1`; `n = 2` | `w(θ) = G₁(θ)`; `w(σ_θ) = −qG₂(θ) = (−1)^1 q^1 G₂(θ)` | holds; Kondo not readable | none |
| 6.1 Origin | Carayol Thm 4.2, p. 205, complement to Def. 4.1, p. 204 | irreducible, cuspidal, minimal conductor, pairwise inequivalent; no `K₁`-invariants clause | Origin now agrees | none |
| 6.2 count | `n = 2`, `q` odd | `((q−1)/2)·((q−1)/2) + ((q−1)/2)·((q+1)/2) = ½q(q−1)` | holds; BH 2005 not read | none |
| `exists_cuspidal_of_regular` | `n = 1`; `n = 2`, `q = 3` | dimension `∏_{Ico 1 1} = 1`, value `θ(s)`; dimension `2` | holds | none |
| `exists_regular_of_isCuspidal` | `GL₂(𝔽₂)` | `sgn = σ_θ`, `θ` of order 3, `θ² ≠ θ` | holds | none |
| `bessel_pairing_eq` | `n = 2, k = 1, i = 0`; `χ` = regular, `1`, `St` | LHS `|G|`, `1`, `q`; RHS `|G|/q + (q−1)|G|/q`, `1 + 0`, `1 + (q − 1)` | holds | none |

- Source locators checked against the text: 5. These were Steinberg 1965 2.7–2.11 (pp. 53–54) and 3.1–3.3 (pp. 54–55); the Stacks Project étale cohomology chapter, Lemma 97.2 = Tag 0F14 (its p. 202); and Carayol 1984, the complement to Definition 4.1 (p. 204) and Theorem 4.2 (p. 205). All say what the README attributes to them.
- Library: no declaration of `Suggested.lean` is added, removed or restated, and only the module docstring changed. `#check @name` for all seven declarations, elaborated together, gives the same types as at the merge base, and none has lost a binder. By reading, none of the three theorems closes in one tactic: two are existence statements, and the third is a character identity for an arbitrary class function.
- Cross-roadmap citations resolved at this head:
  - EtaleCohomologyFoundations §§F.2.7 and F.4.5 (rational Künneth);
  - CharacterTheory §§9a.1, 9a.2, 9a.4–9a.12, with §9a.6 matching the restored 5.4 word for word up to `κ`;
  - ReductiveGroups §§7.1, 7a.1–7a.3, 7b.1, 7c.1, 7C.6, 7h.1 (with the restored clause on linear characters), 7h.2, 7h.3, 7i.1–7i.3 and 9F.1–9F.11;
  - SR.7.1 and SR.7.2 with their named statements;
  - CharacterSumsOverFiniteFields §3.1a;
  - TensorInductionAndFiniteGroupInputs §§6.1 and 6.2 (b′);
  - the family index's convention paragraph.
- Record against the merge base: all 7 layers are kept with their titles. Checks went from 123 to 122; the one dropped is the second-route Check of 4.7, removed with its route. The 5.4 definition and the 1.1 clause are restored.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1471 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: three `sorry` warnings only. No file outside the folders this pull request owns has changed.
- Overlap check: read SmoothRepresentationsOfLocalGroups (SR.7), LocalFactorsOfTwistsAndTypes, BaseChangeAndGaloisRepresentationsForUnitaryGroups, BesselPoincareSeriesAndGramBounds, ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups and EndoscopicTransferAndUnitaryTraceComparison, together with ReductiveGroups Layers 7h, 7i, 9F and CharacterTheory Layer 9a. Shared objects and their owners:
  - regular characters and `Γ_ψ`: ReductiveGroups §7i.1 (R01);
  - the vanishing of `*R_L J_n`: CharacterTheory §9a.8 (b) (C01);
  - Green's theory: CharacterTheory Layer 9a;
  - depth-zero supercuspidals of `GL_n(F)`: SR.7.2;
  - the depth-zero Jacquet comparison: SR.7.1 and LocalFactorsOfTwistsAndTypes §2.1.

  BaseChange and BesselPoincare consume this roadmap, and the G₂ depth-zero theory of ExceptionalThetaCorrespondencesForG2 is a different object. #3036 also edits this README; the description orders it first.
- Source independence: 7 passages compared with 3 sources (Steinberg 1965, the Stacks Project, Carayol 1984), changed passages only; none shares wording beyond formulas, standard names and forced lists of hypotheses. The largest share of the locators is Green 1955, 17 of about 162 author–year citations, which could not be read. The arrangement was not compared: the diff adds, removes and reorders no layer.
- Research link: Layers 4 and 5 are the character theory of finite reductive groups and of `GL_n(𝔽_q)` of Deligne–Lusztig (1976) and Green (1955), and Layer 6 is the depth-zero theory of Moy–Prasad (1996) and Carayol (1984). The README ties them to Alpöge's 2026 formal proof of GRH for Dirichlet `L`-functions through the theta-chain and base-change roadmaps. This rests on the README, MoyPrasad1996 and Carayol1984.

## Not verifiable

- Green 1955 (Trans. AMS): the DOI landing page is on a host the sources service does not class; this affects 0.4, 2.4 (c), 4.4, 4.7, 4.10, 5.2, 5.5, 5.6 and 5.9.
- Kondo 1963 (J. Math. Soc. Japan), the Theorem of the Introduction, p. 245, cited for 5.10 (a): the Project Euclid landing page offered the sources service no PDF.
- Deligne–Lusztig 1976 (Annals): JSTOR only; this affects 3.1, 3.3, 4.1–4.3, 4.6 and 4.11.
- Dudas–Michel 2015: the sources service found no legal copy; this affects 0.2, 1.0–1.3, 3.1–3.4, 4.1 and 4.2.
- Digne–Lehrer–Michel 1992 and Lang 1956: publisher and JSTOR pages only; these affect 0.5, 2.2, 2.6 and 4.1.
- Bushnell–Henniart 2005 (JAMS): the landing page is on a host the sources service does not class; this affects 6.2.
- Zelevinsky 1981 is recorded as uncertified. Macdonald 1995, Carter 1985, Digne–Michel 2020, Harish-Chandra 1970, Springer 1970, Shintani 1976, Kawanaka 1987 and Lusztig–Srinivasan 1977 are books or paywalled and were not fetched.

## Source issues

- none

## For the human reviewers

- The family's Method labels and the formal-proof declaration names rest on [FormalProof], Alpöge's Lean formalisation (README, References, entry [FormalProof], with a public repository URL). I did not open that repository; its status and licence are for the humans.
- Not tested: Green 1955, the source with the largest share of the locators, could not be read, so the changed wording was not compared with it.
