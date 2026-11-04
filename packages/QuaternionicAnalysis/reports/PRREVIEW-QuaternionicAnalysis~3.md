# Review of QuaternionicAnalysis (pull request #980 at d9f8980)

**Verdict:** needs changes

## R01 (P2) — State the full affine Cauchy headlines now expressible at the pins

**Location:** `TauCetiRoadmap/QuaternionicAnalysis/Suggested.lean:15–18`: “their boundary integral is the raw affine face functional … with no carrier in the pinned libraries. Only the axis-aligned box case is stated here”.

**Claim:** the full affine Cauchy theorems and Cauchy–Fueter formulas cannot be stated with a few simple native definitions.

**Witness:** A scratch copy elaborates all four full affine signatures using the definition below, without extra imports or options. For `L=diag(2,1,1,1)`, its pulled flux is `(P∘A,2iP∘A,2jP∘A,2kP∘A)`.

**Repair:** use the explicit cofactor pullback now specified in README §5.4 to define the actual face integral on the existing carrier. This is one real-bodied definition of a Bochner integral, not an assumed predicate or a replacement for the geometric construction:

```lean
noncomputable def affineFluxBoundary
    (L : (Fin 4 → ℝ) ≃L[ℝ] (Fin 4 → ℝ)) (p : Fin 4 → ℝ)
    (F : Fin 4 → (Fin 4 → ℝ) → ℍ) : ℍ :=
  boxBoundarySum 0 1 (fun j u =>
    (LinearMap.det L.toLinearMap) •
      ∑ i : Fin 4, (L.symm (Pi.single i 1) j) • F i (p + L u))
```

State the left and right vanishing theorems and representation formulas on this functional, with positive determinant, continuity on the image of the closed cube, regularity on the image of its interior, and an interior pole for the representation. For example, the full left formula elaborates as follows:

```lean
theorem affineLeftFormula
    (L : (Fin 4 → ℝ) ≃L[ℝ] (Fin 4 → ℝ)) (p : Fin 4 → ℝ)
    (hL : 0 < LinearMap.det L.toLinearMap) (f : ℍ → ℍ)
    (hc : ContinuousOn f
      (toTuple.symm '' ((fun u => p + L u) '' Set.Icc 0 1)))
    (hd : ∀ u ∈ Set.pi Set.univ (fun _ : Fin 4 => Set.Ioo (0 : ℝ) 1),
      LeftFueterAt f (toTuple.symm (p + L u)))
    (q₀ : ℍ) (hq₀ : L.symm (toTuple q₀ - p) ∈
      Set.pi Set.univ (fun _ : Fin 4 => Set.Ioo (0 : ℝ) 1)) :
    f q₀ = (1 / (2 * Real.pi ^ 2)) •
      affineFluxBoundary L p (fun i x =>
        cauchyFueterKernel (toTuple.symm x) q₀ *
          toTuple.symm (Pi.single i 1) * f (toTuple.symm x)) := by
  sorry
```

Use the full affine statements as the acceptance tests; keep the axis-box specializations in the README and retain the §5.4 equality with the geometric raw-face construction. Remove this nonstatability exemption; the separate top-form-comparison exemption is unaffected. On the dilation witness the pulled divergence and boundary flux are both `2−2=0`; for a constant function the representation has boundary mass `2π²`, as required. Identity L gives exactly the existing unit-box functional. Thus the proposed definition measures the advertised integral and retains the full affine scope. All four scratch signatures and their elaborated binders were checked; their proofs remain honestly admitted.

## R02 (P3) — Record the cited works in the source manifest

**Location:** `TauCetiRoadmap/QuaternionicAnalysis/README.md:1121–1131`: “Locators (page, item and equation numbers) refer to the arXiv version v5”.

**Claim:** the three bibliographic sources have stable, versioned records and explicit access status.

**Witness:** the folder contains `README.md`, `Suggested.lean` and `metadata.toml`, but no `sources.toml`. FL08 v5 and D12 v1 were readable; the Sudbery locator could not be independently certified.

**Repair:** add one manifest entry each for FL08, D12 and Sudbery, preserving the arXiv versions and DOI, with the sources service's provenance and access status. Record the inaccessible published Sudbery text as uncertified if it remains a locator-only citation. The repaired record should resolve FL08 equation (18) on printed p. 9 and D12's ordered limits on printed p. 2 to the versions actually read. This is the remaining manifest portion of previous R05; its missing-local-locator portion is repaired. It is a P3 documentation note, not a mathematical blocker.

## Verified sound

This is a full independent AI-assisted review of the two requested files at `d9f898045e546cd556032e0ac2ab09402f7c4dcd`. No PR file was edited. There are **one P2 finding and one P3 finding**. The mathematical statements tested below survive the adversarial pass; the blocking defect is the omission of statable full-scope acceptance tests.

### Previous findings checked first

| Previous finding | Passage/evidence at this head | Disposition and recomputed witness |
|---|---|---|
| R01, complex coordinate conjugation | README:432–434: “`(g(z₁,conj z₂), conj(h(z₁,conj z₂)))`”. | Repaired. For the identity at `(0,i)`, the output is `(0,i)`; both argument and output conjugation are present. |
| R02, opposite Fueter operator | README:553–555: “`b + i b i + j b j + k b k = −2 conj b`”. | Repaired. At `b=i`, left value `−2i`, right value `2i`. |
| R03, multiplication block | README:266–268: “`[[0,−1],[1,0]]` on both `(t,x)` and `(y,z)`”. | Repaired. Left multiplication sends `j↦k`; right multiplication sends `j↦−k`. |
| R04, affine flux reference | README:817–830 defines the pulled field and its divergence; 872–873: “by the pointwise cofactor identity of §5.4”. | Repaired. For `diag(2,1,1,1)` and `f=t+ix`, the pulled divergence is `2−2=0`, not the naive precomposition value `1`. |
| R05, locators and manifest | README:219–222 identifies the coordinate derivation and FL08; 321–322 identifies the remainder theorem; 869–871 identifies the pointwise Cauchy extension. | Partly repaired. The formerly unlocated claims now have native or bibliographic grounding. Only the absent manifest remains, as R02 above. |
| R06, local dependencies/order | README:700 “5.2 Affine change of variables”; 772 “`*Needs:* §5.1, §5.2`”; 464–465 names the local symmetry theorem. | Repaired. Change of variables precedes raw faces and the match; all 27 numbered subsections have local Needs lines. The local symmetry supplier permits arbitrary values outside the open domain. |
| R07, one-form API/Checks | README:663–674 gives evaluation, linearity and ordered pairing; 681–687 supplies separate `dq` Checks. | Repaired. Values `1`, `i+j`, and `−k` versus `k` distinguish missing, conjugated and commuted forms. |
| R08, native calculus duplication | README:353–354: “These quaternionic closure criteria consume the native real product, inverse and chain rules”. | Repaired. No target to rebuild the general rules remains. At inversion at `i`, the native rule sends `j↦−j`, detecting the claimed obstruction. |
| R09, radial supplier name | README:136: `MeasureTheory.integral_fun_norm_addHaar`. | Repaired. Reopened at the pin, at `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:296`; mass is `4(π²/2)=2π²`. |

No supplied repair report classified a finding as “not actionable in this package”; no such settled disposition is re-raised.

A correction to the **previous report's source errata**, not to the roadmap: D12's printed p. 2 has `x₁=(i₁ conj(z)−z i₁)/2`. At `z=i₁` this is `(1−(−1))/2=1`, the correct coordinate. The earlier reported sign error arose from misreading the conjugation bar and is **not sustained**. The rendered page was reopened at high resolution.

### Gate, elaboration and signature evidence

The worker's head-specific gate passes: every scanner count is zero, including build, dependency, outside-folder, stray-files, imports, sorry-data, set_option and README-name checks. Independently, `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuaternionicAnalysis'` is empty, HEAD matches the requested hash, and the final worktree status is clean.

The requested dependency check, with the supplied order, main content and `--movable`, returned:

```text
depcheck: 208 roadmaps, 1461 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. There are no declared supplier gaps. All 27 local Needs lines and the layer Dependencies paragraphs were read. The internal sequence is now change of variables → raw faces → cofactor/match → Cauchy formulas → regularity; real analyticity does not depend on the later derivative estimate.

Direct `lake env lean` elaboration of the requested module succeeded with **19 declaration-uses-sorry warnings, no other warnings and no errors**. A scratch copy also printed `#check @name` for **all 33 declarations**: **14 real-bodied definitions and 19 theorems**. Each elaborated type was compared with its README statement and the worker's signature extraction; no binder disappeared and no correction was needed. In particular:

- The product/inverse criteria are equivalences with the forced slope, not sufficient-only claims.
- All rigidity statements retain openness and connectedness. Native `IsConnected` includes nonemptiness; the empty-domain README Check evaluates the underlying equivalence outside that hypothesis.
- Cauchy vanishing permits zero side lengths. Formula signatures instead require an interior point, which forces all four side lengths positive.
- The estimate places `∃ C` before `f, Ω, q₀, R, M`. Openness of Ω is unnecessary: the included positive-radius ball supplies an open neighbourhood of its centre. Its norm bound forces `M≥0`.
- The Fueter predicates require an actual derivative witness; they do not mistake the totalized zero value of `fderiv` for differentiability.

The headline list is: the four exact product/inverse criteria; three connected-open rigidity classifications; left/right Cauchy vanishing and Cauchy–Fueter representation; left/right analyticity, harmonicity, uniqueness and universal derivative bounds. The **19 existing signatures** cover the box cases and the remaining listed results. Four full affine headlines are omitted under the module docstring’s nonstatability exemption. The new explicit cofactor formula makes them statable using one short real-bodied definition: all four were independently elaborated, as documented in R01. The box formulas are genuine specializations, but do not test that advertised generality. The separate top-form comparison still depends on an unimplemented supplier construction. The derivative-integral identity is an intermediate target supporting the estimates.

Every admitted theorem was tried on a scratch copy with one-tactic `simp`, `rfl` and `infer_instance`, each under `solve` to require complete closure. **All 19 still required sorry.** Inspection of the native calculus, divergence and analytic-uniqueness declarations found no single library lemma with the same hypotheses and conclusion: the quaternionic shape condition, kernel argument or regularity-to-analyticity bridge remains necessary. No padding finding is made.

### Sources: the 15 seeded targets

FL08 was fetched through the sources service as arXiv **0711.2699v5**, D12 as **1203.5619v1**. The printed page numbers agree with the extraction markers. FL08 pp. 7, 9 and 10 and D12 p. 2 were also rendered to check bars, subscripts and normalizations. The README flags no further locator as unverified. References are to the versions actually read, not inferred published numbering.

| Target | Exact source opened, hypotheses and support |
|---|---|
| 1.1 matrices | FL08 §2.1 p. 7, FL08 lines 303–330, supplies the multiplication conventions; the explicit matrices are correctly identified as derivations from native component multiplication, `Mathlib/Algebra/Quaternion.lean:823–835`. All columns were checked. |
| 1.2 composition/inverse/norm/determinant | FL08 §2.1 p. 7, FL08 lines 313–330, gives conjugation, inverse for nonzero elements and norm multiplicativity. Composition and determinant are explicitly derived from §1.1, not attributed to an absent source theorem. |
| 2.2 quotient limits | D12 §1 p. 2, D12 lines 46–61, has precisely the stated factor orders. The remainder equivalence is owned here and grounded in `hasFDerivAt_iff_isLittleO_nhds_zero` at `Mathlib/Analysis/Calculus/FDeriv/Basic.lean:815`; increments are punctured and unchanged. |
| 2.3 products/inverses/compositions | Native noncommutative product, inverse and chain rules were opened at `FDeriv/Mul.lean:198,735` and `FDeriv/Comp.lean:107`. The inverse rule requires nonzero value. The four iff criteria are the roadmap's commutator consequences, not claims that those native lemmas already classify quotient derivatives. |
| 3.2 left classification | D12 §1 p. 2, D12 lines 58–61, supports the affine shape but is an introductory summary. Sudbery Theorem 1 remains uncertified. The supplied independent route through complex analyticity and local second-derivative symmetry was checked, including its connected-open hypotheses. |
| 3.4 simultaneous classification | D12 §1 p. 2, D12 lines 58–61, specifies a real slope. The precise open-domain result follows from §§2.5 and 3.2–3.3; it does not infer a real slope from bijectivity. |
| 4.4 closure/reflection | FL08 Definition 1 and Proposition 2, p. 8, FL08 lines 340–349. The source assumes C¹. The roadmap gives the derivative calculation establishing the pointwise extension and the reflected domain. |
| 5.1 forms | FL08 definition of dX p. 8, FL08 lines 363–372; equation (18) and Proposition 4 p. 9, FL08 lines 375–386. The four signs and multiplication order agree. The differential-form identities require C¹; the separate divergence identity only needs a derivative at the point. |
| 5.5 Cauchy theorems | FL08 Corollary 8 p. 9, FL08 lines 417–421, assumes regularity near the closure under its C¹ definition. README:867–871 explicitly distinguishes those hypotheses from its pointwise extension. The opened native divergence theorem supports the latter. |
| 5.6 kernel/formulas | FL08 Proposition 3 p. 8, FL08 lines 359–362, and Theorem 9 p. 10, FL08 lines 424–447. Correct kernel, both orders, normalization and exterior-of-closure condition. The printed closure bar was checked visually. The weaker boundary hypotheses are justified by the roadmap's cutoff proof, not silently attributed to FL08. |
| 6.1 smoothness/harmonicity | FL08 equation (17) p. 8, FL08 lines 350–362, and the remark after Theorem 9 p. 10, FL08 lines 448–451. The factorization and consequences agree. Smoothness from the weaker initial notion uses the stated differentiation-under-integral route. |
| 6.2 real analyticity | FL08 §2.2 p. 10, FL08 lines 448–451, states analyticity but does not supply the displayed series proof. The roadmap owns that proof: the geometric-square series, radius estimate and absolute-majorant route were checked below. |
| 6.3 uniqueness | The exact native supplier is `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `Mathlib/Analysis/Analytic/Uniqueness.lean:223`. It requires neighbourhood agreement, not merely accumulating zeros; the stated nonempty open U supplies it. |
| 6.4 derivative representation/bound | FL08 Theorem 9 p. 10 supplies the underlying formula, not the estimate, as README:1074 explicitly says. Native parametric differentiation at `ParametricIntegral.lean:208` and currying at `FTaylorSeries.lean:843` support the stated induction. The common neighbourhood and integrable dominator are explicitly requested. |
| 6.5 reflection | Derived target citing §§4.4 and 5.6; FL08 Proposition 2 p. 8, FL08 lines 347–349, supplies the classical reflection. Conjugation is an isometry and reverses multiplication; the computed reflected example below checks both the domain and operator order. |

The other sections were also read in full. Their coordinate identities now cite the native component formulas; uniqueness of a slope cites `HasFDerivAt.unique`; the raw face and cofactor identities are explicitly owned derivations. No copied source passage, algorithm, route-only arithmetic restriction, admitted data or option override was found.

### Adversarial calculations

The table contains **83 rows**. These are computed tests and proof-route checks, not substitutes for the admitted proofs. Every numbered target is covered, including its definitions and API; additional rows separate the headline signatures, orders and normalizations. “Keep” means the stated claim survives the listed test. Here `P(q)=t+ix`, `Q(q)=P(q)j`, and `e=(1,i,j,k)`. Directions and norms on ℍ are Euclidean. Numerical quadrature is explicitly labelled and is only a normalization sanity check.

| Statement / target | Instances tried | Values computed on the two sides / negative control | Result; change |
|---|---|---|---|
| Coordinates, units, conjugation | `q=1+2i+3j+4k` | Tuple `(1,2,3,4)` reconstructs q; conjugate `(1,−2,−3,−4)`; `q conj q=30=‖q‖²`. | Keep. |
| Tuple versus Euclidean norm | `q=1+i+j+k` | Quaternion norm `2`; tuple sup norm `1`; Euclidean tuple norm `2`. | Keep the explicit distinction. |
| 1.1 left multiplication matrix | `a=i,q=j`; `a=2`; `a=i+j,q=1` | Matrix products give `k,2q,i+j`, equal to quaternion products; right matrix gives `−k` on j. | Keep; prior R03 repaired. |
| 1.1 right multiplication matrix | Same inputs | Values `−k,2q,i+j`; the left/right matrices coincide for real a, but not for i. Their first columns both give a. | Keep. |
| 1.2 left composition | `a=i,b=j,q=1` | `i(j·1)=k=(ij)·1`; reversed order gives `−k`. | Keep. |
| 1.2 right composition | Same inputs | `(1·j)i=−k=1·(ji)`; incorrect ab gives `k`. | Keep. |
| 1.2 mixed commutation | `a=i,b=j,q=i` | `i(ij)=ik=−j=(ii)j`. | Keep. |
| 1.2 inverses and zero | `a=i,q=j`; `a=0` | `L_{−i}(L_i j)=j`, `R_{−i}(R_i j)=j`; at zero the composite is zero, not identity. | Keep nonzero hypothesis. |
| 1.2 norms/determinants | `a=0,1,i,2,1+i,1+2i+3j+4k` | Both determinants and `‖a‖⁴` are respectively `0,1,1,16,4,900`; for `a=1+i,q=j`, both norms are `√2`. | Keep; determinants independently recomputed. |
| 1.3 left component equations | `f=iq`, `f=qi` | For iq: `(K_x,−L_t,M_z,−N_y)=(−1,−1,−1,−1)`; for qi its M_z is `1`, failing that row. | Keep. |
| 1.3 right component equations | `f=qi`, `f=conj q`, `f=3q` | qi gives `(K_x,−L_t,−M_z,N_y)=(−1,−1,−1,−1)`; conjugation has `K_t=1,L_x=−1`; 3q has all diagonal entries 3. | Keep both directions: first column fixes a, equations fix other columns. |
| 2.1 left derivative predicate | `f=qj`, `f=jq` at direction i | qj has derivative `ij=k=R_j(i)`; jq gives `ji=−k≠k`, although direction 1 forces candidate j. | Keep. |
| 2.1 right derivative predicate | Same maps | jq gives `L_j(i)=−k`; qj gives `k≠−k`. Constants give derivative zero and identity gives identity. | Keep. |
| 2.1 slope uniqueness, sums/scalars | `q i+q j`, real scale 2 | Direction 1 forces `i+j`; direction k gives `ki+kj=j−i=k(i+j)`; scale gives slope `2i`. | Keep. |
| 2.2 left quotient/remainder equivalence | `h=2,Δ=6,b=1`; `f=qj` | `‖h⁻¹Δ−b‖=2=‖Δ−hb‖/‖h‖`; for qj the quotient is j and remainder 0. At h=0 the standalone identity would be `‖b‖=0`, so puncturing is essential. | Keep. |
| 2.2 right quotient/remainder equivalence | `f=jq`; `f=qj,h=ε,εi` | jq has quotient j and remainder 0. For qj the two directional quotients are `j` and `−j`. | Keep. |
| 2.2 square-map limits | `f=q²,q=i`, real and j increments | Left quotient limits `2i` and `0`; the right limits are also `2i` and `0`. | Keep non-example. |
| Left product iff | `f=id,g=j`; `f=j,g=id`; `f=g=id,q=i` | First has slope j and RHS `bg=0` true. Second's derivative on i is `−k`, forced `R_j(i)=k`, RHS false. Square gives `D(j)=0≠−2k=R_{2i}(j)`, RHS false. | Keep both directions. |
| Right product iff | `f=j,g=id`; `f=id,g=j` | First has slope j and `af=0` true. Second has `D(i)=k≠−k=L_j(i)`, RHS false. At real values centrality makes the commutator 0. | Keep both directions. |
| Left inverse iff | `f=id,q=i,2`; constant `f=i` | At i, `D(j)=−j≠j=R_1(j)`, RHS false. At 2, slope `−1/4`, RHS true. Constant i has derivative and slope zero, RHS true. | Keep. |
| Right inverse iff | Same inputs | At i, `D(j)=−j≠j=L_1(j)`; at 2 the derivative is `−h/4`; constant i gives zero. At zero the hypothesis fails. | Keep. |
| 2.3 left composition | `f=qi,g=qj` | `f(g(q))=qji=−qk`, slope `ji=−k`; reverse product gives k. | Keep. |
| 2.3 right composition | `f=iq,g=jq` | `f(g(q))=ijq=kq`, slope `ij=k`; reverse product gives −k. | Keep. |
| 2.4 elementary derivatives | Constant 5; `q²` at 3; projection x | Derivatives `0,6·id,h↦h_x`. Projection sends `1↦0,i↦1`, excluding every L_a/R_b. | Keep. |
| 2.4 ordered loop integrals | Square `0→i→i+j→j→0` | q dq edges `−1/2,k−1/2,k+1/2,1/2` sum `2k`; dq q edges `−1/2,−k−1/2,1/2−k,1/2` sum `−2k`. | Keep; no 1-form Cauchy theorem asserted. |
| 2.5 simultaneous slopes | id, 3q, iq and its inverse | Common slopes `1,3`; iq sends `j↦k` while `R_i(j)=−k`. Composition with −iq is identity but its slope remains nonreal. | Keep reality conclusion and negative control. |
| 3.1 coordinate scalar actions | `λ=i,q=j` | Left gives k with `Φₗ(k)=(0,i)=i(0,1)`; right gives −k with `Φᵣ(−k)=(0,i)`. | Keep. |
| 3.1 conjugated-function formula | id at `(0,i)`; `q=1+i+j+k` | Correct pair `(0,conj(conj i))=(0,i)`; decomposition `v=1+i,w=1−i` gives `v+jw=q`. | Keep; prior R01 repaired. |
| Left rigidity | `1+qi`; q²; disjoint balls with slopes i,j | Affine parameters `a=1,b=i`; q² at i fails `0=−2k`; disjoint components would force `b=i=j`, false. Empty domain gives true↔true but fails native IsConnected. | Keep openness/connectedness. |
| 3.2 second-derivative obstruction | `h=i,k=j,Db(h)=hc` | Symmetry yields `ijc=jic`, hence `2kc=0`; at `c=1` values `k,−k` disagree, so c must be zero. | Keep local proof route. |
| 3.3 reflection/right rigidity | `f=iq`; ball about i | `Tf=−qi`, left slope −i; reflected centre −i. Double reflection returns iq. | Keep. |
| Two-sided rigidity | `2+3q`, `−q`, `iqi` | Real slopes 3 and −1 work. iqi sends `1↦−1,j↦j`, contradicting the candidate scalar derivative `j↦−j`. | Keep. |
| 4.1 FueterLeft | `D=R_i`, `D=id`, `D=P` | Ordered sums `−2i,−2,0`; for P, `1+i²=0`. | Keep. |
| 4.1 FueterRight | `D=R_i`, `D=L_i`, `D=P` | Ordered sums `2i,−2i,0`; opposite order is `−2 conj i=2i`. | Keep; prior R02 repaired. |
| 4.1 At predicates and derivative witness | Constant, P, conjugation; `f(q)=‖q‖` at 0 | Constant and P have Fueter value 0; conjugation gives 4. Norm has positive/negative real difference quotients `1,−1`, so has no derivative despite totalized fderiv=0. | Keep; no vacuity. |
| 4.1 On predicates/linearity | P on Ω and subsets; empty set; `2P+P` | Fueter sum `3·0=0`; restrictions retain value 0; empty-domain predicate true. id on a nonempty set gives −2, false. | Keep. |
| 4.2 left component system | `f=Q=tj+xk` | Four rows `(0,0,1−1,0)=(0,0,0,0)`. | Keep. |
| 4.2 right component system | Same Q; P; id | Q rows `(0,0,2,0)`; P rows all 0; id first row −2. | Keep. |
| 4.3 quotient/Fueter intersection | qi, constant 5, P | qi: slope i and left Fueter −2i; constant: slope/Fueter 0; P: Fueter 0 but `D(j)=0≠j`. | Keep strictly different classes. |
| 4.4 matching constant multiplication | Pj and jP | Left sums `j+ik=0` and `j−ik=2j`; right sums reverse which is zero. | Keep correct side. |
| 4.4 addition, translation, real dilation | `P+P`, `P(q+i)`, `P(rq)` with `r=0,−1,2` | Fueter sums respectively `0,0,r(1+i²)=0`; at r=0 the map is constant. For P(qj), sum is −2j. | Keep real-dilation scope. |
| 4.4 reflection equation | Q and `TQ=−tj+xk` | Q: left 0, right 2j; TQ: right 0, left −2j, equal to conjugate of 2j. | Keep both directions. |
| 5.1 dq definition/evaluation/pairing | `e_t,e_x+e_y`; coefficient j | Values `1,i+j`; `(j dq)(e_x)=−k` versus `(dq j)(e_x)=k`. | Keep API and three discriminating Checks. |
| 5.1 Dq basis/alternation | Delete t,x,y,z; repeated x | Triple values `1,−i,+j,−k`; repeated-vector value 0. | Keep all signs. |
| 5.1 conjugation pullback | Triple xyz and tyz | `σ*Dq` values `−1,−i`; `−conj Dq` gives `−1,−i`. | Keep. |
| 5.1 ordered divergence identities | `f=1,q,Q` | Left divergences `0,−2,0`; right divergences `0,−2,2j`, equal to their Fueter values. | Keep C¹ only for exterior-derivative reading. |
| 5.2 affine change of variables | n=0 singleton, n=1 L=2 or −1, n=2 diag(2,3), w=1 | Both integrals are respectively `1,2,1,6`; det in n=0 is 1. Signed det in the reflection example gives −1 and fails. | Keep absolute determinant and all finite dimensions. |
| 5.2 totalized integrals | `w=1/x` on [0,1], identity map; zero codomain | Nonintegrable case gives `0=0`; zero codomain also `0=0`. An invertible affine measurable equivalence preserves integrability in both directions. | Keep arbitrary-w scope. |
| 5.3 raw face definition | Identity cube, coefficient 1; `f=t` | Constant gives `Σ(e_i−e_i)=0`; t gives t-pair 1 and other pairs 0, total 1. All-positive signs instead give `2(1+i+j+k)`. | Keep. |
| 5.3 face bound/Jacobian | Face with J=2, constant geometric coefficient j | Norm of integral `2=J sup‖j‖=vol₃(F) sup‖j‖`; double-counting J gives 4. | Keep exactly one Jacobian. |
| 5.3 degenerate faces | Tangents `(e_t,0,0)` | Alternating coefficient 0 and integral 0, independently of continuous f. | Keep singular affine maps in adapter. |
| 5.3 parameter reversal | Identity cube, `f=t`, ρ reverses t | Original Raw 1, reparametrized Raw −1. | Keep signed raw orientation. |
| 5.3 reflection pullback | σ, coefficient Dq·t | Raw(σ,Dq·t)=−1; pullback `−conj Dq·t` gives −1. Adding ρ restores +1. | Keep; stronger nonzero test than constant Check. |
| 5.3 subdivision | Identity cube split at t=1/2, f=t | Outer flux 1; two cell fluxes `1/2+1/2=1`; internal contributions `+1/2,−1/2` cancel. | Keep. |
| 5.4 boxBoundarySum | F_i=e_i x_i on unit cube; degenerate t side | Sum `1+i+j+k`; when t side has length 0, its two faces coincide and all other face measures vanish, sum 0. | Keep. |
| 5.4 axis/raw/BoxIntegral comparisons | Side lengths `(2,1,1,1)`, `f=t` | t flux 2; other pairs 0; Raw and native sum both 2. Face Jacobians `1,2,2,2`; continuous Bochner/box integrals have these same volumes. | Keep. |
| 5.4 top-form comparison/orientation | Unit x-front facet, coefficient 1 | Increasing tangent triple gives −i; parameter reflection gives outward coefficient +i. Raw, oriented chart integral and box front term all give +i. | Keep facetwise comparison, not a boundary-manifold claim. |
| 5.4 cofactor dilation | L=diag(2,1,1,1), F_i=e_i P | H=`(P∘A,2iP∘A,2jP∘A,2kP∘A)`; `div H=2−2=0=2 div F`; naive precomposition gives 1. | Keep. |
| 5.4 cofactor sign | L=diag(−1,1,1,1), F=(x₀,0,0,0) | `H₀=−u₀`; both divergence and signed boundary flux −1; `det L div F=−1`. | Keep signed determinant. |
| 5.4 inverse index order | L(u)=(u₀+u₁,u₁,u₂,u₃), F=(x₁,0,0,0) | H=(u₁,0,0,0), divergence 0; inverse transpose yields (u₁,−u₁,0,0), divergence −1. | Keep indices ji. |
| Left Cauchy theorem | Unit cube, P; id; constant c | P pairs `1,−1,0,0`, sum 0. id gives −2 and is excluded. Constant gives 0. | Keep. |
| Right Cauchy theorem | Unit cube, P and `jP` | P sum 0; jP gives pairs `j,−j,0,0`, sum 0; its left sum would be 2j. | Keep order-sensitive test. |
| Affine Cauchy theorem | Dilation/shear applied to P | Dilation pulled flux `2−2=0`; determinant-1 shear has cofactor divergence `0=1·0`. Negative orientation changes zero to zero. | Mathematics survives; add full signatures (R01). |
| 5.6 kernel definition/homogeneity | r=0,1,2,i; λ=2 | Values `0,1,1/8,−i`; `G(2i)=−i/8=2⁻³G(i)`. | Keep singularity excluded from regularity/formulas. |
| 5.6 kernel regularity | `G_s=conj(r)‖r‖⁻ˢ`, r=1 | Both Fueter values `4−s`: zero at s=4, two at s=2. | Keep; inverse alone is not the kernel. |
| 5.6 weighted product identity | r=1, f=P, q₀=0 | `∂G=(-3,−i,−j,−k)`; right Fueter sum `−3+1+1+1=0`; left Fueter P=0, so weighted divergence 0. | Keep; not product closure. |
| 5.6 cutoff | ψ at 1/2,3/4,1 | Values `0,1/2,1`; annular mass `4(π²/2)∫ψ'=2π²`. At r=1, `G(r)r=1=‖r‖⁻²`. | Keep normalization. |
| Left Cauchy–Fueter formula | Constant j on cube centred at pole | Boundary sum `2π²j`; normalized value j. Wrong factors yield 2j or j/2. Independent midpoint quadrature for c=1 on [−1,1]⁴ gives normalized 1.00024642 (40 subdivisions) and 1.00006160 (80). | Keep; quadrature is approximate corroboration only. |
| Right Cauchy–Fueter formula | Constant j; right-regular `jP` at centre q₀ | Constant gives `j·2π²`, normalized j. at q₀=1+i, jP gives `j−k` with boundary value `2π²(j−k)`; conjugation of the left Q formula reverses all three factors, preserving that value. | Keep. |
| 5.6 exterior case | Constant 1, pole outside closure | Kernel-weighted divergence 0 throughout box, so boundary sum `0=0`; no singularity or radial mass lies inside. | Keep exterior-of-closure restriction. |
| 6.1 smoothness / left harmonicity | P, `P²`, `‖q‖²`, `t²−x²` | Laplacians `0,2−2=0,8,2−2=0`; last two Fueter values `2q,2t−2ix` are not identically zero. | Keep implication, not converse. |
| 6.1 right harmonicity | `jP²` | Laplacian `j(2−2)=0`; right Fueter `j·0=0`. | Keep. |
| 6.1 factorization/kernel harmonicity | Mixed x,y terms; r=i | `−ij−ji=−k+k=0`; conjugate-gradient of `‖r‖⁻²` at i is 2i, and `−(2i)/2=−i=G(i)`; Laplacian G=0 off pole. | Keep. |
| 6.2 left analyticity/series | r=1, h=1/2; h=i/2; h=0 | u=`3/4,−1/4,0`; squared distances `1/4,5/4,1`; kernel values from both sides `8,(16/25)(1−i/2),1`. | Keep. |
| 6.2 convergence majorant | `‖h‖=δ/4` | Bound `2/4+1/16=9/16<1`; scalar majorant sum `(1−9/16)⁻²=256/49`. | Keep geometric-square expansion and smaller radius. |
| Right real analyticity | `TQ=−tj+xk` and `jP²` | Degree-one and degree-two real polynomials respectively; higher Taylor coefficients 0 and exact finite expansions. | Keep. |
| Left uniqueness | Disjoint balls; zeros of P; zero jet | Piecewise constants give `0` on first ball and `1` on second; P vanishes on plane t=x=0 but P(1)=1. Zero analytic jet gives coefficient sequence all 0, hence local value 0. | Keep connectedness and neighbourhood/jet criterion. |
| Right uniqueness | Right-regular jP, compared with zero | Same zero plane but jP(1)=j≠0; agreement of identical jP on any ball gives equality everywhere. | Keep. |
| 6.4 derivative representation sign | r=1, parameter directions 1,i | `D_r G(1)[1]=−3`, `D_q G(r−q)[1]=3`; imaginary direction changes `−i` to i. At m=0, integral is original formula. | Keep chain-rule sign. |
| Left uniform derivative bound | m=0 constant 1; m=1 P; R=0 control | Values `1≤C₀`; `1≤C₁R⁻¹R=C₁`; for R=0 the proposed RHS is 0 but derivative norm 1. | Keep R>0 and C before all function/domain parameters. |
| Right uniform derivative bound | m=1 jP; m=2 jP² at 0 | Norms `1,2`; bounds on radius-R ball `R,R²`; inequalities reduce to `1≤C₁,2≤C₂`. Constants have derivative 0 for m≥1. | Keep. |
| 6.4 scaling and cube geometry | Cube side R in four dimensions | Vertex norm `√(4R²/4)=R`; nearest face R/2; eight face volumes `8R³`. Kernel bound yields `(2π²)⁻¹8·2^(3+m)c_m R⁻ᵐM`. | Keep uniform positive choice of C_m. |
| 6.5 reflection of all consequences | Q→TQ; ball centre i→−i | Right Fueter TQ=0, left=−2j; derivative norm 1 on each side, Laplacian 0; reflected radius R and pole-to-face distance δ remain R and δ. | Keep same constants and reflected domains. |

The source-only errors also have short numerical witnesses: for FL08's non-unit outward normal `2e₀`, the stated normal-times-area gives 2 on `(e₁,e₂,e₃)`, while Dq gives 1. For its anticommutation misprint, `ij=k` is not `−ij=−k`. Neither incorrect formula is inherited by the roadmap.

### Pinned-library and ownership audit

The repository pins were used throughout: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following declarations and defining bodies were opened, rather than inferred from a newer library or a name search:

| Pinned file and line | Declaration / property actually consumed |
|---|---|
| `Mathlib/Algebra/Quaternion.lean:96,306,479–506,598,823–835` | Tuple carrier, constructor multiplication, four coordinate linear maps, linear tuple equivalence, star constructor and four component products. |
| `Mathlib/Analysis/Quaternion.lean:60,63,78,85,89,158,194` | Euclidean inner product, norm-square relation, conjugation isometry, normed division algebra, Euclidean tuple isometry and completeness. |
| `Mathlib/Analysis/Normed/Operator/Mul.lean:39` | Continuous bilinear multiplication; flipped application really is right multiplication. |
| `Mathlib/Analysis/Calculus/FDeriv/Basic.lean:174,815` | Derivative uniqueness and the little-o remainder characterization. |
| `Mathlib/Analysis/Calculus/FDeriv/Mul.lean:198,735` | Noncommutative product rule and inversion at a nonzero point. |
| `Mathlib/Analysis/Calculus/FDeriv/Comp.lean:107` | Composition of continuous real derivatives. |
| `Mathlib/Analysis/Calculus/FDeriv/RestrictScalars.lean:89` | Recovery of the larger-scalar derivative from equality of restricted derivatives. |
| `Mathlib/Analysis/Calculus/FDeriv/Symmetric.lean:463` | Local second-derivative symmetry; comparison with the globally quantified version at 482 confirms the repair. |
| `TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean:255,275` | Complex differentiability implies analyticity on an open set, for finite-dimensional domain and complete codomain. These hold for ℂ×ℂ. |
| `Mathlib/Analysis/Calculus/DifferentialForm/Basic.lean:259` | Pointwise pullback naturality; coefficient differentiability and a sufficiently smooth map are explicit. |
| `Mathlib/MeasureTheory/Integral/DivergenceTheorem.lean:266` | Continuous closed-box field, derivatives off a countable set in the open box, integrable divergence, front-minus-back boundary sum. No C¹ assumption. |
| `Mathlib/MeasureTheory/Measure/Lebesgue/Basic.lean:429` | Map of volume under a linear map with nonzero determinant, with reciprocal absolute determinant. |
| `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean:1100` and `Set.lean:581` | Measurable-equivalence integral identities for arbitrary functions; no hidden integrability hypothesis. |
| `Mathlib/Analysis/BoxIntegral/Integrability.lean:305` | Continuous coefficients on a compact box give the matching Bochner/box integral for complete codomain. |
| `Mathlib/Analysis/BoxIntegral/Partition/Measure.lean:70` | Native half-open box equals Icc almost everywhere. |
| `Mathlib/Geometry/Manifold/IsManifold/Basic.lean:318` | Model from a continuous partial equivalence with convex range, continuous inverse and nonempty interior; the cube/clamp construction meets these conditions. |
| `Mathlib/MeasureTheory/Measure/Haar/InnerProductSpace.lean:139` | PiLp conversion preserves volume. |
| `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:296` | Radial integration with dimension times unit-ball mass; applied only in nonzero dimension four. |
| `Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:359` | Even-dimensional ball volume. The native ENNReal formula is total in r; the README's ordinary-real expression is stated with r≥0. |
| `Mathlib/Analysis/SpecialFunctions/SmoothTransition.lean:146,161,165,205,222` | Definition, endpoint values, smoothness and monotonicity; value at 1/2 follows from equal positive numerator/other summand. |
| `Mathlib/Analysis/Calculus/ParametricIntegral.lean:208` | Local common-neighbourhood derivative bound, measurable integrands and integrable dominator. Compact faces away from the pole provide them. |
| `Mathlib/Analysis/Calculus/ContDiff/FTaylorSeries.lean:843` | Currying convention for successive iterated derivatives. |
| `Mathlib/Analysis/InnerProductSpace/Laplacian.lean:138,171` | Native tensor-trace Laplacian and orthonormal-basis expansion. |
| `Mathlib/Analysis/Analytic/Uniqueness.lean:223` | Preconnected analytic identity principle from neighbourhood agreement. |
| `Mathlib/Topology/Connected/Basic.lean:55` | IsConnected includes nonemptiness; it does not merely mean the vacuous preconnected condition. |

This table records **25 groups of pinned declarations**. The quaternion, differential-calculus, integration and analytic objects were also searched by operation and hypothesis, including Fueter operators, quotient derivatives, cofactor divergence, top-form integration and quaternion regularity. No existing pinned Fueter development or affine-face adapter was found. General multiplication, coordinates, real calculus, flat naturality, volume transport and analytic uniqueness are consumed rather than planned again.

Ownership searches used the required `roadmaps grep` service over open heads and main, plus the board packages and the named sibling checkouts. A focused search for Fueter/quotient-derivative/quaternionic-analysis claims returned this roadmap; the namespace search found only its own Suggested module. The nearby open QuaternionArithmetic roadmap, `TauCetiRoadmap/QuaternionArithmetic/README.md:1–28,101–111`, concerns number-field quaternion algebras, orders and arithmetic; it does not own real Fueter calculus. Searches of the supplied PDE and GlobalHolomorphicFunctions heads found no competing quaternionic construction. Generic cofactor search hits in arithmetic were unrelated; the geometry material is assigned as follows.

All actual cross-roadmap references were resolved against **main `9c6e95d911c8ef4a94a1d22116bd70e3fbcb4858`**, not against proposed revisions of existing roadmaps:

- `TauCetiRoadmap/DifferentialGeometry/README.md:269–370`, Layers 0–2, owns paired forms, exterior derivative, pullback and orientations. Its §1.2 at line 320 supplies smooth manifold naturality; the new explicit coordinate cofactor consequence belongs here. Its boundary/corners policy at lines 64–90 permits these layers over arbitrary models with corners.
- The same file at lines 511–517, §5.2, owns `integralTopForm` and `integralTopForm_of_tsupport_subset_chart`. Lines 87–90 permit the integral over any model; §5.5 at 529–534 is the separate corners-Stokes development. The roadmap's individual-facet comparison needs the former, not the excluded latter.
- `TauCetiRoadmap/ConformalMapping/README.md:107–117`, L2–L3, supplies the scope boundary concerning complex disc automorphisms and the Riemann mapping theorem. It is not a quaternionic proof dependency.

The main DifferentialGeometry and ConformalMapping roadmaps and completed OrthogonalL2Bases roadmap were read as shape comparators. The reviewed README supplies its required scope, conventions, supplier contracts, build narrative, six layers, local APIs, discriminating Checks, Examples/Dependencies and references. The expanded dq API addresses the earlier specific shape defect. No re-planned existing roadmap, duplicate open owner, cyclic supply, upward supplier, undeclared gap, or supplier drift was found. No external write or ownership move is required.

## Not verifiable

- **Sudbery 1979, Theorem 1 and the Cauchy/Cauchy–Fueter locators.** The sources service followed DOI `10.1017/S0305004100055638` to the Cambridge abstract page and obtained no legal full text. An institutional CiteSeer copy was also attempted and failed with a missing archived resource. The published theorem number, printed page and precise hypotheses remain uncertified. The README already describes this as a locator-only citation. Search results for other copies were not treated as verified source text. These attempts are recorded in the job's missing-reference artifact; this review is complete and is not parked.
- **Completed formal proofs.** Elaboration and the computations above do not discharge the 19 admitted targets. The cutoff limit, analytic-series regrouping, affine-face construction and regularity proofs remain implementation work. Their stated inputs and proof routes were checked; no assertion of completed formalization is made.

## Source issues

- **Misprint** in FL08 at §2.1, printed p. 7 (FL08 line 307): the source says a product of distinct imaginary generators equals its own negative; it should be the negative of the reversed product; affects nothing.
- **Misprint** in FL08 at the defining property before equation (18), printed p. 9 (FL08 line 376): the source says the form in the defining identity is named Dz; it should be Dx; affects nothing.
- **Error** in FL08 at Lemma 6, printed p. 9 (FL08 lines 389–401): the source says the flux form is an arbitrary nonzero outward normal times Euclidean area; it should be the unit outward normal times area; affects a stated result.
