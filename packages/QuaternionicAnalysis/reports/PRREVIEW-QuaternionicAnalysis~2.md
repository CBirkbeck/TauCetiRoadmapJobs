# Review of QuaternionicAnalysis (pull request #980 at e9800b0)

**Verdict:** needs changes

## R01 (P1) — Conjugate the input coordinate as well as the output

**Location:** `TauCetiRoadmap/QuaternionicAnalysis/README.md:397–398`: “`Φₗ ∘ f ∘ Φₗ⁻¹` has coordinates `(g, conj h)`”.

**Claim:** if `f(v+jw)=g(v,w)+j h(v,w)`, its conjugate by `Φₗ` is the displayed pair of functions on `ℂ²`.

**Witness:** take `f=id`, `g(v,w)=v`, `h(v,w)=w`. Conjugating the identity gives the identity: at `(0,i)` the actual output is `(0,i)`, whereas the claimed pair gives `(0,−i)`.

**Repair:** at an input `(z₁,z₂)` state the pair as `(g(z₁,conj z₂), conj(h(z₁,conj z₂)))`. The right-coordinate pair remains `(g(z₁,z₂),h(z₁,z₂))`. Add the identity as a Check. The repaired left formula gives `(0,conj(conj i))=(0,i)`. This fixes the coordinate theorem without changing the valid complex-linearity argument used for rigidity.

## R02 (P1) — The opposite Fueter operator on a right multiplication has the wrong value

**Location:** `TauCetiRoadmap/QuaternionicAnalysis/README.md:503–505`: “The wrong-order expression … gives … `−2b` as well”.

**Claim:** for `D=R_b`, both ordered operator expressions equal `−2b`.

**Witness:** set `b=i`. The left expression is `−2i`. The right expression is `i+(ii)i+(ji)j+(ki)k=i−i+i+i=2i`, not `−2i`.

**Repair:** retain the left value `−2b`; replace the opposite-order calculation by `b+i b i+j b j+k b k=−2 conj b`. Thus the values differ for nonreal `b`, although both vanish exactly at `b=0`. Use `b=i` to check coefficient order. The repaired value is `−2 conj i=2i`. The corresponding Lean definitions are correctly ordered; the error is in this README Check.

## R03 (P1) — The Layer 1 example contradicts its multiplication matrix

**Location:** `TauCetiRoadmap/QuaternionicAnalysis/README.md:247–249`: “`[[0,1],[−1,0]]` on `(y,z)`”.

**Claim:** this is the `(y,z)` block of left multiplication by `i`.

**Witness:** the displayed block sends `j`, with `(y,z)=(1,0)`, to `−k`. But `ij=k`; the matrix in §1.1 and its first Check correctly send `j` to `k`.

**Repair:** the `(y,z)` block of `Lᵢ` must be `[[0,−1],[1,0]]`; that of `Rᵢ` must be `[[0,1],[−1,0]]`. With these blocks, `Lᵢ(j)=k` and `Rᵢ(j)=−k`. Keep the already correct `(t,x)` block.

## R04 (P3) — Point the affine extension at the actual pointwise pullback target

**Location:** `TauCetiRoadmap/QuaternionicAnalysis/README.md:745–748`: “by the cofactor pullback of §5.4 with `n = 4`”.

**Claim:** §5.4 supplies the pointwise transformation of divergence needed for the affine extension.

**Witness:** §5.4, lines 707–724, states change of variables for a Bochner integral. The relevant pointwise naturality target is instead at §5.3, lines 688–689. For `A=diag(2,1,1,1)` and `f=t+ix`, naive precomposition gives Fueter value 1.

**Repair:** cite the pointwise naturality target in §5.3 and spell out its cofactor consequence, rather than referring to an unstated theorem in §5.4. For an `E`-valued field `F=(Fᵢ)` and invertible real `L`, the pulled flux coefficients are

`Hⱼ(u)=det(L) Σᵢ (L⁻¹)ⱼᵢ • Fᵢ(p+Lu)`.

They satisfy `div H(u)=det(L) • div F(p+Lu)` and match the signed pulled-back boundary form. Invoke the native divergence theorem on `H`; distinguish this signed determinant from the absolute determinant in volume change of variables. For the witness, `Fᵢ=eᵢ f` gives `H=(f∘A,2i(f∘A),2j(f∘A),2k(f∘A))`, with divergence `2+2i²=0` and flux `2−2=0`. State that the same transformation applies to the kernel-weighted field.

The roadmap already owns the necessary pointwise naturality in §5.3, so this is a locator/specification correction, not an unowned prerequisite or supplier gap. Mathlib's `integral_divergence_of_hasFDerivAt_off_countable_of_equiv` at `Mathlib/MeasureTheory/Integral/DivergenceTheorem.lean:313` is not a drop-in cofactor theorem: it assumes an order-compatible, measure-preserving equivalence.

## R05 (P3) — Several sampled targets still have no locator, and the source manifest is absent

**Location:** `TauCetiRoadmap/QuaternionicAnalysis/README.md:205–233`, `286–306`, `364–398`, `515–541`, `619–661`, `912–942`; references at `986–999`.

**Claim:** each theorem has an exact source or pinned-library locator, and every cited work has a stable manifest entry.

**Witness:** §1.2 ends its claim “from associativity … and the matrices of §1.1” without a locator; §§1.3, 2.2, 2.5, 3.1, 4.2 and 5.2 likewise have none. There is no `TauCetiRoadmap/QuaternionicAnalysis/sources.toml`.

**Repair:** attach locators to the remaining targets, distinguishing results derived here from the source's actual statements. For derived coordinate identities, cite the exact native multiplication declarations and the earlier target used; do not attribute them to a theorem that does not state them. Register FL08 v5 and D12 v1 once each, with the stated version numbering, and Sudbery with its DOI and access status. Record the pointwise Cauchy theorem as the extension proved through the native divergence theorem: FL08 Corollary 8 assumes regularity on a neighbourhood of the closure and its definition assumes `C¹`. The source table below supplies the verified locators and explicitly identifies the gaps. This is the remaining part of prior R05.

## R06 (P3) — Complete the target dependencies and put change of variables before its consumers

**Location:** `TauCetiRoadmap/QuaternionicAnalysis/README.md:690`: “`*Needs:* §5.1, §5.2, §5.4`”; also §§1.1–1.3, 2.1–2.2, 2.4–2.5, 3.1, 4.1–4.2, 5.1–5.2.

**Claim:** targets are in build order and each target identifies the inputs of its statement and proposed proof.

**Witness:** §5.3 explicitly consumes the later §5.4. §5.2's parameter-reflection law also needs change of variables, but has no `*Needs:*` line. The listed earlier subsections similarly have only layer-level dependencies or prose hints.

**Repair:** move affine change of variables ahead of raw reparametrization and the axis-face match, make R04's cofactor consequence explicit before the affine Cauchy theorem, and update the section references. Add a local `*Needs:*` line to each remaining target. In §3.2 cite `second_derivative_symmetric_of_eventually` (`Mathlib/Analysis/Calculus/FDeriv/Symmetric.lean:463`) for the local argument: the currently named version at line 482 asks for differentiability at every point of the ambient space. This replacement works on a small ball inside `Ω` even when `f` is arbitrary outside `Ω`. The supplied roadmap dependency graph has no cycle; this finding concerns internal ordering and precise contracts.

## R07 (P3) — The one-form definition still lacks its own API and three Checks

**Location:** `TauCetiRoadmap/QuaternionicAnalysis/README.md:599–617`: “Define `dq = dt + i dx + j dy + k dz`”.

**Claim:** every introduced definition has a usable API and at least three discriminating Checks.

**Witness:** §5.1's first three Check bullets concern `Dq` or divergence; only the fourth concerns `dq`, repeating the same square-loop calculation from §2.4. There is no API list for `dq`.

**Repair:** give `dq`'s source and target and its evaluation/linearity API, consuming generic form operations from DifferentialGeometry. Add separate Checks, for example `dq(e_t)=1`, `dq(e_i+e_j)=i+j` (the conjugated form gives `−i−j`), and at `q=j` the two ordered evaluations `q*dq(e_i)=−k` and `dq(e_i)*q=k`. Retain the loop integral as an additional Check. This completes the still-unrepaired one-form portion of prior R04.

## R08 (P3) — Consume the native real calculus rules instead of adding targets for them

**Location:** `TauCetiRoadmap/QuaternionicAnalysis/README.md:325–326`: “State the general real Fréchet product and inverse rules separately”.

**Claim:** these general rules are additional work owned here.

**Witness:** `HasFDerivAt.mul'` is already proved at `Mathlib/Analysis/Calculus/FDeriv/Mul.lean:198`; `hasFDerivAt_inv'` is proved at line 735. The supplier contract already names both.

**Repair:** delete this target instruction and say that the exact quaternionic closure criteria consume the native rules and the chain rule. Retain the four nontrivial `iff` criteria. On inversion at `q=i`, the native derivative gives `h↦−i h i`, hence `j↦−j`, precisely the failure of a multiplication derivative that the new criterion detects. No replacement declaration belongs in `Suggested.lean`.

## R09 (P3) — Correct the qualified name of the radial integration supplier

**Location:** `TauCetiRoadmap/QuaternionicAnalysis/README.md:131`: `MeasureTheory.Measure.integral_fun_norm_addHaar`.

**Claim:** the radial integration theorem is in the nested `Measure` namespace.

**Witness:** `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:250` closes `namespace Measure`; the theorem at line 296 is therefore `MeasureTheory.integral_fun_norm_addHaar`.

**Repair:** remove the extra `Measure.` from the supplier contract. The corrected declaration gives, in dimension four at radius one, `4·(π²/2)·1=2π²`, so the radial-mass calculation itself is unchanged. This is an existing supplier under a misspelled name, not an unowned theorem.

## Verified sound

This is a full AI-assisted review of both files at `e9800b0098fd8ec2b137023dcbf13d7052582147`, not an incremental review. The PR worktree was not edited. The normative root README and CONTRIBUTING were read; the parent-relative paths in the supplied AGENTS text do not exist in this checkout. Shape was compared against DifferentialGeometry and ConformalMapping on main and the completed OrthogonalL2Bases roadmap.

### Previous findings, checked individually

| Prior finding | Passage or evidence at this head | Disposition |
|---|---|---|
| R01, missing headline signatures | `Suggested.lean:113` declares `twoSidedQuotient_rigidity`; lines 177–220 state both box Cauchy theorems and formulas; lines 239–279 state harmonicity, uniqueness and estimates. | Repaired. The docstring at lines 13–20 names the full affine and top-form comparisons it cannot state. |
| R02, constructor formula | README:95–97 names `QuaternionAlgebra.mk_mul_mk` at line 306. | Repaired; declaration reopened at the pin. |
| R03, shape | README:3 “**Summary.**”; headings at 15, 47, 83, 159, and six numbered layers with Examples and Dependencies. | Substantially repaired; missing local dependencies and one internal forward reference remain in R06. |
| R04, Checks | README:503 “`D = R_b`”; §§2.1, 4.1, 5.2, 5.6 now contain explicit calculations. | Partly repaired: one new calculation is false (R02); the one-form still lacks three Checks (R07). |
| R05, sources | README:990 “Locators … refer to the arXiv version v5”; D12 and Sudbery are separately identified. | Partly repaired. Two readable sources now exist, but missing target locators and manifest remain (R05). |
| R06, process narrative | README:351–357 presents the square-loop calculation as mathematics, with no transcription story. | Repaired. No process narrative of the previous kind found in either reviewed file. |
| R07, Lean form | `Suggested.lean:4` “Quaternionic analysis: target signatures”; line 31 `namespace TauCetiRoadmap.QuaternionicAnalysis`. | Repaired: single import, module/declaration docstrings, layer comments and correct namespace. |
| R08, padding | The former application lemmas, unused kernel-order definitions and composition-rule declarations are absent. | Repaired. All 19 remaining admitted theorems failed the basic one-tactic probes. |
| R09, weaker Lean statements | `Suggested.lean:64`, 73, 82, 91 and the three rigidity statements contain `↔`. | Repaired; both directions and the explicit forced slopes agree with the README. |

No repair report marking findings “not actionable in this package” was supplied among the readable job/package files; none of the findings above is a re-raise of such a disposition.

### Gate, elaboration, signatures and headlines

The recorded gate for this head passes every scanner, the dependency check and the targeted build; every reported count is zero. The outside-folder `git diff --stat origin/main...HEAD` is empty. Independent direct elaboration of `Suggested.lean` succeeds with **19 `declaration uses sorry` warnings and no other warnings or errors**.

Dependency check rerun with the specified main repository, order and `--movable`:

```text
depcheck: 208 roadmaps, 1456 edges, 0 problem(s)
```

No `UPWARD`, `CYCLE` or `moved:` line. There are no declared supplier gaps.

All **33 declarations** were checked mechanically with `#check @name` on a scratch copy and compared with their README descriptions: **14 real-bodied definitions and 19 theorem signatures**. No section binder disappeared; no signature was changed. The derivative bound has `∃ C` before `f, Ω, q₀, R, M`, so its constant is genuinely uniform. Interior membership in the two formula signatures implies all side lengths are positive; the Cauchy-vanishing signatures separately allow degenerate boxes. `IsConnected` includes nonemptiness; the README's empty-set observation is about the underlying equivalence, not an instance satisfying that Lean hypothesis.

The README's end results and deep intermediate results are: the four exact product/inverse criteria; left, right and simultaneous rigidity; left and right Cauchy vanishing and Cauchy–Fueter representation; real analyticity, harmonicity, uniqueness and uniform derivative estimates on each side. All **19** appear. The full affine integral statements and the smooth-top-form comparison are named in the docstring as depending on the raw face adapter and the unimplemented `integralTopForm`. The derivative-integral representation in §6.4 is an intermediate proof target for the estimates, not a substitute headline. None of the stated targets uses opaque or admitted data, an arbitrary predicate standing for missing mathematics, or a hypothesis containing its conclusion.

For each of the 19 admitted theorems a scratch copy tried `simp`, `rfl` and `infer_instance`, with `solve` enforcing complete closure before falling back to `sorry`. All 19 still required `sorry`. Inspection of the pinned calculus and analytic uniqueness declarations found no single native lemma with the same conclusion and hypotheses: the quaternionic derivative-shape criteria or the regularity-to-analyticity step is still needed. No padding finding is made against these signatures.

### Source verification: all 15 seeded targets

FL08 was fetched legally through the sources service from arXiv **0711.2699v5**; D12 from **1203.5619v1**. Page numbers below are the printed pages, which agree with the extraction page markers. The relevant FL08 pages 7–10 and D12 page 2 were also rendered locally to distinguish genuine source mistakes from lost bars or subscripts in extraction. Sudbery access is recorded below. The README explicitly marks no additional locator as unverified.

| Seeded target | Locator opened and scope actually supported | Result |
|---|---|---|
| 1.1 matrices | FL08 §2.1 p.7, FL08 lines 303–330; native component formulas at `Mathlib/Algebra/Quaternion.lean:823–835`. | Multiplication rules and derived 4×4 matrices agree; source's anticommutation misprint is not inherited. Layer example fails separately (R03). |
| 1.2 composition, inverse, norm, determinant | FL08 lines 313–330 give conjugation, inverse and norm multiplicativity. No local locator is attached to this target. | Composition and determinant identities verified algebraically below; missing locator recorded in R05. |
| 1.3 multiplication subspaces | No source locator supplied. Native component formulas and §1.1 determine all 16 entries. | Both systems checked in both directions; R05 concerns attribution. |
| 2.2 quotient limits | D12 §1 p.2, D12 lines 46–55, gives the ordered limits, not the Fréchet-remainder equivalence. | Norm identity independently establishes the equivalence off zero; R05. |
| 2.3 calculus | Native product/inverse/chain rules at `FDeriv/Mul.lean:198,735`, `FDeriv/Comp.lean:107`. | Rules have the necessary noncommutative order and nonzero hypothesis; exact closure criteria follow from commutators. R08 concerns replanning native rules. |
| 2.5 simultaneous slopes | D12 lines 58–61 describes global affine classifications, not this pointwise assertion. No local locator. | Pointwise assertion follows from derivative uniqueness, evaluation at 1 and the quaternion centre. R05. |
| 3.1 complex coordinates | Native multiplication and complex embedding; no external locator. | Scalar-action laws hold; the stated conjugation of a function fails (R01). |
| 3.2 left rigidity | D12 lines 58–61, §1 p.2; Sudbery Theorem 1 not accessible. | D12 supports the affine shape but is a summary, not a proof with connected-open hypotheses. The independent analyticity/second-derivative route is viable with R01/R06 repaired. |
| 3.4 simultaneous rigidity | D12 lines 58–61, §1 p.2. | Real slope and affine shape agree. Exact domain hypotheses are supplied by the roadmap's derivation from §3.2 and §2.5. |
| 4.2 component systems | FL08 Definition 1 p.8, lines 340–343, gives the ordered operators; native multiplication expands them. | Both four-row systems correct where real differentiability is assumed. No local locator on §4.2 (R05). |
| 4.4 closure/reflection | FL08 Definition 1 and Proposition 2 p.8, lines 340–349. | Source assumes `C¹`; the roadmap explicitly uses pointwise differentiability. The displayed derivative calculation proves the stronger local reflection statement without continuity of derivatives. |
| 5.2 raw face functional | No locator supplied for this new adapter; FL08 p.9, lines 378–406, fixes the form and outward orientation, not this construction/API. | Facet signs, reflection and degeneracies independently checked below; R05/R06 concern grounding and order. |
| 5.3 face comparisons | Native divergence:266, box integrability:305, box a.e. equality:70; DifferentialGeometry main 5.2 and boundary/corners policy. | Native face domains and signs agree. The supplier does provide top-form integration on arbitrary models with corners, independently of corners Stokes. |
| 5.4 affine change of variables | Native Lebesgue measure mapping:429, Bochner mapping:1076, set integral mapping:554; measurable-equivalence variants at Bochner Basic:1100 and Set:581. | Totalized integral formula is sound; use the equivalence/embedding variants for arbitrary `w`. The cited generic variants require a.e. strong measurability. The pointwise cofactor step must reference §5.3, not this section (R04). |
| 5.5 Cauchy vanishing | FL08 Corollary 8 p.9, lines 417–421, following Definition 1 and Proposition 7. | Correct classical comparison, with stronger source hypotheses. Pointwise box proof is supported by the pinned divergence theorem. Affine extension uses §5.3 pointwise naturality; correct its citation (R04). |

Also opened FL08 Proposition 3 p.8 (lines 350–362), equation (18) and Proposition 4 p.9 (lines 375–386), Theorem 9 p.10 (lines 424–447), and the regularity remark (lines 448–451). Theorem 9 has the claimed kernel order and `1/(2π²)` normalization; its exterior case excludes the **closure**, as the rendered page confirms. It assumes regularity on a neighbourhood of the closure, so the roadmap's weaker boundary hypotheses require its cutoff proof, not a direct quotation. The source's `∇` in Proposition 3 is explicitly `∂ₜ−i∂ₓ−j∂ᵧ−k∂_z`, not the Euclidean gradient: README:867 should spell this out when reusing that notation. At `r=i` the conjugate operator gives `G(i)=−i`; an ordinary-gradient reading would give `i`.

### Adversarial mathematics

Each row records an actual evaluation, algebraic comparison or negative control. Universal symbolic calculations cover their indicated arbitrary inputs; small tests are witnesses, not proofs of the headline theorems. `P(q)=t+ix`, `e=(1,i,j,k)`, and `G(r)=conj(r)/‖r‖⁴`. Zero-ring and positive-characteristic tests do not apply to the fixed real quaternion carrier; empty domains, zero slopes, singular charts, zero-dimensional change of variables, noncommuting units and totalized zero values do.

| Statement | Instances tried | Values on the two sides / computed comparison | Result | Change |
|---|---|---|---|---|
| Units and tuple convention | `i,j,k,1+i+j+k` | tuples `(0,1,0,0),(0,0,1,0),(0,0,0,1),(1,1,1,1)`; Euclidean norm of last `2`, tuple sup norm `1` | Correct distinct norms | None |
| Conjugation and norm | `q=1+i`, `q=0` | `q·conj q=2=‖q‖²`; at 0 both `0` | Correct | None |
| §1.1 left matrix | arbitrary `a=(α,β,γ,δ)`, `q=(t,x,y,z)` | product components `(αt−βx−γy−δz, βt+αx−δy+γz, γt+δx+αy−βz, δt−γx+βy+αz)` equal matrix output | Correct | None |
| §1.1 right matrix | same variables | components `(αt−βx−γy−δz, βt+αx+δy−γz, γt−δx+αy+βz, δt+γx−βy+αz)` equal matrix output | Correct | None |
| Matrix equality iff real | `a=2`, `a=i`; general coefficients | `L₂=R₂=2I`; `Lᵢ(j)=k`, `Rᵢ(j)=−k`; equality on i,j forces `β=γ=δ=0` | Both directions hold | None |
| Left composition | `a=i,b=j,q=1` | `LᵢLⱼ(1)=k=Lₖ(1)` | Correct | None |
| Right composition | same | `RᵢRⱼ(1)=−k=R_{ji}(1)`; reversed proposal gives `k` | Correct | None |
| Left/right commute | `a=i,b=j,q=i` | `i(ij)=−j=(ii)j` | Correct | None |
| Inverse maps | `a=i,q=j`; `a=0` | `L_{−i}Lᵢ(j)=j`; `R_{−i}Rᵢ(j)=j`; at zero composition is zero, not identity | Nonzero restriction needed | None |
| Norm scaling | `a=1+i,q=j` | `‖j+k‖=√2=√2·1`; at `a=0`, `0=0` | Correct | None |
| Determinants | arbitrary a; `a=2,1+i,0` | symbolic determinant `(α²+β²+γ²+δ²)²=‖a‖⁴`; examples `16,4,0` | Correct | None |
| §1.3 left component iff | `D=Lᵢ`, `Rᵢ`, conjugation | left-system values `Kx=−1=−Lt=Mz=−Ny`; `Rᵢ` has `Mz=1`; conjugation has `Kt=1,Lx=−1`. Conversely the equations reconstruct the first-column quaternion and all 16 entries | Correct both directions | None |
| §1.3 right component iff | `D=Rᵢ`, `Lᵢ`, real `r·id` | `Kx=−1=−Lt=−Mz=Ny`; `Lᵢ` has `Mz=−1`; real map has diagonal `r`, other entries `0` | Correct both directions | None |
| Layer 1 block example | `Lᵢ(j)` | printed block gives `−k`; product and §1.1 give `k` | False | R03 |
| Left quotient predicate | `f=qj`, `f=jq`, `f=id`, `f=c` | derivatives `Rⱼ,Lⱼ,id,0`; slopes `j`, none, `1,0` | Correct | None |
| Right quotient predicate | same | slopes none, `j,1,0`; `Rⱼ(i)=k≠−k=Lⱼ(i)` | Correct | None |
| Slope uniqueness | arbitrary a,b with `Rₐ=R_b` | evaluation at 1 gives `a=b`; likewise `Lₐ(1)=a` | Correct | None |
| Quotient sum/scalar rules | `f=qi,g=qj`, real scale 2 | `D(f+g)(h)=h(i+j)`; `D(2f)(h)=h(2i)` | Correct | None |
| Pointwise/on quotient interface | `Ω=∅`, `Ω={i}`, `f=q²` | empty universal assertion true; at i derivative on 1 is `2i`, on j is `0≠−2k` | Correct | None |
| §2.2 left norm identity | `h=2,Δ=6,b=1`; arbitrary `h≠0` | `‖3−1‖=2=‖6−2‖/2`; in general `‖h⁻¹(Δ−hb)‖=‖Δ−hb‖/‖h‖` | Correct | None |
| §2.2 right norm identity | same numbers; arbitrary `h≠0` | `‖Δh⁻¹−a‖=‖(Δ−ah)h⁻¹‖=‖Δ−ah‖/‖h‖`; numeric value `2` | Correct | None |
| Wrong quotient order | `f=qj`, increments ε and εi | left quotients `j,j`; right quotients `j,−j` | Correct negative control | None |
| Squaring limit | `q=i`, increments ε and εj | left limits `2i,0`; at real q=3 both slopes `6` | Correct | None |
| Left product iff | arbitrary hf,hg; `f=c,g=id` | derivative-minus-proposed-map `(f(q)h−hf(q))b_g`; `c=i,h=j,b_g=1` gives `2k`; `b_g=0` gives `0` | Exact centrality alternative | None |
| Right product iff | arbitrary hf,hg; `f=id,g=i` | discrepancy `a_f(hg(q)−g(q)h)`; at `h=j,a_f=1` gives `−2k`; `a_f=0` gives `0` | Exact centrality alternative | None |
| Left inverse iff | `f=id,q=i,h=j`; `q=2` | derivative at i `−j`, forced `R₁(j)=j`; at 2 both maps send j to `−j/4` | Correct | None |
| Right inverse iff | same | derivative at i `−j`, forced `L₁(j)=j`; at 2 both `−j/4` | Correct | None |
| Zero-slope inverse branch | `f≡i`; excluded `f=id,q=0` | constant inverse `−i` has slope 0; inversion at 0 has quotient `1/ε²` along real ε, unbounded | Correct exclusion | None |
| Composition orders | `b_f=i,b_g=j`; `a_f=i,a_g=j` | left slope `ji=−k`; right slope `ij=k` | Correct | None |
| Coordinate projections | `f=t` or x | derivatives have ranks 1; `R₀,L₀` rank 0, nonzero multiplications rank 4 | Correct nonexamples | None |
| Left-ordered one-form loop | square `0,i,i+j,j,0` | edge values `−1/2,k−1/2,k+1/2,1/2`, sum `2k` | Correct | None |
| Right-ordered one-form loop | same square | `−1/2,−k−1/2,1/2−k,1/2`, sum `−2k` | Correct | None |
| Simultaneous slopes | `ah=hb` at h=1,i,j | h=1 gives a=b; commuting with i kills j,k components; commuting with j kills i component | Precisely real slope | None |
| Bijective inverse is insufficient | `f=iq`, inverse `−iq` | right slopes `i,−i`; proposed real slope fails since `ij=k≠−k=ji` | Correct | None |
| Complex decomposition | `q=1+i+j+k` | `v=1+i,w=1−i`; `v+jw=1+i+j+k` | Correct | None |
| Left complex scalar law | `λ=i,q=j` | `Φₗ(ij)=Φₗ(k)=(0,i)=i(0,1)` | Correct | None |
| Right complex scalar law | `λ=i,q=j` | `Φᵣ(ji)=Φᵣ(−k)=(0,i)=i(0,1)` | Correct | None |
| Derivative complex-linearity | `R_j`, left scalar i, h=j | `R_j(ij)=kj=−i=i(jj)`; `L_j` with left scalar fails at 1: `−k≠k` | Correct matching actions | None |
| Conjugated function formula | `f=id`, input `(0,i)` | actual `(0,i)`; printed `(g,conj h)` gives `(0,−i)` | False | R01 |
| Left rigidity iff | `f=1+qi`, all ℍ; disconnected q i/q j | first case slope i and `(a,b)=(1,i)`; disconnected slopes i and j cannot be one constant b | Correct hypotheses | None |
| Second derivative rigidity step | symmetry `h Db(k)=k Db(h)` | k=1 gives `Db(h)=hc`; h=i,k=j gives `2kc=0`, hence c=0 | Valid division-ring argument | None |
| Local-component and uniqueness assertions | two disjoint balls; nonempty open ball | slopes i,j constant separately; two affine representations imply `h(b−b')=0` for nonzero small real h, hence b=b', a=a' | Correct | None |
| Reflection and right rigidity iff | `f=iq`, Ω ball about i | `Tf=−qi`, left slope −i; reflected centre −i; right affine form has b=i | Correct | None |
| Simultaneous rigidity iff | `2+3q`, `qi`, `iqi`, `−q` | slopes `(3,3)`, `(i,none)`, neither (1↦−1,j↦j), `(−1,−1)` | Correct | None |
| Fueter left condition | `D=0,id,R_i` | values `0,−2,−2i` respectively | Correct definition | None |
| Fueter right condition | `D=0,id,R_i` | values `0,−2,2i` respectively | Definition correct; Check false | R02 |
| Fueter pointwise predicates | `f=P`, `f=conj`, `f=q` | ordered operator values `(0,0),(4,4),(−2,−2)`; all have real derivatives | Correct | None |
| Setwise regularity/monotonicity | `P` on ℍ or subset; q on empty or singleton | P true on both domains; q true on ∅ but false on every singleton (`−2≠0`) | Correct | None |
| Fueter linear condition/API | `D_P`, `2D_P`, `D_P+D_P` | values `0,0,0`; all ordered sums linear over ℝ | Correct | None |
| Left component equations | `f=tj+xk` | four rows `(0,0,1−1,0)=(0,0,0,0)` | Correct | None |
| Right component equations | same f | rows `(0,0,1+1,0)=(0,0,2,0)` | Correct distinguishing example | None |
| Affine-vs-Fueter intersection | `a+qb`, `a+bq`, b=0 or i | matching operator `−2b`, hence `0` iff b=0; b=i gives `−2i` | Correct | None |
| Holomorphic slice examples | `P²` at t=1,x=0 | ∂t=2, ∂x=2i; both Fueter values `2−2=0`; on j derivative 0 | Correct | None |
| Matching constant multiplication | `Pj`, `jP` | left values `j+ik=0`, `j−ik=2j`; right values `2j,0` | Correct | None |
| Translation/dilation closure | `P(q+1)`, `P(2q)`, `P(0q)` | values `1+i²=0`, `2+2i²=0`, constant derivative 0 | Correct; domains pulled back | None |
| Nonreal precomposition | `P(qj)=−y−iz` | left value `−j−ki=−2j` | Correct negative control | None |
| Fueter reflection identity | `f=Pj`, `Tf=−tj+xk` | right value `−j+ki=0`; left value `−j+ik=−2j` | Correct | None |
| dq evaluations | `e_t`, `i+j`, factor q=j | outputs `1,i+j`; `j·i=−k` versus `i·j=k` | Correct repair witnesses | R07 |
| Dq coefficients | deleted coordinate triples 0,1,2,3 | `1,−i,+j,−k=(−1)^s e_s` | Correct | None |
| Dq alternation | repeated tangent, rank-one face | both tangent evaluations 0, integrals 0 | Correct | None |
| Reflection of Dq | σ=diag(1,−1,−1,−1) | three-spatial term −1; terms containing dt unchanged; equals `−conj Dq` | Correct | None |
| Exterior/divergence identity | `f=q` and `f=1` | top coefficient `1−1−1−1=−2` and `0`, agreeing with ordered divergence | Correct | None |
| Raw functional on constants | A=id, coefficient Dq·c | front/back values `eᵢc,−eᵢc`; sum 0 | Correct | None |
| Raw orientation reversal | f=t, A=id then A∘ρ | raw totals `1,−1` | Correct | None |
| Raw face norm/Jacobian | A=diag(2,1,1,1), constant coefficient | face Jacobians `1,2,2,2`; norms of integrals `J‖c‖`, equal to bound | Correct | None |
| Raw degeneracy | rank≤1 A | every tangent triple has Dq=0, hence Raw=0 | Correct | None |
| Raw reflection | A=id, f=t, σ on target | raw(id)=1; raw(σ)=−1; pullback-form raw also −1 | Nonzero witness confirms sign | None |
| Subdivision/internal cancellation | f=t, split t interval at 1/2 | subbox raw values `1/2+1/2=1`; common-face terms `+1/2−1/2=0` | Correct | None |
| Native boxBoundarySum | Fᵢ=eᵢ xᵢ, unit box | front eᵢ, back 0, sum `1+i+j+k` | Correct | None |
| Axis match/orientation | x-front and x-back | raw Dq on unreflected triple −i; front reflection makes +i, back stays −i | Correct | None |
| Bochner/BoxIntegral match | constant 1 on unit 3-cube | each integral 1; Ioc vs Icc differs only on null faces | Correct | None |
| Top-form facet comparison | t-front, x-front, constant f=1 | native face integrals `1,i`; positively oriented chart form coefficients `1,i` | Supplier supports comparison | None |
| Affine integral, n=0 | unique point, det empty matrix=1, w=c | both integrals `c` under zero-dimensional volume | Correct | None |
| Affine integral, scaling | n=1,L=2,w=1; n=2,L=diag(2,3) | both sides `2`; both sides `6` | Correct | None |
| Affine integral, reflection | n=1,L=−1,w=1 | both sides `1`; signed determinant would give −1 | Correct | None |
| Affine integral, totalized | n=1,L=id,w=1/x on [0,1] | both Bochner integrals 0 because not integrable | Correct | None |
| Affine integral, wrong singular extension | n=0 vs n=1,L=0 | invertibility holds in n=0; n=1 is excluded and determinant 0 | Scope correct | None |
| Left Cauchy box | P, unit box | t-pair `1`, x-pair `−1`, remaining `0,0`; sum 0 | Correct | None |
| Right Cauchy box | P, unit box | same pairs `1,−1,0,0`, sum 0; f=q gives −2 and is excluded | Correct | None |
| Degenerate box | a₀=b₀ | t-faces identical and cancel; other faces measure 0; sum 0 | Correct | None |
| Affine Cauchy extension | L=diag(2,1,1,1), f=P | naive Fueter pullback `1`; cofactor divergence `2−2=0`, flux `2−2=0` | Correct transformation; citation needs repair | R04 |
| Kernel/body/junk value | r=0,1,2,i | `G=0,1,1/8,−i`; inverse/norm and conjugate/norm⁴ agree off 0 | Correct | None |
| Kernel homogeneity | r=i, λ=2 | `G(2i)=−i/8=2⁻³G(i)` | Correct | None |
| Both kernel equations | `G_s=conj r ‖r‖⁻ˢ`, r≠0 | either ordered value `(4−s)‖r‖⁻ˢ`; s=4 gives 0, s=2 at r=1 gives 2 | Correct | None |
| Left kernel-weighted identity | f left regular, r≠0 | product-rule sum `(∂̄ᵣG)f+G(∂̄ₗf)=0+0=0` | Correct factor order | None |
| Right kernel-weighted identity | f right regular, r≠0 | `(∂̄ᵣf)G+f(∂̄ₗG)=0+0=0` | Correct factor order | None |
| Cutoff definition | s=1/2,3/4,1 | ψ values `0,1/2,1`; near r=0 cutoff field identically 0 | Correct | None |
| Cutoff divergence | arbitrary r≠0; r=i | `G(r)r=‖r‖⁻²`; at i, `(-i)i=1`; resulting scalar weight `ε⁻¹ψ'‖r‖⁻³` | Correct | None |
| Radial mass | Euclidean dimension 4 | `4(π²/2)∫ε⁻¹ψ'(s/ε)ds=2π²·1` | Correct; qualified supplier name wrong | R09 |
| Left Cauchy–Fueter normalization | f=c, sphere centred at q₀ | `G(n)·n·c=c` on unit sphere; integral `2π²c`, normalized result c | Correct local mass; box follows cutoff | None |
| Right Cauchy–Fueter normalization | same | `c·n·G(n)=c`; integral `2π²c`, normalized result c | Correct | None |
| Wrong kernel placement | n=i, f=j, unit sphere point | correct `(-i)i j=j`; moving f between factors gives `(-i)j i=−j` | Order essential | None |
| Exterior pole | f=1, q₀ outside closed box | weighted divergence 0 throughout; boundary sum 0 | Correct exclusion of boundary | None |
| Affine formula scaling | A=λ id, λ>0 | face scaling λ³ times kernel scaling λ⁻³ =1 | Consistent; make the general-A transformation explicit | R04 |
| Smoothness under face integration | pole distance ≥δ>0 | kernel bound δ⁻³; first derivative bounded by constant·δ⁻⁴, finite face measure | Uniform dominator exists | None |
| Left/right harmonicity | P, norm², t²−x² | Δ values `0,8,0`; Fueter values `0,2q,2t−2ix` | Correct implication, converse fails | None |
| Operator factorization | cross x,y terms and diagonal x term | `−ij−ji=−k+k=0`; `−i²=1` | Correct Laplacian sign | None |
| Source conjugate operator | r=i, k₀=‖r‖⁻² | ∂x k₀=−2, conjugate operator=2i; `−½·2i=−i=G(i)` | Correct if ∇ defined as in FL08 | Clarify notation |
| Real-analytic kernel expansion | r=1,h=1/2 and h=i/2 | u=`3/4,−1/4`; squared norms `1/4,5/4=1−u`; at h=0 series G(r) | Correct | None |
| Absolute convergence radius | ‖h‖=δ/4 | upper bound `2/4+1/16=9/16<1` | Correct | None |
| Uniqueness, left/right | two balls with f=0/1, g=0; P vs 0 | disconnected equality fails 0≠1; P vanishes on t=x=0 yet P(1)=1 | Correct domain/open-set hypotheses | None |
| Infinite-jet uniqueness | f=P at 0; f=0 | P(0)=0 but first derivative on 1 is 1; zero function has every derivative 0 | Nontrivial jet condition | None |
| Derivative kernel sign | r=1, real parameter h | `G(1−h)=(1−h)⁻³`, derivative at 0 `+3`; `DG(1)[1]=−3` | Chain-rule minus sign needed | None |
| Derivative representation, m=0,1 | f≡1 | normalized m=0 boundary integral 1; derivative of constant formula 0 at m=1 | Correct | None |
| Uniform estimate, m=0 | f≡1,M=1 | lhs 1, rhs C₀; C₀=1 works, C₀<1 fails | Correct | None |
| Uniform estimate, m=1 | f=P,q₀=0,M=R>0 | operator norm 1; rhs C₁R⁻¹R=C₁; forces C₁≥1 | Correct | None |
| Uniform estimate, zero radius | f=P,R=0,m=1 | lhs 1, totalized rhs 0 | R>0 essential | None |
| Uniform estimate, constants | f≡1,m≥1 | lhs 0, rhs positive bound | Correct boundary case kept out of Lean padding | None |
| Cube geometry/scale | side R, then 2R | vertex radii R and 2R; face distance R/2; `R³(R/2)^(−3−m)=2^(3+m)R⁻ᵐ` | Correct scaling and domain | None |
| Reflection of consequences | f=Pj, Ω ball(i,R) | Tf=−tj+xk, right Fueter value 0; reflected centre −i, same R and norm bounds | Correct | None |

The table contains **110 computed rows**, covering all 15 seeded targets, all 19 Lean theorems, the retained definitions, the ancillary APIs and the targets touched by findings. Four scratch Lean examples verify `ij=k`, `ji=−k`, the two Fueter values at `R_i`, and `(0,i)≠(0,conj i)`; a fifth verifies the scalar arithmetic `2+i²=1` versus `2+2i²=0` in the affine witness. These scratch witnesses elaborate without admissions, errors or warnings. They are review evidence and are not additions to the acceptance file.

### Pinned-library audit

Pins read from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following **25 source groups** were opened at those pins. Paths below are library-repository-relative; line numbers identify the declarations, not a newer online version.

| Pinned source | Declarations and hypotheses checked |
|---|---|
| `Mathlib/Algebra/Quaternion.lean:96` | `QuaternionAlgebra.equivTuple`: constructor coordinates, with inverse from the four tuple entries. |
| `Mathlib/Algebra/Quaternion.lean:306` | `QuaternionAlgebra.mk_mul_mk`: all four coordinates in the general symbol algebra. |
| `Mathlib/Algebra/Quaternion.lean:479` | `reₗ`, `imIₗ` (486), `imJₗ` (493), `imKₗ` (500), `linearEquivTuple` (506). |
| `Mathlib/Algebra/Quaternion.lean:598` | `star_mk`: real coordinate `a₁+c₂a₂`, and three negated imaginary coordinates. |
| `Mathlib/Algebra/Quaternion.lean:823` | `Quaternion.re_mul`, `imI_mul` (827), `imJ_mul` (831), `imK_mul` (835), used in the sign witnesses. |
| `Mathlib/Analysis/Quaternion.lean:42` | Inner product `(a*star b).re`; Euclidean norm, `InnerProductSpace` (60), norm-square identity (63), normed division ring (85), normed real algebra (89), complete space (194). |
| `Mathlib/Analysis/Quaternion.lean:138` | `Quaternion.ofComplex` is an ℝ-algebra map; `linearIsometryEquivTuple` (158) targets EuclideanSpace, not the tuple sup norm. |
| `Mathlib/Analysis/Normed/Operator/Mul.lean:39` | `ContinuousLinearMap.mul` is the native continuous bilinear multiplication; flip gives right multiplication. |
| `Mathlib/Analysis/Calculus/FDeriv/Mul.lean:198` | `HasFDerivAt.mul'` preserves noncommutative order; `hasFDerivAt_inv'` (735) requires `x≠0` and has derivative `−x⁻¹ h x⁻¹`. |
| `Mathlib/Analysis/Calculus/FDeriv/Comp.lean:107` | `HasFDerivAt.comp`: derivative composition in the order outer after inner. |
| `Mathlib/Analysis/Calculus/FDeriv/RestrictScalars.lean:89` | `hasFDerivAt_of_restrictScalars`: needs the chosen larger-scalar continuous linear map to restrict to the real derivative. |
| `Mathlib/Analysis/Calculus/FDeriv/Symmetric.lean:463` | Local `second_derivative_symmetric_of_eventually`; compared with global `second_derivative_symmetric` at 482. |
| `Mathlib/Analysis/Analytic/Uniqueness.lean:223` | `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`: two analytic functions, preconnected set, a point in it, equality on a neighbourhood. |
| `Mathlib/Analysis/InnerProductSpace/Laplacian.lean:138` | Native Laplacian on functions, real finite-dimensional inner-product domain; orthonormal-basis formula (171). |
| `Mathlib/MeasureTheory/Integral/DivergenceTheorem.lean:266` | Closed-box continuity, pointwise Fréchet derivative off a countable set, integrable divergence; no continuity of derivative. All `insertNth` front/back conventions checked. Equivalence variant at 313 also inspected. |
| `Mathlib/MeasureTheory/Measure/Lebesgue/Basic.lean:429` | `Real.map_linearMap_volume_pi_eq_smul_volume_pi`: determinant nonzero; scaling is reciprocal **absolute** determinant. |
| `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean:1076` | `integral_map` needs a.e. strong measurability; `MeasurableEmbedding.integral_map` (1088) and `integral_map_equiv` (1100) remove that assumption. |
| `Mathlib/MeasureTheory/Integral/Bochner/Set.lean:554` | `setIntegral_map` and embedding version (562), `setIntegral_map_equiv` (581), including restriction transport. |
| `Mathlib/Analysis/BoxIntegral/Integrability.lean:305` | `MeasureTheory.ContinuousOn.hasBoxIntegral`: complete codomain, locally finite measure, closed-box continuity. `Box.coe_ae_eq_Icc` at `Analysis/BoxIntegral/Partition/Measure.lean:70` supplies the volume-a.e. boundary comparison. |
| `Mathlib/MeasureTheory/Measure/Haar/InnerProductSpace.lean:139` | `PiLp.volume_preserving_toLp`, from tuple coordinates to EuclideanSpace; no quaternion measure instance is needed. |
| `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:296` | `MeasureTheory.integral_fun_norm_addHaar`: finite-dimensional, nontrivial real normed space, Borel/additive Haar measure. Applied in dimension 4; `volume_ball_of_dim_even` at `MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:359` gives π²/2 for radius 1. |
| `Mathlib/Analysis/SpecialFunctions/SmoothTransition.lean:146` | Actual smooth-transition body, positive denominator, zero/one ranges, `contDiff` and `monotone` (222). |
| `Mathlib/Geometry/Manifold/IsManifold/Basic.lean:318` | `ModelWithCorners.ofConvexRange`: continuous partial equivalence, full source, convex target with nonempty interior and continuous inverse; the clamped closed cube meets these conditions. |
| `Mathlib/Analysis/Calculus/ParametricIntegral.lean:208` | `hasFDerivAt_integral_of_dominated_of_fderiv_le`: common parameter neighbourhood, a.e. measurability, integrability and derivative dominator. `iteratedFDeriv_succ_eq_comp_left` at `Analysis/Calculus/ContDiff/FTaylorSeries.lean:843` fixes currying. |
| `TauCeti/Analysis/Complex/CauchyIntegralPolydisc.lean:275` | `DifferentiableOn.analyticOnNhd_of_finiteDimensional`: finite-dimensional complex source, complete complex codomain, open set. All hold for `ℂ×ℂ`. |

`HasFPowerSeriesOnBall` was also opened at `Mathlib/Analysis/Analytic/Basic.lean:74`: its fields require a positive radius bounded by the series radius and convergence to the actual function on that ball. It is not merely a formal coefficient family.

The native coordinate equivalence is real-linear; it is not an isometry to the sup-norm tuple. The native derivative predicate includes differentiability and its little-o approximation; the roadmap's Fueter predicates require that predicate, so zero-valued `fderiv` at a nondifferentiable point cannot accidentally make a function regular. The model-with-corners constructor does not assert that the entire cubical boundary is a manifold. The roadmap correctly compares integrals facet by facet.

### Ownership and supplier order

Object searches used the requested `roadmaps grep` service over its index of **440 open pull requests plus main**, and direct searches of the pinned libraries and board package READMEs/designs. Patterns included Fueter regularity, quaternionic analysis, quotient derivatives, quaternion matrices/complex coordinates, affine faces, cofactors/Piola transforms and affine change of variables. Relevant object matches were read rather than treating matching names as ownership evidence. The service's citation resolver reports no unresolved cross-roadmap name; its output says it did **not** inspect pinned Lake packages, so the manual pin audit above supplies that check.

The analysis spine—one-sided quaternion derivative classification, pointwise Fueter calculus and ordered Cauchy–Fueter integrals—has no competing owner found in the readable main/open/package sources. QuaternionArithmetic's open README, lines 20–25 and 59–97, concerns symbol algebras over number fields, orders, ramification and Shimura curves, not this real analytic theory. The quaternion complex-matrix representation in `TauCeti/Algebra/Quaternion/ComplexMatrix.lean:165,174` has a 2×2 complex matrix and determinant equal to the reduced norm; it is a different object from the 4×4 real multiplication matrices here. `TauCeti/Algebra/Quaternion/ComplexSubfield.lean:105–125` supplies `jUnit`, the coordinate of `ofComplex I`, and conjugation of that embedded I; it does not supply the two derivative transports or their rigidity theorem. No duplicate fully qualified `TauCetiRoadmap.QuaternionicAnalysis.*` declaration was found outside this folder.

Generic quaternion algebra, ordinary Fréchet calculus, box divergence, Lebesgue measure transport, radial integration and the analytic identity principle belong to the pins. These are consumed in the contracts; R08 removes the one explicit instruction to restate native calculus as work. The affine continuous-coefficient adapter and its ordered flux comparisons are legitimate new content over those generic objects.

Cross-roadmap references were resolved against **main `9c6e95d9`**, not substituted with proposed revisions to existing roadmaps:

- `TauCetiRoadmap/DifferentialGeometry/README.md:269–370`, Layers 0–2: alternating/form carriers, exterior derivative and pullback, and chart-sign orientations. The boundary/corners policy at lines 64–90 explicitly gives Layers 0–2 over arbitrary models with corners.
- The same file at lines 511–517, §5.2: `integralTopForm` and `integralTopForm_of_tsupport_subset_chart`. Lines 79–90 explicitly allow the integral itself over any model; only the Stokes interface needs special boundary machinery. The excluded §5.5 at lines 529–534 is really corners Stokes. Thus the facetwise comparison does not secretly depend on that excluded result.
- `TauCetiRoadmap/ConformalMapping/README.md:103–146`, L0–L6: one-variable geometric holomorphic theory, the Riemann mapping theorem and disc automorphisms. The quaternion roadmap mentions it as a scope boundary, not a proof input; there is no upward dependency to its open revision.

All readable `*Needs:*` lines were traced. External supply runs from the pins and main's DifferentialGeometry into this roadmap. No supplier cycle, upward edge, undeclared external gap or need to move ownership to a later roadmap was found. The internal affine edge and local symmetry citation need the corrections in R04/R06. Ownership against the listed open heads was searched; no unlisted open work was independently fetched.

## Not verifiable

- **Sudbery 1979, Theorem 1 and the Cauchy/Cauchy–Fueter locators.** The sources service tried DOI `10.1017/S0305004100055638` and reached Cambridge's article abstract/landing page; it obtained no legal full text. Consequently the theorem number, printed page and exact hypotheses could not be certified. The README calls this a locator-only citation. The failed fetch is recorded in the job's missing-reference artifact; no source was copied into the PR and no manifest was edited. The review is finished without requesting access or parking it.
- **Absent local locators.** For the sections listed in R05 and the source table, there is no theorem/page locator to verify. Algebraic correctness was checked directly where possible, but that is not verification of an unstated bibliographic claim. In particular, D12's introduction is not a proof of the local rigidity theorem and FL08's closing remark is not a proof of every quantitative derivative estimate.
- **Mathematical completion.** This is a roadmap review, not completed formal proofs of its 19 admitted targets. The cofactor/naturality step, cutoff integral argument, analytic power-series regrouping and uniform derivative argument have been checked as proof routes with the computations above; their final formal proofs remain roadmap work.

## Source issues

- **Misprint** in FL08 at §2.1, printed p. 7 (FL08 line 307): the source says a product of distinct imaginary generators equals its own negative; it should be the negative of the reversed product; affects nothing.
- **Misprint** in FL08 at the defining property preceding equation (18), printed p. 9 (FL08 line 376): the source says the newly defined form has the label Dz in that identity; it should be Dx; affects nothing.
- **Error** in FL08 at Lemma 6, printed p. 9 (FL08 lines 389–401): the source says the flux form equals an arbitrary nonzero outward normal times Euclidean area; it should be the unit outward normal times area; affects a stated result.
- **Error** in D12 at §1, coordinate formulas in the parenthetical remark, printed p. 2 (D12 lines 81–82): the source says the imaginary coordinates equal positive half the displayed conjugate commutators; it should be negative half those commutators; affects a stated result.

For the source-error witnesses, choose a flat facet with outward normal `2e₀`: `Dq(e₁,e₂,e₃)=1`, while the unnormalised-normal expression gives `2`. For D12 choose `z=i₁`: the claimed first imaginary-coordinate formula evaluates to `−1`, whereas the coordinate is `1`; inserting the minus sign gives `1`. These defects were confirmed in the rendered sources. Neither erroneous formula is used as stated by this roadmap.
