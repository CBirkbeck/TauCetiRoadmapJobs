# CohomologyComparisonsPartII repair report

## F01 (P2) — not actionable in this package: gap registry is outside permitted files

Verified: the README has 32 contracts, while `packages/CohomologyComparisonsPartII/design/plan.json` has 31 gaps and omits `local-period-fundamental-sequences`. Its `period-rings` entry still includes the chart requirements. Registering the split and updating target prerequisites requires that excluded file. The README already assigns the chart contract to PadicHodgeTheory §§1.1–1.5,2.1–2.4; its consumption sentence now follows the sibling form.

CN line 973–980 specifies the chart Artin–Schreier, crystalline and annular sequences, including the radius conditions and continuous sections; CN line 1234–1239 specifies the filtered chart comparison. EN line 299–308 specifies the separate Fontaine–Messing coefficient input. Moving the chart requirements back into the README’s PadicPeriodRings contract would reverse the established ownership split merely to match the registry. That alternative is not applied.

The maintainer must register `gap:local-period-fundamental-sequences` with supplier PadicHodgeTheory, the section and needs of the existing README contract, update the registry’s `period-rings` needs to its README contract, and attach the chart gap to §4.2 and §4.4. This report does not declare that missing registry entry supplied or settled.

## F02 (P3) — applied

`/-!+#` → `/-! #` in the module docstring of `packages/CohomologyComparisonsPartII/Suggested.lean`. The title now reads “CohomologyComparisonsPartII: representative target signatures” with the intended Markdown heading. No mathematical statement changed.

## F03 (P3) — applied

The incomplete exponent `(−1)^(ij` → `(−1)^(ij)` in §2.3. This records the cohomological Koszul convention already used by the products (BesserI line 752–759; EN line 219–243). Degrees 1 and 1 give −1; a degree-zero factor gives +1.

## F04 (P3) — applied

`ClassicalSyntomic_logRigidComparison_verticalLog` → `ClassicalSyntomic.logRigidComparison_verticalLog` in §7.4. The Check retains its horizontal-log H¹=Q_p versus vertical-log H¹=Q_p² calculation. No Lean declaration bears either Check label.

## F05 (P3) — applied

Deleted the unrelated `(2 : ZMod 2) = 0` conjunct. The same proved example retains the actual `enLattice` and `cnLattice` spans, both CN endpoint generators, and the factorial-coordinate identity `4⁻¹ = 2 * 8⁻¹` in `Padic 2` (EN line 306; CN line 968–971). No claim about the removed automation step is needed.

## F06 (P3) — applied

Removed `he : e ≠ 0` from `ClassicalSyntomic.semistable_baseConvention_differentials`; its docstring and §5.2 now allow every natural e. The chain equivalence retains e≥1. Extended the existing rank-two proved example and zero-index Check: at e=0 the scaled differential still commutes, while its third and final component maps cannot be invertible on nonzero D.

Indeed, writing c₀=−(e:Q)⁻¹, Q-linearity gives `D1_(c₀N)(a,b,c₀c) = c₀ * D1_N(a,b,c)` for every c₀; the D0 equation is its defining formula. Neither identity divides an equation by c₀. At e=0 both relevant sides vanish. The semistable square itself is the one at NN line 1366–1384; its geometric equivalence is NN Proposition 3.8, NN line 1387–1391.

## F07 (P3) — applied

§4.2’s construction domain changes from canonical-log V-schemes to log-syntomic X/W(k), with `U=X_tr∩X[1/p]` and `j=j_ηj′`; α̃ is named explicitly. CN-normalized charts and §4.3–§4.5 comparisons keep their hypotheses. The supplier description now separates these finite-level maps from the rational period and Besser square; its needs already requested only rational periods. Updated the site and trivial-log point Checks.

EN line 278–308 gives this construction domain and both lattices; EN line 311–317 and EN line 326–329 give the pushforward maps and ω composition. EN line 318–323 retains the stronger exact-comparison domain. AM line 1327–1334 supplies the rational horizontal-log/rigid period square consumed by §7.4. These geometric carriers remain README targets, so no Lean headline was forced through a substitute.

## Adversarial mathematics pass

Each subsection row includes its defining formulas, named API and Checks. These are mathematical substitutions and hypothesis checks, not an elaboration certificate.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: bases and Frobenius | e=1; π²=p at p=2,3; general e>1 | F_V(π) has valuation 1, whereas π^p has valuation p; the modulo-p condition obstructs ramified AM bases. Classical layers require no F_V. | None. |
| Conventions: fibre, twists, signs | Multiplication 2 on Q; degree 0 and degree 1 products; O(1)⊗O(−1) | Fibre differential is (0,2a), shifted differential has minus sign; Koszul signs +1 and −1; twist Frobenius exponents add. | F02–F03 typography only. |
| Supplier contracts and carriers | Chart versus coefficient sequences; horizontal versus vertical log; exact versus abelian Ext | EN and CN inputs have distinct domains. Exact-category Ext is a supplier gap, not an application of abelian Ext to FilFMIC. | F01 external registry mismatch recorded. |
| §1.1 FilFMIC and realization API | Zero, unit, Φe=te on G_m, generic-only Spec(K) | Horizontality rejects Φe=te since ∇Φe=dt⊗e; B†=0 permits nonfaithful rigid realization. Finite locally free filtration pieces give projectivity. | None. |
| §1.2 tensor, Tate, dual and pullback API | O(1), O(−1), zero tensor factor, identity map | Filtration jumps and p^(−m) agree; evaluation is filtered; pullback through isocrystals needs no equality of chosen Frobenius lifts. | None. |
| §1.3 exactness and Yoneda API | Split extension; Ext¹(O,0); filtered identity B→A | Exactness on every filtration step distinguishes the nonstrict identity; locally split graded modules make tensor and dual exact. | None. |
| §1.4 coefficient fibre and coordinate API | O(0), O(1), zero; inputs (1,0), (0,1), (0,0) | Point complexes are [Q_p→0 Q_p] and Q_p[−1]; coordinate outputs (0,2), (0,−1), (0,0) fix both signs. | None. |
| §1.5 extension evaluation API | Degree 0 identity and zero; split; Φe=e−h | Connecting image is f(1) in degree 0 and (0,h) for the nonsplit extension; representative diagrams preserve it. | None. |
| §1.6 injectivity and projections | H=O(1), Φe=e+ah; split; H=O(0) | R=−ah; F⁰H=0 kills degree-zero boundaries and gives the unique filtered lift. Without it lifts vary by ch. | None. |
| §2.1 specialization diagram | Spec(V), empty, generic-only Spec(K) | Degree-zero sp is id_K, zero, and K→0 respectively. No general equivalence is asserted. Scalar towers remain visible. | None. |
| §2.2 rigid syntomic fibre | V=Z_p, r=0, r>0; empty special fibre | r=0 gives H⁰=H¹=Q_p; r>0 gives H⁰=0,H¹=Q_p. Empty special fibre leaves F^rDR. | None. |
| §2.3 exact sequence, cup, descent, elimination | Point; G_m; empty; K=K0 | Contractible identity component eliminates to Fib((1−φ/p^r)sp_r); φ(dlog t)=p dlog t; odd products acquire the Koszul sign. | F03. |
| §3.1 divisible PD API | r=0; p=2,r=1; multiplication by p mod p | Divisibility is formed before reduction; equality extends through p−1. Arbitrary division mod p is not unique. | None. |
| §3.2 two fibres and reduction API | r=0, empty, zero map A→B | Both weight-zero fibres agree; a zero map has H⁰=A,H¹=B, so an ordinary kernel is inadequate after derived pushforward. | None. |
| §3.3 error maps and products | r=0; multiplication p on Z/p²; odd classes at p=2 | (p^r,id) and (inclusion,p^r) are chain maps with composites p^r. Error bounds give no integral inverse or multiplicativity of τ. | None. |
| §3.4 local presentations and completion API | r=0; horizontal point; tail tower ⊕_(j≥n) F_p | Quotient at r=0 vanishes; horizontal point has H⁰=H¹=Q_p rationally. Tail tower has lim=0 and lim¹=∏F_p/⊕F_p, so Rlim is necessary. Arithmetic-pair reduction remains restricted. | None. |
| §4.1 modified lattices and coordinate API | r=0; p=2,r=2; both endpoints r=p−1 | Denominators are nonzero. Generators 1/4 and 1/8 have inclusion coordinate 2; mod 2 that coefficient map is zero. Endpoint lattices differ by p. | F05 removes only unrelated conjunct. |
| §4.2 period construction and API | Trivial-log Spec(Z_p); horizontal pairs; canonical vertical log; r=0 | Trivial-log locus need not lie in X[1/p]. U and j now have correct domains; at r=0 ordinary and modified maps agree. No comparison theorem follows merely from construction. | F07. |
| §4.3 exact divided comparison API | p=2,r=0,1; p=3,r=0,1,2; t dlog t | Exact ranges are r≤0 and r≤1 respectively. Inverse Cartier gives [t^p dlog t]≠0, unlike [dt]=0. Undivided errors cannot be inverted integrally. | None. |
| §4.4 bounded comparison API | xy=π^h,h>1; p=2 positive weights; q>r | Ramified charts remain admitted; dimension dependence at p=2 retained; bounds only for q≤r. No ordinary-lattice identification replaces the factorial adapter. | None. |
| §4.5 gluing API | Empty closed part; j′=id; r=0 | Open restriction is Rj′_* of the lattice; with no closed part only this term remains. Exact and bounded conclusions retain the stated domains. | None. |
| §5.1 HK isocrystal adapter | Rank 1,N=0; φ=diag(1,p),Ne1=e0; tame non-Cartier chart | Nφe1=pe0=pφNe1; uniformizer change adds log(u)e0. HK line 730–739 rejects bijectivity without Cartier type. | None. |
| §5.2 total fibre and square-zero API | Zero D,E; rank-two block at r=0,1; prime versus p=0 | D1D0=(p^(1−r)φN−p^(−r)Nφ)x=0 for prime p under the explicitly bound relation. At r=0 the lower map is 1−pφ. p=0,r=1 would fail, and is excluded. | None to square-zero theorem. |
| §5.2 convention adapter | e=1,2,0; N=0; nonzero D | Scaling third and final terms by −1/e commutes with both differentials for all natural e. Inverse scaling exists only at e≠0. e=2 gives −e0/2; e=0 gives zero. | F06 signature, docstring and boundary witness. |
| §5.3 h-realization adapters | Identity presentation; p=2; r=0 | Identity transports identically; all weights allowed rationally; r=0 exports only τ≤0. Full h-descent and periods remain supplied by the named base contract. | None. |
| §6.1 relative datum API | Identity, empty, P¹_S | Ranks and twists are O,0,O(−1); H² Frobenius is pσ. Defining the datum supplies no finiteness theorem. | None. |
| §6.2 promotion API | Zero datum; c=0 on rank 1; D(pt−1) over Z_p[t] | Invalid c and nonfree graded pieces fail. In D(pt−1), rigid coherence and comparison coexist with algebraic unbounded pole order, hence do not imply algebraic finiteness. | None. |
| §6.3 compactification predicate/API | Constant G_m; empty horizontal boundary; sections x=0,x=t | Constant products satisfy total and relative boundary conditions; colliding sections fail the relative condition. Independence uses intrinsic data, not existence of compactifications for all families. | None. |
| §6.4 geometric settings API | Genus 0 and genus g; constant G_m; p=2 | Projective curve ranks 1,2g,1 and G_m twist agree. All-degree rigid coherence and independent algebraic filtered conditions are supplied separately. | None. |
| §6.5 continuous-form comparison | A¹,G_m; elliptic curve | H¹ is 0 and K dlog t on the affine examples. H¹(E^an,O)=K rejects extending the affine acyclicity proof to proper curves. | None. |
| §6.6 residue and Ext API | Split {0,∞}; quadratic étale boundary at p=2; D empty | Residues (1,−1) have sum zero. Nonsplit trace-zero coefficient has Frobenius −2. Empty D retains H² and is excluded from the affine short sequence. | None. |
| §6.7 geometric projections API | n=0; G_m,n=1; split extension | Twist gives F⁰H=F^(n+1)H^n; residue target twist decreases by one. Split projections vanish; no n≥1 restriction needed. | None. |
| §7.1 compatible points API | σ(t)=t^p at 0,[a],p; σ(t)=t^p+p | Teichmüller lifts commute; t=p does not. For the perturbed lift the compatible zero lift is p modulo p², including p=2. | None. |
| §7.2 section detection API | Rank 0; section 1; k=F_p,t^p−t; empty special fibre | Zero module is harmless; t^p−t vanishes at all Teichmüller points but is nonzero. Algebraic closedness is needed; empty special fibre gives zero completion. | None. |
| §7.3 specialization/evaluation API | Split; identity point; t=p under σ(t)=t^p | Actual compatible pullback preserves the filtered lift and remainder. Substitution at the incompatible point does not produce the absolute Frobenius structure. | None. |
| §7.4 log/rigid comparison API | Point r=0; G_m; point r=1 with vertical log added | Horizontal fibre at r=1 has H¹=Q_p; vertical C_st has three middle coordinates and rank-one D0, hence H¹=Q_p². Horizontal comparison requires D alone. | F04 label only; F07 clarifies finite-level source. |
| §7.5 absolute value API | Curve n=1,r=2; split; missing filtered vanishing | F²Ω•=0 on a curve gives H²_rsyn≃H¹_rig; connecting image is +(0,b). Without both vanishings it need not be an isomorphism. | None. |

## Checks and maintainer notes

- **Dependency direction:** requested dependency check exited 0 with exactly:

  ```text
  depcheck: 3 roadmaps, 24 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line appeared. This checks direction, not registration of the missing F01 gap.
- **Elaborate Suggested.lean:** not available, as specified in the brief. No Lean command was run, no `#check @name` was elaborated, and the warning count is unknown. The six `example`s have proof bodies; their elaboration is not certified.
- **Static README–Lean agreement:** nine named Lean declarations appear in the README, including names inside parameterized code spans. Five real-bodied definitions, four theorem targets with four `sorry` sites, six proved examples, 169 lines. There is one `import Mathlib`; no `set_option`, admitted examples, admitted data or forbidden commands. The four theorem signatures bind their needed carriers and hypotheses directly. The scalar identity intentionally carries neither primality nor e≠0; its square-zero counterpart explicitly carries primality and Nφ=pφN.
- **Shape:** seven layers remain in order; 113 distinct named Checks remain. No layer, target or Lean declaration was added or deleted. The unrelated library numeral was removed from an existing example; the zero-index boundary was added to an existing example.
- **Sources:** all 24 manifest records were examined; 23 certified texts are present in the supplied cache. BesserII remains settled as uncertified consumer-context provenance. No new work was cited, no source fetch was required and no missing-reference request was created. The EN and AM version-specific locators used above agree with the cached versions. Garbled Besser displays were not used to infer an unstated formula: the cone description at BesserI line 741–745 and AM line 1314–1326 supply the fibre check.
- **Pinned API and duplication boundary:** read the cached pinned sources: MathlibPadicLattice line 580–588 supplies the actual scalar action; MathlibLinearProd line 68–104 supplies the linear projections/products; MathlibCone line 61–92 supplies cones; MathlibPin line 117–142 supplies isocrystals. TauCetiExactReview line 245–267 supplies exact structures, while TauCetiExtReview line 54 retains its abelian-category restriction. These support coordinate specializations here, not a pre-existing geometric period construction. Object searches on main found syntomic-morphism and quasisyntomic/prismatic material, not these classical syntomic constructions. The ErdosProgressionPowers and ArithmeticDynamics open roadmap branches contain no syntomic, Hyodo–Kato, isocrystal or Fontaine–Messing match in their roadmap folders; their scope paragraphs concern distinct objects.
- **Supplier scope:** main-branch roadmap examples and supplier contracts were read without editing them. CohomologyComparisons §4.5’s negative normalized monodromy convention was compared at the recorded supplier revision; it agrees after N_b=−N_c/e. That text is an ownership/interface check, not a claim that a missing supplier gap has been implemented.
- **Names and consumer consequences:** `ClassicalSyntomic.semistable_baseConvention_differentials` retains its name but loses its `he` argument; downstream explicit applications must drop that argument. Only the README Check label `ClassicalSyntomic.logRigidComparison_verticalLog` is renamed. §4.2 now admits horizontal-log inputs; its stronger comparison conclusions and the rational Besser-square supplier requirement retain their scopes. F01 still needs maintainer action outside this lane.
- **Diff and scope:** `git diff --check` passes. Only the permitted README, Suggested.lean and this report were written in the package; metadata and the source manifest remain unchanged. No commit, push, pull-request edit or merge-order edit was performed.
