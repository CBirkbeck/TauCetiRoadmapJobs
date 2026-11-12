<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13076#issuecomment-6782610334 -->
Review (codex) of e9372f9

Verdict: needs_changes

1. **F01** (P1) Real scalar periods and imaginary forms are still conflated

   **Location:** `packages/ZagierConjecturePolylogarithms/README.md:717`: “`dL₄*(z) = (5/6)L₃*(z) d^C log|z| − (1/6)log|z| d^C L₃*(z)`”; conventions at line 46, tree integral at line 500, use in §§3.7 and 6.2.

   **Claim:** With real-valued `Lₙ`, this is the differential of the canonical real period, using `d^C=∂−∂̄`.

   **Witness:** At `z=e^{iθ}`, `θ=π/2`, evaluated on `∂θ`, the left side is `−15ζ(3)/512`; the right side is `−15iζ(3)/512`. Both are nonzero. GR line 90 places its projection in `(2πi)^{n−1}ℝ`.

   **Derivation:** On the unit circle the logarithmic correction vanishes. Thus `L₄*=5 Im Li₄/16`, and its angular derivative is `5 Re Li₃(i)/16`. The series gives `Re Li₃(i)=Σ_{k≥1}(−1)^k/(2k)³=−3ζ(3)/32`. Meanwhile `L₃*(i)=−9ζ(3)/256` and `d^C log|z|(∂θ)=i`. The repaired formula's two sides therefore differ by `i`, not by an orientation or a rational normalization. This also conflicts with the supplied Deligne coordinates: PR #1470, `TauCetiRoadmap/MotivicEtaleKTheory/README.md:399` and :412, uses the imaginary line in even weight; PR #1461, `TauCetiRoadmap/BorelRegulators/README.md:21`, divides actual Tate-valued coordinates by `(2πi)^{n−1}`.

   **Integral calculation:** In §3.9, each edge function is imaginary-valued and each `d^C` of it is a real one-form. Ordinary integration makes the weight-two tree integral imaginary; line 512 requires the nonzero real number `−D(i)/(8π²)`. With the positive cyclic edge order, direct angular integration gives `−iD(i)/(4π²)`, twice `i` times the required value. The source itself is inconsistent here; neither its formula (3) nor the example after (16) can be imported without reconciling conventions.

   **Exact repair:** Distinguish the scalar period `p` from the form-valued map `P`. Keep the real `Lₙ` and both Lean headlines. In the Deligne formulas use the projection `Re` in odd weight and `i·Im` in even weight: in particular `P(S₄)=iL₄*`, `P(S₃)=L₃*`, `P(S₂)=iL₂*`. State the conversion back to scalar `p` explicitly, and transport all components of §5.1 and the conversion in §6.2 through it. Equivalently, the scalar weight-four diagonal differential is `−i` times the displayed right side. Keep this angular test as a Check. With the form-valued repair both sides are `−15iζ(3)/512`; with the scalar repair both are `−15ζ(3)/512`. Specify the phase and normalization of fiber integration in §3.9, deriving the weight-dependent constants from the same canonical period comparison. With ordinary oriented integration and the positive cyclic edge order, the weight-two displayed tree integral needs the multiplier `1/(2i)`; it then gives exactly `−D(i)/(8π²)`. Preserve the weight-one multiplier `1`. The inverse-unit linearity repair remains valid. Do not silently redefine `d^C`, since that would also change the residue normalization in §5.4.

2. **F02** (P1) The unsigned flag sum is not a chain map for the chosen total differential

   **Location:** `packages/ZagierConjecturePolylogarithms/README.md:596`: “sum the classes over all such `a`. Prove that this is a chain map”; line 601 still leaves `D∘t = ±t∘∂` unspecified.

   **Claim:** The all-positive multi-index sum commutes with `D=∂+p`, with both face maps using the zero-based signs of line 35.

   **Witness:** Take `N=5`, six first decorations `e₁,…,e₅,e₁+⋯+e₅`, and generic length-two flag extensions. In `C₅(4)`, the unsigned map has `(Dt−t∂)=2A−2B≠0`, where the relation vectors of `A,B` are `(-1,-1,-1,-1,1)` and `(1,1,1,1,1)`.

   **Derivation:** Let `t₀` be the sum with `Σaᵢ=0` and `t₁` the sum with `Σaᵢ=1`. Deleting the flag with positive index contributes its projection face, with the same sign, so `∂t₁=t₁∂+pt₀`. The row-four projection is killed by the truncation. Consequently `(∂+p)(t₀+t₁)−(t₀+t₁)∂=2pt₀`. For the tuple above, projecting at any of the first five positions gives `A`, and projecting at the last gives `B`; hence `pt₀=(1−1+1−1+1)A−B=A−B`. A simultaneous invertible linear map preserves the unique linear relation up to scalar, so these ordered vector configurations are different generators. Generic flag extensions exist over ℚ by avoiding finitely many proper algebraic subsets. This is independent of their second decorations.

   **Exact repair:** Put the sign into the definition, not into an unresolved subsequent target: use `t=Σ_a (−1)^{Σaᵢ}t_a` for the stated `∂,p,D`. Replace the `±` API by `Dt=t∂`, and state the transport from the source's convention. The general recurrence is `∂t_d=t_d∂+pt_{d−1}`; consecutive coefficients must therefore have opposite signs. On the witness, `t₀−t₁` gives residual `−(A−B)+(A−B)=0`. Add this as the nontrivial `N=5` Check, and use the signed map in §§4.4 and 5.8. GR lines 2878–2902 alone do not fix its conversion to this package's totalization.

3. **F03** (P2) The scope promises a quotient-complex map that the final target disclaims

   **Location:** `packages/ZagierConjecturePolylogarithms/README.md:14`: “the presentation map from `Γ(F,4)` to the inductive weight-four complex”; compare line 938.

   **Claim:** The roadmap constructs a map of the explicit quotient complex to the inductive quotient complex.

   **Witness:** Line 938 explicitly says that no map `B₄(F)→B₄^ind(F)` is used and that descent of all single-symbol relations is not known. Such a map is exactly the missing degree-one component of the advertised complex map.

   **Exact repair:** Replace the scope promise by the actual §6.5 result: inclusion of explicit **raw** cycles in inductive raw cycles, transfer of existence, and every-family rationality under the stated obstruction/period-span condition. Keep the distinction in Downstream consumers. Do not advertise a quotient-complex map unless its relation descent becomes a sourced target. On a raw generator `[x]`, the two maps to `B₃^ind⊗U` agree as `[x]₃^ind⊗u(x)`; that verifies the raw square without claiming the unproved `R₄^explicit⊆R₄^ind` needed for quotient descent.

4. **F04** (P2) The algebraic K-theory comparison is narrowed to the final arithmetic route

   **Location:** `packages/ZagierConjecturePolylogarithms/README.md:859`: “For every number field `F` and `i = 1,2,3,4` construct natural maps”.

   **Claim:** The algebraic comparison of §6.1 is specified only for number fields, following the number-field motivic route of §5.7.

   **Witness:** GR Theorem 1.3(i), printed p.6, GR lines 230–232, supplies these maps and rank-three vanishing for every infinite field. `ℚ(t)` and `𝔽₂(t)` satisfy that hypothesis and are excluded by §6.1.

   **Exact repair:** State and develop the algebraic comparison and rank-three vanishing over every infinite field. Supply the general algebraic construction/descent needed by that target; retain number-field hypotheses on the motivic realization and arithmetic regulator conclusions. Do not replace the general input by its number-field special case. Add `ℚ(t)` and `𝔽₂(t)` as scope controls: the four degrees remain `(K₇,H¹),(K₆,H²),(K₅,H³),(K₄,H⁴)` in both characteristics. This is a general-library requirement, not a request to extend the zeta theorem beyond number fields.

5. **F05** (P3) The Summary still claims the imported decorated flags

   **Location:** `packages/ZagierConjecturePolylogarithms/README.md:3`: “This roadmap builds … decorated flags and the Grassmannian configuration chain map”.

   **Claim:** Decorated flags themselves are among this roadmap's constructions.

   **Witness:** Line 586 says “Nothing about flags is constructed here.” PR #1424, `TauCetiRoadmap/Polylogarithms/README.md:400` and :406, owns the decorated-flag resolution and comparison. The revised supplier contract at line 75 agrees.

   **Exact repair:** Change the Summary to say it builds the **weight-four flag-to-configuration map** and the Grassmannian chain map. This leaves `N=4,k=1` and `N=5,k=2` as imported flag instances, with only the new signed map of R02 constructed here. The conflicting sentence in Polylogarithms' own scope at line 21 is a supplier-side inconsistency; this package should not perpetuate it.

Five findings: two P1, two P2 and one P3; four blocking. The acceptance file elaborates, but the period and configuration conventions still have independently reproducible defects. No package input was edited.

## Previous findings, checked first

The repair report marks none of the thirteen findings not actionable. Each repair was checked against the actual package, not accepted on the repair report's authority. Locations below are in `packages/ZagierConjecturePolylogarithms/README.md`.

| Previous finding | Status | Repaired passage and independent check |
| --- | --- | --- |
| R01, tensor period | Partly repaired | Line 717 now has “− (1/6)log\|y\| d^C L₃*(x)”. This fixes additivity: inverse units give zero. The newly stated diagonal differential still confuses real coordinates with Tate-valued forms; new R01 below. |
| R02, square factor | Repaired | Line 300 specifies “the value is `2·B∧A`”. The four-edge expansion gives coefficients `(2,−2)` on `(B⊗δA,A⊗δB)`, exactly its differential. |
| R03, raw heptagon | Repaired, by a different valid repair | Lines 325–326 begin “`= −2·Q₄`” and include both correction sums. Exact rational expansion on all three listed seven-tuples gives zero residual; raw supports remain 70 versus 35. No equality in the wrong carrier remains. |
| R04, numerical versus canonical period | Partly repaired | Line 507 says “`Cor^H = (2πi)^{−m}·p∘Cor^Hod`”. At weight two the stated scalar coordinates are `D(i)/2` and `−D(i)/(8π²)`, not equal. The tree integral itself has the wrong value line, and the relation between scalar `p` and Deligne-form `P` still needs new R01. |
| R05, decorated-flag ownership | Partly repaired | Line 586 says “Nothing about flags is constructed here.” The named supplier and matching gap now own the general resolution; §4.4 only composes it. The Summary still claims to build decorated flags: new R05. |
| R06, Tannakian locator | Repaired | Line 104 names “§6.2: the coordinate bialgebra with its antipode” and §§3.6, 6.1–6.3. These exist at the MotivesAndAlgebraicCycles head and provide the stated reconstruction. |
| R07, pinned Hodge inventory | Repaired | Line 58 now names `TauCeti.Hodge.MixedHodgeStructure` and the category, abelian instance, strictness and Tate structure. All five declarations were opened at the pin. They do not include framed variations or correlator periods. |
| R08, missing scissors inputs | Repaired | Lines 773–777 now define `a₁`, all three coproduct components and the comparison squares. Independently computed triangle square: `2(2∧3)+2(2∧5)−2(3∧5)` on both sides. The tetrahedron coassociativity test has 113 nonzero coefficients on each side and zero difference. |
| R09, invalid quotient controls | Repaired | Line 639 now says “the 72 ordered terms cancel in 36 pairs”. Line 791 gives the four coefficients `1,−9,−8,2`; their signed sum is `1+9−8−2=0`. No failure of descent is inferred from deleting a relation. |
| R10, wrong-sign residual | Repaired | Line 699 now says “`(3/14)X`”; at `X=14` the residual is `3`, while the intended signs give `0`. |
| R11, zero-period noncycles | Repaired | Line 926 says “[2] over ℚ has `L₄(2) = 0` and is not a cycle”. Its obstruction is `7ζ(3)/8`; a zero determinant still gives the allowed `q=0`. The erroneous consequence was deleted. |
| R12, diagonal/index controls | Repaired | Line 178 inserts “for `x ≠ y`”; `(2,3)` gives raw coefficients `+1,−1`, while `(2,2)` gives `0`. Line 582 now computes mixed-face signs `+1,−1` and explicitly allows a common global sign. |
| R13, API and Checks | Repaired as to the identified omissions | Lines 502, 670 and 747 supply API lists. Lines 910–934 test all eight Lean definitions individually. The three real 22-term tests recompute to residuals below `3×10⁻¹⁵`; swapping `A,B` gives `−0.52104143746`. |

## Verified sound

**Extent of review.** All 47 numbered targets, their API lists, Checks and 47 Needs lines were read. The thirteen previous repairs were checked first, then their changed passages and the same patterns elsewhere. Unchanged computations from round 2 are explicitly identified below; they are not presented as new computations. All fifteen seeded source targets were opened in the six legal cached texts. README and sources.toml flag no additional locator as unverified. The six cited works have six manifest entries; no source was fetched or manifest entry changed.

**Principles and shape.** The introduction makes this a Part II of Polylogarithms and identifies its imported foundations. The six layers have mathematical names, Examples and Dependencies; the dependency lines explain the order independently of the source's chapter order. The apparent forward reference from Layer 2 to §3.1 uses the raw formula, not its later descent, so it does not force a proof cycle. R03–R05 identify the remaining scope defects. No prime restriction, copied source passage, executable mathematical algorithm, prohibited supplier, process residue, HTML anchor or machine path was found in the package text. Definitions have API lists and at least three Checks, with the newly added eight-definition tests examined individually; R01–R02 identify false specifications despite that shape. Main-branch examples read for house style were `Completed/HodgeStructures/README.md` and `TauCetiRoadmap/PolylogarithmFunctions/README.md`.

**Lean elaboration and all padding probes.** From the specified content checkout, `lake env lean` on the package's Suggested.lean exited 0. Its only warnings were `declaration uses sorry`, at lines 123 and 132. There are eight definitions with actual bodies and two sorried theorems, exactly one `import Mathlib`, no Tau Ceti imports needing a build, no `set_option`, no admitted data, and no API or boundary-case padding declarations. A second scratch elaboration with `#check @name` for all ten declarations also exited 0 with only those warnings. The explicit field and number-field binders, cycle family and `hc` hypothesis survive elaboration. The universal test's `V : Type u` includes the actual rational symbol quotient, so its universe does not make the condition vacuous.

Every sorried theorem was tested separately with each of `rfl`, `infer_instance`, `simp`, and `exact riemannZeta_four` in independent namespace copies. All eight probes failed: neither existential conclusion reduces definitionally, neither is a typeclass goal, simplification does not produce its cycles or rational multiplier, and the one-variable Riemann-zeta evaluation has the wrong type. The supplied library-near-match leads were also inspected at the pins. No padding or existing-library duplicate of either headline was found. No original Lean file was edited.

| README headline or deep deliverable | Acceptance-file disposition |
| --- | --- |
| Existence of a nonzero rational zeta multiple for every number field | `zagier_four_exists`, line 123, states the actual cycles and determinant; nonzero multiplier retained. |
| Rationality for every explicit cycle family | `zagier_four_everyFamily`, line 132, states the actual cycle hypothesis; zero multiplier permitted. |
| Weight-four extension, cobracket descent and cluster map | Named in the module docstring; missing explicit Bloch and single/double-symbol quotient carriers. |
| Motivic realization, base-point change, depth reduction and periods of every cycle | Named in the docstring; missing mixed Tate motives, motivic groupoids and framed Hodge–Tate coalgebras. Native unframed Hodge structures do not suffice. |
| Collision continuity | Named in the docstring; missing Hodge correlator integrals. |
| Grassmannian chain map and polylogarithmic Chern cocycle | Named in the docstring; missing configuration complexes, Grassmannian group and Deligne classifying-space realization. |
| Algebraic K-comparison and regulator of κ | Named in the docstring; missing higher Quillen K-groups and Borel regulator. The README generality still needs R04. |

The eight native-carrier definitions are `polylog`, `singleValued`, `unitVector`, `trilogCyclic`, `TrilogRelationFunction`, `IsCycle4`, `periodMatrixFour`, and `zagierDeterminantFour`. Together with the two headlines these are exactly the package's ten own ASCII declaration names, and all occur in README. Backticked symbolic mathematical names were distinguished from claimed Lean declarations. No same fully qualified declaration was found in the other available roadmap files.

### Adversarial calculations

These rows cover the seeded targets, headlines, changed material and every new finding. Exact values are used except where marked approximate. An “inherited” row refers specifically to a computed round-2 row on unchanged mathematics. Such rows do not certify the repaired formulas: the latter were recomputed. In rational-unit exterior expressions, `p` abbreviates `u(p)`.

| Statement | Instances and values computed on both sides | Result / required change |
| --- | --- | --- |
| §1.1 raw symbols and ratios | `s(∞,1,0,2)=2=r(∞,0,1,2)`; wrong unpermuted ratio `1−2=−1`. `Z(0,1,2,3,4,5)=1/5`, opposite sign `−1/5`. Coefficients of `S₃(2)−D₂₁(2,2)` on its two tags are `(1,−1)`, not `(0,0)`. | Independent tags and conventions discriminate. |
| §§1.2–1.5 specialization and reduction | `D₂₁(t,3)↦−[3]₃`; the reduction specializes to `[2/3]₃+[−2]₃−[1]₃=−[3]₃`. Equal poles give `2[u₀/v₀]₃` on both sides; weight four gives `3S₄(u₀/v₀)`, not `S₄(u₀/v₀)`. At `(2,3)` the six coefficients are `+[1/2]+[2/3]+[3/2]+[2]−[4/3]−[1]`. | Relation closure uses the declared gap, not analytic evaluation. |
| §1.3 symmetry control | `D₂₁(2,3)−D₂₁(3,2)` has raw coefficients `1,−1`; at `(2,2)` it is `0`. | Repaired diagonal exception is necessary. |
| §2.1 oriented Stasheff cells | Vertex/edge counts for `K₀,K₁,K₂`: `(1,0),(2,1),(5,5)`; `K₃` has `(14,21,9,1)` cells and alternating sum `1`. Two orders of adding diagonals have incidence products `+1,−1`, sum `0`. | Source dimensions and Koszul signs agree. |
| §§2.3–2.5 square | Four edges from `W,W+a,W+b,W+a+b` give `2B⊗a−2A⊗b`. Differential of the repaired oriented square `2B∧A` is the same; the old coefficient gave half. | Previous R02 repaired. |
| §2.4 hexagon/heptagon | For `(0,1,3,7,11,17,23)`, raw support counts are `70` and `35`; coefficient of `D(−69/8,−1/4)` is `−1` versus `0`. After adding the displayed antisymmetry/inversion corrections to `−2Q₄`, every residual coefficient is `0`. Same residual `0` on `(0,1,2,5,−3,1/2,9)` and `(2,3,5,7,11,13,19)`. | New exact identity repaired the carrier error. A rotation shifts the signed six-term coefficients by one and changes each sign. |
| §3.1 cobracket | At equal poles, both specialization paths yield `3[u₀/v₀]₃⊗u(u₀/v₀)`. Inherited nontrivial co-Jacobi test at `x=−7/9−8i,y=−2+3i`: tensor contribution `−0.5011`, wedge contribution `+0.5011`; opposite exterior convention gives approximately `−1.0023`. | Negative identification of `Λ²L₂` is essential and explicit. |
| §3.4 reduced cyclic shuffle coalgebra | Three-letter cut is `ab∧bc+bc∧ca+ca∧ab`; reversal is its negative. With two punctures, the only length-two basis word is pure, hence `0`; length-three pure shuffle has coefficient `2`, hence `0` over ℚ. Length five has `5+5+5=15` cuts. | Pure-word quotient removes the weight-one kernel; first-shuffle alone would leave a one-dimensional class. Cut/co-Jacobi computation inherited where unchanged. |
| §3.6 frames and weight one | Kummer `−1` is torsion, so its rational class is `0`; Kummer `2` has period `log 2≠0`. A split extension has extension class `0`; `(ℚ(n),id,id)` has weight `0`, multiplicative unit `1`, no positive-weight indecomposable. | Native Hodge data is used; frames are additional data. |
| §3.7 period and rigidity | At the Kummer coordinate `2`, scalar value `log 2`, derivative `dt/t≠0`; hence weight-one variation need not be constant. For weight `m≥2`, `F⁻¹ℚ(m)=0`, so the extension derivative is `0`. Exchanging two inputs of `ω₃` changes sign, equal inputs give `0`. | Rigidity hypothesis matters; form/scalar conversion needs R01. |
| §§3.7, 5.1 real differential | `z=e^{iθ}`, `θ=π/2`: `Re Li₃(i)=−3ζ(3)/32`, `L₃*(i)=−9ζ(3)/256`; `dL₄*(∂θ)=−15ζ(3)/512`, displayed RHS `−15iζ(3)/512`. | R01. Multiplying the scalar RHS by `−i`, or the scalar LHS by `i` for the form-valued version, makes the values equal. |
| §3.9 tree definition | Weight one at `(0,2)` gives `log 2/(2πi)`, and multiplying by `2πi` gives `log 2`. Weight two at `(0,1,i)`: with ordinary oriented integration the stated tree gives `−0.02320167954i`; the claimed comparison gives `−0.01160083977`. | R01: value-line mismatch, not just an unspecified sign. Multiplier `1/(2i)` repairs this weight-two instance. |
| §3.9 scalar versus normalized value | With `D(i)≈0.91596559418`, the claimed scalar is `D(i)/2≈0.45798279709`; multiplying `−D(i)/(8π²)≈−0.01160083977` by `(2πi)²` gives that scalar exactly. | Algebraic conversion is correct, but does not validate the stated integral. |
| §3.10 collisions | For a partial collision `(0,1,1+t)`, `D(1+t)→D(1)=0`. Full collisions `(0,t,it)` preserve `D(i)≠0`, whereas `(0,t,2t)` give `D(2)=0`; no unique full-diagonal limit. Weight one `(0,t)` has `log|t|→−∞`. | Exclusion of the full diagonal and weight-one distinction agree. Overall rescaling from R01 does not affect these continuity tests. |
| §3.13 realization signs | At `y=3`, cut `(1−3)∧3=2∧3`, equal to the chosen symbol boundary; negative image gives `−2∧3`. For `(0,0,3,1,5)`, the cut in `Λ²L₂` is `−[3]₂∧[5]₂`; model coordinates give `+[3]₂∧[5]₂`. Their boundaries are independent `2∧3` and `2(2∧5)`. | Inherited cut computations agree with the repaired exterior convention. At `x=2`, boundary and wedge component are `0`, a degenerate control. |
| §3.13 constants | Over ℚ, primitive ranks in weights three/four are `1/0`; `L₃*(1)=3ζ(3)/8≠0`, while the weight-four constant extension space is `0`. | The proof does not kill constants uniformly in all weights. |
| §§4.1–4.4 truncation/flags | `BC₄=0`, `BC₅=C₅(4)`; mixed-face coefficients `+1,−1` cancel. `N=4` uses one decoration and one summand. For `N=5`, `pt₀=A−B`, unsigned residual `2A−2B`; alternating multi-index signs give residual `0`. | R02; checks at `N=4` alone had missed it. Summary ownership correction R05. |
| §4.5 projective quotient | Two orders of projecting a nine-tuple give `9·8=72` ordered terms, paired into `36` opposite-sign pairs; `p²=0` and `δ̃π₈p=0`. | Repaired Check tests descent instead of claiming that fewer relations prevent it. |
| §4.7 symbolic modules | Inherited dimensions `dim b₂(2,6)=10`, `dim b₂(3,7)=55`. Reversing determinant indices multiplies by `−1`, whose unit vector is `0`. Three-term image in `B₃` is `[1]₃≠0`; its cobracket is `[1]₂⊗u(1)=0`. | Correct evaluation is to `B₃/ℚ[1]₃`, or through δ₃; source's stronger evaluation is invalid. |
| §4.8 degree-eight cancellation | Inherited numerical test: `X≈−60.7015`, projected-alternation ratio `−9`; contributions approximately `−6.50373,+6.50373`, sum `0`. Fresh arithmetic: `3/28−9/84=0`, wrong sign `3/28+9/84=3/14`; at `X=14` residual `3`. | R10 repaired; no new 8! numerical evaluation claimed. |
| §5.1 tensor argument | Corrected expression is additive in the unit: for `y,y⁻¹`, both `d^C log|y|` and `log|y|` cancel, output `0` for tensor input `0`. | Old unit-linearity error repaired, independent of remaining R01. |
| §§5.2, 6.3 cycle calibration | Inverse-pair cycle gives correction `D(x)log²|x|−D(x)log²|x|=0`; `[1]` gives `0`. On `i`, logarithmic correction `0`, so `L₄*=5L₄/16`. | Scalar calibration survives; Tate/form conversion must be fixed. |
| §§5.3–5.4 normal-crossing diagram | For `t₁∧t₂∧u∧w`, two residue orders give `ū∧w̄` and `−ū∧w̄`; on all units residue is `0`. Codimension-one/internal-one degree is `3`; codimension-four/internal-zero degree is `8`. With stated `d^C`, `dd^C log|t|=2πiδ₀`. | Shift and residue tests agree; do not alter `d^C` silently to fix R01. |
| §5.5 scissors | `a₁(∞,0;1,2)=u(2)`; rescaling one lift by `3` changes this by `0`, while a lone determinant changes by `u(3)`. For coordinate `L` and `M=((1,1,1),(1,2,3),(1,3,2))`, both δ₂a₂ and the coproduct wedge are `2(2∧3)+2(2∧5)−2(3∧5)`. | Repaired degree-one interface independently checked. |
| §5.5 relation/coassociativity | Adding `M₃=(1,4,9)` gives `2∧3` coefficients `1,−9,−8,2`, signed sum `0`; other coefficients also `0`. Coordinate tetrahedron against moment-curve points at `2,3,5,7`: both coassociativity composites have `113` nonzero tensor coefficients, difference `0`. | New formula and relation Checks pass exact rational calculations. |
| §5.6 scissors normalization | Replacing `r₃` by `T₃=3r₃`: `(1/6)a′₃=(1/18)(3a′₃)`; using `1/2` instead gives nine times the latter coefficient. | Inherited numerical normalization retained. |
| §5.7 Grassmannian symbol/lift | Weight-four consecutive determinants are `1234,2345,3456,4567`. The first segment varies entry `a₁₁`; `a₁₀` does not exist under this indexing. G09's symbol factor at `n=4` is `(+1)·2·(4!)²=1152`. Permutation transposition changes the alternation by `−1`. | Sources support the symbol and construction route; no uniqueness inferred from symbol alone. |
| §§5.8–5.10 Chern normalization | Correction coefficient `−3/28` times the double-symbol wedge coefficient `1` cancels the corresponding wedge term. Inherited topological test: primitive degree-seven ranks of `U(3),U(4)` are `0,1`. Codimension-three unit term has degree `1+6=7`. | Nonvanishing route and residue degrees are meaningful. |
| §6.1 field/degree scope | For both `ℚ(t)` and `𝔽₂(t)`, source degrees are `(K₇,H¹),(K₆,H²),(K₅,H³),(K₄,H⁴)`. README's number-field quantifier excludes both. | R04: preserve the all-infinite-field algebraic theorem. |
| §6.2 regulator exponent | Per column `π³`; total exponent `3r₂+(r₂−4N)=−4(r₁+r₂)`. At `(r₁,r₂)=(0,1)` this is `−4`, whereas a `π²` column gives `−5`. Actual Tate divisor `(2πi)³=−8π³i`. | Exponent arithmetic is correct; the numerator must carry its Tate phase (R01). |
| Eight Lean definitions, analytic branches | `polylog 0 1=0` by totalized division; `polylog 1 3=−log2−πi`; disc coefficient in weight two `1/k²`. `singleValued 4 0=singleValued 4 1=singleValued 4 2=0`, `singleValued 4 i=β(4)≠0`. `u(0)=u(−1)=0`, `u(2)` detected by `ord₂=1`. | Genuine definitions with correct totalization and nonexamples; no admitted data. |
| `trilogCyclic`, relation predicate | Native formula tested with real `L₃` on three admissible triples: 22-term residuals `−2.22×10⁻¹⁶`, `−1.78×10⁻¹⁵`, `−2.89×10⁻¹⁵`; exchanging the two coefficient expressions at `(2,3,5)` gives `−0.52104143746`. Endpoint relation has retained value `L₃(1)=ζ(3)`. | Coefficient order and constant matter; zero denominators are excluded by the six hypotheses. |
| `IsCycle4` | `[i]` is a cycle since `u(i)=0`; `[2]` is not: `L₃(2)ord₂(2)=7ζ(3)/8≠0`, though `L₄(2)=0`. Zero sum and inverse-pair cycles have obstruction `0`. | Predicate tests actual algebraic obstruction, not just a vanishing period. |
| Both headline theorems; period matrix/determinant | ℚ: empty matrix determinant `1`, `Z₄=π⁴=90ζ(4)`. ℚ(i) with `[i]`: one entry `β(4)`, `Z₄=π⁴β(4)/2=45ζ_{ℚ(i)}(4)` up to embedding sign. Zero column and `[i]+[−i]` give determinant `0`, multiplier `q=0`. | Separates existence from every-family rationality and tests the empty determinant. Changing complex embedding negates its row. |
| §6.5 raw presentation square | On `[x]`, both composites are `[x]₃^ind⊗u(x)`. On inductive `[1]₄`, inversion gives `2[1]₄=0`, hence class and period `0` over ℚ. These values do not establish descent of the explicit relation subspace. | R03: raw square is sound; quotient-complex promise is not supplied. |

For the new tree-integral test, put `h_b(x)=log|x−b|` and use polar coordinates around zero. Writing `ρ=min(r,r⁻¹)`, the angular integral in `∫h₀ dh₁∧dh_i` is the sum of `2πρ^{2k−1}ρ′sin(kπ/2)`. The radial integral with `log r` is `−1/(2k²)`. Consequently this real integral is `−πΣ sin(kπ/2)/k²=−πD(i)`. Also `d^C h₁∧d^C h_i=−dh₁∧dh_i`. Inserting the displayed coefficient `−2` and three Green factors `(2πi)⁻¹` gives `−iD(i)/(4π²)`. Reversing orientation changes sign, never the imaginary value line. This calculation tests the literal integral, independently of the source's inconsistent closed formulas.

### Seeded source checks

Locators refer to the legal versions recorded in sources.toml. The source text, rather than the roadmap's summary of it, was checked. Printed and PDF pagination differ in G00 and M20; references below preserve the package's printed locators and the supplied line numbers.

| Seeded target | Text opened and hypothesis/locator result |
| --- | --- |
| 1.1 Raw symbols | GR (3), p.4, GR line 130; (23)–(25), p.10, GR lines 389–405; (34), p.13. Units, tagged doubles, infinite-field rational setting and admissible cross-ratios agree. Endpoint notation is a zero vector, not a new basis symbol. |
| 1.5 Explicit trilogarithm reduction | GR (29)–(31), p.12, GR lines 494–503; Lemmas 5.1–5.2, p.54, GR lines 2391–2427. Formula and endpoint constant agree. The specialization step is precisely the declared closure contract; the source does not replace it by an analytic theorem over arbitrary fields. |
| 2.1 Oriented Stasheff cells | GR §1.3 item 2 and Figure 6, pp.20–21, GR lines 877–890, with §3.2 and §4.1's cellular convention. Counts `1,2,5,14` and the six-pentagon/three-square boundary agree. The package constructs a finite combinatorial complex, not disc moduli. |
| 2.4 Hexagon three-cell | GR (35)–(36), p.13, GR lines 537–552; Definition 4.2, (101)–(102), p.52, GR lines 2297–2303. Six-term alternating formula agrees. The added raw heptagon formula is independently verified above; the source supplies a quotient relation, not that raw equality. |
| 3.1 Weight-four cobracket | GR (37)–(38), pp.13–14, GR line 573 onward; Theorem 1.14, p.16; Proposition 5.5, p.56. Four tensor terms and wedge term agree after the package's explicitly marked exterior-coordinate identification. Equal-pole coefficient uses table (26), not the subsequent misprint. |
| 3.4 Cyclic shuffle coalgebra | GR §2 item 2, pp.27–28, GR lines 1180–1217, cut formula (66); G08 §8.2, pp.84–85, G08 lines 3670–3728. Cyclic/shuffle/cut construction supported. The pure length-two kernel requires the quotient the package explicitly adds. |
| 3.6 Framed mixed Hodge–Tate structures | GR §8.2, (183)–(184), p.76, GR lines 3503–3519; G08 §§4.1–4.2 and §5. Framings, Tate grading, good variations and unit description agree. The native Tau Ceti structure alone has none of the frame or variation fields. |
| 3.7 Canonical period and rigidity | GR Theorem 8.3, (185)–(188), pp.76–77, GR lines 3520–3552; Lemma 2.7, p.33, GR lines 1438–1444. Rigidity requires weight at least two. G08's real Hodge complex and `d^C`, including G08 line 3851, fix the phase missed in R01. |
| 3.9 Hodge correlators | M20 (3), p.3, M20 lines 102–130; Theorem 6(a), p.13, M20 lines 623–629; (4), p.4, M20 lines 144–148; example after (16), p.18, M20 lines 889–895; G08 Lemma 11.1 and normalized formula, pp.103–105, G08 lines 4505–4633. Source formulas are mutually inconsistent. The literal imported integral and claimed value fail the computed phase test R01; citing the later example does not settle it. |
| 3.10 Collision continuity | M20 Theorem 11, p.18, M20 line 899; Lemma 29 and closing corollary, pp.44–45, M20 lines 2378–2430. Domain excludes the full diagonal; specialization at partial collisions retains coincident arguments. Weight-one qualification is explicit and correct. |
| 3.13 Combinatorial realization | GR Theorem 1.13, pp.15–16, GR lines 660–671; (66)–(67), pp.28–29, GR lines 1215–1253; §5.3, pp.56–57, GR lines 2585–2601. No surjectivity onto the full motivic coalgebra is inferred. Source signs are tested against the cut order rather than copied. |
| 4.7 Finite symbolic modules | GR Definitions 10.2, 10.4 and 10.7, Examples 10.6 and 10.8, pp.95–97, GR lines 4350–4412. Dimensions and relations agree; evaluation in weight three needs the package's quotient by `[1]₃`. |
| 5.3 Normal-crossing diagram | GR Theorem 8.1, (171), remarks and (172)–(177), pp.72–75, GR lines 3377–3456; Theorem 8.6, pp.80–81; §9.2, p.88. Finite normal-crossing support, degree shifts and vanishing of the homotopy correction in that case agree. No general Gersten quasi-isomorphism is asserted. |
| 5.7 Grassmannian tetralogarithm | G09 Definition 4.1, p.22, G09 lines 930–935; Theorems 4.2–4.3, pp.23–24, G09 lines 941–997; Theorem 3.4 and warning, p.18, G09 lines 742–768; GR §9.3, pp.92–93, GR lines 4228–4243. Integrability, projectivity and nine-term identities are supported. A symbol does not determine the full coproduct or constant extension; the package explicitly supplies that extra route. |
| 6.2 Regulator of κ | GR Theorem 1.3(ii),(iv), pp.6–7, GR lines 230–242; Theorem 9.1, p.87; §9.3 items 3–4, p.94. Regulator comparison and nonzero rational normalization are the correct inputs. The powers of π agree with BorelRegulators; conversion of the real scalar to the Tate-valued coordinate is still R01. |

Other changed source passages checked include G00 §2's coproduct and Proposition 2.3 (G00 lines 178–221), alongside its `a₂` formula and `a₃` normalization. The round-2 computed Chern/residue rows retain G93 Theorem 4.5, printed p.190, G93 lines 787–815, and Theorem 4.6, printed p.191, G93 lines 831–860. The OCR partially loses the number 4.5; the page, displayed residue equations and following 4.6 identify the location. No claim of a newly proved global Chern comparison is made from the small checks.

### Pinned declarations and duplication by object

The inspected manifest pins Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following declarations were opened there. Paths in this table are library-relative.

| Object | Pinned declaration evidence and boundary of the supplied result |
| --- | --- |
| Free symbols and evaluation | `Mathlib/Data/Finsupp/Defs.lean:89`, `Finsupp`, has finite support; `Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean:54`, `Finsupp.linearCombination`, supplies linear evaluation. |
| Presentations | `Mathlib/LinearAlgebra/Span/Defs.lean:46`, `Submodule.span`; `Mathlib/LinearAlgebra/Quotient/Defs.lean:61` and :227, `Submodule.Quotient.mk` and `Submodule.mkQ`. They supply quotient carriers/projections, not the relations of a Bloch group. |
| Units and tensors | `Mathlib/Algebra/Group/TypeTags/Basic.lean:50`, `Additive.ofMul`; `Mathlib/LinearAlgebra/TensorProduct/Basic.lean:122`, `TensorProduct.lift`. Bilinearity includes unit-argument additivity, now satisfied by the repaired tensor expression. |
| Exterior powers | `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:79`, `ExteriorAlgebra.exteriorPower`; `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:56`, `exteriorPower.ιMulti`. Alternation kills a repeated vector and changes sign on exchange. |
| Determinants | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:63`, :97 and :141: `Matrix.det`, `Matrix.det_isEmpty`, `Matrix.det_mul`. The empty determinant is `1`, not `0`, and rational column change multiplies the period determinant by the rational change determinant. |
| Lie algebra inputs | `Mathlib/Algebra/Lie/Free.lean:121`, `FreeLieAlgebra`; `Mathlib/Algebra/Lie/Derivation/Basic.lean:43`, `LieDerivation`. These do not supply the cyclic shuffle quotient or framed correlator coalgebra. |
| Group homology and resolutions | `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:226`, `groupHomology`; `Mathlib/CategoryTheory/Preadditive/Projective/Resolution.lean:41`, `CategoryTheory.ProjectiveResolution`; `Mathlib/CategoryTheory/Abelian/Projective/Resolution.lean:92`, `ProjectiveResolution.lift`. The last takes two projective resolutions, not an arbitrary acyclic flag target. |
| Number-field zeta/discriminant | `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:50`, `NumberField.dedekindZeta`, is the ideal-norm L-series; `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:36` and :41 give `NumberField.discr` and its nonvanishing. Thus the determinant's square-root denominator is nonzero. |
| Archimedean places | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean:102`, :188, :437 and :441: chosen `embedding`, `IsComplex`, `nrRealPlaces`, `nrComplexPlaces`. The two matrix indices use the same finite complex-place subtype. |
| Analytic definitions | `Mathlib/NumberTheory/Bernoulli.lean:197`, :207: `bernoulli` and `bernoulli_one=−1/2`; `Mathlib/Analysis/SpecialFunctions/Complex/Log.lean:30` and `Arg.lean:30`; `Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean:655`. These are actual total functions and the interval integral used by the simple analytic restatement. |
| Near-matches to headlines | `Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean:232`, `riemannZeta_four`; `Mathlib/NumberTheory/ZetaValues.lean:458`, `hasSum_zeta_four`; `Mathlib/NumberTheory/NumberField/Units/Regulator.lean:225` and :315, logarithmic unit regulator and its determinant; `Mathlib/RingTheory/Trace/Basic.lean:410`, `embeddingsMatrix`; `Mathlib/Analysis/SpecialFunctions/Complex/LogBounds.lean:67`, `logTaylor`. These concern scalar zeta evaluation, units, traces or logarithms, not polylogarithmic K₇-cycle determinants. |
| Existing mixed Hodge structures | `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72`, `TauCeti.Hodge.MixedHodgeStructure`; `Mixed/Category.lean:56`, `MixedHodgeStructureCat`; `Mixed/Abelian.lean:33`, its abelian instance; `Mixed/Strictness.lean:110`, `MixedHodgeStructure.Hom.range_inf_F_eq_map_F`; `Tate/Basic.lean:93`, `TauCeti.Hodge.tate`. The base structure has bounded filtrations and pure graded pieces, not frames, variations or a period map. Finite-dimensional good variations need their own usual finiteness conditions; these are not supplied by the bare native structure's fields. |

Object searches in both pinned trees and the available roadmap heads used polylogarithms, Bloch groups, cyclic shuffle coalgebras, special derivations, decorated flags, Grassmannian configurations, framed Hodge–Tate structures, correlators, scissors congruence, Stasheff complexes and regulators, rather than only proposed declaration names. The board package index was read: its other packages are AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory. `roadmaps grep` and `roadmaps show` supplied the main/open-head ownership evidence. FukayaTheory's compactified-disc associahedra do not construct the finite arithmetic cell complex here. No additional owner of the retained weight-four constructions appeared in those matches. R05 is the remaining imported-object claim; the generic flag foundations themselves have been moved to the correct supplier.

### Supplier resolution, gaps and merge order

Every supplier name and section in the Scope, contracts and Needs lines was resolved against main, or against the supplied current head of a new-roadmap pull request. No revision-only supplier was substituted for main. Locations below exclude the display tool's extra header line.

| Supplier | Sections consumed and current evidence |
| --- | --- |
| PolylogarithmFunctions, main | `TauCetiRoadmap/PolylogarithmFunctions/README.md:105`, :540, :625, :641, :697, :719, :806 resolve §§1.1, 4.2, 4.6–4.7, 5.1–5.2, 5.7: principal lower-cut polylogarithms, Bernoulli single-valued normalization, inversion/conjugation and five-term identity. Natural weights here specialize its formulas. |
| Polylogarithms, PR #1424 | `TauCetiRoadmap/Polylogarithms/README.md:136`, :152 resolve §§2.1–2.2: dilogarithm descent and rational primitive Hurewicz/rank filtration. Sections 3.1–3.3 at :310, :342, :377 supply explicit weight three, universal cycle tests and residues. §§3.4–3.7 at :397, :415, :500, :519 supply configurations, flags, ratios, duality and homology maps. The flag comparison is explicit at :400 and :406. |
| Polylogarithms, continued | Same file §§4.1–4.7 at :575, :598, :625, :642, :672, :691, :715 supply inductive groups, complexes, analytic descent, determinant/calibration, explicit cycles, obstruction, totally real theorem. Consumed current/regulator sections §5.1, §5.2, §5.4, §5.5, §5.9 are at :831, :852, :999, :1027, :1114. These are actual planned mathematical inputs, not sources cited in place of ownership. |
| K3BlochGroups, PR #1430 | `TauCetiRoadmap/K3BlochGroups/README.md:581`, :608, :682, :717, :806 resolve §§3.2–3.5 and 3.8: projective ratios, five-term relations, pre-Bloch group and boundary. Supplier boundary `x∧(1−x)` is explicitly negated by this package. Cross-ratio permutations are stated in its Conventions. |
| BorelRegulators, PR #1461 | `TauCetiRoadmap/BorelRegulators/README.md:170`, :266, :286, :639, :661, :723, :794 resolve §§1.1, 2.2–2.3, 5.3–5.4, 6.0a, 6.2. The covolume exponent at :663 is `dₙ−Nn`; signed comparison at :796 is `r_Bo=−2r_Be`. Tate division is part of the input, not an optional normalization (R01). |
| MotivicEtaleKTheory, PR #1470 | `TauCetiRoadmap/MotivicEtaleKTheory/README.md:397`, :420, :650 resolve §§3.3–3.4, 7.1: logarithmic Deligne realization and independent Chern character. Smooth separated finite-type complex varieties and all algebraic pullbacks are covered by the logarithmic complex; the K-character keeps its smooth quasi-projective hypothesis. At a point its weight-two projection is `4i` on `3+4i`, not `4`. |
| PeriodsAndSpecialValues, PR #1496 | `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:751`, :2084, :2189, :2210, :2230 resolve PS.3.0, PS.9.3, PS.9.8–PS.9.10. Tate-Hom comparison and tangential regularization exist; the latter motivic category/path-torsor targets are scoped to ℚ/ℤ and three punctures. The broader interfaces below are declared gaps, not falsely supplied facts. |
| MotivesAndAlgebraicCycles, PR #1313 | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:536`, :1116, :1130, :1149 resolve §3.6 and §§6.1–6.3: neutral fibers, reconstruction, Hopf algebra with antipode and functoriality. Layer 4 at :555 supplies geometric motives. The repaired citation no longer substitutes numerical semisimplicity for reconstruction. |
| HodgeStructures, completed main | `Completed/HodgeStructures/README.md:326`, Layer L2, with the pinned Tau Ceti implementations listed above. Frames, correlators and periods remain genuine additions here. |

All four gap slugs occur both in `design/plan.json` and the README's Exact supplier contracts. Their suppliers are named and earlier. The needs are coherent mathematical interfaces with hypotheses, rather than arbitrary assumptions containing this roadmap's conclusion:

- `trilog-specialization-closure`, Polylogarithms §3.1: algebraic closure under valuation-zero specialization of admissible coordinate relations over `F(t)`. Analytic functional equations do not already prove it.
- `mixed-tate-number-fields`, PeriodsAndSpecialValues PS.9.8–PS.9.9: the number-field mixed Tate heart and its compatible extension/primitive/Hodge-realization interface. The ℚ/ℤ supplier scope does not supply it for every number field.
- `punctured-line-path-torsors`, PeriodsAndSpecialValues PS.9.10: arbitrary finite punctures and tangential path torsors over a number field, with realizations and special-derivation action. The three-punctured supplier target is insufficient.
- `decorated-flag-lengths`, Polylogarithms §3.4: every `1≤k≤N`, pre-coinvariant acyclicity and comparison naturality/homotopy/stabilization. The basic flag target exists; this precise all-length interface is not redundant with `ProjectiveResolution.lift`.

No gap has supplier `none`, and none is treated as an unowned prerequisite merely because its implementation is future work. The gap declarations are consistent with the repair report. Acceptance would be conditional on these contracts, but this verdict is needs changes for independent defects.

The supplied head-based overlap ledger reports no conflicting head changing this package, no dropped cited id, and no citation defined only by an open revision. The five closest roadmaps—PRs #1424, #1461, #1496, #1430 and #1470—were inspected by object as above. There is no demonstrated old-to-new numbering defect to add. The package is not a roadmap on main whose existing target numbers were deleted. A live package-only overlap lookup cannot replace that supplied ledger; no successful fresh overlap computation is claimed. Fresh citation resolution reported no missing names, but its library scan was unavailable; the explicit local pin checks above supplied that missing part.

The mandated dependency check returned exactly:

```text
depcheck: 236 roadmaps, 2140 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Every external Needs edge was compared with the supplier sections above. No merge-order or content-repository edit was made.

## Not verifiable

- No cited text was inaccessible, and no missing-reference request is needed. G93's partly damaged OCR theorem label is described above; its page and equations are readable.
- The four declared supplier contracts are mathematical supply obligations, not existing implementations. Their wording and ownership were checked; their fulfillment cannot be tested at these pins.
- The degree-eight 8! numerical alternation and the symbolic-module dimensions were inherited only from round 2's recorded computed values. This round recomputed the sign/coefficient arithmetic and the changed raw-symbol, square, scissors, flag and period tests; it does not claim a fresh exhaustive numerical alternation.
- The inconsistent M20 integral and closed formulas do not certify an all-weight normalization. The explicit weight-two contradiction is proved in R01; an all-weight corrected integral formula remains for the fix worker to reconcile with the canonical period map.
- The supplied overlap ledger is the evidence for its mechanical categories. Ownership against the available open heads was checked; heads or files not supplied by the brief were not independently sought.

## Source issues

- **Error** in GR at (192), printed p.78, GR line 3600: the source places the trilogarithm derivative on the unit argument; it should differentiate the symbol argument and multiply by the unit logarithm; affects a stated result.
- **Error** in GR at §4.3, (95) and (99), printed pp.50–51, GR lines 2257 and 2284: the source doubles the edge normalization without doubling the square; it should give the square twice its displayed value with compatible orientation; affects a stated result.
- **Misprint** in GR at Lemma 3.13, printed p.43, GR line 1901: the source adds the exchanged tensor term; it should subtract that term for an exterior-square differential; affects the proof.
- **Misprint** in GR at Theorem 10.15(b), (244), printed p.106, GR lines 4808–4816: the source gives an unscaled target wedge; it should multiply it by `−84`, as the subsequent coefficient calculation requires; affects a stated result.
- **Error** in GR at Definition 2.3, printed p.29, GR line 1269: the source's weight-two image has the opposite cut cobracket; it should use the positive `(0,1,y)` correlator for its specified cut order; affects a stated result.
- **Error** in GR at Lemma 7.9, printed p.72, GR line 3341: the source asserts separate deletion vanishing; it should retain cancellation against the projection contribution; affects the proof.
- **Gap** in GR at Lemma 5.2(ii), printed p.54, GR lines 2423–2427: the source uses specialization to identify presentations; it should justify closure of the coordinate-relation subgroup under the required specializations; affects the proof.
- **Misprint** in GR at §1.2 item 3, printed p.14, GR line 581: the source assigns coefficient one to equal poles; it should assign coefficient three, agreeing with table (26) and its own cobracket calculation; affects nothing.
- **Misprint** in GR at §9.3 item 2, printed p.93, GR line 4228: the source varies first-row entry `k−1`; it should vary entry `k` under its one-based segment indexing; affects nothing.
- **Misprint** in GR at §9.3 item 2, printed p.93, GR line 4247: the source omits the double-symbol correction coefficient; it should include `−3/28` from the configuration map; affects nothing.
- **Error** in GR at §9.3 item 1 and footnote 24, printed pp.91–92, GR lines 4177–4185: the source uses `1/2` with its stated triple-ratio normalization; it should use `1/18` to recover G00's normalized map; affects a stated result.
- **Error** in GR at Theorem 1.2, printed p.5, GR lines 196–200: the source states an exact determinant equality for every number field; it should allow a nonzero rational multiplier when the determinant is empty, with multiplier `90` over ℚ in the package's direction; affects a stated result.
- **Error** in GR at Definition 10.7 and its evaluation, printed p.97, GR lines 4397–4412: the source evaluates a constant-free three-term quotient directly in `B₃`; it should evaluate in `B₃/ℚ[1]₃`, or apply the cobracket; affects a stated result.
- **Error** in G08 at Proposition 8.4, printed p.85, G08 line 3713: the source identifies the cyclic shuffle object with special derivations without removing pure length-two words; it should quotient their surviving weight-one kernel; affects a stated result.
- **Error** in G08 at §1.3, printed p.7, G08 lines 300–302: the source includes `K₁(F)` in a finite-rank formula; it should restrict that Borel rank formula to weights greater than one; affects a stated result.
- **Error** in M20 at (3), printed p.3, M20 lines 110–130: the source assigns value line `(2πi)⁻ⁿℝ` to its literal normalized tree integral; it should specify corrected integration factors, since ordinary integration in weight two gives a nonzero imaginary value; affects a stated result.
- **Error** in M20 at (4) and the example after (16), printed pp.4 and 18, M20 lines 145–148 and 889–895: the source gives incompatible dilogarithm coefficients differing by `−2`; it should use one normalization consistent with its corrected integral and canonical period comparison; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e9372f9f54db24876bae81746a9de35771d6677f", "job": "REV-PKG-ZagierConjecturePolylogarithms~3", "model": "gpt-6-astra", "worker": "chris-33"} -->
