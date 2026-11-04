<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1236#issuecomment-6400712126 -->
Red team round 1 pass b (claude) of bb39ab9

Verdict: needs_changes

1. **F01** (P2) gap:primitive-minus-cycle-interface bundles three contracts

   Location: `packages/FuchsianOrbifoldsPartII/README.md:77` ("§4.17a must export the primitive reduced minus cycle as a complete narrow-class invariant up to cyclic rotation, its attracting Pell word … and its compatibility with the IntegralLattices B2–B3 oriented dictionary …"); same text in `design/plan.json`, `gaps[0].needs`.

   Claim: one declared gap with one `needs` sentence.

   Witness: the sentence asks for three deliverables with different hypotheses and different consumers: (a) the minus cycle is a complete invariant of the narrow class up to rotation (consumed by §1.4, §3.4, §4.3); (b) the word ∏T^{n_k}S is the primitive automorph of multiplication by the least norm-one unit ε_D>1 with attracting fixed point w (consumed by §1.5 only; needs the Pell/unit input, not the invariant); (c) the B2–B3 dictionary specialised through GlobalNumberFields Layer 11 agrees with the native `NumberField.NarrowClassGroup` (consumed by §4.4–4.6 label rules). AutomorphicSpectralTheory §4.17a (open head, lines 2669–2684) states none of them, so each is a genuine contract, but the intake announces one sentence that the supplier can satisfy in part and still be reported as either met or unmet.

   Repair: split into three gaps with the same supplier and section, in both files, and repoint the `*Needs:*` lines:
   - `gap:primitive-minus-cycle-invariant`, needs: "§4.17a must prove that two primitive reduced minus periods belong to the same narrow class exactly when they are cyclic rotations of each other, and that every narrow class has one." Cite in §1.1 (arithmetic specialization), §1.4 (representative independence), §3.4 (class statement), §4.3.
   - `gap:primitive-pell-word`, needs: "§4.17a must prove that for a primitive reduced period of A the word S₁⋯SℓT^m=∏T^{n_k}S is the automorph (2.9) of multiplication by the least norm +1 unit ε_D>1 with attracting fixed point w." Cite in §1.5 and §4.6.
   - `gap:narrow-dictionary-compatibility`, needs: "§4.17a must identify its narrow class group and form labels with IntegralLattices B2–B3 specialised through GlobalNumberFields Layer 11 to the native `NumberField.NarrowClassGroup`, including the negative-leading-coefficient sign clause." Cite in §4.4–4.6.
   Keep `gap:oriented-quadratic-cycle-reversal` unchanged (it is precise and minimal).

2. **F02** (P3) §§3.1, 3.2 and 3.3 have no source locator

   Location: `packages/FuchsianOrbifoldsPartII/README.md:490` ("This is this roadmap's orbifold doubling route, extending the smooth double of ComplexCurveModuli D0.4 …"), `:520` ("This is this roadmap's covering-lift route …"), `:536` ("This is this roadmap's arithmetic normalization route, using the height formula …").

   Claim: every target carries a locator into a legal source.

   Witness: the three targets replace the locator line with a supplier sentence; every other target of the README has a `(DIT16, …, DIT16 line N)` line. The design README of this package carried locators for all three (design `README.md:554`, `:573`, `:591`: "[DIT16] Theorem 1 … final proof paragraph p.959"), and the material is in DIT16 lines 387–405 (p.959): the boundary geodesic orders the elliptic points, the conformal type is claimed to determine the cycle. §3.3's height formula is the pinned `ModularGroup.im_smul_eq_div_normSq` (Mathlib `Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:471`).

   Repair: add, after the hypothesis paragraph of each target,
   - §3.1: `(DIT16, §2 pp.952–953, boundary circles and Nielsen region, DIT16 line 164; the doubling is the route stated here, extending ComplexCurveModuli D0.4 and D6.2.)`
   - §3.2: `(DIT16, Theorem 1, final proof paragraph p.959, DIT16 line 387; the lift through the double replaces the source's selected-lift argument.)`
   - §3.3: `(DIT16, Theorem 1, final proof paragraph p.959, DIT16 line 394; Mathlib ModularGroup.im_smul_eq_div_normSq.)`
   keeping the existing "This is this roadmap's … route" sentences.

Read in full: `packages/FuchsianOrbifoldsPartII/README.md` (807 lines, 28 targets), `packages/FuchsianOrbifoldsPartII/Suggested.lean` (103 lines, 8 declarations), `design/plan.json` (gaps), `sources.toml`, the three prior reports. No prior finding is marked `not actionable`, so nothing is settled. No Lean was run; the elaborated signatures in the job's scratch were compared with the README by hand.

Dependency gate output (unchanged file):

```text
depcheck: 54 roadmaps, 599 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The README's pins (Mathlib 6b7abb3…, Tau Ceti a91d3aa…) equal the manifest's.

## Verified sound

Counts: 8 Lean declarations read and compared with their elaborated types and the README (no lost binder, no `set_option`, no `lemma`, no sorry'd data, single `import Mathlib` plus one existing Tau Ceti module); 28 README targets read; 26 source locators verified against the cached texts (DIT16 lines 149, 157, 164, 174, 195, 250, 251, 260, 323, 332, 333, 349, 354, 381, 394, 407, 416, 439, 514, 1025, 1038; LU23 lines 253, 262, 275 with pages 195 and 198; SERIES05 lines 733 (p.21) and 1126–1149 (pp.32–33)); 60 README Checks read and evaluated, 31 by explicit computation (table below); 31 sibling/supplier citations resolved at main or at the named open heads; 20 Mathlib and 23 Tau Ceti declarations found at the pins with the stated files and namespaces.

Suppliers resolved. AutomorphicSpectralTheory (#925 head): §§0.27, 0.28, 1.14, 1.15, 2.17 (`completed_eisenstein_fourier`, expansion identical to DIT16 (5.3)), 2.18 (poles 0,1; residues −1/2, +1/2), 4.17a (period, Γ_A, F_A, projection with multiplicities, area πℓ_A, length 2 log ε_D, compact-part/finite-width cusp), 4.18, 4.20. AnalyticNumberTheoryPartI (#1126 head) §2.1: `core_stokes` with coefficient s(1−s)/2 under integrability and vanishing truncation flux, `core_signature` (0;2^ℓ;1;1), `core_boundary_period`. CongruenceSpectralGap (head 4aa2ff2) §0.1: pushforward of restricted area, independence, level-one mass π/3. MultiquadraticPartII (head 0bf098b) §§2.3–2.4 (`J_square_iff_sumTwoSquares`, at `Suggested.lean:108`), §§3.1–3.2. On main: IntegralLattices Layer B B2 (sign clause for a<0), B3, B5; GlobalNumberFields Layer 11 (`NarrowPic`); ComplexCurveModuli D0.1 (normal forms, χ=2−2g−b), D0.4 (bordered uniformization, conformal double, uniqueness), D6.2 ("Geodesic-cut metric", Fermi collar dr²+ℓ²cosh²r dθ²); ConformalMapping L2, L4; AlgebraicTopology Stages 1 and 7; DifferentialGeometry 5.3 (`integralTopForm_mextDeriv`), 5.5, 5.6.3; FuchsianOrbifolds Layers 0–6 with the cited items; Completed/UniversalCovers Stage 2. Merge order: AutomorphicSpectralTheory (97), AnalyticNumberTheoryPartI (98), CongruenceSpectralGap (106), MultiquadraticPartII (274) all precede FuchsianOrbifoldsPartII (275); none of them cites this roadmap.

Gaps: both slugs agree between README and `plan.json`; the supplier is named; neither asks for something §4.17a, IntegralLattices B5 (plus-reduction cycles, not minus cycles) or the pins already provide. gap:oriented-quadratic-cycle-reversal is precise (DIT16 line 239 states it for C_{JA⁻¹}).

Ownership: `roadmaps grep` over open heads and main for Nielsen/convex cores, limit sets, minus continued fractions, Ford polygons, `cycleGroup`, `AdmissibleCycle`, `cyclePolygon` finds no other owner and no other `Suggested.lean` with these names; the board package AutomorphicSpectralTheoryPartII is at design stage and its design README has none of these objects. FuchsianOrbifolds has an open revision (#1168); it is not a dependency and its "minimal limit set" items concern a different object.

Headlines: the statable headlines (Theorem 1's fundamental domain, free-product presentation, infinite index, and the raw-list conformal classification restated as conjugacy) are stated; the rest (finite-area core, bordered Gauss–Bonnet, arithmetic comparison, doubling and conformal recovery, complementary covering, improper Stokes and the completed endpoint) are named in the module docstring with their missing carriers (hull, bordered core, class-indexed surfaces, core-boundary integration), and no stand-in is written. Padding probe: `AdmissibleCycle`, `cycleGroup`, `cyclePolygon` have real bodies and are needed by the headlines; none of the five theorems follows by one tactic, restates a definition, mirrors a Check or computes a value (`cycleGroup_cuspStabilizer` needs the normal form of the free product and is an input of the conjugacy headline).

Adversarial mathematics record (values computed on each side):

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `AdmissibleCycle` | [], [2], [2,2], [4], [3,2], [4,4] | [] fails (empty); [2],[2,2] fail (no digit >2); [4],[3,2],[4,4] pass; digit sum ≥3 for every admissible list | matches §1.1 | none |
| `cycleGroup` body | [] ; [4] ; [3,6] ; [4,4] | [] gives generators {T⁰}=∅ effectively, group ⊥; [4]: {T⁴, S}; [3,6]: {T⁹, S, T³ST⁻³}, S₁ SL rep [[3,−10],[1,−3]], fixes 3+i; [4,4]: centres 0,4, width 8 | matches §1.1/§1.3 | none |
| `cyclePolygon` body | [4], [3,2], [3,6], k=ℓ term | [4]: strip 0..4 minus discs at 0,4, free interval (1,3) of length 2; [3,2]: discs at 0,3,5 tangent at 4, I₂ empty; [3,6]: i, 3+i, 9+i on P; take ℓ gives centre m | matches §1.2 | none |
| `cyclePolygon_fundamentalDomain` | covering: height-maximum argument; disjointness: n=[4] vs Hecke domain | Im γz ≥ Im z forces |cz+d|≤1, finitely many rows; a strip point inside a disc at N_k (0≤k≤ℓ, S_ℓ=T^mS₀T^{−m}∈Γ) is raised by S_k; for [4] the domain is the Hecke domain {|x|≤2,|z|≥1} with its left half translated by T⁴; boundary null | true | none |
| `cycleGroup_presentation` | [4]: C₂*ℤ; [4,4]: index-2 subgroup of Γ([4]) | χ(C₂*ℤ)=1/2−1=−1/2; index 2 gives −1=1/2+1/2−1=χ(C₂*C₂*ℤ); SS₁=[[−1,4],[4,−17]] ≠ ±S₁S=±[[−17,−4],[−4,−1]] | true incl. repeated lists | none |
| `cycleGroup_cuspStabilizer` | [4], [4,4] | translations in Γ([4]) are ⟨T⁴⟩; in Γ([4,4]) are ⟨T⁸⟩ although the height-one set is 4ℤ+i in both | true | none |
| `cycleGroup_infiniteIndex` | [4] | P([4]) contains the strip 1<x<3, 0<y<1 of area ∫₀¹2y⁻²dy=∞; finite index would give area ≤ index·π/3 | true | none |
| `cycleGroup_conj_iff_isRotated` (⇒) | [4] vs [4,4]; [3,4,5] vs [5,4,3] | φ fixes ∞ after Γ(n′)-composition (one cusp class); φ=az+b, max elliptic height 1 on both sides gives a=1; T^m↦T^m forces m=m′; integer translation of centre sets mod m gives rotated gap lists; [4]/[4,4]: m=4≠8; [3,4,5]/[5,4,3]: {0,3,7}+b≠{0,5,9} mod 12 for all b | true | none |
| `cycleGroup_conj_iff_isRotated` (⇐) | [3,6]→[6,3] | T⁻³Γ([3,6])T³: S↦T⁻³ST³=T⁶(T⁻⁹ST⁹)T⁻⁶∈Γ([6,3]); S₁↦S; T⁹↦T⁹ | true, direction T^{−N_r}ΓT^{N_r} | none |
| §1.5 word | [3,6]; [2] | T³S·T⁶S=[[17,−3],[6,−1]], det 1, trace 16, fixed points (3±√7)/2, cw+d=6w−1=8+3√7=ε₂₈>1 so w attracting; [2]: T²S trace 2 parabolic | matches | none |
| §1.5 inequalities (3.5) | [3,6], k=1,2 | 0<0.177<1≤2<2.823<3; 3<3.354<4≤8<8.646<9 | matches | none |
| §2.1 crossings | [3,6] | z=1/2+(√3/2)i; crossing with |ζ−3|=1 at 5/2+(√3/2)i; γ_w z=2.8226+0.0279i inside disc 3 (|·−3|=0.18); S₁γ_w z=8.5+0.866i on |ζ−9|=1 | matches Check | none |
| §2.2 cutoff | [3,6] | first arc centre 3/2 radius √7/2, max height 1.32>1; second arc centre 6 radius √7, max 2.65; 3/2+(6/5)i in P, below first arc; Y₀=3 works | matches Checks | none |
| §2.3 V | x=0,2; DIT display | 2arsinh(1)=1.7627=log((2/2)(√8+2)+1); cosh=3; V(0)=0; dist_eq gives 2arsinh(n/2) | matches | none |
| §0.4 B | (0;[2,3];1;0), (0;[2^ℓ];1;1), (0;[];0;3), (0;[];1;0), doubling | π/3; πℓ; 2π; −2π; B(2g+t−1,m++m,2s,0)=2B(g,m,s,t) | matches | none |
| §3.3 heights | γ=S at P₁ for [3,6]; identity | S(3+i)=−3/10+i/10, denominator 3²+1=10; identity excluded as witness | matches | none |
| §4.1 F_DIT | i; ±1/2+2i; ±1/2+(√3/2)i | i∈F_DIT, i∉fdo; −1/2+2i in, 1/2+2i out; −1/2+(√3/2)i in, 1/2+(√3/2)i out; interior = fdo; DIT16 line 197 | matches | none |
| §4.3/§4.4 masses | D=12, D=28 | π+2π=3π=9·π/3; 2π+5π=7π=21·π/3; m_A+m_ιA: 4+5=9, 9+12=21 | matches | none |
| §4.6 periods and units | D=12, 28, 136 | minus periods of 2+√3: [4]; (3+√3)/2: [3,2]; (3+√7)/2: [3,6]; (5+√7)/3: [3,3,2,2,2]; least t²−Du²=4: (4,1),(16,3),(70,6) giving 2+√3, 8+3√7, 35+6√34; (2,3+√7)=(3+√7), N=2; (3,5+√7)=(2+√7), N=−3 | matches | none |
| Label rules (B2–B3) | [a,−b,c], [−a,b,−c], −Q | σ(𝔞_f) gives A⁻¹; sign clause gives JA; both give JA⁻¹; invariant under replacing the dictionary by its inverse since J²=1 | matches | none |
| §5.1/§5.2 forms | F=1, F=y, F=log y on [0,1]×[1,2] | α₁=0; α_y=dz/2, top integral −m/2; d(i∂_zF dz)=−(F_xx+F_yy)/2 dx∧dy=(λ/2)F dμ; rectangle: 1/2−1/4=1/4=(1/2)∫1·y⁻²; cusp tail m/Y | matches, coefficient λ/2 | none |
| §5.2 λ=0 | periodic harmonic F | a″=∫F_yy=−∫F_xx=0; flux=−ia′/2; tail a(Y₀)/Y₀ | matches | none |
| §5.3 constant term | ε=10⁻³,10⁻⁵, y=5, c_Λ=0.37 | Λ(1+2ε)y^{1/2+ε}+Λ(1−2ε)y^{1/2−ε}→√y(log y+2c_Λ)=5.2535; c_Λ=Λ₀(1)−1 from `completedRiemannZeta_eq` | matches | none |
| §5.3 flux and tail | Y=100, m=9; Y=7, c=0.3 | F_y=Y^{−1/2}(1+(log Y+c)/2)=0.34876 both ways; ∫_Y^∞y^{−3/2}(log y+c)dy=(2log Y+4+2c)/√Y=3.2096 (quadrature 3.200) | matches | none |
| §5.3 Fourier pairs | n=±1, ±2 at s=1/2 | σ₀(1)=1, σ₀(2)=2: 4√yK₀(2πy)cos2πx, 8√yK₀(4πy)cos4πx; x-integrals over integer m vanish | matches | none |

Policy: the diff touches only `packages/FuchsianOrbifoldsPartII/`; no pull-request numbers or process words in README or docstrings; `theorem` only; every line ≤100 characters; `sources.toml` records exactly the three cited works, all certified.

## Not verifiable

- Ownership against open roadmap pull requests whose files this brief does not give was not checked, except through `roadmaps grep` over the indexed heads.
- ComplexCurveModuli D0.4's "hyperbolic uniqueness" for bordered surfaces was read only in the summary sentence of D0 item 4 and its D6.2 use; the full item text was not read line by line.
- AutomorphicSpectralTheory §§0.27–0.28 state Whittaker asymptotics; whether they export a bound |K_j(t)|≤Ct^{−1/2}e^{−t} valid on all of t≥2π (rather than for large t) is not stated there. The README derives it as local work, which is acceptable; it was not checked further.
- No Lean elaboration was run (brief); the elaborated types are those recorded in the job's scratch signatures.

## Source issues

- **Gap** in DIT16 at Theorem 1, final proof paragraph, printed p.959 (DIT16 line 394): the source says the cycle of hyperbolic distances between successive fixed points of S₀,…,Sℓ in ℍ is a conformal invariant of F_A; it should be stated for the normalized lifts, since these are distances of chosen lifts, not intrinsic distances on F_A, and the identification of lifts needs the cusp normalization; affects the proof.
- **Misprint** in DIT16 at Lemma 2, proof, printed p.972 (DIT16 line 1041): the source says the Stokes identity with the boundary term negated and dz̄ dz = −2i dx dy; it should be either the unnegated boundary term with dz̄∧dz = 2i dx dy or both as printed read with dz dz̄; the two sign slips cancel and (7.11) is correct; affects nothing.
- **Misprint** in LU23 at §3.1, printed p.195 (LU23 line 262): the source says every group with more than two limit points has a perfect nowhere dense limit set; it should be nowhere dense only for the second kind, the paragraph's standing case; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bb39ab94e699ddaf1ef552cd0e0a58780c699b8c", "job": "RT-FuchsianOrbifoldsPartII~1b", "model": "fable", "worker": "chris-j"} -->
