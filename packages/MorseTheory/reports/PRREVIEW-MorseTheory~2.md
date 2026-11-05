# Review of MorseTheory (pull request #1682 at 929db4f)

**Verdict:** needs changes

AI-assisted independent review. Eleven findings, five blocking (two P1 and three P2). The gate fails. No pull-request files were changed. The new Palais–Smale arguments passed the mathematical tests below; this verdict also covers the existing content in the folder, as requested.

The supplied previous report identifies pull request #1094 at 65c6a14, not this pull request. I checked its nine findings individually against this head before the full review. “Repaired” below describes the present text, not an inferred repair history. No supplied repair report marks a finding settled as not actionable.

| Previous finding | Present passage/evidence | Status |
| --- | --- | --- |
| R01, unavailable Čech closed-pair supplier | The README ends with M6.1 and References; there is no M4.2, invariant compactum, or Čech closed-pair demand. | Repaired by absence of that target. The LS categorical-cover supplier that remains is on main. |
| R02, missing Morse inequalities | README:464 still gives “with Q∈ℕ[t]”; neither polynomial inequalities nor their non-statable justification appears in Suggested.lean. | Not repaired; R03 below. |
| R03, HTML anchor | The previous M4.2 anchor is absent; gate `residue=0`. | Repaired. |
| R04, competing Brown ownership | The standalone M4.1 and Brown ownership claim are absent. README:582–584 retains the two-handle sphere application, with a separate hypothesis defect (new R04). | Repaired as an ownership conflict. |
| R05, missing Golé reference | Neither the Golé citation nor its target remains. | Repaired by absence. |
| R06, padding | Suggested.lean:155 retains `criticalPoints_eq_setOf_mfderiv_eq_zero`; :245–255 retain the attainment and witness-independence statements. | Not repaired; all five previously identified declarations remain. R09 below. |
| R07, Lean form and hypotheses | Docstring:12 says “suggested forms, not an exhaustive checklist”; :135 adds second countability, whereas :122 does not. | Not repaired; R03/R11 below. This head’s admitted atlas also drops essential binders, R01. |
| R08, unresolved names | README:279 still names `MorseChart.linearFlow`; :651 still names `TauCeti.Manifold.riemannianGradient`; :484 names `lsCriticalPointBound` without a declaration. | Not repaired; R02/R11 below. |
| R09, README shape | README:750–753 still says “catalogued separately in the course-source audit”; there are no `*Needs:*` or `**Checks.**` lists. | Not repaired; R08/R10/R11 below. |

## R01 (P1) — The admitted atlas has an impossible, overly general type

**Location:** `TauCetiRoadmap/MorseTheory/Suggested.lean:36–40`: “`noncomputable def scalarRegularLevelChartedSpace` … `:= by sorry`”. Its dependent statements are at lines 42–80.

**Claim:** Regularity constructs a level atlas modelled on `Fin (Module.finrank ℝ E - 1) → ℝ`. This is admitted data, which the gate forbids. Worse, the elaborated definition drops `FiniteDimensional`, `I.Boundaryless`, `T2Space`, and `IsManifold`: these section variables are absent from its type.

**Witness:** Take E=M=ℝ×ℓ²(ℕ), f=first projection and c=0. The derivative is surjective, but finrank E=0. The claimed atlas models the nondiscrete level ℓ² on a point, forcing discreteness.

**Repair:** Delete the admitted definition and every signature referring to it. Keep the construction and its formulas in the README. State the existing existential `exists_scalarRegularLevelData` directly with `sorry` and the finite-dimensional, boundaryless hypotheses; it needs no admitted atlas. The ℓ² instance is then excluded, whereas f(x,y)=x on ℝ² still has level ℝ, tangent range ker(df)=span(e₂), as intended. An eventual implemented constructor must explicitly retain its required binders. Gate failure `sorry-data=1` is covered here.

## R02 (P1) — Several claimed native suppliers do not exist at the pins

**Location:** `TauCetiRoadmap/MorseTheory/README.md:110–111`, :276–283 and :651–657. Representative claim: “Consume `TauCeti.Manifold.riemannianGradient`”.

**Claim:** Native manifold Morse charts, their critical-point comparison and pseudo-gradient flows, and that named gradient are available inputs.

**Witness:** Tau Ceti a91d3aaf has no `Geometry/Manifold/Morse/Lemma.lean` or `Morse/PseudoGradient/` directory. Searches at both pins return no `MorseChart.linearFlow`, `MorseChart.mfderiv_eq_zero_iff`, or `TauCeti.Manifold.riemannianGradient`.

The e8375e4f links identify later work; they do not make that work an available supplier at this pin. The text around lines 37–40 acknowledges a distinction but still consumes those unavailable APIs in M1/M2. This is supplier drift under the brief's rule, not a failed build: Suggested.lean avoids those imports. The gradient has an actual roadmap owner: DifferentialGeometry §12.2 names `mgradient`, its chain rule, smoothness and flat-model comparison at main lines 918–919.

**Repair:** Cite DifferentialGeometry §12.2 for the gradient, and replace the unavailable native chart/pseudo-gradient inputs with explicitly owned construction targets, building from pinned `IsNondegenerateCriticalPoint.exists_morse_chart` and DifferentialGeometry §3 flows. Preserve the general chart and flow theory. The flat test f=x² must give gradient 2x and descending flow x₀ exp(−2t); the normalized chart still has Hessian 2. Do not resolve this by waiting for another library revision or silently treating an unpinned commit as the pin.

## R03 (P2) — The acceptance test omits statable headline results

**Location:** `TauCetiRoadmap/MorseTheory/README.md:460–478`: “`Σ c_j t^j = Σ b_j t^j + (1+t)Q(t)`, with Q∈ℕ[t]”; Suggested.lean:11–19 and :265; `PalaisSmaleTargets.lean:47–54`.

**Claim:** Suggested.lean should test the finished roadmap's deep results at the pins. It omits the strong Morse inequalities, proper bounded-below Morse exhaustion existence, and sphere conclusion. The new flow-convergence headline is statable—this PR states it in the other file—but absent from the designated acceptance module. Neither module docstring lists the omitted headlines and their missing carriers.

**Witness:** Mathlib `singularHomologyFunctor` (`Mathlib/AlgebraicTopology/SingularHomology/Basic.lean:52`) returns actual homology objects; `Module.finrank`, `Polynomial ℕ`, `IsProperMap` and native spheres exist. `criticalCount` and `TauCeti.IsMorse` already occur in Suggested.lean.

**Repair:** Add the statable headlines, with their actual objects and exact hypotheses, to the appropriate roadmap's Suggested.lean (R05 applies to the extension). Use a small real-bodied Betti-number definition on `ModuleCat k` if needed. State the full strong inequality, not only its weak corollary. Name each genuinely non-statable headline and the missing carrier in the module docstring. Recheck S²: C=B=1+t², Q=0; and RP² over ℚ: C=1+t+t², B=1, Q=t. The latter distinguishes the full polynomial claim from an incorrect perfectness assertion. Exhaustion existence includes the empty manifold; the sphere result must keep connectedness, positive dimension and whichever critical-point hypotheses its actual proof establishes.

## R04 (P2) — The two-handle sphere proof needs a Morse hypothesis

**Location:** `TauCetiRoadmap/MorseTheory/README.md:581–584`: “closed connected positive-dimensional M with exactly two critical points is homeomorphic to a sphere. The last conclusion follows from two disc handles”.

**Claim:** The specified two-handle route proves the statement without a nondegeneracy hypothesis on the function.

**Witness:** On S² let h be height and f=h−h³/3. Then df=(1−h²)dh vanishes only at the two poles, but both critical Hessians are zero. M2's nondegenerate handle theorem cannot apply.

The topological conclusion is not refuted by this example. The defect is the missing hypothesis of the claimed proof route: Cohen–Iga–Norbury Application 5.13, printed p.43 (`cohen-iga-norbury` lines 1617–1643), explicitly assumes a Morse function and invokes the Morse lemma at both extrema.

**Repair:** State this two-handle application for a Morse function with exactly two critical points and cite Application 5.13 p.43. This matches the cited source's full scope: ordinary height qualifies, whereas h−h³/3 does not. If the broader arbitrary-function Reeb theorem is retained as an additional target, give it its own construction and source rather than feeding degenerate extrema to M2. Do not silently regard the LS arbitrary-function discussion as supplying Morse handles.

## R05 (P2) — Put the new nonproper theory in a Part II extension

**Location:** `TauCetiRoadmap/MorseTheory/README.md:682–708`: “Palais–Smale compactness without properness” and “This is a new noncompact corollary of M2's construction”.

**Claim:** The new condition, noncompact deformation theorem and nonproper convergence theory extend the existing roadmap in place.

**Witness:** Main already contains MorseTheory M1–M6, including the compact-trapped theorem at lines 649–680. The diff adds M6.1 and PalaisSmaleTargets.lean; it does not merely correct an existing theorem's formulation.

**Repair:** Move this added development into MorseTheoryPartII, beginning with the exact boundary of MorseTheory M2/M6 and importing those sections by name. Preserve the complete finite-dimensional Riemannian scope and the new nonproper results. No need to restate the base roadmap. This is repairable organization, not grounds to reject the mathematics. The distinction is witnessed by f(x,y)=x on ℝ²: its critical-free band is noncompact, PS holds vacuously, and the new complete-metric argument applies where the base compact-band premise does not.

## R06 (P3) — Both Lean files violate the import form

**Location:** `TauCetiRoadmap/MorseTheory/Suggested.lean:1–9` and `TauCetiRoadmap/MorseTheory/PalaisSmaleTargets.lean:1–4`.

**Claim:** The required header is a single `import Mathlib`, then only used individual `TauCeti.*` modules.

**Witness:** Suggested.lean starts with a Tau Ceti import and six `Mathlib.*` imports; PalaisSmaleTargets.lean has three `Mathlib.*` imports and no `import Mathlib`.

**Repair:** Replace the Mathlib subimports in each retained file with `import Mathlib` as its first line and retain only needed Tau Ceti imports. This covers all three gate rules: `imports=1`, `mathlib-subimports=6`, `no-import-mathlib=1`; the extra file has the same independently checked defect. Re-elaborate the retained statements, including the zero-dimensional cases in the table.

## R07 (P3) — Replace the two commit-pinned roadmap links

**Location:** `TauCetiRoadmap/MorseTheory/README.md:241` and :585: the DifferentialGeometry §5.1 and ComplexKahlerGeometry K7 links.

**Claim:** Roadmap suppliers should be cited by their main section, not an immutable snapshot of the roadmap repository.

**Witness:** The gate reports `blob=2`. Both cited contracts exist on main: DifferentialGeometry:507–510 and ComplexKahlerGeometry:1407–1460.

**Repair:** Use repository-relative links and the same section names. Preserve the outward-first sign and projective real-model conventions: the interval's outgoing endpoint is positive, and CP¹ has critical indices 0 and 2. No contract change is needed.

## R08 (P3) — Remove pull-request and process references

**Location:** `TauCetiRoadmap/MorseTheory/README.md:646`: “Riemannian/PR284 path”; :751–752: “catalogued separately in the course-source audit”. Also the pull link at :77 and `#279` at :587.

**Claim:** These identify work through transient review identifiers rather than mathematical ownership and bibliographic locators.

**Witness:** Gate `prnum=1` points to line 646; the remaining text is directly visible in the README.

**Repair:** Name RiemannianGeometry R3 and HomotopySpheres §4B; identify ComplexManifolds' real-restriction interface by roadmap and milestone; replace the course-audit reference with an actual course-source citation. The mathematical examples and supplier direction stay the same.

## R09 (P3) — Delete the retained padding

**Location:** `TauCetiRoadmap/MorseTheory/Suggested.lean:97–100`, :155–158, :233–236, :246–255.

**Claim:** These are headline acceptance statements.

**Witness:** `criticalPoints_eq_setOf_mfderiv_eq_zero` closes with `rfl` in a scratch copy. `minimumCriticalCount_independent` is already `rfl`; attainment is `Nat.find_spec`; nonemptiness unpacks the witness; `criticalCount_ne_top` is a finiteness boundary corollary.

**Repair:** Delete these five declarations from Suggested.lean; keep their mathematical content in the README. Do not prove them in place. If the minimum is retained for a genuine headline, inline its elementary existence argument or use a simpler real-bodied minimum definition. The witness-independence check still gives 2=2 on S¹, and compact critical counts remain finite without a separate acceptance theorem for that boundary fact.

## R10 (P3) — Supply exact source locators, starting with the seeded LS target

**Location:** `TauCetiRoadmap/MorseTheory/README.md:481–500`, :742–743 and :745–755. The sample's only title is “Arbitrary-function Lusternik–Schnirelmann inequality”; no source, theorem number or page follows it.

**Claim:** The README attributes exact claims to checkable source locations. It does not provide a locator for the sampled LS theorem. “Classical part” and Milnor “§§2–6” also do not locate many individual claims. Morgan §1.3 defines Condition (C); the deformation result is in §1.4.

**Witness:** In the legal author copy, Weber Theorem 1.1, printed p.2 (`weber-conley` lines 65–76), proves the C² closed-manifold critical-point bound using the unnormalized open-cover convention. Morgan Proposition 1.8, pp.6–7, is in §1.4.

**Repair:** Cite Weber's author version, Theorem 1.1 p.2, explicitly translating its category to `lsCategoryCount`; keep the empty convention as a separate zero calculation. Cite Morgan Definition 1.6/Remark 1.7 p.6 for the sequential condition and Proposition 1.8 pp.6–7 for critical-free bands. Give exact locators for the remaining targets and bibliographic identity for the course notes. Add the author's source records; this review changes no manifest. The LS checks give 0≤0 for empty M, 2≤2 for S¹ height, 3≤4 for the standard torus Morse function, and 2≤∞ for a constant on S¹.

## R11 (P3) — Restore the required definition APIs, Checks and module documentation

**Location:** `TauCetiRoadmap/MorseTheory/README.md:1–10`, :432–437, :613–623 and :684–706; both Lean module docstrings.

**Claim:** Each definition needs a usable API, at least three discriminating Checks and explicit dependencies; the acceptance files need the headline/missing-carrier explanation and documented declarations.

**Witness:** There are zero `*Needs:*` lines, zero `**Checks.**` lists, no per-layer Examples/Dependencies, and no exact-supplier-contract section. M6.1 has only the escaping-exponential example. Several Suggested.lean declarations lack docstrings; `lsCriticalPointBound` is named but undeclared.

**Repair:** Restructure the README into the specified form, preserving its substantive development. Give the PS definition an API for value-band equivalence, metric comparison, properness and critical compactness, and Checks f=x² (PS), f=x on ℝ² (PS, nonproper), and f=e^(−x) (not PS). Add the analogous discriminating tests to each other definition, exact per-target Needs lines and the missing module documentation. Match Lean names to README names. For retained theorem signatures either carry the standing second-countability convention consistently or explicitly state the broader theorem's scope. The signature audit makes the distinction visible; it is not a mathematical counterexample to the broader compact-band theorem.

## Verified sound

The evidence comprises 102 adversarial rows, 35 elaborated declaration signatures, 21 admitted theorem probes, 22 pinned-library audit entries and 14 resolved cross-roadmap citation groups. These are finite adversarial tests and inspected proof inputs, not proofs of admitted theorems. They cover every explicit Lean declaration and each mathematical target family in M1–M6.1. Several rows deliberately test missing hypotheses. Only R01 supplies a false quantified Lean construction; no counterexample was found to the intended finite-dimensional Palais–Smale results.

**Gate, build and signatures.** The worktree head is 929db4fba91b28f59cbe9ad33341c184b8472559. Pins inspected: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Context main is fa41b3747f56d4e77bd69e7099c1be4f2e4959ba. The outside-folder diff is empty. The supplied gate has `build=0`; the local rerun reproduces the text failures and exits before the build. Its summary is:

```text
gate MorseTheory: set_option=0 blob=2 latex=0 tex=0 prnum=1 sorry-data=1 sorry-examples=0 residue=0 private-paths=0 imports=1 mathlib-subimports=6 no-import-mathlib=1 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
```

Built the missing `TauCeti.Analysis.Calculus.Morse.NormalForm` object with its targeted module build. Then ran the prescribed `lake env lean` elaboration on Suggested.lean and PalaisSmaleTargets.lean sequentially: exit 0 for each, respectively 18 and 4 sorry warnings, no other diagnostic. Suggested's 18 comprise one data definition and 17 theorems.

Scratch copies appended `#check @name` for all 30 declarations in Suggested and all 5 in PalaisSmaleTargets; both elaborated. R01 records the substantive lost binders. The real-bodied critical-set/count definitions retain only the structures their types need; their smooth/Morse theorems retain those hypotheses. `PalaisSmale.Satisfies` drops finite dimensionality but retains `CompleteSpace` because native `gradient` requires it; the four PS theorems retain finite dimensionality, completeness, and their stated hypotheses. This broad predicate is meaningful; the finite-dimensional conclusions are not silently generalized. No file was edited to change a signature.

The one-tactic probe tried `rfl`, closing `simp`, and `infer_instance` on all 21 admitted theorem statements, plus the admitted data site. Only the derivative-zero-locus equality closed. A separate direct `rfl` copy confirmed it. All four new PS theorems survived; no claim is made that failure of those tactics proves depth. The four other padding items in R09 were checked by reading their definitions and proofs, rather than treating a failed tactic search as evidence of necessity.

**Adversarial table (102 rows).** “Retain” means the tested instance supports the stated intended scope; it does not erase the source/form findings. `C(t)` denotes the critical-count polynomial and `B(t)` the relevant Betti polynomial. Distances and gradients below are Euclidean unless a metric is specified.

| Statement / location | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Standing Morse convention, README:12–16 | f=x on ℝ; constant on ℝ; function on a point | x has no critical points, hence is Morse but not bounded below; constant has Hessian 0 and is not Morse; the 0×0 Hessian on a point is invertible | Properness/PS must remain separate | Retain |
| Boundaryless model transport, :41–57 | H=E=ℝ², I=id; translated chart c(x)=x−p | I∘c=c; inverse transport gives c; derivative comparison is id∘df∘id=df | Correct transport convention | Retain; construction remains owned here |
| Intrinsic critical Hessian, :92–101 | f=x²−y² at 0; chart (x,y)=(2u,3v) | Hess=diag(2,−2); transported Hess=diag(8,−18)=Aᵀ Hess A | Congruence preserves negative rank 1 | Retain |
| Noncritical connection dependence, :99–101 | f=x at 0; connection coefficient Γ=0 versus Γ=1 | Hess(f)=f''−Γ f'=0 versus −1; df=1 | Criticality is necessary for connection independence | Add explicit Check under R11 |
| Complementary index and bound, :98 | q=−x²+y² and q=−x² on ℝ²/ℝ; zero space | 1+1=2; 0+1=1; 0+0=0 | Nondegenerate native index law applies | Consume pinned law |
| Product index, :99 | −x² plus y², then −x² plus −y² | indices 1+0=1; 1+1=2 | Sign and direct-sum convention agree | Consume pinned law |
| Restriction/positivity tests, :100–101 | q=−x²+y² on span(e₁), span(e₂), span(1,1) | q-values −1, +1, 0; restricted negative indices 1,0,0 | Restriction need not remain nondegenerate | Add those Checks |
| Normalized Morse chart, :103–107; Lean:103 | f=x²; q=−x²+y² | native expression (1/2)·2x²=x²; normalized coordinates give q(1,2)=3 and Hess diag(−2,2) | Correct factor/sign | Retain |
| Critical isolation and extremum/saddle, :107–109 | x², −x², x²−y² at 0 | df=0 only at 0; values at ε are +ε², −ε²; saddle has both signs | Discriminates minimum, maximum and saddle | Retain |
| Compact critical finiteness, Lean:92 | f=x² on [−1,1]; 1−cos x on [−2π,2π] | critical intersections {0}, cardinal 1; {−2π,−π,0,π,2π}, cardinal 5 | Global Morse and compactness suffice | Retain |
| Persistence/branch dependence, :117–120 | f_s=x²+s x; birth-death g_s=x³−s x | p_s=−s/2, value −s²/4, Hess=2; g_s has 0/1 degenerate/2 critical points for s<0/=0/>0 | Nondegenerate persistence, not arbitrary-family persistence | Retain |
| `criticalPoints`, Lean:86 | x²; x; constant 0 | sets {0}, ∅, ℝ from df=2x,1,0 | Body uses native derivative, no hidden finiteness | Retain |
| `criticalCount`, Lean:89 | x²; constant on S¹; j=2 on a 1-manifold | count at index 0 is 1; constant has count ∞ at index 0; out-of-range count 0 | Extended count avoids Nat.card junk value | Retain |
| `criticalCount_ne_top`, Lean:97 | height on S¹, j=0,1,2 | counts 1,1,0, each ≠∞ | True boundary consequence | Delete from Lean, R09 |
| Proper bounded-below sublevel finiteness, Lean:116 | x², b=−1/0/1 | sublevels ∅/{0}/[−1,1]; critical intersections cardinal 0/1/1 | Lower bound and properness used correctly | Retain |
| Named regular-level atlas, Lean:36 | projection ℝ²→ℝ; ℝ×ℓ²→ℝ | level dimensions 1 and infinite; claimed model dimensions 2−1=1 and 0−1=0 | Infinite-dimensional instance refutes elaborated definition | R01 |
| Scalar-level manifold theorem, Lean:42 | f=x on ℝ at c=0; dimension-0 regular value c outside image | first level is one point, Fin(1−1)=Fin 0; second level ∅, Fin(0−1)=Fin 0 | Intended finite-dimensional cases agree | Remove dependence on admitted data |
| Scalar-level smooth embedding, Lean:49 | f(x,y)=x, level 0 | inclusion y↦(0,y), derivative v↦(0,v), injective | Ordinary embedded hyperplane | Retain existential form |
| Scalar-level tangent range, Lean:58 | same projection | range(d inclusion)={0}×ℝ=ker(df) | Both inclusions checked directly | Retain existential form |
| `exists_scalarRegularLevelData`, Lean:68 | projection; f≡0 at regular level c=1 | explicit line atlas and tangent equality; empty level with empty atlas | Existential statement is statable without chosen data | Admit this theorem directly, R01 |
| Same-complement chart formula, :163–197 | D(x,y)=x; π(x,y)=(0,y) | L(x,y)=(x,(0,y)); L⁻¹(0,(0,y))=(0,y); level chart sends (0,y) to y | Named projection is consistent throughout | Retain |
| Boundary and band atlas signs, :199–252 | f=x, M_a=(−∞,a], band [a,b] | inward coordinates a−x,x−a,b−x are ≥0; at boundary 0; level dimension 0 | Correct endpoint signs and Fin reindexing | Retain |
| Outward-first orientation, :241–247 | oriented [a,b] | outward vectors −∂x at a, +∂x at b; boundary coefficients −1,+1 | Agrees with DG §5.1 | Retain |
| Zero-dimensional regular bands, :248–252 | finite discrete M, constant values 0 and 2, band [1,3] | point of value 2 has df=0; regular endpoints but interior critical point; no-critical version forces cardinal 0 | Regular endpoints alone do not make band empty | Retain |
| Compact-band homotopy equivalence, Lean:122 | x² on [a,b]=[1,4] | M_a=[−1,1], M_b=[−2,2]; inclusion followed by clipping has r(i(x))=x | Conclusion is inclusion-induced | Retain |
| `sublevelInclusion`, Lean:129 | x², a=1,b=4; a=b | x maps to the same x; equality case is id | Real body, transitivity of ≤ | Keep only as needed by headline |
| Strong deformation, Lean:135 | preceding intervals | r(x)=max(−1,min(1,x)); H_t(x)=(1−t)r(x)+t x; H_t(x)=x on [−1,1] | Homotopy direction matches Lean | Retain |
| Regular-band product and endpoint homeomorphism, :261–271 | x² band [1,4] | two intervals [−2,−1]⊔[1,2] map to {−1,1}×[1,4]; x↦x/2 sends levels 4→1 | Product and endpoint claims distinct from retract | Retain |
| Small minimum/maximum discs, :268–271 | ±(x²+y²), small ε>0 | minimum sublevel is radius √ε disk; maximum superlevel is same disk | Need Morse extremum for disc route | Retain explicit Morse scope |
| Pseudo-gradient rescaling and energy, :276–291 | f=x² on [1,4] | −grad=−2x; normalized field=−1/(2x); df(X)=−1; original energy derivative=−4x² | Rescaling only away from zero | Correct math, supplier repair R02 |
| One-critical handle/cell attachment, :293–308 | x² on ℝ; −x² near 0; empty 0-cell boundary | minimum adds D⁰×D¹; maximum adds D¹ with S⁰ boundary; λ=0 boundary ∅ | Handles, cells and boundary cases distinguished | Retain |
| Attaching/characteristic maps, :310–316 | q=−x², c=0 | χ(w)=√ε w; q(χ(±1))=−ε, disk values in [−ε,0] | Pair domains correct | Retain |
| Milnor comparison seams, :317–331 | λ=1, h=−id, α₁=α₀∘h | r=1/2: target boundary hθ=H(θ,1); r=1: H(θ,0)=α₁θ | Formula agrees at both identifications | Retain; book locator not certified |
| Pair-homotopy independence, :325–334 | strict identity transition; reflection twice | Φ₀E=Φ₁ for strict case up to radial compression; (−1)(−1)=+1 | Endpoint maps determine relative class through Φ₀ inverse | Retain; not arbitrary boundary homotopy |
| Polar comparison and positive contraction, :346–356 | O(1,1) boost A=[[cosh s,sinh s],[sinh s,cosh s]] | Q(A(x,0))=−x²; A_uu=cosh s≥1, polar h=1; deleting positive coordinate gives −cosh²(s)x²≤−x² | Correct direction of level decrease | Retain |
| Scaled chart homotopy, :351–356 | linear boost T=A; identity | T(tx)/t=A x for t>0 and at t=0; Q stays −x² | Limit formula and denominator extension agree | Retain |
| Outer-annulus tracks, :357–370 | radial q=−x²; δ<√ε | initial outer level −ε stays fixed under R; final R₁(inner circle) reaches ≤−ε; β(inner)=0, β(outer)=1 | Both seams and lower-sublevel condition agree | Retain |
| Orientation comparison, :371–378 | λ=0,1,2; h reflection | λ=0 det=1 and ∂D⁰=∅; λ=1 swaps ±1; λ=2 degree −1 | Negative/positive determinant distinctions survive low rank | Retain |
| Metric and unequal ε comparisons, :377–385 | fixed chart; ε₀=1/4, ε₁=1 for −x² | h=id for metric change; retraction sends radius 1/2 boundary outward to radius 1; lower sublevels satisfy M_(−1)⊂M_(−1/4) | Retraction direction is correct | Retain |
| Compact parameter families, :335–344 | P=[0,1], charts y↦a(s)y with 1≤a≤2 in compatible quadratic data | positive lower scale 1, upper scale 2; restriction to {0} retains same bounds | Compactness permits uniform choices; no arbitrary extension claim | Retain |
| Double-well Check, :388–393 | f=(x²−1)², c=1, ε=1/2 | r=√(1−1/√2); f(±r)=1/2; α₊(1)=r and α₋(1)=−r are in different components | Label-fixed homotopy fails; reflection repairs it | Retain |
| RP² attaching-degree Check, :394–400 | normalized negative disk, reflected first coordinate | counterclockwise boundary maps twice around θ mod π: degree +2; reflection gives −2 | Correct signs and nonhomotopy | Retain |
| Iterated CW model, :402–428 | x² on ℝ; Morse height on S² | one 0-cell gives contractible ℝ model; S² gives one 0- and one 2-cell; successive restrictions keep old map | Exhaustion and finite model examples agree | Retain |
| Strong C^k and smooth topology, :432–437 | M=S¹; M=ℝ and bumps of amplitude 1 translated to n | compact case finite seminorms; translated bumps tend to 0 on each fixed compact but violate global tolerance 1/2 | Discriminates strong from weak topology | Add Check under R11 |
| Morse approximation, :438–445 | zero function on S¹; x² on ℝ | ε cos θ has critical points 0,π, Hessians −ε,+ε; x² needs zero perturbation | Handles degenerate input without restricting output | Retain |
| Properness under C⁰ error, :447–449 | f=x², bounded perturbation h with sup norm <1 | g⁻¹([a,b])⊂f⁻¹([a−1,b+1]); g≥−1 | Compact inverse image and lower bound follow | Retain |
| Proper Morse exhaustion existence, :448–450 | point, empty M, ℝ | constant 0 proper on point/empty; x² proper on ℝ with lower bound 0 | All statable carrier cases | Add headline, R03 |
| Relative approximation, :450–456 | f=x² fixed near closed A={0}; perturbation supported outside [−1,1] | g=f on [−1,1]; Hess at 0 remains 2 | Relative target respects protected neighborhood | Retain |
| Strong inequalities, :460–469 | S²; T²; RP² over ℚ | C=B=1+t²; C=B=1+2t+t²; RP² C=1+t+t²=B+(1+t)t | Q=0,0,t in ℕ[t] | Add headline, R03 |
| Weak/Euler insufficiency Check, :578–581 | formal b=(1,0,1), c=(2,0,2,2) | c≥b; alternating sums 2=2; c₁−c₀=−2<−1=b₁−b₀; quotient Q=1−t+2t² | A negative Q coefficient is detected | Retain as Check only |
| Relative inequalities, :469–471 | (D²,S¹); interval with incoming one endpoint | relative B=t² and one index-2 cell gives C=t²,Q=0; interval pair is acyclic, no critical point C=B=0 | Relative, not absolute Betti numbers | Retain |
| Arbitrary-rank subgroup freeness, :473–475 | 2ℤ⊂ℤ; ⊕ℕ2ℤ⊂⊕ℕℤ | bases {2} and {2e_n}; ranks 1 and ℵ₀ | Finite PID theorem alone does not cover arbitrary rank | General extension remains owned here |
| Top homology versus top cohomology, :476–479 | RP² integral cellular complex | d₂=2,d₁=0; H₂=0 free; H²=ℤ/2 not free; H³=0 | Correct distinction and upper vanishing | Retain |
| Sampled LS inequality, :481–500 | empty; point; S¹ height; T² cosine | category counts 0,1,2,3; critical counts 0,1,2,4; hence 0≤0,1≤1,2≤2,3≤4 | Arbitrary-function theorem supported by Weber | Add exact locator, R10 |
| Cup-length normalization, :494–498 | S¹ over ℤ and zero ring; T² over ℤ | cup lengths 1,0,2; normalized categories 1,1,2; inequalities 2≤2,1≤2,3≤3 | Zero ring handled by empty-supremum convention | Retain |
| Infinite critical count, `totalCriticalCount`, Lean:151 | constant on S¹; x² on ℝ | encards ∞ and 1; LS comparison 2≤∞ | No finite-cardinality junk | Retain |
| Component sum and derivative restriction, :502–512 | S¹⊔S¹; discrete two-point M | category 2+2=4, height critical count 2+2=4; discrete category=critical count=2 | A categorical set cannot join different components | Retain |
| Derivative-zero-locus equality, Lean:155 | x² and x | both loci {0} and ∅; wrappers reduce definitionally | `rfl` succeeds | Delete padding, R09 |
| Fermat, Lean:161 | x⁴ at 0; f=x on [0,1] | derivative 0 at degenerate minimum; boundary example derivative 1 | Boundaryless condition matters | Retain |
| Compact critical nonemptiness, Lean:166 | point; S¹ height; empty manifold | counts 1,2,0; Nonempty premise excludes last | Correct empty exclusion | Keep only if needed, not a replacement headline |
| Degenerate critical-level deformation, Lean:172 | f=(1−cos θ)² at minimum 0; small U | Hess at 0=0; outside U, f has positive minimum m; choose ε<m so {f≤ε}⊂U, identity endpoint works there | Degeneracy allowed; no Morse lemma used | Retain |
| Ambient no-critical deformation, Lean:187 | height z on S², a=−1/4,b=1/4,δ=1/4 | critical values ±1 outside buffer [−1/2,1/2]; band descent has strictly positive speed; common time gives value <−1/4 | Strict/open target is attainable | Retain |
| Categorical cover, Lean:199 | empty, point, S¹ height | index sizes 0,1,2; empty union covers ∅; point covers itself; two punctured arcs cover circle | Exactly critical-count cover handles empty case | Retain |
| `finiteSmoothCriticalCounts`, Lean:209 | point; S¹ | sets {1} and counts containing 2; no count 0 on S¹ | Actual smooth finite-critical witnesses | Retain only as headline support |
| `MorseFiniteWitness`, Lean:214 | x²; constant on S¹ | x² is Morse with critical set {0}, so witness; constant fails Morse and finiteness | Structure fields exclude wrong model | Retain only as needed |
| `morseFiniteWitnessOfMorse`, Lean:220 | S¹ height | function unchanged, Morse retained, critical cardinal 2 | Wrapper constructs real data from theorem | Retain only as needed |
| `nonempty_morseFiniteWitness`, Lean:229 | empty; compact point; S¹ | witnesses have critical counts 0,1,2 | M3 existence supplies actual function | Retain |
| `finiteSmoothCriticalCounts_nonempty`, Lean:234 | those witnesses | explicit members 0,1,2 of corresponding sets | Unpacks witness | Delete padding, R09 |
| `minimumCriticalCount`, Lean:240 | point; S¹ | Nat.find chooses 1 and 2, not Morse-only restricted infimum | Concrete minimum once nonempty | Retain only as needed |
| Minimum attainment/independence, Lean:245–255 | S¹ with height and height plus constant | attained counts 2; minima 2=2 | `Nat.find_spec` and `rfl` | Delete padding, R09 |
| Extended infimum, Lean:258 | S¹ with finite-count height and infinite-count constant | inf{2,…,∞}=2; point inf{1}=1 | Infinite counts cannot lower finite minimum | Retain only if treated as headline |
| Reeb sphere application, :581–584 | Morse height on S¹/S²; f=h−h³/3 on S² | height has two nondegenerate extrema; f also has exactly two critical points but Hessians 0,0 | Two-handle proof handles height, not the degenerate input | R03/R04 |
| CPⁿ moment function, :585–600 | n=0,1,2; scale z↦αz | numerator/denominator both scale by ∣α∣²>0; critical values 0,…,n; indices 0,2,…,2n | Representative independence and index signs | Retain |
| Count/Euler parity and opposite function, :601–604 | T² cosine; S³ height | totals 4 and 2; χ=0 for both; parity 0=0; S³ indices swap 0↔3 | No false symmetry of a single function claimed | Retain |
| RP² perfection obstruction, :605–609 | quadratic coordinate function, ℚ versus F₂ | c=(1,1,1); b_ℚ=(1,0,0), b_F₂=(1,1,1); π₁=ℤ/2 needs a 1-cell | Not perfect over ℚ, perfect over F₂ | Retain |
| Morse–Bott definition and normal Hessian, :613–616 | f(x,y)=x²; f=x⁴ | crit={x=0} for both; first Hess kernel=span(e_y)=TC; second kernel=ℝ²≠TC | Excludes degenerate wrong model | Add definition Checks |
| Negative/positive bundles, :617–623 | diag(−1,1); same form with positive metric G=diag(2,3) | G⁻¹H has eigenvalues −1/2,1/3; negative rank remains 1 | Metric changes spectral realization, not inertia | Retain |
| Smooth square root, :621–623 | B=diag(4,9), transition swapping coordinates | B^(1/2)=diag(2,3); inverse root diag(1/2,1/3); conjugation swaps both entries | No eigenbasis choice required | Retain |
| Parametric congruence/normal form, :625–631 | f_b(x)=a(b)x², a(b)>0 | coordinate y=√a(b)x gives f_b=y²; at a=0 inverse root undefined | Nondegenerate normal family essential | Retain |
| Negative disk-bundle attachment and Thom shift, :632–637 | trivial negative line over S¹; Möbius negative line | trivial pair has integral relative H₁=ℤ,H₂=ℤ; Möbius pair H₁=ℤ/2,H₂=0, from sign coefficients | Untwisted formula would be false | Retain local coefficients |
| Morse–Bott spectral sequence/inequalities, :639–644 | constant on connected compact M; isolated Morse points | normal rank 0 gives one filtration block E₁=H*(M), Q=0; points contribute t^λ | Rank-0 and Morse specializations agree | Retain |
| Hamiltonian even-index convention, :645–647 | circle action on CP¹ | critical negative real ranks 0 and 2 | Complex negative directions double real dimension | Supplier is consumer application, not base prerequisite |
| Compact-trapped convergence, :660–666 | f=x²; saddle f=x²−y² on stable line y=0 | x(t)=x₀e^(−2t), omega-limit {0}; saddle stable line has same limit | Finite critical set route fits Morse scope | Retain with explicit hypotheses |
| Local Morse gradient inequality, :668–670 | f=x² and saddle x²−y² | ∣f−f(0)∣≤x²+y²=(1/4)‖grad f‖²; gradient norm=2 distance | Works at saddles without local positivity | Retain |
| Energy, tail and exponential estimates, :670–674 | x(t)=e^(−2t) | E=e^(−4t), −E'=4e^(−4t)=‖grad f‖²; tail length=e^(−2t)=√E | Rate and square root agree | Retain |
| Equilibrium and degenerate negative control, :674 | x₀=0 for x²; x'=−4x³ with x₀=1 | equilibrium distance=0; x⁴ flow x=(1+8t)^(−1/2), no exponential bound | Nondegeneracy required for Morse rate | Make hypothesis explicit in documentation |
| PS sequential definition, README:686; Lean:23 | x²; x on ℝ²; e^(−x) | grad norm→0 for x² forces x→0; x has grad norm 1 so premise impossible; at n, e^(−n)→0 but n diverges | Positive, nonproper positive, and negative controls | Add three Checks |
| PS global/band equivalence, :688–690 | sequence with ∣f(x_n)∣≤C; empty band a>b | all values lie in [−C,C]; no sequence can lie in empty band | Both quantifier directions immediate from bounded interval | Retain API |
| Metric-change condition, :690–691 | f=x on ℝ; g=dx² versus g'=e^(x²)dx² | grad norms 1 versus e^(−x²/2); on [a,b] ratio ≥e^(−max(a²,b²)/2)>0 | Bandwise uniform comparison is the needed premise | Retain |
| Properness implies PS, Lean:29 | x²; zero-dimensional point | bounded values give ∣x∣≤√C; on point every sequence is constant | Compact band supplies convergent subsequence | Retain |
| Compact critical bands, :695–696 | f=x²; f≡0 on ℝ | first critical band {0} or ∅; second band at 0 is ℝ, not compact, and PS fails via x_n=n | PS, not isolation alone | Retain |
| `finite_criticalValueBand`, Lean:33 | x² with [0,1], [1,2], reversed interval | critical counts 1,0,0 | Empty bands and boundary values handled | Retain |
| `exists_gradient_lowerBound`, Lean:40 | x² on [1,4]; f=x on ℝ² | norms 2∣x∣≥2 and 1≥1; choose η=2 and η=1 | Noncompact band can still have positive bound | Retain |
| Buffer existence, :702–706 | x² band [1,4] | expanded [1/2,9/2] still avoids critical value 0; η≥√2 | Regular endpoint buffers follow under PS | Retain; cite Morgan §1.4 |
| Noncompact critical-free deformation, :700–708 | f(x,y)=x on ℝ², a=0,b=1 | normalized field (−1,0), speed 1; r(x,y)=(min(x,0),y), fixes x≤0 | Noncompact band, complete metric, valid retract | Preserve in Part II |
| Forward lifetime without PS, :710–715 | e^(−x), x₀=0; time interval [0,T] | x(t)=log(1+t); length log(1+T)≤√(T·T/(1+T)); lifetime ∞ | Finite-time length bound does not imply infinite-time trapping | Retain |
| Completeness negative control, :710–715 | M=(0,1), f=x | lower bound 0; x(t)=x₀−t reaches missing endpoint at t=x₀ | Completeness is necessary | Add Check |
| `exists_forwardTrajectory_converges`, Lean:47 | x² with any x₀; zero space | γ=x₀e^(−2t), limit p=0 and grad p=0; zero-space γ=0 | Strong theorem survives degenerate dimension | Move headline to Part II Suggested |
| PS critical subsequence and trapping, :717–725 | x² trajectory at times n | grad=2x₀e^(−2n)→0; energy=x₀²e^(−4n); tail=∣x₀∣e^(−2n) | Tail budget tends to zero, giving actual trapping | Retain |
| Exponential PS corollary and minimum, :726–728 | x²; (x²−1)² | rates near minima are 2 and 8; minima values 0 at 0 and ±1 respectively | Minimum need not be unique | Retain |
| PS does not imply lower bound, :717 | f=−x² | PS holds since grad→0 forces x→0; γ=x₀e^(2t) diverges for x₀≠0 | Lower bound prevents this counterexample | Retain hypothesis |
| Escaping-exponential Check, :730–736 | f=e^(−x), x₀ arbitrary | γ'=1/(e^x₀+t)=e^(−γ); normalized solution x=−log(e^(−x₀)−t), escape time e^(−x₀) | Both formulas and the PS failure are correct | Retain; source attribution uncertified |

**Headline inventory.** M1: intrinsic normal form and finite critical sets (represented). M2: regular levels and compact-band deformation (represented, but the atlas must be repaired); handles/cells, coherent chart comparison and CW exhaustion (not represented). M3: Morse approximation and proper Morse exhaustion existence (not represented). M4: strong inequalities, top-homology freeness, arbitrary-function LS count/cover and minimum, Reeb sphere conclusion (cover/minimum represented; strong inequalities, freeness and sphere theorem absent). M5: parametric Morse–Bott normal form, negative-bundle attachment, spectral sequence and inequalities (absent). M6: compact-trapped manifold convergence and exponential rate (absent). M6.1: PS critical compactness/finiteness, critical-free-band deformation, forward continuation, convergence, rate and minimum attainment (four flat statements in PalaisSmaleTargets; none in Suggested).

The missing strong topology, coherent attachment constructions and critical normal-bundle interfaces need honest missing-carrier explanations when their full headlines cannot be expressed economically. Native homology, freeness, properness, sphere homeomorphism and the already-written flat PS convergence do not need an invented `Prop` stand-in. No mathematical source passages were found copied; the technical targets are paraphrased. No computational algorithm, `set_option`, admitted example or stray source file was found. The admitted atlas is the sole sorry-data site.

**Pinned-library audit.** I opened the following definitions/theorem types and their relevant surrounding hypotheses. Paths are relative to the respective pinned library source root.

| Library | Declaration / file and line | What was verified |
| --- | --- | --- |
| Mathlib | `mvfderiv`, `Mathlib/Geometry/Manifold/MFDeriv/NormedSpace.lean:448` | Composition of `mfderiv` with target tangent-space identification; no smoothness, finiteness, or separation condition is built into the definition. |
| Mathlib | `gradient`, `Mathlib/Analysis/Calculus/Gradient/Basic.lean:83` | Riesz-dual derivative requires the inner product and completeness; no nondegeneracy or PS built in. |
| Mathlib | `singularHomologyFunctor`, `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean:52` | Actual coefficient-category homology functor, including ModuleCat field coefficients. |
| Mathlib | `Submodule.nonempty_basis_of_pid`, `Mathlib/LinearAlgebra/FreeModule/PID.lean:278` | Requires a finite basis; does not settle M4's arbitrary-rank target. |
| Mathlib | `Module.finrank`, `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61`; `Polynomial`, `Mathlib/Algebra/Polynomial/Basic.lean:69` | Infinite rank maps to natural value 0; polynomials have actual finitely supported coefficients. These support R01 and R03. |
| Mathlib | `PartialDiffeomorph`, `Mathlib/Geometry/Manifold/LocalDiffeomorph.lean:81` | Open source/target and smooth maps in both directions, with actual partial inverse data. |
| Mathlib | `ContinuousMap.HomotopyEquiv`, `Mathlib/Topology/Homotopy/Equiv.lean:43`; `Nullhomotopic`, `…/Contractible.lean:26` | Bundled continuous inverse maps and homotopies; nullhomotopy existentially chooses a point in the ambient target. |
| Mathlib | `IsProperMap`, `Mathlib/Topology/Maps/Proper/Basic.lean:77`; `onePointEquivSphereOfFinrankEq`, `…/Compactification/OnePoint/Sphere.lean:34` | Proper maps include continuity; the sphere homeomorphism uses an explicit finite-dimensional rank equality and Hausdorff real topological vector space. |
| Tau Ceti | `IsMorse`, `TauCeti/Geometry/Manifold/Morse/Basic.lean:178`; `isMorse_iff`:188 | Smoothness and nondegenerate critical points, without properness or PS. |
| Tau Ceti | `manifoldMorseIndex`, `TauCeti/Geometry/Manifold/Morse/Index.lean:74`; bound:105; negation:140,154 | Preferred-chart index, dimension bound and nondegenerate complementary index. |
| Tau Ceti | `IsNondegenerateCriticalPoint.exists_morse_chart`, `TauCeti/Analysis/Calculus/Morse/NormalForm.lean:362` | Smooth local homeomorphism and inverse; quadratic formula has factor 1/2. |
| Tau Ceti | `exists_congruence_of_symmetric_family`, same file:217 | Fixed-reference local congruence input; not the varying-base normal-bundle construction of M5. |
| Tau Ceti | `exists_norm_lt_hasNondegenerateCriticalPointsOn_sub`, `TauCeti/Analysis/Calculus/Morse/Generic.lean:207` | Local linear perturbation input; global strong-topology approximation remains new. |
| Tau Ceti | `sectionZeroChartedSpace`, `TauCeti/Geometry/Manifold/VectorBundle/Section/Chart.lean:246`; formulas:123,136,152,174,254,263 | A real constructor with complement and implicit-coordinate inputs, not an arbitrary zero-set atlas. |
| Tau Ceti | `isManifold_sectionZero`, `…/Section/Manifold.lean:154`; inclusion derivative:169; immersion:219 | Supplied smoothness and Fredholm/index conditions are required. |
| Tau Ceti | `exists_isManifold_sectionZero_of_contMDiff`, `…/Section/SmoothZero.lean:63`; `sectionLinearization_trivial`, `…/Section/Linearization.lean:271` | Existential construction and the trivial-bundle comparison are separate inputs. |
| Tau Ceti | `boundaryChartedSpace`, `TauCeti/Geometry/Manifold/Boundary/Charts.lean:195`; public formulas:220–263; `isManifold_boundary`:321 | Half-space boundary model and nonzero differentiability order; does not build the regular sublevel itself. |
| Tau Ceti | `ContinuousLinearMap.implicitCoordEquiv`, `TauCeti/Analysis/Calculus/ImplicitFunctionTheorem.lean:79`; coercion law:86 | Coordinates are (D v,π v), for the chosen complemented kernel. |
| Tau Ceti | `IsIntegralCurveOn.exists_tendsto_atTop`, `TauCeti/Analysis/Calculus/Morse/Convergence.lean:272` | Requires compact K, trapping, differentiability, gradient continuity and finite critical locus; not the new nonproper theorem. |
| Tau Ceti | `IsNondegenerateCriticalPoint.exists_mul_abs_sub_le_norm_gradient_sq`, `TauCeti/Analysis/Calculus/Morse/Linearization.lean:380` | Local inequality assumes a nondegenerate critical point. |
| Tau Ceti | `exists_sub_le_mul_exp_atTop` / `exists_norm_sub_le_mul_exp_atTop`, `TauCeti/Analysis/Calculus/Morse/ExponentialConvergence.lean:239,262` | Convergence and nondegeneracy are hypotheses; they cannot manufacture the missing trapping step. |
| Tau Ceti | `Module.Free.of_filtration`, `TauCeti/LinearAlgebra/FreeModule/Filtration.lean:37` | ℕ-indexed exhaustive split filtration; useful for the countable case, not a theorem for arbitrary well-ordered rank. |

**Ownership and supplier audit.** Read the merged AlgebraicTopology and CharacteristicClasses roadmaps and the completed ConformalMapping roadmap as shape/context examples. Searched objects—not just proposed names—in both pins, main, the board packages and indexed open roadmap heads with `roadmaps grep`; inspected the supplied MorseNovikov and VariationalMethods heads as relevant overlap candidates. VariationalMethods' quadratic Hilbert-space minimization is not the PS condition/gradient-flow theorem; MorseNovikov consumes the ordinary Morse core and owns closed-one-form/cover versions. No separate competing owner of the new finite-dimensional PS package was found. A namespace/declaration search found MorseTheory names only in this same folder on main and its revisions, not in another roadmap folder; the extra PS file was also inspected directly. Existing M1–M6 remain the base owner; hence R05 concerns an extension, not re-planning or duplication of those sections.

Resolved these cross-roadmap contracts against main (open revisions of existing roadmaps were not substituted as suppliers):

| Citation in MorseTheory | Resolved location and result |
| --- | --- |
| DifferentialGeometry Layers 3,5,10,12 | `TauCetiRoadmap/DifferentialGeometry/README.md:375–400` flows; :507–510 boundary orientation; Layer 10 degree/Sard and the manifold partition-of-unity inputs; :915–922 metrics, `mgradient`, Hessian. The named native gradient in MorseTheory still needs R02. |
| AlgebraicTopology Stages 2–8 and AT4.4/4.5 | `TauCetiRoadmap/AlgebraicTopology/README.md:624` disk pair; :644 pushout; :658 gluing comparison; :683 tower equivalence; :700 union; :716 relative CW model. These supply the explicitly used tower operations. |
| AlgebraicTopology AT4.6 / AT6.1 | Same README, Stage 4 real-projective carrier/calculations and :1034–1041 local-system/UCT discussion. RP² coefficients in the table agree. |
| AlgebraicTopology categorical-cover supplement | Same README:1080–1150: open inclusions nullhomotopic in the ambient space, extended count, finite-coproduct sum and cup-length lower bound. It is on main; no Čech supplement is consumed here. |
| GeometricTopology Layer 1 | `TauCetiRoadmap/GeometricTopology/README.md:195–222`: native boundary, collars, gluing and normal/disk bundles. M2 specializes those constructions; M5 does not invent a second normal bundle. |
| CharacteristicClasses C2 | `TauCetiRoadmap/CharacteristicClasses/README.md:550–620`: disk/sphere bundle pairs; :619–629 constructs Thom theory with orientation/local coefficients. |
| DGFloer Layer 1 item 3 | `TauCetiRoadmap/DGFloer/README.md:612–628`: filtered-complex spectral sequence and its degreewise bounds/convergence. This is independent of trajectory layers as claimed. |
| ComplexKahlerGeometry K1/K7 | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1407–1460`: projective carrier/affine charts, real restriction, orientation, and independent cellular calculation. M4 supplies the real Morse calculation, not the projective carrier. |
| ComplexManifolds real restriction | `TauCetiRoadmap/ComplexManifolds/README.md:172–193`, Milestone 1: finite-dimensional complex-to-real restriction, linear recharting and carrier transport. This is the owner behind the numbered reference in M4; M1’s arbitrary real boundaryless-model preferred-chart comparison is a distinct specialization with extra Morse/immersion laws. |
| HeegaardFloer Lane M | `TauCetiRoadmap/HeegaardFloer/README.md:203–214`, Layer 1 (Lane M): stable/unstable, trajectory and Morse-homology work remains there. Its §2.3 (:1380–1425) owns compact finite-C^k Banach-space genericity and explicitly compares it with M3’s distinct smooth approximation. |
| RiemannianGeometry R3 | `TauCetiRoadmap/RiemannianGeometry/README.md:159–166,431–497`: consumes MorseTheory; owns broken geodesics and index comparison. It is a consumer, not an input to M6.1. |
| AffineMorseLefschetz | `TauCetiRoadmap/AffineMorseLefschetz/README.md:16,189–199`: consumes ordinary Morse core and its exhaustion/index consequences. |
| ConvexityToric T2 | `TauCetiRoadmap/SymplecticGeometry/ConvexityToric/README.md:73–99`: consumes M5 and supplies moment-map complex negative bundles/equivariant conclusions. |
| HomotopySpheres §4B | Supplied open head, `TauCetiRoadmap/HomotopySpheres/README.md:1466–1480`: broken-geodesic/Bott application consumes M5. The numbered PR links must be replaced, R08. |

The mechanical dependency command returned exactly:

```text
depcheck: 204 roadmaps, 1500 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. There are no declared gaps and no `*Needs:*` lines to audit; all prose supplier citations were examined. Broad roadmap-level success does not validate the nonexistent pinned declarations in R02. No consumer above was treated as a reverse supply edge.

**Seeded source check.** No locator is explicitly marked unverified in this README. For the required arbitrary-function LS sample, the requested theorem number/page simply are absent. I fetched and read the legal [Weber author copy](https://www.math.stonybrook.edu/~joa/PUBLICATIONS/conblock.pdf): `weber-conley` lines 39–76, Theorem 1.1, printed p.2. It treats C² functions on closed manifolds, counts distinct critical points, and uses the unnormalized number of open sets contractible in M. Lines 73–106 separate the infinite case and produce a finite categorical cover. This supports the smooth compact boundaryless statement after the explicit normalization and empty-case conventions; it does not certify an unstated README locator. Cohen–Iga–Norbury's “classical part” is not an LS theorem locator.

For [Morgan's cited notes](https://www.math.columbia.edu/~jmorgan/Condition_C.pdf), `morgan-condition-c` lines 198–203 are Definition 1.6/Remark 1.7 (printed p.6); lines 205–258 give Proposition 1.8 and its proof (pp.6–7). Completeness, smoothness and Condition (C) are present. The proof supplies a gradient lower bound, the Cauchy–Schwarz length estimate and a regular-value buffer. Its Riemannian Hilbert setting includes the finite-dimensional specialization. The new nonproper convergence conclusion is not stated there as the cited §1.3 theorem; the roadmap gives its own subsequence/trapping proof route, which was checked in the table.

## Not verifiable

- `milnor-morse`: Milnor, *Morse Theory*, §§2–6 and Lemma 3.6. The service's bibliographic lookup resolved to Smiley's book review (DOI 10.2307/2312441), not the book. No legal book text was read; neither the page nor the detailed chart-comparison attribution is certified. The algebraic seam computations above are independent checks.
- `mark-math240`: Thomas Mark's 2001 Math240 lecture/homework notes; Homework 10 problem 3, scan label `0228_001`, physical p.3, and Homework 11. Service lookup and searches by author/course/scan label did not identify the text. The allegation about the homework's normalized-flow proof remains unverified; the exponential counterexample itself was recomputed. Both missing works are recorded under stable keys in the job's missing-reference list, without modifying a source manifest.
- Cohen–Iga–Norbury was fetched legally from the cited author page. Application 5.13 p.43 was checked directly for R04. “Classical part” still does not identify locators for the other targets; they have not all been source-certified.
- The coherent parameter-family chart-comparison theorem and all source-dependent global normal-bundle proofs are not certified by the finite examples. Their source locators and required APIs need the repairs above. Open-work ownership was checked for the indexed/supplied readable roadmap sources, not for inaccessible private or unlisted work.

## Source issues

- **Misprint** in morgan-condition-c at Definition 1.6, printed page 6: the source says a critical value belongs to the closure of a subset of the manifold; it should be a critical point; affects a stated result.
- **Misprint** in morgan-condition-c at Proposition 1.8, printed page 6: the source says composing f after its band-to-product diffeomorphism is the second projection; it should be f equals the second projection after that diffeomorphism; affects a stated result.
- **Misprint** in morgan-condition-c at the proof of Proposition 1.8, printed page 7: the source says the enlarged upper endpoint b′ is less than b; it should be b′ greater than b; affects the proof.
- **Misprint** in cohen-iga-norbury at the proof of Application 5.13, printed page 43: the source says the minimum disk is the inverse image of [t₁,a]; it should be the inverse image of [t₀,a]; affects the proof.
