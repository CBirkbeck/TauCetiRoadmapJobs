# Review of RowTowerAndRallisIdentities (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RowTowerAndRallisIdentities/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 403 changed lines since `b8f3652`. The change adds `*Origin:*` and `*Method of the formal proof:*` labels to 5.1–5.12, `*Corollary of:*` lines to 5.2a and 5.10a, corrected supplier lines and new references; it changes no statement and removes no section, layer or declaration. The ranges the labels assign to J.-S. Li (1992) and to Gan–Qiu–Takeda, Propositions 11.1 (ii) and 11.2, were recomputed from the chain's rank conditions and hold, and every published locator that could be read legally was read at its place. Accepted, with two small corrections (the 5.2a label credits its supplier section with a generality that section does not state; "Weil's convergent range" in three labels is ambiguous) and two format notes, none blocking; the folder is unchanged since the previous review, so these four remarks stand as they were. Two points are left to the human reviewers: Barnes (1980) could not be read, and the formal proof, the main source, was not compared.

## C01 — The labels of 5.2a say that VonNeumannAlgebras V9.IntegrableDiscreteSeries states the projector theorem for every unimodular locally compact group; that section states it for second-countable groups, exactly as 5.2a does.

A reader is told that 5.2a is a proper special case of its supplier, and an implementer who needs a group that is not second-countable would look for a statement that is not there. V9.IntegrableDiscreteSeries (`TauCetiRoadmap/VonNeumannAlgebras/README.md`, line 2534) opens "Let G be a unimodular second-countable locally compact group"; it only remarks, in its source parenthesis (line 2545), that Barnes proves the result without second countability. Against this, the Origin of 5.2a (lines 507–508) reads "states it, with its source, for every unimodular locally compact group, and this section is its case of a second-countable group"; the parenthesis of the `*Corollary of:*` line (lines 517–518) and the contract under From TauCetiRoadmap.VonNeumannAlgebras (line 2636) also omit second countability. The deduction itself is sound: the two statements have the same hypotheses.

Smallest change: in the Origin, "states it, with its source, in the same generality (Barnes proves it without second countability)"; and add "second-countable" in the `*Corollary of:*` parenthesis and in the contract line.

## C02 — In the Origin labels of 5.5, 5.6 and 5.8g, "J.-S. Li (1992), in Weil's convergent range, that of the step `i = 0`" reads as if the later steps were outside Weil's convergent range; every step is inside it, and what singles out the first step is `dim Y_1 > 2 dim Y_0`.

5.5 assumes Weil's condition at every step (Witt index of `Y_{i+1}` less than `t`). In Gan–Qiu–Takeda's terms (GanQiuTakeda14 line 141, with `d(n) = n` for unitary pairs, lines 348–353) this is the convergent range `m − r > n` for every `i`, and their Proposition 11.1 (ii), which the same labels cite for `i ≥ 1`, is precisely the convergent case inside `n < m ≤ 2n` (GanQiuTakeda14 lines 2580–2582, 2601–2602). With `m = 4`, `k = 8`, `r = 11`, `t = 313` (so that (R1), (R2), (R5) with `f = 4` hold) the ranks are `11, 324, 637, 950, 1263`: step 0 has `324 > 22`, outside `n < m ≤ 2n`; step 1 has `637 ≤ 648` and `637 − 1 > 324`; steps 2 and 3 have Witt index 0. The README's own Check in 5.5 (line 857) calls the range of step 0 "Weil's range (`dim Y_1 = r + t > 2r = 2 dim Y_0`)", which is the inequality meant.

Suggested wording: "J.-S. Li (1992), in the range `dim Y_1 > 2 dim Y_0` of the step `i = 0`" in 5.5 and 5.6, and "of the first step of the column, whose larger rank exceeds twice the smaller" in 5.8g.

## N01 — "*Sources:* ingredients (Rallis; Hecke)" in 5.6 (line 960) and "*Sources:* ingredients (Shimura; …)" in 5.11 (line 2287) keep the word "ingredients" from the tag they replace; "*Sources:* (…), for the ingredients" would read like the other sections.

## N02 — Several Origin labels that call a statement published or adapted name a work without a theorem or section number: Wallach (1984) and DeGeorge–Wallach (1978) in 5.3, J.-S. Li (1990) in 5.2, J.-S. Li (1992) in 5.5–5.7, and Shimura, Deligne, Milne and Harris in 5.10a. A number for each, as 5.2a gives for Barnes and 5.3 for Muić, would let a reader check the attribution.

## Previous findings

The previous review of this folder raised no finding. Its two small corrections and two format notes concern text this pull request adds; the folder is unchanged since the head that review read, so none is repaired, and they are C01, C02, N01 and N02 above, checked again at this head.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 5.5 Origin: Li (1992) at step 0; GQT Props 11.1 (ii), 11.2 at `i ≥ 1`; value at `s = t/2` | `m=4, k=8, r=11, f=4, t=313` | ranks `11, 324, 637, 950, 1263`; `324 > 22`; `637 ≤ 648`, `637−1 > 324`; `s_{m,n} = (n_{i+1}−n_i)/2 = t/2`, `L` at `(t+1)/2 = 157` | holds | C02 wording |
| 5.6 Origin; Needs: MetaplecticAutomorphicForms §6.14 for `i ≥ 1` only | §6.14 through §6.13: `d(n) < m ≤ 2d(n)`, `r ≤ n` | step 1: `(n, m, Witt) = (324, 637, 1)`, inside; step 0: `324 > 22`, outside | holds | none |
| 5.6 positivity of the factors (cited by its Method label) | `β = i`, `u = 1`, `Nw = 2`, `s = 2` | `|1 − i/4|^{−2} = 16/17 > 0`; with `B(w̄) = B(w)`: `(1 − i/4)^{−2} = (15/16 − i/2)^{−1}`, not real | holds | none |
| 5.7 Origin: model identity in the range `dim V_j > 2 dim W_j` | `dim W_j = r = 11`, `dim V_j = r + t = 324`, `V_j` definite | `324 > 22`; Witt index 0, so Weil's criterion holds trivially | holds | none |
| 5.8g Origin: first core step Li, later steps GQT | base rank `r+1 = 12`, step `s−1 = r+5 = 16`, `m = 4` | ranks `12, 28, 44, 60, 76`; `28 > 24`; `44 ≤ 56`, `60 ≤ 88`, `76 ≤ 120` | holds | C02 wording |
| 5.2a `*Corollary of:*` V9.IntegrableDiscreteSeries | hypotheses side by side; `𝕋` with `σ = z^n`; `SL₂(ℝ)` weight 2 | both: unimodular, second-countable, `e_σ ∈ L¹`; `𝕋`: `∫ z^{−n}ρ(z)dz` projects on the `z^n`-part; weight 2 square-integrable, not integrable | deduction holds; description of supplier wrong | C01 |
| 5.2a Method: `e_σ(g^{−1}) = conj e_σ(g)`, `Pρ(g)P = ⟨w, σ(g)w⟩P` | inner product conjugate-linear in the first variable | `d·conj⟨w, σ(g^{−1})w⟩ = d·⟨w, σ(g)w⟩`; V9 route: `e*f*e = ⟨w, π(f)w⟩e` at `f = δ_g` | holds | none |
| 5.2 Origin locators | Rallis84Howe lines 430–435, 520; Wu13 line 406 | Thm 1.1.1 printed p. 345 (constant term along a maximal parabolic); Corollary p. 351 (cuspidality); Prop 3.1: constant term along `Q_a`, unitary groups | holds | none |
| 5.3 Origin: Muić, Lemma 4-2 | Muic16 lines 733–736 | `Z(𝔤)`-finite, `K`-finite, `L¹` function: Poincaré series is a cuspidal automorphic form | holds | N02 for the other works |
| 5.5 Origin: Rallis (1984b), Prop 1.1 | Rallis84Injectivity lines 345–349 | printed pp. 149–150; hypothesis `m > 2(k+k′)+2`; orthogonal–symplectic | holds | none |
| 5.8h Origin; 5.8e locators | GanIchino16 lines 8–10; GanGrossPrasad12 lines 1528, 2229, 3029 | FJ case from Bessel case through local theta; §12 p. 43, Cor 15.2 p. 63, §23 p. 86 | holds | none |
| 5.9 locator (sampled, untouched) | BernsteinZelevinsky77 line 329 | 2.12 on the page after printed 447, so p. 448 | holds | none |
| 5.10a `*Corollary of:*` | section headings at this head; signature `(k+j−1, m−j)` for `j=1,3` | AutomorphicBundles 2.7, 3.1, 3.2, 4.3, 6.4, 11.2, 11.9, 11.18 and ShimuraVarieties §4.11 present with the stated subjects; `(8,3)`, `(10,1)`: unequal, reflex field `K` | holds | none |
| Contract edits: ThetaLiftsForDefiniteUnitaryGroups 3.2, 1.4; MetaplecticAutomorphicForms §5.6 | headings at base and head; Needs of 5.11 | 3.2 is the Rallis inner product formula and 3.3 the convergence, at both; 1.4 in no Needs line; §5.6 in the Needs of 5.11 | corrections true | none |
| Downstream: SeesawForThetaChains §6.14 (c) | its README line 403 | (c): root of unity `ζ_ℂ(u, ξ)`, `ζ_ℂ(u, 1) = 1`, `P̃_ξ = ζ_ℂ·B_u(φ)(ι_ξΥ)` | holds | none |
| 5.5 Check (untouched, same section) | `r = 1`, `t = 3`, `q = 2` | `#ℙ³(𝔽₂) = 15`; `15·2^{−4} = 15/16 = 1 − 2^{−4}` | holds | none |
| Headlines (1)–(3) | module docstring of `Suggested.lean`; elaboration | none statable at the pins; each named with the carriers it lacks; no declaration, so no one-tactic probe applies | holds | none |
| 5.1, 5.4, 5.8a, 5.8b, 5.8d, 5.8, 5.11, 5.12 labels (sampled) | each label against its section's statement and Needs | labels restate the section's own content; their sole locators are into the formal proof | consistent; source not read | none |

- Source locators checked against the text: 13 (Rallis84Howe 2, Rallis84Injectivity 1, GanQiuTakeda14 4, Wu13 1, Muic16 1, GanIchino16 1, GanGrossPrasad12 3; BernsteinZelevinsky77 1 is the fourteenth, in untouched text).
- Cross-roadmap citations resolved at this head: VonNeumannAlgebras V9.IntegrableDiscreteSeries; AutomorphicBundles §§2.7, 3.1, 3.2, 4.3, 6.4, 11.2, 11.9, 11.18; ShimuraVarieties §4.11; MetaplecticAutomorphicForms §§5.6, 5.7, 6.12–6.14; ThetaLiftsForDefiniteUnitaryGroups 1.4, 3.1–3.3; SeesawForThetaChains §6.14; ThetaChainsOnDefiniteUnitaryGroups §2.1 (R1), (R2), (R5).
- README at the merge base compared with the head: no heading, layer, section or Lean declaration removed, renumbered or retitled; the `*KNOWN*`/`*NEW*` tags become `*Sources:*` lines and Origin labels; every section 5.2–5.12 carries both labels and 5.1 the first only, as the Labels paragraph says.
- Library declarations opened: none needed (`Suggested.lean` declares nothing and the diff names no library declaration).
- Dependency check: `depcheck: 129 roadmaps, 1454 edges, 0 problem(s)`; no upward or cyclic line.
- Elaboration of `Suggested.lean`: no message, exit 0. The `#check` comparison of signatures does not apply: the file has no declaration.
- The worker's automatic checks: all passed.
- Overlap check: read ThetaChainsOnDefiniteUnitaryGroups, SeesawForThetaChains, GluedTargetAndDivisionInequality, ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, BesselPoincareSeriesAndGramBounds (the open ones nearest in vocabulary score at most 0.12 and were not opened); the projector of 5.2a is owned by VonNeumannAlgebras V9.IntegrableDiscreteSeries and the rational cusp forms of 5.10a by AutomorphicBundles §§11.2–11.18, both cited through the `*Corollary of:*` lines; nothing else shared. Ownership against the other open pull requests was checked only through the overlap list, which names no shared id.

Source independence: changed passages only; 13 passages compared with 7 sources, none shared beyond a five-word run in a one-sentence statement (Rallis84Howe line 431) and the standard name of a result (GanIchino16 line 8); largest share [FormalProof], 93 of about 115 locators, not read; arrangement not compared (no layer added, removed or reordered).

Research link: 5.5–5.7 and 5.8g are cases of the Rallis inner product formula (Rallis 1984; J.-S. Li 1992; Gan, Qiu and Takeda 2014) and 5.2 of the tower property (Rallis 1984; Wu 2013), for the unitary theta chains of Alpöge's formal proof of GRH for Dirichlet L-functions (2026). Rests on the README's Origin labels and GanQiuTakeda14 §§1.7, 11.4.

## Not verifiable

- Barnes (1980), Lemma 1 and Proposition 1 (5.2a): not in the sources cache; cited through a publisher DOI, and no legal copy was looked for beyond it.
- J.-S. Li (1990) and (1992), Wallach (1984), DeGeorge–Wallach (1978), Kashiwara–Vergne (1978), Kudla (1984), Kudla–Rallis (1994), Ichino (2004), Arthur–Clozel (1989), Labesse (1999), Shimura, Deligne, Milne, Harris: cited by work only, with no locator to check; not fetched.
- Wu (2013) was read as arXiv:1409.0770v1 and Muić (2016) as arXiv:1505.02263v1; their numbering was not compared with the journal versions.
- The `*Method of the formal proof:*` labels and every locator into [FormalProof]: a Lean repository that is not in the sources cache; the labels were checked only for consistency with each section's statement and route.
- The pull request's description is truncated where it was read and does not name this folder in the part read. Nothing in that part is contradicted by the folder: section numbers are unchanged, and the labels have the four kinds it lists.

## Source issues

- none

## For the human reviewers

- The two recorded decisions concern sections that leave a family roadmap; this folder removes none, so neither was needed here.
- Licence: Barnes (1980), Proc. Edinburgh Math. Soc. 23, backs 5.2a and VonNeumannAlgebras V9.IntegrableDiscreteSeries; no legal copy was read, so Lemma 1 and Proposition 1 are unchecked.
- Not tested: the source with the largest share of locators is [FormalProof] (93 of about 115), an unrefereed Lean formalisation announced 2026-11-20; neither the wording nor the accuracy of the new Method labels was compared with it.
