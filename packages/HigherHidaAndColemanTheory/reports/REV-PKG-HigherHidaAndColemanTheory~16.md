<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13045#issuecomment-6886523316 -->
Review (codex) of 5549965

Verdict: needs_changes

1. **F01** (P1) A zero support witness makes the claimed compact operator the identity

   **Location:** packages/HigherHidaAndColemanTheory/README.md:876, also :864, :895 and :897. “On every allowed pair the s-th power of T^±, for the s of its inclusions, acts potent compactly”.

   **Claim:** The particular nonnegative integer s witnessing the support inclusions always gives a potent compact operator, and finite slopes are extracted for that power.

   **Witness:** Set m=n=s=0 in the standard positive pair of §5.2. On the GL₂ identity cell with κ=0, U⊂Z and H⁰=O(U) is infinite-dimensional. The claimed operator is T⁰=id.

   Here U=B(0,−1), Z=B(cl 0,cl 0). There is only a negative-root coordinate, so B(0,cl 0)=U and all four inclusions hold. Take a nonempty ordinary component of the modular-curve neighbourhood, with canonical coefficient O. Its functions are infinite-dimensional: on the proper curve choose a closed point outside U; a nonconstant rational function with poles only there exists by Riemann–Roch and restricts to U, and its powers are linearly independent. Thus id has eigenvalue 1, of slope 0, on subspaces of dimensions 3, 6, 12 and arbitrarily larger dimensions. Every positive power of id is again id. It cannot be potent compact in the stated pro-category: a compact power factors through a compact operator on bounded Banach complexes, whose nonzero-eigenvalue blocks are finite-dimensional. This is exactly the obstruction already computed in the package's §5.4a Check at README.md:934 and §6.6a.

   The mistake is inherited from the literal s≥0 formulation in BP-Coleman line 5065, Corollary 5.3.8, p.108, and line 5240, Theorem 5.4.12, p.112. The definition of compactness at BP-Coleman line 1057 requires a factorization through a compact map of Banach complexes; compact transition maps of an exhaustion alone do not make its identity compact.

   **Exact repair:** Keep all allowed pairs, including the standard pair of depth zero. After choosing a witness (m,n,s), choose an integer S≥max(1,s). State compactness and perform finite-slope extraction for (T^±)^S, with the usual rescaling of slope cutoffs by S. Update the construction, API and proof route in §§5.2–5.3 and the comparison wording in §6.2 to distinguish the support depth from this positive iteration. Record the source correction and add a negative-control Check for s=0. A suitable replacement sentence is:

   “For an allowed pair, enlarge its inclusion witness s to an integer S≥max(1,s). The comparison defines a potent compact action of (T^±)^S; its finite-slope cohomology, with slopes divided by S, is independent of that positive choice.”

   **Repair tested:** Increasing s to S only shrinks the lower-bound tubes; all upper bounds stay fixed. Thus every previously allowed pair remains allowed. For the counterexample pair, S=1 gives B(1,cl 0)⊂U=B(0,−1), while U∩B(0,cl 1)=U⊂Z. The controlling action is now a positive contracting iteration. In its root-coordinate model f(z)↦f(3z), the eigenvalues on 1,z,z² are 1,3,9, and the slope ≤2 block has dimension 3. The identity's slope-zero blocks remain unbounded. §6.2 already says “for s large”, so it needs consistent notation, not a new restriction of its theorem.

One blocking finding. The previous finding is repaired. The new finding concerns a zero iteration in the supported Coleman construction, not the negative determinant twists repaired this round. README.md, Suggested.lean, metadata.toml and sources.toml were not modified.

## Verified sound

### Previous finding and repair audit

Previous review R01 (repair report F01), concerning §9.6: **repaired**. README.md:1604 now says “for every r∈ℤ put C(n,ε,w,κ_A,r)=RΓ(X_Kli(p^n,ε),F^(κ_A,w)⊗ω^r)”; :1609 says “For every k∈ℤ_≥0 and every r∈ℤ”. Negative determinant powers are defined as dual powers of an invertible sheaf. The same paragraph extends the exact triangle and finite-slope radius comparison to these twists. README.md:1606 separately restricts the integral slope estimate to r≥0.

Opened Pilloni-Singular line 3950 through line 4170, §§13.2–13.3, pp.85–90. Tensoring the r=0 sequence by ω^r preserves exactness for negative r; invertibility of the characteristic-zero isogeny differential defines its negative powers. This does not invert the integral divisibility used in the nonnegative-twist slope proof. The new negative-twist Check at :1620 computes (k,r)=(0,−1), final determinant exponent 0, D(1)=0 and D(z)=1. At p=3, D(f(3z))=3(Df)(3z), also for this twist. The positive BGG normalization and radius-colimit qualification survive the repair.

The repaired pattern was searched through the rest of the package: §9.7 legitimately uses k,r≥0 for slope bounds; §9.8 uses r=2; §6.5 uses dominant Levi weights and does not impose a nonnegative determinant twist. No additional negative-twist restriction was found. There were no maintainer notes or settled “not actionable” findings to reopen.

### Principles, shape and acceptance file

Read all 69 numbered README sections, their proof routes, API/Check blocks and Needs lines, together with the conventions and supplier contracts. The nine layers have Examples and Dependencies endings. The 24 explicit API blocks and 41 Checks blocks include negative controls; definitions described in prose were also read. The package keeps the all-prime Siegel theory, the separate quasi-split abelian-type Coleman theory, and the distinction between proved rational amplitude and conjectural integral amplitude in genus at least three. No computational algorithm, sorry'd datum, set_option, undeclared local Lean name, copied table, process residue or second roadmap on main was found. The compactness boundary in R01 is the mathematical exception to this result.

Main-branch shape comparisons were read in TauCetiRoadmap/RigidAnalyticGeometry/README.md, TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md and the main LieHighestWeight README. Their mathematical dependency and ownership structure was used, not their incidental process wording.

The headline list at README.md:303 agrees with Suggested.lean's module docstring:

| Headline | README | Suggested.lean coverage and missing carrier |
|---|---|---|
| Derived arithmetic Hida control | §4.6 | Lines 10–15: supported Igusa/Iwasawa complex on integral Siegel models |
| Integral Iwasawa Serre duality | §4.8 | Lines 10–15: same complexes and geometric coherent duality |
| Integral amplitude in genera 1,2 | §4.9 | Lines 16–18: universal Iwasawa complexes |
| All-genus rational amplitude | §8.4 | Lines 16–18: universal complexes and analytic comparison |
| Regular and singular geometric classicality | §5.8 | Lines 19–21: period domains and supported coherent Cousin complexes |
| Cohomological eigenvariety | §7.1 | Lines 22–24: rigid weight spaces and geometric family cohomology |
| Interior dimension and deformation | §7.5 | Lines 22–24: those families and their interior image |
| Sharp interior bounds | §7.6 | Lines 25–27: finite-slope Shimura cohomology |
| Sharp Siegel bounds | §8.5 | Lines 25–27: integral supported overconvergent model |
| Two-term Klingen control | §9.8 | Lines 28–30: Klingen threefold, height-one tower and partial-ordinary complex |

The Lean file contains exactly one import, `import Mathlib`, one module docstring and the correct empty namespace. There are **zero declarations, zero sorried theorems and zero examples**. Therefore the exhaustive one-tactic padding probe and the `#check @name` binder audit each have zero cases; no surrogate theorem is being counted as a headline. Searches by object at both pins did not find the missing Shimura/Igusa/supported-family carriers. Generic derived categories, modules and Hecke rings do not make these geometric headlines statable with a few simple definitions.

Ran `lake env lean` on packages/HigherHidaAndColemanTheory/Suggested.lean from the prescribed pinned checkout: **exit 0, empty output, no warnings**. No additional import needed a targeted build. No Lean process remains running.

### Seeded source verification

All four manifest texts were readable in the legal source cache. No cited work was missing, no unverified locator flag was found, and no source entry was added or rewritten. Page numbers below refer to the manifest's author editions, including the revised 180-page BP-Coleman edition. The arithmetic and geometric hypotheses were compared with the surrounding source setup, not merely the theorem titles.

| Sampled target | Text opened, exact locator | Result |
|---|---|---|
| §1.1 cohomological dictionary | BP-Coleman line 90, §§1.1–1.3, pp.2–4; line 2379, §4.1, pp.50–52; BP-Hida line 208, Theorem 1.4.3, p.5 | Left representation, Levi dominance, central quotient, shifted chamber formula and dual canonical twist retained. |
| §1.2 relative slopes | BP-Coleman line 5675, Theorem 5.9.6, p.122; line 6022, Definition 5.11.2, p.130; line 6210, Definition 5.11.14, p.134 | Relative cone, centre, strict exclusion and finite-slope occurrence are distinguished. The printed coefficient exclusion is not silently used as a theorem. |
| §3.2 integral normalization | BP-Hida line 2473, Proposition 4.3.9; line 2486, Remark 4.3.10; line 2490, Proposition 4.3.11; line 2501, Remark 4.3.12; line 2504, Proposition 4.3.13; line 2550, finite-character normalization, pp.47–49 | Unit parts, p-divisibility and finite character are retained. The pure-p-power simplification is explicitly corrected. |
| §3.4 fixed-weight ordinary complexes | BP-Hida line 2634, Proposition 4.4.4; line 2642, definitions; line 2647, Proposition 4.4.5, p.51; line 2863, §5.3.1, p.55 | Both boundary variants, finite characters, p-adic inverse limit, normalized torus action and decomposable levels agree. |
| §3.8 away-p action | BP-Hida line 184, §1.4, p.4; line 2234, §4.2, pp.43–44; line 2919 and line 2954, §5.4, pp.56–57 | The source states the spherical action/finite image; the roadmap supplies the relations on its supported models using the named correspondence contracts. No assertion that arbitrary individual operators commute. |
| §4.1 finite group-ring perfectness | BP-Hida line 2775 through line 2855, especially Proposition 5.2.3, p.53 | Cofinal decomposable levels and equivariant perfect models, including p=2; no averaging by a nonunit group order. |
| §5.1 finite-level Bruhat geometry | BP-Coleman line 4150, Theorem 4.5.2, pp.88–89; line 4427, Propositions 4.6.12, 4.6.14–4.6.15, pp.94–95; line 4559, Proposition 4.6.19, pp.97–98 | Truncated continuous period maps, finite-level domains and cyclotomic torsor reductions. Correct inequality 0≤m−n≤m′−1. Abelian affinoid strengthening is a gap. |
| §5.3 continuation | BP-Coleman line 5062, Corollary 5.3.8, p.108; line 5236, Theorem 5.4.12, p.112; line 1057, compact pro-maps, p.23 | Positive-iteration continuation supported; the zero-iteration assertion is R01. |
| §6.1 analytic torus action | BP-Coleman line 7170 through line 7225, Lemmas 6.3.10–6.3.11, pp.155–156 | Element-dependent normalization, coefficient twist and opposite distribution action agree. |
| §6.2 supported analytic families | BP-Coleman line 7296, Definition 6.4.7, p.158; line 7320 through line 7365, Theorems 6.4.8 and 6.4.10, p.159 | Separate analytic radius and geometric depths, relative lower inclusion, corrected negative depth and sufficiently large compact power retained. |
| §6.6b analytic bounds | BP-Coleman line 7670 through line 7725, Theorem 6.8.3 and proof, pp.167–168 | Three printed bounds and the corrected fourth checked by duality and algebraic specialization. General complete-field extension is supplied by the explicit finite-block specialization argument, not by unsupported duality over ℂ_p. |
| §7.4 interior specialization | BP-Coleman line 7820 through line 7869, Proposition 6.9.5(1)–(4), pp.170–171 | Torsion freeness, surjective specialization and the different +/− algebraic comparison directions agree. No equality of arbitrary base-changed images. |
| §7.6 sharp interior theorem | BP-Coleman line 7930 through line 7991, Theorems 6.10.1–6.10.3, pp.172–174 | Interior restriction and proof's small-slope improvement retained; the degree-zero factorization keeps Cκ+={id}. |
| §8.4 rational amplitude | BP-Hida line 3270 through line 3306, Corollary 6.2.17 and Remark 6.2.18, p.64 | Every genus after inverting p, with opposite canonical/cuspidal intervals; no integral genus-three assertion. |
| §9.7 Klingen extension | Pilloni-Singular line 4530 through line 4578, §14.7, pp.99–100 | Strict extension bound k+2r−3 and its combination with the two BGG bounds; k,r≥0 and both boundary variants retained. |

### Computed adversarial table

These are separating computations, not substitutes for proofs of the headline research results. All fifteen sampled sections, all ten headline sections and the repaired/failing passages are represented. For untouched material, the earlier review was reused only for rows with explicit values; its erroneous prose spelling of the §5.1 depth inequality was not carried over. Other sections and their checks were read against the standing hypotheses and their named inputs.

| Statement | Instances | Values computed on each side or against a wrong model | Result/change |
|---|---|---|---|
| §1.1 dictionary and §9.1 | C₂, ν=(0,−2), four chambers | κ=(5,3),(5,1),(2,−2),(0,−2); applying the matching inverse returns (0,−2) in all four cases. | Keep central coordinate/parity convention. |
| §1.2 cone order | Difference (−1,10) in a two-ray cone; central difference 1 | −1<0 excludes the first vector despite 10>0; central difference 1 also excludes comparison. | Both restrictions needed. |
| §2.1 smooth dualizing object | Relative dimensions 0,1,2 over 𝔽₂ and ℤ/9 | Ω⁰[0]=A[0]; Ω¹[1] in degree −1; Ω²[2] has rank 1 in degree −2, whereas Ω¹[2] has rank 2. | Correct shifts and top exterior power. |
| §2.2 strict dynamics | I=(t), t↦t²,t³; identity | Pullbacks (t²),(t³) give ratios 1/2,1/3; identity would need a≥b and a/b<1 simultaneously. | Strictness is not equality of underlying supports. |
| §§2.3–2.4 ordinary extraction | A=ℤ/9; multiplication by 3 and 1; zero | 3²=0 gives ordinary part 0; identity gives A; zero module gives 0. Over ℚ₃ eigenvalue 3 has slope 1. | Integral ordinary is not rational finite slope. |
| §2.7 duality | ℙ¹ over 𝔽₂, empty boundary | RΓ(O)=𝔽₂[0]; RΓ(Ω¹[1])=𝔽₂[0]; trace pairing is multiplication. | Keep smoothness and shift. |
| §3.2 normalization | p=3, diag(2,3), diag(2,6) | Character ratios 3/2 and 3, valuations 1 and 1; replacing the first by a pure p-power gives 3≠3/2. | Unit factor essential. |
| §3.4 fixed weight and character | Rank-one torus action, ν(u)=u, χ trivial; a nontrivial finite χ | At u=2 the algebraic scalar is 2, twisted scalar is 2χ(2); the untwisting scalar is 1/2, giving 1 or χ(2). | Full νχ and inverse twist retained. |
| §§3.8,6.10 spherical action | GL₂, ℓ=2,3; matrix units over 𝔽₂ | 3²=6+3·1=9; 4²=12+4·1=16. E₁₂E₂₁=diag(1,0)≠diag(0,1)=E₂₁E₁₂. | Relations must precede passage to action images. |
| §3.8 coefficient limit | C_s=ℤ/3^s[0], degree character at ℓ=2 | Modulo 9, 3²=6+3=0; assigning every coset 1 gives 1≠4. In the limit 3·1=3≠0. | Limit action is ℤ₃-linear, not ℤ/3-linear. |
| §4.1 group-ring perfectness | C₂ over k=𝔽₂; regular versus trivial module | k[C₂] is free rank 1; Tor_i(k,k)=k for every i≥0 for the trivial module. Invariants' augmentation over ℤ₂ has image 2ℤ₂. | Tower hypothesis excludes the false arbitrary-module claim and division by 2. |
| §4.4 continuous admissibility | f(x)=x on ℤ_p | Infinite image; not locally constant. Dual degrees i→−i→i. | Continuous functions and measures retained. |
| §4.6 derived control; §6.4 | B=F⟨t⟩, [B —t→ B] in degrees 0,1 | Family H⁰=0,H¹=B/(t); t=0 fibre H⁰=H¹=F via Tor₁=F; t=a≠0 fibre is 0. | Derived specialization necessary. |
| §4.8 Iwasawa duality | g=2, d=3, degree 1; curve k=3 | Partner degree 2; 1+2=3 and target [−3]. Curve dual weight 2−3=−1. | Degree, character inversion and boundary twists agree. |
| §4.9 integral amplitude | g=1,2; g=2, ℓ=1 | d=1,3; cusp interval [0,1], canonical [1,3], intersection {1}. | No integral all-genus extrapolation. |
| §5.1 depth and rootless geometry | m=n=0,m′=1; m=0,n=1; torus | 0≤0≤0 true; 0≤−1 false. Torus flag has one cell of dimension 0. | Correct m−n direction. |
| §§5.2–5.3 compactness | GL₂ identity cell, m=n=s=0, κ=0 | U∩Z=U, T⁰=id; slope-zero ranks on independent powers are 3,6,12,…, not finite. | R01: choose positive S after enlarging witness. |
| §§5.2–5.3 repaired witness | Same pair, S=1,p=3 | B(1,cl 0)⊂B(0,−1); contraction on 1,z,z² has eigenvalues 1,3,9 and slopes 0,1,2. | No support pair lost. |
| §5.4a duality cutoff | Eigenvalue p² on first line, inverse character on second | η⁻¹(t⁻¹)=η(t)=p², both controlling slopes 2; η⁻¹(t)=p⁻². | Same cutoff, opposite characters. |
| §5.8 singular classicality | C₂, κ=(2,2) | κ+ρ=(1,0); compatible lengths 0 and 1; range [0,1], not one degree. | Singular Cousin terms retained. |
| §6.1 normalized analytic action | Unit 2 and twist p⁻³ on eigenvalue p² | 2·(1/2)=1; twisted eigenvalue p⁻¹ has slope −1, not 2. | Full unit and trace normalization. |
| §6.1a descent | A²/{±1} in characteristic 0 | Generic quotient fibre length 2; origin fibre basis 1,x,y, length 3. | Finite quotient alone is not flat; keep stated descent hypotheses. |
| §6.2 relative supports | p=3,C=2, depth 1; periods z=3,9 | v(3)=1,v(9)=2; v(z)>1 excludes 3 and contains 9, while v(z)>2 excludes 9. | Relative lower inclusion works; absolute version fails. |
| §§5.2,6.2 empty roots | Torus with N points | Every tube=X; U=Z=X; cohomology F^N[0]. For N=1, id is compact on the one-dimensional space. | Does not rescue R01 on a curve; empty-root convention is defined. |
| §6.5 BGG | SL₂, κ=1,p=2,3 | D²1=D²z=0; D²z²=2≠0. At p=3 twisted eigenvalues on 1,z are 1/3,3, slopes −1,1. | Characteristic zero and coefficient twists necessary. |
| §6.6b four bounds | C₂,w=1,ρ=(−1,−2) | a=(3,3),b=0,2ρ_nc=(−3,−3); a+2ρ_nc=0=−b and b+2ρ_nc=(−3,−3)=−a. Printed omission gives (−2,−1). | Correct fourth bound. |
| §6.6b general coefficient field | GL₂, ν(4)=a transcendental in 1+9O_ℂ_p | Thresholds −1 and 0; slope −1/2 passes only first; slope 0 passes both. | Finite-extension-only duality would not cover this point. |
| §6.6b specialization route | [B —t→ B], t₀=p⁻¹, t=0 | Fibre H⁰=H¹=F, slopes −1; family only H¹=B/(t); q=1 survives though original i can be 0. | Transfers an occurrence, not its degree. |
| §7.1 cohomological support | [F —1→ F] and F in degree 1 | Total cohomology 0 versus F; support empty versus one point. | No degree-zero truncation or acyclic padding. |
| §7.4 interior specialization | Image I=(t)⊂F⟨t⟩ | I⊗F≅F, but image of specialized multiplication by t is 0; F→0 is surjective, not an isomorphism. | One-sided statement is correctly scoped. |
| §7.5 dimension | A=F⟨t⟩, A[ε]/ε² versus A/(t) | First algebra rank 2 and dimension 1; second dimension 0 and A-torsion. | Torsion-free interior input needed; reducedness not implied. |
| §7.6 sharp interior/identity chamber | GL₂ k=2 and k=1; C₂ κ=(5,3) | k=2 standard threshold 1 excludes slope 1. At k=1 lengths {0,1} give range [0,1]. C₂ t₂ sharp thresholds 3,4,4,8 give standard window [0,1). | Keep singleton identity chamber; no singular extension. |
| §8.4 rational amplitude | g=3,d=6,ℓ=2 | Canonical [2,6], cusp [0,2]; dual intervals [−6,−2], [−2,0]. | Invert p first. |
| §8.5 sharp Siegel bounds | g=2,k₂=3 | Sharp t₂ threshold k₂+1=4; normalized threshold 4−3=1. Slope 0 admitted, equality 1 excluded. | Strict endpoint retained. |
| §9.6 repaired negative twist | k=0,r=−1 | Final exponent k+r+1=0; D1=0,Dz=1; at p=3, D(Uz)=3=pU(Dz), not 1/3. | Previous finding repaired. |
| §9.6 radius colimit | f=Σ 2^m z^(2^m−1) over ℚ₂ | Input coefficients tend to 0; antiderivative coefficients at z^(2^m) equal 1, not tending to 0; on radius ρ<1, ρ^(2^m)→0. | Fixed-radius right exactness is correctly not claimed. |
| §9.6 spectral localization | R=ℚ₃[X,X⁻¹], y=X−1, R/(y²) | Localized primary component dimension 2; residue tensor dimension 1 and Tor₁ dimension 1. | Weight specialization then localization, not spectral fibre. |
| §9.7 Klingen extension | k=0,r=2 and k=r=0 | Extension thresholds 1 and −3; at (0,2), combined all-degree threshold min(−2,1)=−2, H⁰ threshold min(1,1)=1. | Ordinary H⁰ covered at (0,2); not all-degree ordinary control. |
| §9.8 two-term control | p=2,k=0 and k=4; parameters 1,1,9,9 | Rational small-weight statement does not supply torsion control at k=0; k=4 is in its stated integral range. Products 1,9,9,81 have slopes 0,2,2,4. | Isolated ordinary product survives repeated nonordinary roots. |

### Pin audit and ownership

The following declarations were opened at the manifest pins, not inferred from a newer library or from a successful sorry build:

| Declaration | Pinned file and line | Boundary checked |
|---|---|---|
| Module.End | Mathlib/Algebra/Module/LinearMap/End.lean:33 | Semiring, additive group/module data; no Hecke relations |
| zpow_sub₀ | Mathlib/Algebra/GroupWithZero/Units/Basic.lean:402 | Nonzero base; with 3,−1,2 both sides are 1/27 |
| HasDerivedCategory; DerivedCategory | Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74 and :87 | Abelian category and localization; no geometric coherent cohomology |
| CondensedMod; abelian instance | Mathlib/Condensed/Module.lean:41 and :43 | Module sheaves on CompHaus with coherent topology |
| CondensedMod.IsSolid | Mathlib/Condensed/Solid.lean:83; documentation :74 | Profinite solidification predicate; not relative analytic localization |
| IsHeckeTriple; HeckeCoset; HeckeRing | Mathlib/NumberTheory/HeckeRing/Defs.lean:75, :157, :189 | Commensuration, double cosets, finitely supported coefficient module |
| HeckeCosetModule.instRingHeckeRing | TauCeti/NumberTheory/HeckeRing/Associativity.lean:484 | Convolution ring for the native carrier |
| HeckeCosetModule.mul_comm_of_antiInvolution | TauCeti/NumberTheory/HeckeRing/Commutativity.lean:459 | Requires an anti-involution fixing every double coset; does not produce one for general G |

Object searches in Mathlib and Tau Ceti covered Igusa, Shimura, ordinary supported complexes, analytic localization and Hecke operations. Generic derived/condensed objects and classical Hecke computations are imported; none gives these supported geometric families. All eleven distinct backticked library identifiers in the README resolved, and there are no local declaration claims to reconcile with Suggested.lean.

Read the board package index before checking absence on main. Read the supplied open-head index and overlap output, and used `roadmaps show` and `roadmaps grep` for object ownership. No second copy, conflicting head, dropped cited id or dependency on numbering only supplied by a revision was found. The closest scopes give these ownership boundaries:

| Roadmap/head and scope witness | Shared object and owner |
|---|---|
| PadicFamiliesPartII, #2280, TauCetiRoadmap/PadicFamiliesPartII/README.md:7 | Imports this roadmap's higher Hida/Coleman foundation; owns Hilbert extensions and its later arithmetic applications. |
| AutomorphicBundlesPartII, #1823, TauCetiRoadmap/AutomorphicBundlesPartII/README.md:7; §§3.0a,3.13,5.13 | Owns coherent carriers, individual operators and hyperspecial genus-two relations. This package owns relations on supported p-level and analytic-family complexes. |
| OverconvergentAutomorphicForms, #1422, TauCetiRoadmap/OverconvergentAutomorphicForms/README.md:7; §§0.4,8.6–8.7 | Owns analytic induction/coefficient sheaves and descent. This package owns their supported cohomology and analytic BGG application. |
| GSp4NonregularModularityLifting, #1817, TauCetiRoadmap/GSp4NonregularModularityLifting/README.md:7 | Owns selected genus-two modularity-lifting applications, not the universal higher-cohomology library. |
| PerfectoidShimuraVarieties, #1085, TauCetiRoadmap/PerfectoidShimuraVarieties/README.md, scope and §§6.13–6.15 | Owns period maps, tubes and Levi reductions; this package imports them and starts at allowed supports. |
| SmoothRepresentationsOfLocalGroups, main, TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md, scope and SR.1.2,SR.4.1 | Owns generic Hecke/Satake theory; this package owns supported actions and its isolated Klingen refinement computation. |

Overlap check: read PadicFamiliesPartII, AutomorphicBundlesPartII, OverconvergentAutomorphicForms, GSp4NonregularModularityLifting, PerfectoidShimuraVarieties and SmoothRepresentationsOfLocalGroups across all three closest lists; shared objects have the owners recorded in the table, with higher supported cohomology owned here.

### Supplier resolution and declared gaps

Re-resolved cross-roadmap citations against main or the supplied open heads. The following are the interfaces read; section ids are grouped where one contract consumes their combined API:

| Supplier | Resolved interface |
|---|---|
| AdicSpacesPartIII (main) | R3.1,R3.4,R3.6,R3.8: coherent/quasi-Stein operations and Banach input; projective coefficients remain a declared extension |
| AdicSpacesPartIV (main) | F1.10: dagger coherent duality; LB/Fréchet complementary-support extension is declared |
| AlgebraicModularFormsAndSerreWeightsPartII (#1822) | §§7.1–7.4: hyperspecial spherical integral operators and rank-zero extension, not the Klingen twisted analogue |
| AutomorphicBundles (#1069) | §§1.4–1.5,1.9,3.3,5.2–5.4,5.10,6.1,9.1,11.10,11.16–11.17,12.1,12.11: torsors, bundles, duals, BGG and individual correspondences |
| AutomorphicBundlesPartII (#1823) | §§2.2,2.4–2.5,3.0a–3.0b,3.1–3.3,3.6,3.9–3.13,4.4,5.1–5.2,5.13: coherent operations, group-ring descent, transpose, support and vanishing |
| AutomorphicFormsOnReductiveGroups (#1037) | §6.7: Siegel chambers |
| CompletedCohomologyPartII (#1035) | §§3.11–3.12: continuous admissibility, measure duality and Iwasawa realization |
| DeformationAndDerivedPatchingAlgebra (#1034) | §§7.1,7.3,7.5–7.6,7.8,7.10: perfectness, derived limits and coefficient change |
| HodgeTateAndCanonicalSubgroups (#1084) | §5.1: Hilbert ordinary torsor; full Siegel and height-one Klingen versions are declared gaps, not claimed supplied |
| IntegralHeckeAndGaloisDeterminants (#1689) | §§2.1,2.3: finite action images and Fitting extraction |
| LieHighestWeight (main) | Layer 3: enveloping/Verma inputs; not the locally analytic BGG result |
| LocallyAnalyticDistributions (#854) | §§3.3,4.2,4.16–4.17: character coordinates, tensors, slope complexes and Fréchet comparison; preserved section interfaces despite internal ownership deferrals |
| OverconvergentAutomorphicForms (#1422) | §§0.4,8.6–8.7: analytic induction, quotient convention and Bruhat coefficients |
| PELModuli (#966) | M2.8–M2.9,M5.1–M5.2,M5.5–M5.6: Siegel and split-unitary moduli; general algebraic-space statements not mistaken for every scheme-level specialization |
| PadicFamilies (#1019) | 0a.24–0a.25 and 2a.8–2a.17: ordinary factors, spectral/eigenvariety machine and localized eigenmodule fibres |
| PadicMeasuresIwasawaAlgebras (main) | §§1.1,1.7: measures and completed group algebras |
| PerfectoidShimuraVarieties (#1085) | §§3.13,4.5,6.3–6.10,6.12–6.15, including 6.13a: geometry/quotients/reductions |
| PhiGammaModulesAndIwasawaCohomology (#1310) | §2.7: compact character spaces and Mellin coordinates; section exists at that head |
| ResolutionOfSingularitiesCharacteristicZero (main) | §6.3: ideal-sum blow-up separation, with its scheme-general scope |
| RigidAnalyticGeometry (main) | §§1.1–1.2,8.2: affinoid algebra, points and scalar extension |
| SchemeAndStackFoundations (main) | §2.20: dualizing upper-shriek input for the smooth computation |
| ShimuraCompactifications (#1053) | §§0.14,4.10,6.16–6.17,7.19–7.21,7.29: toroidal comparison, models and degree strata |
| ShimuraData (#1038) | §§3.8,3.10,3.13,5.5–5.6,5.10–5.11: Weyl and C₂ conventions |
| SmoothRepresentationsOfLocalGroups (main) | SR.0.2,SR.1.2,SR.1.4,SR.2.2,SR.3.1,SR.3.4,SR.4.1,SR.4.5: local representation and Hecke inputs |
| SolidAnalyticRings (#1458) | §§7.2–7.4: analytic coefficients/localization; exact relative-kernel and discrete-adic tower extensions remain declared |

The ten gap slugs in packages/HigherHidaAndColemanTheory/design/plan.json equal those in the README's ten “What … must provide” contracts: solid-localization-kernel, discrete-adic-solid-comparison, siegel-ordinary-igusa, klingen-height-one-igusa, abelian-affinoid-basis, projective-banach-cohomology, banach-support-duality, coherent-correspondences, abelian-subcanonical-vanishing and klingen-lci-model. Each names an earlier owner and a specific missing construction/comparison. These are coherent APIs for one construction per contract, not unrelated unowned prerequisites. In particular, the current Hilbert Igusa target does not supply the all-genus or height-one towers, ordinary coherent quasi-Stein theory does not already supply projective Banach coefficients, and the normalization of a toroidal level model does not by itself give the specified Klingen lci moduli model. No gap is reported merely because it is not yet delivered.

The required mechanical dependency check completed successfully:

```text
depcheck: 244 roadmaps, 2217 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. Internal Needs lines were also read: the duality precedes transposed bounds; family BGG and geometric classicality feed the interior theorem; the Siegel comparison precedes rational amplitude; the Klingen application does not supply prerequisites back to those layers.

### Source independence

Compared the fifteen seeded passages and five additional passages (§§2.1,5.4a,6.5,9.2,9.6) with the four source texts. The extra passages cover a definition, a duality formulation, a BGG statement, an example and the revised proof route. No copied prose sentence or clause-by-clause paraphrase was found. Shared mathematical formulas and unavoidable short terminology were excluded from the wording test. A token comparison's longest apparent match in §9.6 consisted solely of repeated formula variables, not prose. No source figure, exercise list or table was reproduced.

Counting explicit source-id occurrences in the README, including reference and errata citations, gives BP-Coleman 74, BP-Hida 55, Pilloni-Singular 31 and BP-GL2 3: 163 named citations. Opened BP-Coleman's contents at line 18 through line 76. Its geometry/overconvergent/analytic sequence is not copied section for section: the roadmap separates a common weight layer, dynamics, integral strata, Iwasawa interpolation, geometric supports, analytic families, interior eigenvarieties, the integral–analytic bridge and the Klingen application. In Layer 5 the duality-to-transposed-bound edge (§5.5 Needs §5.4a), and in Layer 6 the bound-to-exclusion-to-control edges (§6.7 Needs §6.6b; §6.8 Needs §6.7), force the relevant order. The bridge uses both earlier theories (§8.3 Needs §4.6 and §8.2); it is not a source chapter renamed as a layer.

Source independence: 20 passages compared with 4 sources, no copied expression found; largest share BP-Coleman, 74 of 163 named citations; contents compared with BP-Coleman: independent, with the mathematical dependency edges stated above.

## Not verifiable

- No source-access or elaboration obstruction. All four cited works and the largest source's contents were readable.
- The ten declared supplier extensions are contracts for future work, not implemented theorems at the pins. Their declarations and ownership were checked; this review does not certify their future implementations.

## Source issues

The following are source defects encountered in the checks above; except for the new zero-iteration problem, the package already records the corrections and they are not additional package findings.

- **Error** in BP-Coleman at Corollary 5.3.8 and Theorem 5.4.12, pp.108,112: the source permits s=0 while asserting potent compactness of T^s; it should choose a positive iteration after enlarging the support witness; affects a stated result.
- **Error** in BP-Coleman at Definition 5.4.10, Example 5.4.11 and Definition 6.4.7, pp.111–112,158: the source uses an absolute lower inclusion incompatible with its standard support pairs; it should intersect that lower tube with U; affects a stated result.
- **Misprint** in BP-Coleman at Definition 6.4.7, p.158: the source substitutes the coefficient radius for one freely chosen negative-support depth; it should use geometric depth l there; affects a stated result.
- **Gap** in BP-Coleman at Definition 5.11.14 and Corollary 6.8.4, pp.134,168: the source identifies printed coefficient inequalities with BGG exclusion without the required shifted calculation; it should derive the exclusion from each shifted term and corrected bounds; affects the proof.
- **Misprint** in BP-Coleman at Proposition 2.7.3, p.32: the source shifts an already degree-d supported complex again and later writes Ω¹; it should omit that extra shift and use Ω^d; affects a stated result.
- **Misprint** in BP-Coleman at Theorem 6.8.3(2), p.167: the source omits ρ from the second negative upper bound; it should read −w⁻¹ρ+ρ+w⁻¹2ρ_nc; affects a stated result.
- **Misprint** in BP-Coleman at Theorem 6.10.2(1), p.173: the source labels the result strongly-small although its proof establishes the small region; it should state the geometric small region; affects a stated result.
- **Misprint** in BP-Hida at Remark 4.3.12, p.48: the source describes a stratum ratio as a pure power of p; it should include the ratio character evaluated on the unit part of t; affects a stated result.
- **Misprint** in BP-Hida at Proposition 4.3.17, p.49: the source garbles the normalized algebraic-weight expression in its finite-character statement; it should use −w⁻¹w0M(κ+ρ)−ρ and retain χ separately; affects a stated result.
- **Gap** in BP-Hida at Remark 5.4.3 and Theorem 6.2.15, pp.57,64: the source leaves the family scalar map unlabelled despite its inverse-character arithmetic convention; it should specify the map including inversion; affects a stated result.
- **Misprint** in Pilloni-Singular at Proposition 13.3.3.1, p.90: the source gives the inverse p-power on the BGG target operator; it should give p^(k+1), as the derivative calculation and following thresholds require; affects a stated result.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5549965c18e60b3ea023004175e2bb2a9c4ccc6e", "job": "REV-PKG-HigherHidaAndColemanTheory~16", "model": "gpt-6-astra", "worker": "chris-9"} -->
