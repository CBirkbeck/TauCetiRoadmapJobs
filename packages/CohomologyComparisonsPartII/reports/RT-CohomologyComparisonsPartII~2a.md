<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/110#issuecomment-6313667423 -->
Red team round 2 pass a (codex) of 4d14e60

Verdict: needs_changes

1. **F01** (P3) The replacement filtration Check is false after forgetting filtration

   **Location:** `packages/CohomologyComparisonsPartII/README.md:262`: “Forgetting filtration would admit nonzero maps into O(1).”

   **Claim:** The degree-zero Tate Check distinguishes filtered morphisms from morphisms preserving only connection and Frobenius.

   **Witness:** At Spec(Z_p), a linear map O→O(1) is multiplication by a∈Q_p. Frobenius compatibility still requires a=p⁻¹a, hence a=0. AM line 152–154 and AM line 181–184 specify these morphisms and twists.

   **Exact repair text:** Replace the final sentence by: “Frobenius alone also forces Hom(O,O(1))=0 here. To test filtration separately, take the rank-one object T with Φ=1, F⁰T=0 and F⁻¹T=Q_p. Then Hom_FilFMIC(O,T)=0, while forgetting filtration gives Hom(O,T)=Q_p; the identity scalar is the negative control.” Keep the O(0)/O(1) evaluation computations.

   This is a new error in the replacement for review b.F04, not a re-raising of the old collision or tautology.

2. **F02** (P1) The general affine comparison consumes a supplier restricted to AM bases

   **Location:** `packages/CohomologyComparisonsPartII/README.md:658`: “Frobenius compatibility additionally uses the AM lifts”; supplier `relative-rigid-coefficients` at README:114; prerequisites at README:664.

   **Claim:** The relative rigid realization and its connection are supplied for the §6.5 comparison over every complete mixed-characteristic DVR, even without an AM Frobenius lift.

   **Witness:** Take V=Z₂[π]/(π²−2), S=Spec(V[t]), U=S×A¹. Section 6.5 admits this base, but README:191 proves it has no required F_V. Both §6.1 and the relative-rigid-coefficients contract require F_V.

   The existing general rigid-realizations contract is absolute (README:110); AdicSpacesPartIV supplies analytic forms and coherent acyclicity, not this relative rigid direct-image realization. AM line 117–120 imposes F_V before the relative definition at AM line 451–496. The issue is the uncovered consumer domain, not the absence of an implementation of a declared gap.

   **Exact repair text:** Add a separately registered contract, consumed by §6.5: “What PadicDifferentialEquationsAndRigidCohomology must provide (gap:relative-rigid-realization): For a complete mixed-characteristic DVR V with perfect residue field, K=Frac(V), S smooth affine over V, and u:U→S smooth quasi-projective, supply the frame-independent relative rigid complex, its identification with Ru_K^an,* j†Ω•_(U_K^an/S_K^an), and its Gauss–Manin connection, natural under morphisms of lifted families; no Frobenius lift is assumed.” Use AM Definition 2.12 and Remark 2.13, AM line 451–496, as the construction locator, explicitly marking the extension beyond the source’s AM standing assumptions. Move the overlapping relative realization clause out of `relative-rigid-coefficients`, leaving its Frobenius enhancement there. Consume the new contract also in §6.1. State the existing affine coherent-model/derived-colimit clause for arbitrary such V independently of F_V, and record that generality in its registry needs. Register the same slug, supplier and needs in design/plan.json. Keep the all-DVR comparison and the conditional Frobenius assertion in §6.5.

## Earlier findings: repair verification

The identifiers below are the original reports’ F-identifiers. The mathematical findings are checked independently of the repair report.

| Earlier finding | Status | Repaired passage and witness |
|---|---|---|
| a.F01, b.F01 | Repaired | README:427: “a=floor(r/(p−1))”; README:433: “integral coordinate p^c a_(r+s)!/(a_r!a_s!)”. At p=2 the weight-one product is 1/4, which lies in the floor weight-two lattice. README:441 distinguishes the global kernel from the chart’s p^r-exact sequence; CN line 968–977 and EN line 306. |
| a.F02 | Repaired mathematically; elaboration unverified | Suggested.lean:113: “((2 : ZMod 2) • (LinearMap.id : ZMod 2 →ₗ[ZMod 2] ZMod 2)) = 0”; lines 109–118 also give the generator-coordinate identities, reduction kernel and nonzero generator class. README:46 explicitly identifies the coordinate quotients. Multiplication by 2 reduces to zero on a nonzero F₂; MathlibPadicReductionReview line 450–464 and MathlibSpanReview line 895–906. |
| a.F03 | Repaired | README:554: “D1(2,0)(e1,0,0)=e0”; README:560: “transported D1=−e0/2”. Suggested.lean:213–219 adds independent nonzero D1 evaluations. Substitution into D1=N(a)−c+p^(1−r)φ(c) gives all four values. |
| a.F04 | Repaired as a declared contract; settled | README:150: “the natural quasi-isomorphism λ:Kos(Γ_R,M)≃RΓ_cont(Γ_R,M)”. The same slug and needs occur in design/plan.json and README:487 consumes it. CN line 1933–1954 supplies the bridge’s specification; QWittVectors §1.7 supplies only commuting directions. The repair report’s “not actionable in this package” reason is valid: implementing the newly declared supplier theorem is not this package’s job. |
| a.F05 | Repaired | README:658: “H^j(S_K^an,R^iu_rig j†O)=0 for every i≥0 and j>0”; README:660 exports `_ofCoherent`. This matches AM line 639–645. The general acyclicity condition is no longer replaced by coherence. |
| a.F06 | Repaired | README:248: “the input (2,5) maps to (2,−4)”. Suggested.lean:38–41 evaluates d_A=id, d_B=2id, f=3id: first coordinate 2 and second 6−10=−4. |
| a.F07 | Repaired mathematically; elaboration unverified | README:442: “enLattice 3 4 … equals cnLattice 3 2”. Suggested.lean:79–97 supplies the third EN case. Its generators are 1/18 and 1/9, with ratio 2∈Z₃ˣ; MathlibPadicLattice line 317–319 and line 389. |
| b.F02 | Repaired | README:110: “Algebraic filtered de Rham realizations belong to `relative-hodge`.” README:90 now requests the absolute characteristic-zero version from CohomologyComparisons; README:300,316,332,771 consume that contract. The rigid contract no longer requests that construction. |
| b.F03 | Repaired | Suggested.lean:188–195 states D0 with scaled N equal to the coordinate adapter applied to classical D0; its second conjunct is the D1 square. README:546: “the two chain-map squares”. Linearity verifies both, also at e=0; invertibility remains restricted to e≥1. |
| b.F04 | Partly repaired | README:743 renames the Check `detectSection_zeroModule`; README:459 tests the nonzero inertia H¹ stalk rather than merely naming the site. README:262 replaces the tautological evaluation Check, but its claimed negative control is false: see S01. |
| b.F05 | Repaired differently, correctly | README:499: “exact closed and open restriction detect its cohomology kernel and cokernel”. Exact inverse image commutes with cohomology, kernels and cokernels; the generic restrictions vanish, and the closed restrictions have exponent A_EN or B_EN. No doubling is needed for these sheaves. EN line 380–386 supports the same bound. |
| b.F06 | Repaired | README:550 uses `gap:hyodo-kato-proper` and `gap:rational-descent`; README:664 uses `gap:relative-rigid-coefficients`. README:92 and :114 explicitly request the convention identification and affine coherent-model comparison, respectively. Registry needs match verbatim; these are no longer unsupported section exports. |

## Verified sound

Read all 824 README lines and all 233 Suggested.lean lines. The running inventory contains 96 bold items (including contract labels, Check headings and references), 33 mathematical subsections, 173 distinct roadmap-owned target/API names, and 115 named Checks. All 15 Lean declarations were read: five definitions, four admitted theorem signatures and six examples with proof bodies. The Check audit is mathematical and by hand; it is not a Lean execution result. S01 identifies the false negative control.

Inspected 224 distinct source-line locator strings across the 25 certified cached works, including their surrounding hypotheses. This verifies the locator and the specified mathematical interface, subject to the OCR limits below; it does not certify implementations of enhanced supplier contracts. The 16 cached Lean source files match the local pinned files byte for byte. Both local library revisions equal the manifest pins. The main README and CONTRIBUTING rules were read. No additional source was needed; the manifest's BesserII entry remains settled as uncertified and is not used.

Checked 34 section/target locators across the six available main suppliers and QWittVectors: AdicSpacesPartIV (six sections and four named dagger targets), RigidAnalyticGeometry (six sections), EnhancedDerivedSheaves (six interfaces), EtaleCohomologyFoundations (eight sections), DerivedModuleAlgebra (one), GrothendieckEulerForms (two), and QWittVectors §1.7. Searched all main/Completed roadmaps and both other supplied open-roadmap folders by object; no competing classical syntomic implementation was found. The QWittVectors cochain signs agree with the CN commuting-direction construction after applying Hom to CN's chain resolution. The arithmetic twisted direction remains a separate contract.

All 33 gap slugs occur in the README, every registry needs string occurs there verbatim, and every supplier is named. The new Koszul contract is precise about coefficients, reduction, the noncommuting arithmetic direction and the Frobenius target S′. The earlier Hodge ownership duplication is removed. Declared contracts are accepted conditionally, without treating unavailable supplier implementations as findings. S02 concerns a consumer outside its declared contract's hypotheses.

The prescribed dependency check exited with status 0:

```text
depcheck: 4 roadmaps, 31 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurs. No movement from a later owner is required by these findings. The gate's small graph does not establish the content of unavailable suppliers.

The head is 4d14e605caa3f3f756eb393a84cb37f563f82632. The origin/main comparison contains nine changed files, all inside `packages/CohomologyComparisonsPartII/`. Suggested.lean has one `import Mathlib`, no additional imports, no admitted data or admitted examples, no `set_option`, no `lemma`, and no empty proposition or forbidden diagnostic commands. Its nine named declarations occur in the README. No computational algorithm or pull-request number occurs in README/docstrings. The geometric headlines require missing geometric carriers; no additional easy missing headline or forced geometric substitute was established.

### Lean declarations, contexts and adversarial calculations

Each module below carries its own AddCommGroup and Module ℚ instances. Type* universes are independent. No theorem relies on an ambient variable/include block: every required hypothesis appears in its own signature. Lines refer to `packages/CohomologyComparisonsPartII/Suggested.lean`.

| Declaration / line | Section and variable/instance context | Instances tried and result | Change |
|---|---|---|---|
| `fiberCoordinatesDifferential` / 20 | §1.4; four ℚ-modules A,A′,B,B′; dA,dB,f linear; x:A×B | Zero modules; basis inputs; dA=id,dB=2id,f=3id at (2,5): (2,−4). | None |
| example / 29 | §1.4; all carriers ℚ; dA=0,dB=id,f=2id | (1,0)↦(0,2), (0,1)↦(0,−1); both signs fixed. | None |
| example / 38 | §1.4; all carriers ℚ; dA=id,dB=2id,f=3id | (2,5)↦(2,−4); first differential is exercised. | None |
| `enLattice` / 51 | §4.1; p,r:ℕ; explicit Fact p.Prime; span over PadicInt p in Padic p | r=0; (p,r)=(2,2),(3,4): generators 1,1/8,1/18. Denominators nonzero. | None |
| `cnLattice` / 59 | §4.1; p,a:ℕ; explicit prime instance; same scalar carriers | a=0,1,2; at p=2 generators 1,1/2,1/4. Parameter is the exponent, not the weight. | None |
| `cnLattice_le_enLattice` / 64 | §4.1; p,r:ℕ and prime instance | Integral a! multiplies the EN generator to the CN generator. Works at a=0 and p=2. | None |
| `modifiedLattice_generator` / 70 | §4.1; same binders | Cancel nonzero p^a and a! in characteristic zero; 1/4=2/8 at p=2,r=2. | None |
| example / 79 | §4.1; arbitrary prime p plus concrete p=3 | Weight-zero spans; 1/18 and 1/9 generate equal Z₃ lattices because 2 is a unit. | None mathematically |
| example / 102 | §4.1; p=2, a=0,1,2; z:PadicInt 2 | Both inclusion coordinates equal 2; mod 2 the maps vanish but the unit class does not. Product 1/4 is outside (1/2)Z₂. | None mathematically |
| `semistableD0` / 158 | §5.2; p,r:ℕ; ℚ-modules D,E; linear phi,N,iota; x:D | r=0,1; zero spaces; rank-two block. Definition remains meaningful at p=0 without a geometric claim. | None |
| `semistableD1` / 166 | §5.2; p,r:ℕ; D,E; phi,N linear; y:D×E×D | r=0 gives 1−pφ below. Independent inputs give e0,e0,e1. | None |
| `semistable_d_squared` / 173 | §5.2; prime instance; D,E; explicit N.comp phi=p•phi.comp N | D1D0=−p^(−r)Nφx+p^(1−r)φNx=0; r=0 and zero modules included. | None |
| `semistable_baseConvention_differentials` / 185 | §5.2; p,r,e:ℕ; D,E; arbitrary phi,N,iota,x,a,b,c | Both squares follow from linearity with scalar −1/e. e=0 gives valid equations but no equivalence. | None |
| example / 198 | §5.2; arbitrary p,r,D,E,phi,N,iota | Both differentials send zero to zero; supplemented by nonzero tests in next example. | None |
| example / 209 | §5.2; D=E=ℚ²; phi=diag(1,2); N(e1)=e0; iota=id | Recomputed all twelve conjuncts at r=0,1 and e=0,2, including independent D1=−e0/2. | None mathematically |

### README adversarial pass

Each row includes the subsection's milestone and its named component API; the running inventory records each target and every bold item separately. “None” means no further defect established in these tests, with declared contracts retained, rather than a proof of every future implementation.

| Statements | Instances tried | Result | Change |
|---|---|---|---|
| Conventions | p=2,3; π²=p; empty chart; generic-only chart; mixed versus equal characteristic | AM Frobenius is obstructed on ramified bases; fields exclude zero rings, coordinate rings may vanish. Classical layers retain ramification. | None |
| §1.1 coefficient object/API | Zero, unit, Φ(e)=te on G_m, Spec(K) | Horizontality rejects te; generic-only rigid realization is zero and is not faithful. | None |
| §1.2 tensor/dual/Tate/pullback | m=0,±1; zero factor; identity base map | Filtration jumps and inverse Frobenius twists agree; dual evaluations and cancellation respect the conventions. | None |
| §1.3 exact structure/Ext | Split extension, zero coefficient, differently filtered identity | Underlying exactness alone is insufficient; Ext⁰ is Hom; no abelian instance is assumed. | None |
| §1.4 connection fibre/API | Point O(0), O(1); zero coefficient; coordinate basis and (2,5) | H⁰=H¹=Q_p for O(0); O(1) has degree-one Q_p. Fibre signs and d² agree. | None |
| §1.5 extension evaluation/API | i=0 with Tate weights; split extension; Φe=e−h | Non-split class +(0,h) is nonzero. The filtration negative-control sentence fails because Frobenius also forces zero. | S01 |
| §1.6 injectivity/projections | F⁰H=0; Φe=e+ah; split lift; F⁰H≠0 | R=−ah; F⁰H=0 removes degree-zero coboundaries and makes the lift unique. | None |
| §2.1 specialization/API | Point, empty, Spec(K), identity pullback | sp=id_K at the point and K→0 on a generic-only component; no false general equivalence. | None |
| §2.2 rigid fibre/API | Z_p,r=0,1; empty special fibre; K≠K0 | Weight-zero diagonal kernel and first-target cokernel; positive-weight H¹=Q_p; generic-only fibre retains F^rDR. | None |
| §2.3 LES/products/descent | K=K0, sp=0, G_m, odd degrees | Elimination uses bc=id, not inverse sp; φ(dlog t)=p dlog t fixes the twist. | None |
| §3.1 divisible coefficients/API | n=1; r=0,p−1,p; p=2 | Division at a higher level is essential; py=0 mod p cannot select y. | None |
| §3.2 two integral fibres/API | r=0; zero map A→B; empty scheme | Zero-map fibre has H⁰=A,H¹=B; kernel replacement is restricted to the syntomic site. | None |
| §3.3 error maps/cups | r=0; p on Z/p²; products of weights | Both composites equal p^r; annihilated errors do not give integral inverses; no multiplicativity claim for τ. | None |
| §3.4 completion/presentations | r=0; horizontal point; tail inclusion tower | DR/F⁰=0; inverse of ω is p^(−r)τ; lim¹ of tail tower is product/direct sum, not zero. | None |
| §4.1 lattice/API | p=2,r=0,1,2; p=3,r=4; mod-2 inclusions; floor carry 0,1 | Actual integral products and factorial coordinate established; reductions can be zero between nonzero quotients. | None |
| §4.2 periods/API | r=0; canonical-log and trivial-log points; inertia character | Generic open is X_tr∩X[1/p]; nonzero geometric nearby H¹ excludes a constant sheaf replacement. | None |
| §4.3 small weights/API | p=2,3; n=1; t dlog t on G_m | Exact ranges r≤0 and r≤1; inverse Cartier uses a^p; undivided exactness is not inferred from ωτ=p^r. | None |
| §4.4 bounded periods/API | p=2,r=1; xy=π^h,h>1; q>r | General and enough-roots bounds remain separate; d-dependence at p=2 and the finite coefficient error are retained. | None |
| §4.5 gluing/API | Empty closed part; generic identity; closed and generic geometric stalks | Exact restrictions preserve the sheaf kernel/cokernel annihilator; no doubling needed. | None |
| §5.1 HK adapter/API | Point; nilpotent rank-two block; tame multiplicity m>1 | Correct Nφ=pφN and positive change law; non-Cartier example has nonbijective φ. | None |
| §5.2 total fibre/adapter/API | Zero spaces; r=0,1; e=0,1,2; independent rank-two inputs | Lower exponent is 1−r; both chain squares hold. Enhanced arithmetic-pair input is separate from proper cohomology. | None |
| §5.3 rational adapters/API | Identity; geometric extension; r=0; q>r | Base comparison remains truncated and on its declared pair domain. | None |
| §6.1 relative datum/API | Identity, empty family, P¹/S, generic divisor | Datum asserts no general finiteness; P¹ has H²=O(−1), with Frobenius p. | None |
| §6.2 promotion/API | c=0 on a line; nonfree graded piece; D(pt−1) | Algebraic finiteness is independent of rigid coherence; unbounded pole orders disprove finite algebraic H⁰ in the negative control. | None |
| §6.3 compactification/API | Constant G_m; empty boundary; colliding sections 0,t | Both total and relative NC conditions are necessary; collision gives x²=0 in the fibre. | None |
| §6.4 geometric domains/API | Projective curve of genus 0,g; G_m; p=2 | Separate rigid and algebraic contracts supply promotion; no universal compactification existence is claimed. | None |
| §6.5 differential comparison/API | A¹, G_m, proper elliptic curve; acyclic noncoherent input; ramified V | Acyclicity is correctly more general than coherence; proper counterexample is excluded. All-DVR relative input is not supplied by the AM-only contract. | S02 |
| §6.6 residue/API | Split G_m; nonsplit quadratic divisor over Z₂; empty boundary | Residues (1,−1), Gysin=sum; nonsplit trace-zero Frobenius is −2. Empty proper boundary retains H² outside affine theorem. | None |
| §6.7 extension projections/API | Split extension; n=0,1; H¹(G_m)(2) | F⁰=0 removes lift ambiguity; residue target twist is lowered by one. | None |
| §7.1 point lift/API | σ(t)=t^p; σ(t)=t^p+p; t=p arbitrary lift | Teichmüller and shifted lifts satisfy their equations; arbitrary lift t=p fails the unshifted one. | None |
| §7.2 section detection/API | Zero module; x=1; finite k and t^p−t; empty special fibre | Algebraic closedness is necessary; empty special fibre gives zero completion. | None |
| §7.3 specialization/API | Split extension; point identity; incompatible t=p | Pullback of a differential form vanishes at a point; cotangent tensor evaluation is not substituted for it. | None |
| §7.4 log/rigid comparison/API | Horizontal and vertical point, r=0,1; G_m | Weight-one H¹ dimensions 1 and 2 prevent identifying horizontal and vertical log structures. | None |
| §7.5 absolute value/API | Curve n=1,r=2; split extension; missing filtered vanishing | Connecting representative is +(0,b); both hypercohomology vanishings are needed for an isomorphism. | None |

## Not verifiable

- Lean elaboration, tactic closure and elaborated `#check` output were not run: the brief forbids Lean execution. The new lattice proof's unit coercions, span-membership unfolding, `field_simp`/`linear_combination` and reduction simplifications remain execution risks, not established defects. No Lean process was started.
- Accepted sections of CohomologyComparisons, CrystallineCohomology, PadicPeriodRings, PadicDifferentialEquationsAndRigidCohomology and PadicHodgeTheory are absent from the supplied main and open-roadmap inputs. Their source-based contracts were checked, but their current implementations and precise accepted section text cannot be certified. In particular, the base monodromy identification is a declared obligation; the displayed scalar adapter is mathematically correct conditional on it.
- BesserI's OCR loses parts of the fibre diagrams. The readable descriptions were checked against AM line 1314–1326 and the explicit cone calculation. Some TsujiNearby displayed formulas are OCR-damaged; the theorem locations, prose hypotheses and proof structure were checked, but the damaged glyphs are not independently certified.
- BesserII is settled as uncertified and unused here. There is no new missing-reference request.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4d14e605caa3f3f756eb393a84cb37f563f82632", "job": "RT-CohomologyComparisonsPartII~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
