# Review of DeligneWeightsAndPurity (pull request #929 at 5f2fd53)

**Verdict:** needs changes

## R01 (P3) — Layer 2 cites source numbers that the renamed headings no longer identify

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:1150` "Keep the setting of Lemma `3.5`, and assume in addition that `f` and every `f_i` are Taylor expansions …"; lines 1114, 1126, 1133, 1169, 1176 "Under the hypotheses of Theorem `3.2`" / "Under hypothesis (iii) of Theorem `3.2`".

**Claim:** At 5930b27 the headings of 2.7 ("Lemma `3.5`: …") and 2.9 ("Weil `I`, Theorem `3.2`: …") identified these numbers. The new headings drop them, so the text now points at this roadmap's §3.5 (open arithmetic monodromy) and §3.2 (geometrically constant sheaves). Neither has the power-series setting or hypotheses (i)–(iii).

**Witness:** `README.md:1236` "**3.5. The arithmetic monodromy of `ℱ₀` is open in `H`.**"; `README.md:1204` "### 3.2. Geometrically constant lisse sheaves come from `𝔽_q`". No heading or label at this head contains "Theorem `3.2`" or "Lemma `3.5`".

**Repair:** Use the roadmap's own numbers, as the new group intro at line 1124 already does: "Under the hypotheses of 2.9, …" at lines 1114, 1169 and 1176; "Under hypothesis (iii) of 2.9, …" at lines 1126 and 1133; "Keep the setting of 2.7, and assume in addition …" at line 1150. Checked: 2.9 states (i)–(iii) at line 1160, and 2.7 states the setting at line 1143.

## R02 (P3) — The reworded §7.4 still names `P_n(f)` by a catalogue id

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2165` "The property `P_n(f)` is that of DWP.7/devissage-in-the-sheaf-and-the-source."

**Claim:** "DWP.7/devissage-in-the-sheaf-and-the-source" is not a heading, label or section of the README. `P_n(f)` is defined in 7.3, which is now in the same group as 7.4.

**Witness:** The string occurs once in the README, and none of the 251 heading anchors matches it. `README.md:2158`: "A sheaf `ℱ` on `X` has property `P_n(f)` if each `R^i f_!ℱ` is mixed of weights `≤ n + i`."

**Repair:** "The property `P_n(f)` is that of 7.3."

## R03 (P3) — The description names only two of the six suppliers that are not on main

**Location:** Pull-request description, Dependencies paragraph: "By section, the README uses: InverseGaloisAndArithmeticFundamentalGroups, the geometric trace constructions; LefschetzPencilsAndVanishingCycles, pencils and vanishing cycles. The representation, curve, elliptic, Jacobian, profinite and Dirichlet-series suppliers are on main."

**Claim:** The README also consumes AbelianSchemesAndArithmeticModuli, ArithmeticGaloisRepresentations, ArithmeticGaloisDuality and ModularCurvesPartII, none of which is on main. As a result, "representation" and "elliptic" read as suppliers on main, but ArithmeticGaloisRepresentations and ModularCurvesPartII are open.

**Witness:** `README.md:211–235` (AbelianSchemesAndArithmeticModuli §§A2.5–A6.14), 249, 253, 324 (ArithmeticGaloisRepresentations), 320 (ArithmeticGaloisDuality), 475 (ModularCurvesPartII). None of these folders is on main at 7c8b292, and the merge order lists them at lines 43, 58, 62 and 73.

**Repair:** Replace the two sentences with: "By section, the README uses these open roadmaps: AbelianSchemesAndArithmeticModuli §§A2.5, A3.9, A6.1, A6.10–A6.12, A6.14 (polarizations, the Rosati involution, characteristic polynomials and degrees of endomorphisms); ArithmeticGaloisRepresentations §§1.1–1.6, 2.6, 5.13, 6.1–6.2 (coefficient models, scalar Weil numbers, function-field Chebotarev, Tate realizations); ArithmeticGaloisDuality §R02.3.2 (function-field ideles and reciprocity); InverseGaloisAndArithmeticFundamentalGroups, the geometric trace constructions, local systems and covers; LefschetzPencilsAndVanishingCycles, pencils and vanishing cycles; ModularCurvesPartII §§3.1–3.2, 4.11–4.12 (full level and geometric connectedness). EtaleCohomologyFoundations, SchemeAndStackFoundations, AlgebraicCurves, JacobianChallenge, ModularCurves, NewtonPolygons, ReductiveGroups, ReductiveGroupsPartII, RepresentationTheory (CompactGroups, LieGroups, SchurWeyl), ProfiniteProPGroups and ArithmeticDirichletSeries are on main."

## R04 (P3) — The AI attribution omits the Claude models used on the branch

**Location:** Pull-request description: "AI assistance: GPT-6 (Codex) for the port from the explorer package, with two author-side red-team passes (GPT-6 Codex and Astra, then a second Codex pass) applied before review."

**Claim:** `CONTRIBUTING.md:54–56` asks the description to name the models used. Nine of the 18 commits that touch the folder carry Claude co-author trailers, including both commits since 5930b27, and the description names none of these models.

**Witness:** Co-Authored-By trailers in `git log origin/main..HEAD -- TauCetiRoadmap/DeligneWeightsAndPurity`: Claude Opus 5.5 on 5f2fd534, e086807d, 5930b278, e0046cbb and 87323d1e; Claude Fable 5.1 on 60456772, f9684e0b, 43d17c70 and d65b68a6; Codex on 6c2402d5.

**Repair:** "AI assistance: GPT-6 (Codex) for the port from the explorer package and the first statement of the headline theorems in `Suggested.lean`, with author-side red-team passes (GPT-6 Codex and Astra). Claude Fable 5.1 and Claude Opus 5.5 for the later red-team, dependency and review repairs, including the rewording and regrouping of Layers 2, 3 and 7."

## Previous findings

- The review of 5930b27 raised no finding. Its only bullet was R01 of the review of e0046cb, which that review marked repaired. The §9.7(iii) text it covered is unchanged at this head.

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 2.7 (reworded): coefficient and radius comparison | `f_i=(1−t^i)⁻¹`, `i≥1`; control `f₁=(1−2t)⁻¹`, `f₂=1−2t` | `a_{i,n}=[i∣n]≤p(n)`, e.g. `a_{2,4}=1≤p(4)=5`; all radii `1≥1`; control: `f=1` has radius `∞` while `f₁` has `1/2`, possible only because a coefficient is negative | pass; WI line 442–445, p. 284 |
| 2.8 (reworded): pole comparison | `f₁=(1−t)⁻¹`, `f₂=(1−t/2)⁻¹`; control `f₂=1−t` | poles of the product `{1,2}`, inf `1`; `f₁`: `1≥1`; `f₂`: `2≥1`; control: `f=1`, inf `+∞>1`, excluded by coefficients `≥0` | pass; WI line 446–449, p. 284 |
| 3.4 (reworded): families from `n`-th powers | `K={3}`, `δ=(ζ₃,ζ₃²)`, `ε=(ζ₃²,ζ₃)`; `K={2}`, `δ=(2,−2)`, `ε=(2,2)`; control `1∈K` | `3∤n`: `{ζ^n,ζ^{2n}}={ζ,ζ²}` on both sides, and the conclusion holds; odd `n`: `{2^n,−2^n}≠{2^n,2^n}`, so the hypothesis fails as it must; `1∈K` allows no `n`, so `(1)` vs `(2)` would pass vacuously, which is excluded | pass; WI line 887–890, p. 297 |
| 3.8 (reworded): full denominator off `K`, `L` | `ℱ₀=0`; `γ=(−1)`, `δ=(1)`; `γ=(1)`, `δ=(2)`, `ℓ≠2` | `deg x=2`: `(1−t)/(1−t)=1`, denominator `1`, so `2∈K` is needed; `deg x=3`: `(1+t)/(1−t)`, full denominator; `(1−t)/(1−2^d t)` keeps its full denominator for every `d≥1` | pass; WI line 874–880, p. 296 |
| 3.9 (reworded): `S∣R` and the lcm | `ℱ₀=0`, `γ=(1,−1)` | admissible `S`: `1`, `1−t`, `1+t`, `1−t²`; `(1−t)²` fails at `deg x=1`; lcm `1−t²=R`; `δ=(2)` fails at `deg x=1` | pass; WI line 897–908, p. 297 |
| 7.3 (reworded): (a), (f) | `f:Spec 𝔽_{q²}→Spec 𝔽_q`, `ℱ=ℚ̄_ℓ(−1)`; extension of `ℚ̄_ℓ` by `ℚ̄_ℓ(−1)`, `f=id` | `F_{q²}=q²`; on `f_!ℱ`, `F_q` has eigenvalues `±q`, `|±q|=q^{2/2}`, so the weight `2` is kept; `R^i f_!=0` for `i≠0`; the extension (weights 0, 2) is mixed of weights `≤2` | pass; WII line 2575–2595, p. 204 |
| 7.4 (reworded): (c), (e) | `Y=𝔸¹_{𝔽_q}`, `V=𝔾_m`, `T={0}`, `𝒢=j_!ℚ̄_ℓ`; `Y′=Y_red` | `𝒢|V` has weight 0 and `𝒢|T=0`, so mixed `≤0` on both sides; residue fields of closed points are unchanged (a purely inseparable extension of a finite field is trivial), so the eigenvalues agree; the "iff" in (c) follows from base change for `Rf_!` | pass; WII line 2583–2592, p. 204 |
| 7.5 (reworded): (α), (β) | `K=𝔽_p(s)`, `C=Spec K[x,y]/(y^p−s)`; `ℱ=ℒ_ψ(x)` on `𝔸¹_{𝔽_q}` | `C` is smooth at no point over `K`, while `(C⊗K(s^{1/p}))_red=𝔸¹` is smooth, so the extension is needed; the cover `y^p−y=x` makes `u*ℒ_ψ` trivial, with `D̄=ℙ¹`, `E={∞}`, and `u_*ℚ̄_ℓ=⊕ℒ_ψ′` containing `ℒ_ψ` | pass; WII line 2601–2606, p. 205 |
| Group intros 2.5, 2.7, 2.9, 3.4, 3.8, 7.3: the "uses" claims | each claim against the *Needs* lines | 2.9 uses 2.6 and 2.8; the 5.8 positivity block uses 2.6 and 2.7–2.8; 5.9 uses 2.7–2.8; 5.10 uses 2.7; 3.11 uses 2.9 and 2.11; 3.8 and 3.10 use 3.4 and 3.7; 4.1 uses 3.11; 7.6 uses 7.3–7.5; 7.7 uses 7.3; 8.3 and 8.4 use 7.4: 14 of 14 hold | pass |
| R01: "Theorem `3.2`" (2.4–2.6, 2.10–2.11), "Lemma `3.5`" (2.8) | the roadmap's §3.2 and §3.5 at this head | §3.2 has no hypotheses (i)–(iii); §3.5 has no power series; at 5930b27, headings `README.md:1138,1154` named them | fail → R01 |
| R02: `P_n(f)` in 7.4 | the catalogue id vs the 251 heading anchors | 0 matches; definition at `README.md:2158` (7.3) | fail → R02 |
| 7.7 (sampled; *Needs* line changed) | WII line 2607–2621, p. 205 | `Rf_!ℱ=Rf̄_*(j_!ℱ)` (line 2614); `R^i f̄_*j_*ℱ` pure of weight `n+i` by (3.2.3) (line 2618); `Gr^M_k` is zero for `k>0` and pure of weight `n+k` (line 2620); the 7.3 link resolves | pass |
| 8.4 (sampled; *Needs* line changed) | WII line 4007–4008, p. 243 | Théorème (6.1.2): `R^i f_*` of a mixed sheaf is mixed over `𝔽_p` and in context (6.1.1) b); the next page header is 244; the 7.4 link resolves | pass |
| Internal links after the regrouping | every `](#…)` against each heading's slug | 251 headings; 0 unresolved links; 0 numbered labels landing in a group that does not contain them (`[3.5](#34-…)` lands in the group 3.4–3.7) | pass |

The rows for untouched statements stand as in the review of 5930b27 and the reports it carries. These include the headlines `abelianPointCountBound`, `finiteFieldZetaRationality`, `degreeFactorExtraction`, `lefschetzDecomposition` and `lefschetzPairings`, and the sampled targets 0.6, 0.14, 0.15, 1.10, 2.2, 5.5, 5.12, 5.15, 6.3, 6.4, 7.11, 10.1 and 10.2, which lie outside the changed passages.

- Gate rerun at 5f2fd53 (text scanners and dependency check): `set_option=0 … source-material=0 OK`, every scanner zero; the worker's run at this head adds `build=0`. Dependency check: `depcheck: 245 roadmaps, 2221 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/DeligneWeightsAndPurity/Suggested.lean` gives five `sorry` warnings (lines 82, 96, 111, 154, 179) and no error. `Suggested.lean` is unchanged since 5930b27, so the signatures and the padding probes stand. No file outside the folder changed.
- 10 source locators were opened against the text: WI (3.5), (3.6), (6.6), (6.7) and (6.8) (Numdam, fetched into a scratch manifest), and WII (3.3.1) a)–f) (also checked on the rendered p. 204), the proof's (α)/(β), the 7.7 step and the 7.6 reduction on p. 205, and (6.1.2) on p. 243.
- Cross-roadmap citations: no roadmap links this README by anchor (`roadmaps grep 'DeligneWeightsAndPurity/README\.md#'`: no match). Citations by number of regrouped sections (ArithmeticGaloisRepresentations README.md:760 and FunctionFieldArithmetic README.md:2457, both §3.7) still resolve to the label 3.7. AutomorphicLFunctionsAndLocalFactors §AL.3.11, cited at `README.md:310`, exists at its open head (its README.md:2074).
- Supplier status for R03 at main 7c8b292: on main are EtaleCohomologyFoundations, SchemeAndStackFoundations, AlgebraicCurves, JacobianChallenge, ModularCurves, NewtonPolygons, ReductiveGroups, ReductiveGroupsPartII, RepresentationTheory/*, Completed/ProfiniteProPGroups and Completed/ArithmeticDirichletSeries. AbelianSchemesAndArithmeticModuli, ArithmeticGaloisRepresentations, ArithmeticGaloisDuality, InverseGaloisAndArithmeticFundamentalGroups, LefschetzPencilsAndVanishingCycles and ModularCurvesPartII are not on main.
- Overlap check: read LefschetzPencilsAndVanishingCycles (it leaves "the purity theorems of Weil I and Weil II" to others), WeilConjectures ("The proof of purity belongs to DeligneWeightsAndPurity"), WeightsInEtaleCohomology and EtaleDualityAndPerverseSheaves (consumers, later in the order) and FourierDeligneTransform (it cites §§5.2 and 6.5 here). The lists of roadmaps on main and of named results are empty. No object of the changed passages has a second owner, and this roadmap owns Layers 2, 3 and 7.
- Source independence: 14 passages compared with 2 sources, changed passages only. These are the eight reworded statements against WI lines 442–449, 874–908 and WII lines 2575–2606, plus six group intros in the roadmap's own words. No run of shared words goes beyond formulas and standard names (French sources, English text, clauses reordered). Largest share WII, 140 of 217 locators. No layer was added, removed or reordered, so the contents comparison stands from the earlier reports.
- Remarks on untouched text (no change requested): 14 further `DWP.n/<slug>` catalogue ids remain (e.g. `README.md:2190, 2240, 2357, 2481`), and §7.6 (`README.md:2182`) cites WII's "Theorem 3.3.1" by number. The package `sources.toml` records Lef and WII, two of the eight works the README cites.

## Not verifiable

- Nothing this round needed an unreadable text. [Int] (SGA 7 II, XXI §5) is still cited by locator only, outside the changed passages.

## Source issues

- **Misprint** in WII at Théorème (3.3.1) e), printed p. 204: the source gives the normalisation of a normal integral `Y` in an inseparable extension of its function field as an example of a universal homeomorphism; it should be a purely inseparable (radicial) extension; affects nothing.

## For the human reviewers

- none
