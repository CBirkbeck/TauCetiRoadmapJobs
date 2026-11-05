# Review of GL2AutomorphicRepresentationsAndTransfer (pull request #931 at 6364600)
**Verdict:** needs changes

**Previous findings (round 1 at efb6d45), checked passage by passage.** R01 (LLC–quaternion cycle): repaired. `README.md:406–409` now reads “This target uses no inner-form input. Assigning parameters to quaternion division classes is a downstream application: R17.1 … composes PadicLocalLanglandsForGL2Qp §6.9's correspondence with the bijection constructed here”; the R16.0 Dependencies (`:455–457`) no longer name R17.1 or §6.9, and the quaternionic test of R16.3.3 moved to R17.2.2 (`:1539–1542`). No R16.x `*Needs:*` line cites an R17.x target. R02 (lost binders): repaired; `supercuspidalProjective` carries `[IsNonarchimedeanLocalField F]` explicitly (`Suggested.lean:97–98`) and the `#check` below retains it. R03 (consume SR.5.2): partly repaired, re-raised as R02 below. R04 (general Varshavsky traces): repaired; R17.6.3a–b now state the trace map, Lefschetz–Verdier formula and contraction theorem on separated finite-type schemes over a separably closed field with Varshavsky's coefficient rings, and the ℙ² and ℙ¹×ℙ¹ instances are Checks. R05 (121 anchors): not repaired, re-raised as R03. R06 (namespace and invented API names): repaired (namespace `TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer`; the API bullets are prose; the gate's `readme-ids-missing` is 0); the docstring title is still not in the prescribed form (R06 below). R07 (Iwahori Checks): repaired, values recomputed below. R08 (source ledger): not re-raised; no roadmap folder on main carries a `sources.toml` and the gate has no such check; the three Jacquet–Langlands keys now say they are one work with different paginations.

## R01 (P1) — Deligne–Langlands local constants and the Artin functional equation are cited to targets that do not exist

**Location:** `README.md:222–224`: “[hecke-zeta-integral-comparison](../ArithmeticGaloisRepresentations/README.md#hecke-zeta-integral-comparison) compares their global tensor integral with the Hecke completion”; `README.md:2400`: “ArithmeticGaloisRepresentations §2.7 **Global inputs** supplies their Brauer assembly into the completed meromorphic functional equation for every global character twist of ρ, with the product of local epsilon factors”; `README.md:431–433`: “ArithmeticGaloisRepresentations §§2.4–2.7 (WD objects and factors)” for the ε-factor compatibility of R16.0.1.

**Claim:** ArithmeticGaloisRepresentations §2.7 supplies (a) the Hecke zeta-integral comparison, (b) the meromorphic completed functional equation of every character twist of a finite-image ρ by Brauer induction, with root number the product of local constants, and (c) local ε-factors of rank-two and rank-three Weil(–Deligne) representations, with Deligne's inductivity (the λ-constants of R17.4.17) and the global product formula.

**Witness:** ArithmeticGaloisRepresentations at its open head (#856) has no target named `hecke-zeta-integral-comparison` (its §2.7 has exactly the three subsections Local-constant Gauss sum, Standard-test-function evaluations, Root-number product formula, at its lines 2092, 2179, 2240) and says at lines 146–153: it consumes no continued L-function, and the comparison of the standard zeta integral with the completed Hecke function, the meromorphic Artin functional equation of finite-image representations by Brauer induction, Deligne's global transfer and the existence and uniqueness of the Deligne–Langlands local constants of Weil and Weil–Deligne representations “belong to ArithmeticGaloisRepresentations Part II” (repeated at its lines 2320–2322 and 5239–5242). No roadmap named ArithmeticGaloisRepresentationsPartII exists in the merge order or among the 432 open roadmap pull requests. ArtinRepresentations (#1711) owns the Brauer-induction functional equation (its Layer 4) but consumes this roadmap's R17.5.1, R17.5.6–R17.5.10 (its lines 206–208, 1333–1336), so it cannot be a supplier here; it too cites AGR §2.7 for “Deligne–Langlands local constants” (its lines 161, 698, 1046), which AGR disclaims. Hence (b) and (c) are used here with no owner: R16.0.1 (“standard and pair factors equal the WD factors”), R16.3.5, R17.4.17 (`λ(K⊗F_v/F_v,ψ_v)²`, tensor induction, “Deligne's WD invariant-kernel formula”), and R17.5.5, whose proof compares “the resulting functional equation with the cuspidal equation of π” for every twist; R17.5.6–R17.5.10, R17.5.14 and R17.6.4 rest on R17.5.5. Instance: for the primitive dyadic parameter of R16.3.3 no cited section gives ε(s, rec π ⊗ χ, ψ); for the dihedral Ind θ it is given only through the unowned λ-constant.

**Repair:** Declare the two gaps the brief provides for exactly this situation, on the supplier AGR names: “What ArithmeticGaloisRepresentations must provide (gap:weil-local-constants): existence and uniqueness of ε(V,ψ,dx) for finite-dimensional Weil and Weil–Deligne representations of a p-adic field, additive, inductive in degree zero, with the twist, conductor-exponent and global product formulas (Deligne 1973, Theorem 4.1, §§5.6, 5.11, 8.12)”, and “What ArithmeticGaloisRepresentations must provide (gap:artin-functional-equation): for continuous finite-image ρ:G_F→GL_n(ℂ) and every Hecke character χ, the completed Λ(s,ρ⊗χ) is meromorphic with Λ(s,ρ⊗χ)=W(ρ⊗χ)Λ(1−s,ρ^∨⊗χ⁻¹) and W the product of local constants, by Brauer induction from the Hecke equation of AutomorphicLFunctionsAndLocalFactors AL.1.6.2”; put the same slugs in `plan.json`'s `gaps`, replace the three citations above by the gap names, and delete the dead link. Alternatively state both as targets of R16.0 and R17.5 with those inputs (AGR §2.7's three subsections and its finite-order globalisation, AL.1.6.2, RepresentationTheory/InductionRestriction Layer 6) and cite them from the four targets. On the instance: with either repair the primitive dyadic ε of R16.3.3 is supplied by the Deligne existence theorem and the dihedral one by inductivity, and R17.5.5's twisted equations have a stated source.

## R02 (P2) — R16.0.1 still constructs a second local Langlands correspondence (Re-raised: r1 R03)

**Location:** `README.md:369`: “construct the bijection between irreducible admissible smooth complex GL₂(F) classes and Frobenius-semisimple rank-two Weil–Deligne parameters”; `:386–387`: “Construct its inverse”; `:890`: “The R16.0/local-langlands correspondence must include the fully local dyadic existence and bijectivity arguments of [bh06], Theorem 50.3 … and Theorem 52.1”; `:401–402` for n=3.

**Claim:** This roadmap owns the construction of rec at n=2 and n=3 and then proves it agrees with SmoothRepresentationsOfLocalGroups SR.5.2.

**Witness:** SmoothRepresentationsOfLocalGroups at its open head (#1688), SR.5.2 `classical-llc-normalization`, lines 4586–4600: “It also owns the classical GL_n correspondence rec … the classical correspondence itself is an owned input theorem here”, with reciprocity to arithmetic Frobenius and the instruction to transport geometric-convention sources by inversion. The new paragraph at `:411–416` cites it, but the construction and inverse sentences remain, so the object is planned twice.

**Repair:** Define the correspondence of R16.0.1 as SR.5.2's rec composed with the convention inversion (ϖ ↦ Φ_geom), at n=2 and n=3; delete “construct the bijection”, “Construct its inverse” and the bh06 existence/bijectivity sentence of R16.3.3; keep as targets exactly what SR.5.2 does not state: the conductor comparison `c(π)=a(rec π)`, the twisted L/ε compatibility with AL.2's factors (after R01), the pair-factor compatibility, and the geometric-convention Checks. Tested on the Checks of `:421–429`: the rank-one character with value 2 at arithmetic Frobenius is attached by SR.5.2 to χ(ϖ)=2 and by the transported correspondence to χ(ϖ)=1/2; the transported Steinberg parameter keeps N of rank one and conductor 1; neither needs a second construction.

## R03 (P3) — The gate fails: 121 HTML anchors (Re-raised: r1 R05)

**Location:** `README.md:365` `<a id="r16-0-local-langlands"></a>` and 120 more.

**Claim:** The README passes the push gate.

**Witness:** The worker's gate at this head: `residue=121 … FAIL`; every hit is an `<a id=` line. The README contains no `](#…)` fragment link (grep count 0), and every anchor sits directly under a `### Rk.n` heading.

**Repair:** Delete the 121 anchor lines; nothing else changes (consumers cite `R17.6.3b / contracting-curve-local-term` as text, which still resolves by heading). Re-run the gate; `residue` becomes 0 and no other scanner is affected.

## R04 (P3) — Supplier citations by slugs that no longer exist in AutomorphicLFunctionsAndLocalFactors, and a non-existent `satake_power_sum`

**Location:** `README.md:228, 232, 244, 461, 674, 2662` (links to `#rank-one-local-functional-equation`, `#hecke-l-functional-equation`, `#gl2-newvectors`); 22 distinct slug citations such as `AL.3/gln-converse-full-rank` (`:2255`), `AL.2/standard-local-l-factor` (`:435`), `/archimedean-gln-parameters` (7 uses); `README.md:1847`: “AutomorphicSpectralTheory's `satake_power_sum`”.

**Claim:** These names denote sections of the suppliers at their open heads.

**Witness:** AutomorphicLFunctionsAndLocalFactors at #924 numbers every target `AL.k.n.m`; none of the 22 slugs occurs in its README (0 hits each), while the content exists under AL.2.2 (GL₂ newvectors), AL.2.1.4, AL.1.3.3, AL.1.6.2, AL.3.9.5–6, AL.3.7.1–2, AL.2.3.2, AL.4.2.1, AL.R.1–R.5, AL.0.3.1, AL.1.4.2–3, AL.3.4.1–3, AL.3.6.1–3, AL.3.2.1, AL.3.2.3, AL.3.3.2. AutomorphicSpectralTheory at #925 states the power-sum identity in §7.0b (its line 13 names this roadmap as its consumer) but has no declaration `satake_power_sum` (0 hits).

**Repair:** Cite AL by those numbers and drop the three dead fragments; cite AST §7.0b's power-sum identity in words. The citations.md lead for `AutomorphicForm` is ALS.F.6's planned carrier, not a pinned name; no change.

## R05 (P3) — The downstream paragraph misdescribes EtaleDualityAndPerverseSheaves, which builds the same general trace theory

**Location:** `README.md:3039–3042`: “EtaleDualityAndPerverseSheaves §§6.3–6.5 use R17.6.3a–R17.6.3b's trace, Lefschetz–Verdier and contraction interfaces on separated finite-type schemes”.

**Claim:** EDPS consumes the general interfaces.

**Witness:** EtaleDualityAndPerverseSheaves at #1040, lines 76–80 and 6563–6571: it consumes only the smooth-proper-curve trace and the reduced-closed-point contraction from here, and its §6.3 and §6.5 construct the general trace map, local terms and contracting theorem themselves (lines 6935–6950 repeat Varshavsky Definition 2.1.1). Two open pull requests therefore build one object. This roadmap (merge order 85) is the earlier owner, as round 1 directed; the duplication is EDPS's to remove.

**Repair:** Say what EDPS does today (it consumes the curve and reduced-point cases) and that R17.6.3a–b offer the general interfaces for its §§6.3–6.5 to consume; no mathematics changes. The consumer QuaternionArithmetic (#1722, lines 153–157) also still names `ramifiedExactlyAt_iff_nonsplit`, a Lean name this head removed; that is its drift, recorded here for the authors' coordination.

## R06 (P3) — Module docstring heading

**Location:** `Suggested.lean:7`: “GL₂ automorphic representations and transfer: headline theorems”.

**Claim:** The module docstring has the prescribed form.

**Witness:** The form rule asks for “<title>: target signatures”; round 1 R06 asked for it; the heading was not changed.

**Repair:** Rename the heading; the body already says what is and is not statable.

## Verified sound

**Scope.** Both files at 6364600 were read in full (README 3105 lines, Lean 270 lines); the diff outside the folder is empty; the folder has README, Suggested.lean, metadata.toml. No copied passage, computational algorithm, sorry'd data, `set_option`, admitted `example` or process word other than the anchors was found; the folder adds a new roadmap and re-plans none on main.

**Gate and elaboration.** Worker's gate: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=121 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL`. I ran `lake env lean` on a scratch copy with `#check @name` appended for all ten declarations: exit 0, exactly ten `declaration uses sorry` warnings, and every elaborated type keeps its hypotheses, in particular `supercuspidalProjective` keeps `[Field F] [ValuativeRel F] [TopologicalSpace F] [IsNonarchimedeanLocalField F]` (the r1 R02 defect is gone; the Mathlib class at `Mathlib/NumberTheory/LocalField/Basic.lean:45` extends only valuative topology, local compactness and nontriviality, so equal characteristic is included as the README says). One-tactic probe (`first | rfl | simp | infer_instance | exact trivial` on a scratch copy): all ten declarations fail to close; no padding. Dependency check:

```text
depcheck: 201 roadmaps, 1328 edges, 0 problem(s)
```

**Headline inventory.** README headlines: finite-place LLC with conductor and factor comparisons (R16.0, R16.3), Iwahori oldforms and the Iwahori centre (R16.2), the classical/Hilbert dictionaries and rationality (R16.4–R16.6), Chevalley congruence and full-local character prescription (R16.1.7–8), supercuspidal projectivity (R16.2.10), quaternion ramification and local–global isomorphism (R17.1.5), local and global Jacquet–Langlands with the trace comparison (R17.1–R17.3), cyclic, solvable and non-normal cubic base change, the adjoint lift and automorphic induction (R17.4), finite projective lifting, Fong–Swan, Langlands–Tunnell and its weight-one consequences (R17.5), the characteristic-two dihedral classification, Rohrlich–Tunnell, Katz weight one and residual modularity (R17.6). The ten statable ones are in `Suggested.lean`; the docstring names the missing carriers (Weil–Deligne parameters, smooth GL₂ classifications, cuspidal adelic classes, Whittaker models, quaternionic spectra, modular-curve coefficient cohomology, Katz forms, Galois attachments) for the rest; I found no further headline statable at the pins and no stand-in.

**Seeded sample.** All twelve targets were checked at the locators in the fetched texts (cache line numbers):

| Target | Text and locator | Outcome |
|---|---|---|
| Fixed-space comparison (R16.2.7) | cg20 lines 182–191, §1.3 pp.805–806 | dim π^Iw = 2 = 2·dim π^Sph and the characteristic-zero doubling by U_p; the source's hypothesis “not trivial” is weaker than the needed “infinite-dimensional” (source issue below); the README states the right hypothesis. |
| Ramification realization (R17.1.5) | prr23 Thm 1.33 not readable (see below); GlobalQuadraticForms §4.4 (README:443, `Suggested.lean:350` `exists_hilbertSymbol_eq_neg_one_iff_pair`), ClassFieldTheory Layer 10 (`eq_zero_of_localInv_eq_zero`, README:1606), Layer 14 Hilbert reciprocity (README:1872) | The three main-branch inputs exist; parity and sign instances below. |
| Quaternion proof (R17.2.6) | jl70 (UBC retypeset) lines 15819–15832 (Theorem 16.1, printed p.260) and 16816–16841 ((16.1.7), printed p.275) | (16.1.7) at ≥2 places kills terms (iv)–(viii); the source itself calls the argument a formal sketch (source issue below), which the README assigns to AutomorphicSpectralTheory. |
| Classical coefficient and Hecke adapter to Pan (R17.3.9) | pan26 lines 3075–3086 (Def. 5.4.11, p.71), 3231–3247 and 3271–3288 (§5.5.5, pp.75–76) | Right coefficient law f(dh^p h_p)=h_p⁻¹f(d), D_p× action (h·f)(d)=h·f(dh), A¹ nonzero only for n₁=n₂, T_S=ℤ_p[T_l,S_l], spectrum σ_{k+2,1} with π_p special or supercuspidal, k=0 splits σ_{2,1}∪σ_0; W(k,0) is dual to highest weight (0,−k). All as stated. |
| Whittaker-type bridge (R17.4.13b) | gj78 lines 2051–2075 (§9.1), 2088–2160 (§9.2, Thm 9.3), 2209–2227 (§9.5) | Attached module (9.1.2.2), the t=1/4 exception (9.5.1), T=S or a singleton, ε=ε(χ)³ with L=1 at T, Thm 9.3(4) bound t<1/4. As stated. |
| Cubic monomial input (R17.4.17) | jpss79 (OCR) lines 1519–1531 (Thm 14.2, pp.253–254), 1587–1595 (p.255) | Theorem and the non-normal remark (irreducible, or a character plus a degree-two monomial) as stated. |
| All-place comparison (R17.4.17) | henniart02 lines 122–131 (§1.5 theorem, p.590); deligne73 lines 1282–1289 ((5.6.2)), 1335–1341 (5.11), 1972–1984 (8.12, p.572) | Pair-factor family and its uniqueness; inductivity in degree zero and the global product; conductor (8.12.1). Locators correct; their ownership is R01. |
| Oddness API (R17.5.13) | bcgp21 lines 12593–12624 (Prop. 10.1.3 and the solvable case of its proof, pp.473–474) | Tate lift totally odd with finite solvable image, then Langlands–Tunnell; the determinant lemma is the README's own deduction, tested below. |
| Domain test, Order test (R17.5.15) | tunnell78 (OCR) lines 193–197 (Thm 1.3, pp.182–183) | Global field F, place with F_v≅K, ρ_v≅σ, types preserved, F=ℚ with det ρ(c)=−1 for S₄ over ℚ₂. The two tests are finite calculations below. |
| Construction and local finiteness (R17.5.16) | patrikis lines 1374–1386 (Lemma 2.3.1, p.28); carayol86 lines 1558–1575 (§11.2 (a)–(c), p.450) | Unitary ψ₀ with angular infinity type on a CM field; (a) completion at 𝔭, (c) nonsplit at v with ξ_v not a norm. As stated. |
| Parabolic comparison (R17.6.4) | carayol86 §11 lines 1552–1600, §12.2 lines 1808–1850; varshavsky05 lines 169–176, 323–336, 360–380, 629–652 | Coefficient setting, trace map on Hom(c₂!c₁*F,F), Prop. 1.2.5, Cor. 1.2.6 for proper c, Def. 2.1.1 and Thm 2.1.3 match R17.6.3a–b verbatim in content; branch computations below. |

**Adversarial pass.** Values computed on each side; “retain” means no change needed.

| Statement | Instances | Values | Result |
|---|---|---|---|
| Conventions: δ_B, reciprocity | q=4, diag(ϖ,1); χ(Frob_arith)=2 | δ=1/4, δ^{1/2}=1/2, scalar δ=1; χ(Φ_geom)=1/2 | Retain; R16.0.1 Check agrees. |
| R16.0.1 conductor formula vs Deligne (8.12.1) | Steinberg, q=4 | a(r)=0, dim V^I=2, dim(ker N)^I=1 ⇒ a=1; N=0 ⇒ 0 | Retain. |
| R16.0.1 ownership | SR.5.2 lines 4592–4600 vs README:369 | rec owned there; constructed again here | R02. |
| R16.0.1 ε-compatibility input | primitive dyadic rec π of R16.3.3 | no cited section defines ε(rec π⊗χ) | R01. |
| R16.1.3 K₀/K₁ at depth 1 over ℤ₅ | upper, lower unipotent, diag(2,1), 2I; residue F₂ | in both; in neither; K₁ yes; K₀ yes, K₁ no (2−1∉5ℤ₅); over F₂ u−1∈p forces K₀=K₁ | Retain. |
| R16.1.3 Hecke cosets | q=2 | q+1=3 | Retain. |
| R16.1.4 Cartan representatives | diag(ϖ²,ϖ), diag(ϖ,ϖ²) | both ↦ (a,b)=(2,1) | Retain. |
| R16.1.5 central L² | ω(z)=i; ω(z)=2 | |f|² ratio 1; 4 | Retain. |
| R16.1.6 parity | k=3, χ=1 | −I acts by (−1)³χ(−1)=−1 ⇒ space 0 | Retain. |
| R16.1.7 `chevalley_power_congruence` | E=⟨2⟩⊂ℚˣ, n=2, T={2}; n=3; E=⟨−1⟩ | m=(3): 2^j≡1 iff j even; m=(7): iff 3∣j; m=(3): −1≢1, vacuous | Retain; `IsCongrOne` (Modulus.lean:314) is the valuation-and-sign predicate with empty infinite part. |
| R16.1.7 saturation | E=⟨4⟩ | E₀/E ≅ (ℤ/2)², exponent 2 | Retain. |
| R16.1.8 `finite_hecke_full_local_prescription` | ℚ, S={2}, χ₂=(−1)^{v₂}; S=∅ | Ψ = quadratic character mod 5: Ψ(2)=−1, Ψ(−1)=+1 so trivial on ℝˣ; Ψ=1 | Retain; `IdeleClassGroup` is the quotient of 𝔸ˣ (AdeleRing.lean:120–130), `ofAdicCompletion` is `Units.map` of the multiplicative embedding. |
| R16.1.8 extension criterion | G=ℤ/4, H={0,2}, χ(2)=−1; N=0 or H | a↦i^a extends; H∩N=H, −1≠1 blocks | Retain. |
| R16.1.8 quasicharacter | q=4, α(ϖ)=2 | s=−1/2, ν(ϖ)=1 | Retain. |
| R16.2.1 sub/quotient | I(χν^{1/2},χν^{−1/2}); constants in I(ν^{−1/2},ν^{1/2}) | χ∘det needs χ₁=χν^{−1/2}, so it is the quotient; constant covariance δ^{1/2}·|a|^{−1/2}|d|^{1/2}=1 | Retain; agrees with the R16.2.10 Check. |
| R16.2.1 Steinberg-twist conductor | a(χ)=2 | 2a=4 | Retain. |
| R16.2.6 h_m and W | α=2,β=3,q=4; α=β=1 | h₁=5,h₂=19 (25−6=19); W=5/2,19/4; h₂(1,1)=3; [Y²](1−Y)^{−2}=3 | Retain. |
| R16.2.7 Iwahori oldforms | PS, St, nontrivial unramified χ∘det | (dim K,dim I)=(1,2),(1,0)→St (0,1),(1,1); U matrix [[λ,qc],[−1,0]], X²−λX+qc; (2 1;−1 0): U−1 nonzero, square 0 | Retain. |
| R16.2.8 Kirillov | 1_{O×} at ϖ, 1; ψ(xu) factor | 0, 1; support unchanged | Retain. |
| R16.2.9 unicity | σ⊗χ∘det, ramified χ; Hom into PS | type of twisted class; 0 | Retain. |
| R16.2.10 `supercuspidalProjective` | F=𝔽_q((t)), ℝ; π⊗ρ with ρ(g)=(1 v(det g);0 1) | instance holds, fails; ϖI ↦ ω(ϖ)(1 2;0 1) not semisimple, surjection π⊗ρ→π has no section outside fixed ω | Retain. |
| R16.2.11 vexing Check | x=5, ℓ=3, θ₀ order 8 on 𝔽₂₅ˣ, λ∘N conductor 2 | 5≡−1 (3); θ₀/θ₀^σ=θ₀^{−4} of order 2, conductor 1; a(θ)=2 ≠ 1 ⇒ excluded | Retain. |
| R16.2.12 Iwahori centre | q=4, roots 2,3; roots 1,1; q=2 over ℤ[1/2] | U₁∈{4,6}, U₀=6, z₁=4+24/4=6+24/6=10=√4·5; without q: 11/2, 7; (X−2)², z₁=2+4/2=4; 3 not a unit | Retain (r1 R07 repaired). |
| R16.2.13 archimedean | real ratio |·|, sgn; complex z z̄, z/z̄ | r=1 odd ⇒ D₂ sub, dim-1 quotient; r=0 ⇒ irreducible limit; p=q=1 ⇒ quotient dim 1; (1,−1) irreducible | Retain. |
| R16.3.1 principal series | α=2,β=3 | det 6, 1−5T+6T² | Retain. |
| R16.3.2 Steinberg | q=4, α=1, N e₂=e₁ | r(Φ)=diag(1/2,2); rNr⁻¹=N/4=ν_W(Φ)N; L=(1−T/2)⁻¹; det 1 | Retain. |
| R16.3.3 primitive dyadic | α=((0,−1/2),(1,0)) | α²=−1/2; Swan=3−2+0=1; 1≥3d impossible | Retain. |
| R16.3.4 Tate shift | roots 2,3 | 4,6; det 24 | Retain. |
| R16.3.5 ε under ψ_a | a=ϖ, ω(a)=1, s=1; s=1/2 | q^{−(2s−1)}=1/4; 1 | Retain; the Galois-side ε is R01. |
| R16.3.6 gamma factors | s=1,2; D₂ | Γℝ(1)=1, Γℝ(2)=1/π, product=Γℂ(1)=1/π; Γℂ(2)=1/(2π²); ε(D₂)=i²=−1 | Retain. |
| R16.3.7–8 tamely dihedral | q=2, ℓ=3; ℓ=2 | θ^q=θ⁻¹≠θ; θ⁻¹=θ; a(Ind θ)=2, L=1 | Retain. |
| R16.3.9 CDT character sum | finite cuspidal character | (16−20+4)/24=0 | Retain. |
| R16.4.4 eigensystems | weight k, k=1; (1,−1) vs (2,−2); inert Ind θ; trivial rank 2 | s_p=χ(p)p^{k−2}, χ(p)/p; det −1 vs −4; [[0,θ(Φ_w)],[1,0]] trace 0 det −θ(Φ_w); (2,q⁻¹), raw 2√q | Retain. |
| R16.4.5 rationality | k=3 | T₁=p(α+β)=a_p, T₀=χ(p)p | Retain. |
| R16.4.6 self-twist | ω=ωχ² | χ²=1 | Retain. |
| R16.5.1 Mellin | e^{−2πy}, s=1 | (2π)^{−s}Γ(s)=1/(2π) | Retain. |
| R16.5.3–4 shifts and FE | k=2; t=s+(k−1)/2 | shift 1/2; 1−s ↦ k−t; A^{s−1/2}=1 at s=1/2 | Retain. |
| R16.6.1–2 dictionary | k=2 good p; n=1,c=0 | α+β=a_p/√p, αβ=χ(p); a_p²=χ^{(p)}(p)p^{k−2} | Retain. |
| R16.6.3 Hilbert weights | (k,m)=(3,1); (2,3); k=(2,4),m=(1,0) | dim 2, scalar z³=z^{w−2} with w=5; parity contradiction; w=4, dim 3, z₁²z₂² | Retain. |
| R16.6.6 weight one | parameter 1⊕sgn | det=sgn, χ(−1)=−1 | Retain. |
| R17.1.1 JL sign | d=2 | (−1)^{d−1}=−1, equals PLL §6.9's (−1)^{n−m} at n=2,m=1 (its line 2417) | Retain. |
| R17.1.3 real coefficients | k=2,3 | dim 1; dim 2, character sin2θ/sinθ=2cosθ | Retain. |
| R17.1.5 `existsQuaternionRamification_iff` | ℚ: ∅, {∞}, {2,∞}; complex place | even/split; odd/none; (−1,−1)_2=(−1,−1)_∞=−1, (−1,−1)_p=1 for odd p: Hamilton; complex always split so Si must be real | Retain. |
| R17.1.5 `quaternionAlgEquivOfLocalSplitting` | (−1,−1) vs (1,1) | differ at ∞ ⇒ hypothesis false; identical data ⇒ identity | Retain. |
| R17.2.1 projector traces | St⊗χ; χ∘det; unramified PS | e_H^ξ−e_K^χ: 1−0; 0−1; 1−1=0 (det w=−ϖ has odd valuation, so ξ≠χ there) | Retain. |
| R17.2.3 cyclic matching | diag(2,3), f=2; odd det valuation | diag(4,9), 13, 36; nonnorm | Retain. |
| R17.2.4 ledger | d odd; d=2 | no exceptional summand; weight 1/2 | Retain. |
| R17.2.6 quaternion proof | (16.1.7) at 2 places; |S|=2 norm characters | (iv)–(viii) vanish (jl70 line 16823); (−1)²=+1 | Source supports the formal argument; its analytic gap is owned by AST. |
| R17.2.6 periodization | t^{−1/2} on (0,1); constant map | L¹ norm 2, countable fibres, no atom; one atom | Retain. |
| R17.3.1–4 global JL | M₂(ℚ); {p,∞}, π_p=St⊗χ_p; |S| even | identity; χ_p∘Nrd; (−1)^{|S|}=1 | Retain. |
| R17.3.9 Pan adapter | n₁=−k,n₂=0; U=(1 1;0 1),V=(1 0;1 1) | W(k,0) dual of weight (0,−k); UV=(2 1;1 1)≠VU=(1 1;1 2) | Retain. |
| R17.3.12 Euler–Poincaré | (sl₂,O(2)) on D₂; (gl₂,O(2)) | cochain dims 0,1,0 ⇒ EP=−1, negative function gives +1; 0 | Retain. |
| R17.4.1 power sums | A=diag(2,3); f=2 then 3; (t,s)=(5,6/5), q=5; char 2 | p₂(5,6)=13, p₃=35, p₃(13,36)=793=64+729; (13,36/25), q_w s_w=36; p₀=0, p₂=s² | Retain. |
| R17.4.2–7 cyclic BC | ℓ=3; ℓ=2 | block rank 2/3 non-integral ⇒ cuspidal; θ⊞θ^σ | Retain. |
| R17.4.12 filling | I(1,1,1)⊗χ₀χ at T | ε=ε(χ₀χ)³, L=1 (gj78 (9.5.5), jpss79 (14.2.3)) | Retain. |
| R17.4.12a outside-S converse | Eig(1,1); ratio q | entire ramified twists, not cuspidal; reducible | Retain. |
| R17.4.13b Whittaker bridge | q=4, t=1/4, χ=1, s=2 | full L=(32/31)(16/15)(8/7)=4096/3255; constituent L=(32/31)(16/15)=512/465; ratio 8/7 | Retain. |
| R17.4.13 adjoint | diag(2,3); diag(a,a); scale by u | diag(2/3,1,3/2); identity; unchanged | Retain. |
| R17.4.14 cubic induction | θ=1 inert | eigenvalues 1,ζ₃,ζ₃², trace 0, det 1 | Retain. |
| R17.4.16 quadratic induction | θ(Φ_w)=2 inert | [[0,2],[1,0]], trace 0, det −2=−θ(Φ_w) | Retain. |
| R17.4.17 cubic BC | (1,2) split type; degree 3; Std(S₃)|C₂; permutation rep | A,A²; diag(8,27); 1⊕sgn; traces 3,1,0=1+(2,0,−1) | Retain. |
| R17.4.17 λ-constants | ℝ³, ℝ×ℂ | (d,−1)_∞=+1, −1 | Retain; ownership R01. |
| R17.4.17 norm phase | K=ℚ(∛2) | M=(a 2c 2b; b a 2c; c b a); N=a³+2b³+4c³−6abc; N(0,1,0)=2,N(0,0,1)=4,N(1,1,1)=1; Q=3a²−6bc: −3,0,3; identity at (0,1,0),C=1: 3−3=0=−2+0+2; disc/4=−27; −3≡5 (8) nonsquare | Retain. |
| R17.5.4 `finite_projective_lift` | trivial r | ρ=1 lifts | Retain. |
| R17.5.5 all-place upgrade | Std(S₃) of x³−2 at p=31, cubic χ mod 7 | 4³,7³,20³≡2 (31) split; χ(31)=χ(3)=ζ₃; twisted trace 2ζ₃, geometric eigenvalues ζ₃⁻¹ | Retain the Check; the functional-equation input is R01. |
| R17.5.7 octahedral comparison | A=diag(e^{iπ/6},e^{−iπ/6}), B=−A | tr A=√3, tr B=−√3, tr A²=tr B²=1, tr A³=tr B³=0, s²=3e, projective order 6 | Retain. |
| R17.5.9 `odd_solvable_artin_weight_one` | Std(S₃) of ℚ(∛2,ζ₃): p=5,7,31 | c transposition det −1; traces 0 (transposition), −1 (3-cycle), 2 (split) | Retain. |
| R17.5.11 Brauer character | a,a² with τ(a)=ζ₃; rank-p identity | ζ₃+ζ₃²=−1 also in char 2; p≠0 in ℂ | Retain. |
| R17.5.12 `solvable_finite_image_integral_lift` | natural rep of GL₂(𝔽₂)≅S₃; n=0 | lifts to the integral reflection lattice, reflection det −1≡1; zero module not irreducible | Retain. |
| R17.5.13 oddness | diag(1,−1) at 3, 2; R=ℤ×ℤ | −1≠1; −1=1; A=diag((1,1),(−1,1)): det=(−1,1)≠(−1,−1) though first-coordinate reduction is −1 | Retain; domain hypothesis needed. |
| R17.5.15 domain and order tests | x=2,−1,5 in ℚ₂ˣ; a=1,2,3 in ℤ/4 | −1,1,1; i,−1,−i, χ(1)²=χ(2)=−1 | Retain. |
| R17.5.16 CM construction | L=ℚ(i), a=1+i; k=3,w=1,t=2 | a/ā=i, phase e^{iπ/4} of order 8, index h=1; ζ(t)=t^{−w}=1/2 | Retain. |
| R17.5.17 mod-3 section | GL₂(𝔽₃) | order 48, PGL₂(𝔽₃) order 24≅S₄; √−2↦−1: 1≡−2 (3); 1+√−2 has norm 3 | Retain. |
| R17.6.1 Δ at p=2 | k=12 | raw −24, unitary −24/2⁵=−3/4, central 2¹⁰ on π_alg, 1 on π_unit | Retain. |
| R17.6.3a ℙ² | identity, constant coefficients | trace 1+1+1=3, one component | Retain. |
| R17.6.3b ℙ¹×ℙ¹ | c₁(t,s)=(t²,s), c₂=id, Z={0}×ℙ¹ | (t²)⊂(t), (t²)⊂(t)²: n=1; trace on H⁰,H²,H⁴ = 1,1+2,2 = 6 = 3·χ(ℙ¹) | Retain. |
| R17.6.4 branches | (a,d)=(2,3),(3,2),(1,pᵐ),(1,1) | reordered: dn≥a(n+1) at n=2: 6≥6; dual with n=2: 6≥6; n=1: pᵐ≥2; equal orders never | Retain. |
| R17.6.4 conductor | M=15, N=5 | N∣M, M∤N: no conclusion; both divide ⇒ equal | Retain. |
| R17.6.5 untwist | d of odd order n | ξ=d^{(n+1)/2}, ξ²=d; a²=1 ⇒ a=1 in char 2 | Retain. |
| R17.6.6 `solvable_characteristicTwo_projective_dihedral` | GL₂(𝔽₂); unipotent C₂; V₄; D_n with n even | ≅D₃; fixes a line; normal 2-subgroup fixes a line ⇒ A₄,S₄ reducible; central involution unipotent ⇒ reducible | Retain. |
| R17.6.7–8 dyadic cases | D≡1,5,4,0 (8) | ν=0,2,2,3; weights 2,2,2,4; −5≡3 (8) no discriminant | Retain. |
| R17.6.11a Katz descent | m=1; level 11 mod 5 | identity; S₂(SL₂(ℤ))=0 blocks descent | Retain. |
| R17.6.13 `characteristicTwo_solvable_weight_one` | natural GL₂(𝔽₂) rep via x³−2 | traces 0,0,1 and det 1 by class; Std(S₃) lift gives a_p reducing to them | Retain. |
| R17.6.17–19 compatible systems | roots 2,3, f=2; χ of order 3; tower (2,3) | 1−13T+36T²; (ρ⊗χ)⊗χ≠ρ; 1−793T+46656T² | Retain. |

**Pinned declarations opened** (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`): `IsNonarchimedeanLocalField` (`Mathlib/NumberTheory/LocalField/Basic.lean:45`); `IdeleGroup`, `IdeleClassGroup`, `IdeleClassGroup.ofCompletion`, `.ofAdicCompletion` (`Mathlib/NumberTheory/NumberField/AdeleRing.lean:93–130`); `MonoidHom.domRestrict_surjective` (`Mathlib/GroupTheory/FiniteAbelian/Duality.lean:107`); `Matrix.charpoly_fin_two` (`Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:228`); `Matrix.GeneralLinearGroup.map_det` (`.../GeneralLinearGroup/Defs.lean:219`); `Matrix.det_smul` (`.../Determinant/Basic.lean:275`); `Zsqrtd.lift` (`Mathlib/NumberTheory/Zsqrtd/Basic.lean:862`); `Representation.ind` (`Mathlib/RepresentationTheory/Induced.lean:77`); `Complex.Gammaℝ_mul_Gammaℝ_add_one` (`.../Gamma/Deligne.lean:124`); `haarMeasure_self` (`.../Haar/Basic.lean:540`); `Modulus`, `IsCongrOne`, `congruenceSubgroup` (`TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:96, 314, 365`); `HeckeRing.GL2.Newform` and `dirichletLift`, `qExpansion_coeff_one` (`.../Newforms/Newform.lean:104, 134, 164`); `satakeParameters`, `satakeParameters_eq_pair_iff` (`.../Newforms/Satake.lean:91, 108`); `eq_of_forall_notMem_eigenvalue_eq` (`.../StrongMultiplicityOne.lean:120`); `symPowerRep` (`.../ClassicalGroups/SymmetricPower.lean:59`); `Representation.charTwist` (`.../CharacterTwist.lean:86`); `IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero` (`.../SchurMultiplier.lean:249`); `QuaternionAlgebra.oneEquivMatrix` (`TauCeti/Algebra/Quaternion/Split.lean:121`); `HeckeCharacter` (`.../HeckeCharacter/Basic.lean:30`). The README's statements about each (what it provides and does not) match.

**Cross-roadmap citations resolved** (at the open heads read with `roadmaps show`, or on main): SmoothRepresentationsOfLocalGroups SR.0–SR.4 and SR.5.2 (#1688, lines 553–3515, 3758, 4586); PadicLocalLanglandsForGL2Qp §4.4 (line 1515) and §6.9 with `DivisionAlgebraTypes.jacquetLanglands` and `DrinfeldComparison.localJacquetLanglands` (lines 2415–2417; the resolver's two leads are these planned names); AutomorphicSpectralTheory §§0.9, 0.48–0.50, 3.6a, 6.9, 6.17, 6.19, 7.0a–c, 7.1 (#925); ArithmeticGaloisRepresentations §§1.6, 2.4, 2.5, 2.7 (three subsections), 3.1–3.7, Layer 4 (Dickson §4.4), Layer 5, §7.1–7.2, §7.6 with its three bold targets (#856); AlgebraicModularFormsAndSerreWeights R15.1–R15.6 and R15.5A.1–3 with the cited fragments (#928); QuaternionicModularForms §§1.3, 2.1, 2.2, 3.1 (#934); ArithmeticLocallySymmetricSpaces ALS.F.6–F.7, 5b.4–5b.5 (#871); AutomorphicFormsOnReductiveGroups §§0.5, 2.6, 5.8, 7.2–7.3 (#1037); AdelicAlgebraicGroups AA.0–AA.3, AA.1.5, AA.5.2 (#792); AutomorphicLFunctionsAndLocalFactors by content (R04 for the names); LefschetzPencilsAndVanishingCycles LPV.0, LPV.2; ComplexComparisonPartII C6.3–C6.6; ClassicalAdicEtaleCohomology Layers 8–9; on main: ClassFieldTheory Layers 5–14 (`README.md:920–1872`), QuadraticFormInvariants Layers 2, 5, 6 with 6D, GlobalQuadraticForms 4.4, HeightsAndUnits 4.2 (`:419–422`), EtaleCohomologyFoundations 0.6, 0.8, 0.11, F.0–F.6, F.4.0, ModularCurves 0E, 5B, 9A, SchemeAndStackFoundations 1.1, GlobalNumberFields Layers 1, 2, 7, 9, 10, ProfiniteCohomology Layer 10, Chebotarev Layer 10, NumberFieldArithmetic Layer 5, LocalFieldsRamification Layer 1, ModularForms Layers 4, 7, 8, 8G, 8W, RepresentationTheory/InductionRestriction Layers 3, 6, 7 and SemisimpleAlgebras Layer 6, ReductiveGroupsPartII RG2.0. Ownership by object: Chevalley's theorem, Fong–Swan and Brauer characters have no other owner (RepresentationTheory on main declares modular theory proper out of scope, `README.md:111–117`); QuaternionArithmetic (#1722) consumes R17.1.5's two theorems (its lines 153–157); ArtinRepresentations (#1711) consumes R17.5.1, R17.5.6–R17.5.10; EtaleDualityAndPerverseSheaves is R05. Ownership against open pull requests without supplied files was not checked beyond the `roadmaps grep` index.

## Not verifiable

- **prr23**, Theorem 1.33, pp.42–43: the sources service resolves the book only to its Cambridge landing page; the locator is uncertified. The ramification realization was checked through GlobalQuadraticForms §4.4, ClassFieldTheory Layers 10 and 14 and the instances above.
- **jl70** pagination: the Springer DOI is paywalled; the UBC retypeset (fetched, `institutional`) places Theorem 16.1 at printed p.260 and (16.1.7) at printed p.275, while the README cites p.261 (IAS author scan) and p.277 (“IAS retypeset edition (2026)”), which I could not locate. Content verified, page numbers of those two editions not.
- **bh06** (paywalled, uncertified), **bz76** (author server), **artin-tate**, **tate-global**, **clozel90**, **casselman73** and **rt83** (image scans): not read this round; their locators are cited by number only.
- **jpss79** and **tunnell78** were read from OCR of image-only scans; symbols are degraded, the statements quoted above were legible.

## Source issues

- **Error** in cg20 at §1.3, printed p.805: the source says a smooth admissible irreducible unramified representation that is not trivial has a two-dimensional Iwahori-fixed space; it should say infinite-dimensional, since a nontrivial unramified determinant character has a one-dimensional one; affects a stated result.
- **Gap** in jl70 at Theorem 16.1 and the paragraph after it, printed p.260 in the UBC retypeset: the source says its proof is a formal sketch with analytic facts not verified; it should supply the convergence and trace identities; affects the proof.
- **Misprint** in rt97 at §2, case (ii), p.306: the source says the discriminant is congruent to plus or minus five modulo eight; it should say five, since three is not a discriminant residue; affects nothing.
- **Misprint** in rt97 at §2, sentence after cases (i)–(iv), p.307: the source assigns the dyadic exponent three to case (iii); it belongs to case (iv); affects nothing.
