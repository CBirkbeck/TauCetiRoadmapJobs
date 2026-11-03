# Review of GlobalShtukasAndFunctionFieldLanglands (pull request #1490 at c0563df)

**Verdict:** needs changes

## R01 (P2) — Retire the four redundant supplier-gap requests

**Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/design/plan.json:4`, 10, 16, 22; `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:29`, 139, 460, 1056, 2088. “The elliptic-sheaf carrier and its comparison with one-leg shtukas belong to §2.7.”

**Claim:** Previous R01 remains unresolved. All four active gap requests still ask suppliers for objects this README owns or explicitly imports from their existing owner. None of their slugs occurs under Exact supplier contracts. This is redundant ownership, not an objection to consuming declared supplier gaps.

**Witness:** README §§0.13, 2.7 and 7.6 own volume, elliptic chains and centre restriction. SmoothRepresentationsOfLocalGroups §SR.5.2, *classical-llc-normalization*, owns rec. The four plan requests assign these same objects again.

**Exact repair:** Retire `classical-centre-restriction`, `equal-characteristic-glr-correspondence`, `elliptic-sheaf-carrier` and `function-field-sl-volume` from the active package gaps. Keep the volume theorem in §0.13, elliptic chains in §2.7, ordinary-centre restriction in §7.6, and the geometric/pair-factor comparisons in §7.11. Consume the existing rec bijection rather than requesting a second construction. Synchronize the package record with that ownership.

**Repair test:** The assignments retain SL₂/F₃(t) volume 1/16, period 4 for rank 2 at a degree-2 pole, the exclusion of completed functions with support sizes 1,2,3,…, and rec(D∨)(ϖ)=2 for geometric Frobenius 2. The computations below give each object one owner without removing mathematical content. The available repair report does not mark this finding “not actionable in this package.”

## R02 (P3) — Register Sp, Harder and YZ-I in the source manifest

**Location:** `packages/GlobalShtukasAndFunctionFieldLanglands/sources.toml`; `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:476`, 1077, 1368–1370, 2255, 2280, 2282. “YZ-I Definition 4.1 and Lemma 4.2, pp. 22–23.”

**Claim:** Previous R04 remains unresolved: Sp and Harder are absent from the 28-entry manifest. The repair also adds a third unrecorded work, YZ-I. The existing YZ entry is the second paper, not the first paper under another key.

**Witness:** Searching the complete manifest by key, title, author and arXiv identifier finds none of these three works. YZ-I line 1262 defines the kernel; line 1271 states surjectivity.

**Exact repair:** Add one entry under each existing README key Sp, Harder and YZ-I, with its cited targets, exact version/locators and legal retrieval metadata. Preserve the references and do not rename YZ. YZ-I is arXiv:1512.02683v3; YZ is arXiv:1712.08026v2.

**Repair test:** These are three distinct works: Sp supplies the elliptic-chain comparison, Harder the SL_r volume route, and YZ-I the rational Satake/Picard normalization. Their identifiers match three references rather than introducing duplicate records. The previous review legally fetched Sp and Harder; this review retrieved and read YZ-I through the sources service. No inaccessible-source request is needed.

## Previous findings

- R01 — not repaired: The four plan gaps remain active; README §§0.13, 2.7 and 7.6 retain local ownership, while §7.11 imports the existing rec bijection. Repeated as this report’s R01.
- R02 — repaired: README §§3.9 and 3.11 now define H_G^Σ, a_Eis^Σ, its kernel and ι_Pic, specify the product image map, and connect rational and normalized Satake coordinates. The computed tests agree.
- R03 — repaired: README lines 99, 107, 179, 197, 551 and 568 use existing prose targets, retain unramified reductive/qcqs hypotheses, and identify stack descent as this roadmap’s §1.4.
- R04 — not repaired: The manifest still lacks Sp and Harder. The new YZ-I reference is also unrecorded; all three are covered by this report’s R02.

## Verified sound

:robot: AI review. This is an **incremental re-review of 42 changed lines since 6efb589**: all changed passages, their affected interfaces and the four previous findings were checked. Unchanged mathematics is carried from [Prior], not presented as a new full review. No PR file was modified.

### Gate, dependencies and Lean

The supplied gate and targeted build passed. The independent gate rerun returned:

```text
gate GlobalShtukasAndFunctionFieldLanglands: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 204 roadmaps, 1641 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The separately rerun targeted command `lake build TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands.Suggested` exited 0 (“Build completed successfully (8976 jobs).”). Direct `lake env lean` elaboration of the reviewed Suggested.lean exited 0 with no output or warnings. The head is c0563df9ed77a4932f6d8636a4f2424d7d2a7e75; the outside-folder diff against origin/main and the worktree status are empty.

Suggested.lean is unchanged, has the single Mathlib import, the namespace and one module docstring, and **zero declarations**. Thus there are zero signatures requiring a binder probe and zero sorried theorems requiring a one-tactic probe. No new definition has been forced into a stand-in headline.

The README headlines remain: bundle masses/SL_r volume (§0.13); rational, integral and arithmetic Satake (§§1.7–1.14); shtuka geometry, truncations and compact cohomology (§§2.1–2.5); elliptic-sheaf comparison (§2.7); integral Eichler–Shimura (§3.7), cusp/one-place finiteness (§§3.10–3.12), PGL₂ Eisenstein decomposition (§3.11); Drinfeld descent and ind-smoothness (Layer 4); split, nonsplit and modular excursion decompositions (§§5.7–5.11); companions/GL_r comparison (Layer 6); and local parameterization, local–global and gamma/GL_r comparisons (§§7.6–7.11). The docstring names their missing geometric carriers. The new rational Hecke/Picard definitions specify the Eisenstein theorem’s interface; they do not make its actual shtuka-cohomology carrier available at the pins. The prior missing-carrier assessment is unchanged.

### Changed sources and the seeded sample

The seeded target **§1.1** intersects the diff and was reopened at VL Definition 1.6, Notation 1.7, Construction 1.8 and Remark 1.9, pp.43–45 (VL lines 2222, 2231, 2251, 2292). The final bundle is trivialized, formal-disc gluing retains the whole torsor chain, and factorization is over the disjoint-leg locus. The repaired supplier comparison is restricted to v∈U, where the model is reductive and unramified.

The other 14 seeded targets are unchanged: §§0.8, 1.3, 1.6, 1.9, 1.10, 3.12, 3.13, 4.2, 4.8, 5.10, 6.2, 6.3, 7.2 and 7.6. Their computed rows are retained below with explicit provenance. Section 7.6 was reopened for the unresolved ownership request. Their source proofs were not re-reviewed outside the incremental scope.

| Changed statement / affected consumer | Source and precise locator read | Result |
|---|---|---|
| §3.9 local rational Satake and divisor orientation | YZ-I §4.1.1–§4.1.2, p.22; YZ-I lines 1229–1263 | h_v maps to t_v+q_v/t_v; t_v represents the inverse uniformizer coset. Positive divisor/Picard orientation also agrees with YZ line 2409. |
| §3.9 twisted involution, kernel and full image | YZ-I Definition 4.1 and Lemma 4.2, pp.22–23; YZ-I lines 1252–1277 | Degree-twisted inversion and kernel are specified correctly; full-image surjectivity is the cited theorem. |
| §3.9 arbitrary finite excluded set | YZ §2.2, Lemma 2.1, p.8; YZ lines 403–418 | Surjectivity holds after removing any finite set, not only when a degree-one place remains. |
| §3.9 boundary action and §3.11 finite-rank conclusion | YZ Lemma 3.36, pp.38–39, YZ lines 2383–2409; Corollary 3.38, p.39, YZ lines 2457–2462 | The Picard action is modulo constructible errors; the kernel acts mc-trivially and consequently with finite rank. |
| §3.11 image algebra and decomposition | YZ Corollary 3.40 and Theorem 3.41, pp.40–41; YZ lines 2495–2547 | Product map, dimension-one algebra, reduced spectrum and finite-dimensional isolated part match; ramified base change is retained. |

The seven new Check bullets contain separate tests of the restricted tensor product, product preservation, kernel, involution, normalization, residue degree and finite-place removal. Their actual values are reproduced below. For example, removing all four degree-one places of P¹/F₃ still leaves 3, 8 and 48 places of degrees 2, 3 and 5, respectively. The polynomial identity recovering x has coefficient 9x, not 0.

### Supplier and ownership checks

Four supplier roadmaps were reopened through `roadmaps show`; the following **six target locators** were resolved against their operative text. The full citation resolver also found no unresolved cross-roadmap citation. Its library scan was unavailable on its own host, so the pinned declarations listed below were inspected directly.

| Supplier file and line | Contract checked |
|---|---|
| `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1095` | §3.1 constructs the fixed-curve torsor stack for a quasi-split reductive model, including descent, universal torsor and algebraicity. The new prose citation matches. |
| `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1119` | §3.2 constructs the fpqc local quotient for an unramified reductive group over k[[t]], including nonreduced test rings and coordinate changes. Restriction to v∈U prevents using this supplier at a bad model fibre. |
| `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:3054`, 3076 | §5.4 supplies the oriented product and modification theorem with qcqs irreducible S, finitely presented f, positive invertible n and bounded constructible Z/n coefficients. Modification may depend on F. |
| `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:3147` | SR.4.1 supplies raw/normalized Satake. Its qX+X⁻¹ convention becomes t+q/t on setting t=X⁻¹; at q=3 both give 3X+X⁻¹. No new generic Satake theorem is duplicated. |
| `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4653` | SR.5.2 *classical-llc-normalization* supplies rec on Frobenius-semisimple parameters, with arithmetic reciprocity and full dual. Confirms the existing owner relevant to R01. |
| `TauCetiRoadmap/FunctionFieldArithmetic/README.md:515` | §0.3 identifies divisor classes, Picard groups and Picard-scheme points over finite exact constants, compatibly with degree. It supplies the Picard target of the new map. |

Object searches used `roadmaps grep` over main/open heads, package README/plan records, and the pinned libraries. Searches for Satake–Picard maps, degree-twisted inversion and the function-field Eisenstein ideal found this roadmap’s specialized construction; modular-curve Eisenstein ideals and analytic Eisenstein series are different objects. SR.4.1 supplies generic local Satake, while this roadmap owns its divisor/Picard composition and boundary action. Unchanged ownership audits remain those of [Prior]; no new fully qualified Lean declaration is introduced.

The read-only package comparison confirms that the four declared gaps have named suppliers, but request already assigned objects. They are therefore the redundant-contract case of the brief, not unowned prerequisites or objections to future supplier delivery. No new supplier edge is upward.

### Pins inspected

The manifest still pins Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Four declarations were reopened in three files:

| File and line | Pinned definition and limitation |
|---|---|
| `Mathlib/AlgebraicGeometry/Scheme.lean:40` | `AlgebraicGeometry.Scheme` is a locally ringed space with local affine presentations; it does not include smoothness, finite type or nonemptiness. |
| `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49` | `CategoryTheory.Pseudofunctor.IsStack` extends prestack descent by essential surjectivity over covering sieves; no algebraic atlas is included. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean:216`, 231 | `TauCeti.FGPointRepresentationCat` and `TauCeti.fgPointRepresentationCategoryEquivalence` supply finite representations/comodules, not the perverse-sheaf Satake side. |

The other pinned declarations and unchanged supplier contracts retain the prior review’s audit. Two main-branch shape examples, AlgebraicCurves and AlgebraicVectorBundles, were consulted. The changed material introduces no computational algorithm, sorry’d data, good-prime restriction or route-specific substitute.

### Computed adversarial table: changed interfaces and findings

The following 21 rows were recomputed for this review. They are concrete diagnostics, not proofs of the geometric theorems. Standing finite-field hypotheses exclude q=0,1; rational scalar extension does not specialize q to zero.

| Statement | Instances tried | Values computed on both sides / wrong model | Result; change |
|---|---|---|---|
| §0.1 and supplier §3.1: fixed-curve stack | G_m on P¹/F₃; trivialize one rational fibre | Aut(O)=F₃× has order 2; framed automorphism group has order 1; Picard scheme would give 1 in both cases | Pass; prose supplier name retains the stack |
| §1.1 and supplier §3.2: local quotient at v∈U | G_m/F₃[[t]]; t²,t⁻¹; dual-number loop | Valuations 2,−1 add to 1; (1+ε/t)(1−ε/t)=1 but neither nonconstant factor is a power-series unit | Pass; unramified reductive hypothesis and fpqc functor retained |
| ClassicalAdicEtaleCohomology contract §5.4 | X=S=Spec(k̄), F=Z/2, char k=3; X empty; identity base change | Point stalk Z/2 in degree 0 and 0 otherwise; empty stalk 0; comparison sends 1 to 1 | Pass; n>0 invertible, qcqs irreducible base and F-dependent modification explicit |
| §3.9 H_G^Σ and local algebra | Empty tensor; one generator; two distinct places | Unit maps to 1; h²−h is nonzero in Q[h]; h_vh_w−h_wh_v=0, support of tensor indices has size 2 | Pass; algebraic restricted tensor product, not a completion |
| §3.9 Satake–Picard homomorphism | P¹/F₃, v,w rational, z=2 | Each image z+3/z=7/2; product image z²+6+9/z²=49/4=(7/2)² | Pass; product and coefficient 6 distinguish the map |
| §3.9 kernel and ideal | h_v−h_w, 1, h_v, h_v(h_v−h_w) on same curve | Images 0, 1, z+3/z, 0; at z=2 these are 0,1,7/2,0 | Pass; 1 and h_v are excluded from the kernel |
| §3.9 twisted involution | Degrees 1,−1,0 over F₃ | z↦3/z↦z; z⁻¹↦z/3; (3/z)(z/3)=1=ι(1) | Pass; negative powers are defined since 3≠0 |
| §3.9 multiplicativity on arbitrary degrees | Degrees 2 and −1, q=3 | Twist factors 9·(1/3)=3=3^(2−1); inverse degrees −2+1=−1 | Pass; multiplicative and involutive on basis elements |
| §3.9 invariant image and quotient | P¹/F₃, x=z+3/z; ordinary inversion control | ι(x)=x; x(2)=x(3/2)=7/2; ordinary inverse gives 13/2 at 2; Q[z,z⁻¹]^ι=Q[x] | Pass; kernel quotient maps to the specified invariant ring |
| §3.9 scalar extension | Q→Q₂; anti-invariant y=z−3/z | ι(y)=−y and (1+ι)y/2=0; (1+ι)x/2=x; kernel vector h_v−h_w still maps to 0 | Pass; Q₂ has 1/2, regardless of residue characteristic 2 |
| §3.9 normalized coordinate and §1.12 | q_v=3, t=√3u, u=2 | t+3/t=√3(2+1/2)=5√3/2; multiplying by 1/√3 gives 5/2 on both sides | Pass; no ordinary inversion on the unnormalized t |
| §3.9 degree-two and characteristic-two controls | P¹/F₃, deg v=2, z=2; q=2, deg v=1 | z²+9/z²=25/4=(7/2)²−6; wrong coefficient 3 gives 19/4; at q=2, ι²(z)=2/(2/z)=z | Pass; q_v and q distinguished; p=2 allowed |
| §3.9 removing all rational places | P¹/F₃; degrees 2,3,5 | a₂a₃=x⁵−15x³+54x; a₅=x⁵−15x³+45x; difference/9=x | Pass; recovering x does not require a degree-one place |
| §3.9 availability in that Check | P¹/F₃, degrees 1,2,3,5 | Closed-place counts are 4, (9−3)/2=3, (27−3)/3=8, (243−3)/5=48 | Pass; removing the four degree-one places leaves the three required degrees |
| §3.9 boundary action through a_Eis | e_n, n≥0, forward/backward shifts | T₋T₊e₀=e₀; T₊T₋e₀=0; difference rank 1 becomes 0 modulo constructibles | Pass; only mc-action on the truncated sum |
| §3.11 image algebra and finite-rank kernel action | Zero cohomology V=0 on a P¹ model; separate abstract image diagnostic | Product map is (0,a_Eis); image Q_ℓ[x] has dimension 1; fV=0 has dimension 0; splitting V=0⊕0 | Pass; definition does not collapse Eisenstein curve when V=0 |
| §3.11 one-place module distinction | Degree-two place, E[x] over E[a₂] | x²=a₂+6; generators 1,x give rank 2, while dim_E E[x]=∞ | Pass; changed map preserves any-place finiteness |
| R01: SL_r volume ownership | P¹/F₃, r=2 and r=1 | 3⁻³/((1−1/9)(1−1/3))=1/16; gauge multiplier 16 yields 1; r=1 empty product 1 | Numerical target unchanged; retire duplicate request |
| R01: elliptic-chain ownership | Rank 2, degree-2 pole | Period 2·2=4 and degree increment 4=deg(E(∞))−deg E; period 2 would increment only 2 | Numerical target unchanged; retire duplicate request |
| R01: centre restriction ownership | λʲ on ϖʲ, j≥0, reductions s=1,2,3 | Support sizes 1,2,3; union support infinite; uniform finite-support bound fails | Existing §7.6 target supplies the missing condition; retire duplicate request |
| R01: correspondence ownership | Rank-one geometric Frobenius 2 | Arithmetic value 1/2, full-dual value 2, supplied rec(D∨)(ϖ)=2 | Existing bijection plus owned adapter; retire duplicate request |

### Carried adversarial table

These 101 rows preserve [Prior]’s computations for unchanged statements or unchanged subclaims. The old §3.11 undefined-map row is replaced by the new rows above. Every row cites its provenance; carrying a row does not claim its source proof was independently reopened here.

| Statement | Instances tried | Values computed / competing model | Result; change |
|---|---|---|---|
| Conventions: coefficients | p=3, ℓ=2, s=1 versus s=0; q=1 | 3 mod 2=1 is invertible; O/λ nonzero versus O/λ⁰=0; q−1=0 at q=1 | Pass: ℓ≠p, s≥1, q≥2 exclude the junk cases; carried from [Prior] |
| Conventions: reciprocity | χ(ϖ)=2, degree 1 and 2 | Geometric values 2,4; arithmetic values 1/2,1/4 | Pass; inversion is necessary; carried from [Prior] |
| Conventions: half Tate | GL₂ minuscule over F₃; q=9, degree 2 | IC trace −1/√3 becomes +1/√3; √(9²)=3²=9 | Pass; carried from [Prior] |
| 0.1 Bundle stack | G_m on P¹/F₃; one fibre trivialized | Automorphism orders 2 and 1; stack mass 1/2 versus 1 | Pass; retain automorphisms and nonparahoric level models; carried from [Prior] |
| 0.2 Deformations | G_m/P¹; PGL₂ with one flag | (h⁰,h¹,h²)=(1,0,0), dimension −1; PGL₂ dimension −3+1=−2 | Pass; carried from [Prior] |
| 0.3 Full levels | F₃[ε]/ε², G_m | Units 2·3=6 versus reduced-level units 2 | Pass; reduced level is wrong; carried from [Prior] |
| 0.4 Fractional twists | Rank 2 and rank 1 at degree-one point | Two rank-2 rotations raise degree by 2=deg(E(x))−deg(E); rank-one period 1 | Pass; carried from [Prior] |
| 0.5 Slopes/Euler form | O,O(1) on P¹; torsion; zero | χ=1+1=2, reverse 1−1=0; nonzero torsion slope ∞; zero has no factors | Pass; carried from [Prior] |
| 0.6 Bounded loci | G_m→GL₂, t↦diag(t,t⁻¹), bound 1 | max(d,−d)≤1 gives d=−1,0,1; adjoint slope is 0 for all d | Pass; faithful bound essential; carried from [Prior] |
| 0.7 Adelic groupoid | Line bundle/F₃; disconnected C₂ | Stabilizer order 2=automorphism order; H¹(F₃,C₂) has 2 classes, not 1 | Pass; connected Lang hypothesis retained; carried from [Prior] |
| 0.8 Shifted HN | O(1)⊕O(−1), T=(1,−1); block (1,3] of T=(3,2,0), degree 4 | Shifted slopes 0,0; block slope (4−2−0)/2=1 versus wrong prefix −1/2 | Pass; carried from [Prior] |
| 0.9 Parabolic instability | Opposite flags on O² at 0,∞ | Empty/full subsets have instability 0, singletons 1 | Pass; uniqueness restricted to positive minimum; carried from [Prior] |
| 0.10 Central lattice | GL₂ degree lattice 2Z; norm-one torus | Z/2Z has 2 classes; rational split rank 0 versus geometric rank 1 | Pass; rational quotient does not bound arbitrary geometric components; carried from [Prior] |
| 0.11 Orbit masses | G_m/F₃ | Kernel value 2 times mass 1/2=1; unweighted count 1 differs from integral of constant function 1/2 | Pass; carried from [Prior] |
| 0.12 Nonsplit descent | GL(O⊕O(1))/P¹; norm-one torus | h⁰(Lie(𝒢)(−1))=1 versus split value 0; Frobenius closure d=−d forces d=0 | Pass; outer splitting alone insufficient; carried from [Prior] |
| 0.13 Bundle mass/SL volume | P¹/F₃, rank 2 | GL mass 1/48+Σ(m≥1)1/(4·3^(2m+1))=1/32; SL₂ volume 1/16=3⁻³Z(1/9); gauge multiplier 16 gives 1 | Mathematics passes; R01 ownership; carried from [Prior] |
| 0.13 Torsion mass | P¹/F₂, degree 2; rank-one volume | Torsion contributions 2+3+1/3=16/3, not ordinary-exponential 9/2; SL₁ volume 1, empty product 1 | Pass; q=1 excluded; carried from [Prior] |
| 0.14 Cuspidal functions | G_m/P¹/F₃, level {0,∞} and empty level | Ray quotient size (2·2)/2=2 versus 1; all torus functions are cuspidal | Pass; carried from [Prior] |
| 0.15 Picard/Lang fibre | P¹/F₃ | Pic(F₃)=Z, Pic⁰(F₃)=0; scalar stabilizer 2 and object mass 1/2 | Pass; degree-zero kernel alone loses components; carried from [Prior] |
| 1.1 BD Grassmannian | G_m over dual numbers; weights 1,−1 collide | (1+ε/t)(1−ε/t)=1, but 1+ε/t is not a power-series unit; collision weight 0 | Pass; geometric integer points do not describe all test rings; carried from [Prior] |
| 1.2 Schubert geometry | GL₂ weights (1,0),(2,0),(1,1) | Dimensions 1,2,0; minuscule quotient determinant degree +1, not −1 | Pass; carried from [Prior] |
| 1.3 Hecke chains | Empty chain; G_m weights 2,−1 | Empty map id; composite weight 2−1=1 | Pass; carried from [Prior] |
| 1.4 Stack sheaves/trace | BC₂ sign over Q₂; BG_m/F₃ | Invariants of sign=0 versus trivial dimension 1; compact trace Σ(i≥1)3⁻ⁱ=1/2=1/2 | Pass; rational averaging not silently used for torsion; carried from [Prior] |
| 1.5 Fusion/convolution | Two standard GL₂ modifications | Exceptional fibre P¹ dimension 1; fixed-fibre codimension 2 gives 2=2; total-family codimension 3 gives 2<3 | Pass; semismall and small distinguished; carried from [Prior] |
| 1.6 Iwahori minuscule | Local equation ab=t; r=0 | At a=b=t=0, fibre tangent dimension 2 versus smooth relative dimension 1; no modification gives Bun | Pass; smooth total space does not imply smooth projection; carried from [Prior] |
| 1.7 Satake category | G_m weights 2,−1; GL₂ standard; G=1 arithmetic descent | Weight sum 1; 2²=3+1; geometric unit has arithmetic Frobenius +1 or −1 | Pass; full arithmetic category retained; carried from [Prior] |
| 1.8 Symmetry | Two odd minuscule factors | Koszul −1 times parity correction −1 gives +1 | Pass; carried from [Prior] |
| 1.9 Geometric Satake | G_m; standard GL₂ representation | Coordinate algebra E[z,z⁻¹]; standard dimension 2; tensor dimension 4 | Pass; reconstruction has the marked fibre functor; carried from [Prior] |
| 1.10 Central action | diag(1,2) on P¹/F₅; central scalar 3 | [1:1]↦[1:2]; inverse gives [1:3]; scalar 3 fixes point | Pass; equivariance not confused with trivial action of every group element; carried from [Prior] |
| 1.11 Nonsplit Satake | Inner transition diag(1,t); characteristic 2 | Root-line transition factors t⁻¹,t; lift a²(1+t)=1 would require a₀²=1 and a₀²=0 | Pass; étale inner data and half-Tate choices retained; carried from [Prior] |
| 1.11 L-group adapter | Split SL₂, cyclotomic value 3 | Conjugation-only source map gives u(1/3) versus u(3); right translation by c_γ⁻¹ gives u(1)c_γ⁻¹ on both products | Pass with corrected roadmap map; source issue in [Prior]; carried from [Prior] |
| 1.12 Spherical Satake | Unramified norm-one torus; locally split torus coordinate z=2 | Invariant cocharacter lattice 0 gives spherical algebra E; local values 2 and 1/2 differ although orbit sum is 5/2 | Pass; use local quotient Q_v; carried from [Prior] |
| 1.13 Determinant/opposition | Zero module, one line scaled by 2, two-line swap; P¹ | Determinants 1,2,−1; inverse line would give 1/2; IH⁰/IH² signs +1,−1 | Pass; in characteristic 2 the swap sign becomes +1; carried from [Prior] |
| 1.14 Integral Satake | Residue module k over DVR; torus weights ±1 | Tor₁(k,k)=k, ordinary tensor k; derived degrees −1,0 but perverse degree-zero tensor k; weight sum 0 | Pass; flat/free restrictions remain explicit; carried from [Prior] |
| 2.1 Shtuka definition | Opposite GL₂ modifications; positive G_m singleton | Degrees d,d+1,d close; singleton would require d+1=d | Pass; arrows and closing isomorphism constrain object; carried from [Prior] |
| 2.2 Finite type | μ_p over dual numbers; two SL₂ factors | (1+ε)^p=1 with ε≠0; kernel element (−I,I) acts by −1 on a mixed tensor even though individual squares act by +1 | Pass; source shortcut replaced; carried from [Prior] |
| 2.2 Bound transport | E=O(2)⊕O(−1), double cover and tensor square | Pullback top slope 4; tensor slopes 4,1,1,−2; modified polygon vertex 1/4 need not equal source 0 | Pass; inseparable/modified bounds not identified without comparison; carried from [Prior] |
| 2.3 Local model | G=1; one G_m jet with zero modification | Relative dimensions 0 and 1=dim G_m; quotient subtracts the jet dimension | Pass; carried from [Prior] |
| 2.4 Fractional infinity | Rank 2, degree-2 pole; rank 1/no legs over F₃ | Balancing degree n·deg(D∞)=4; groupoid quotient removes scalar order 2 while degree-class quotient leaves BC₂ | Pass; Picard groupoid quotient essential; carried from [Prior] |
| 2.5 Compact cohomology | No-leg GL₂/P¹, HN bounds 0,1,2; collision P¹ | H⁰ dimensions 1,2,3 grow unbounded; collision H⁰ and H² both rank 1 | Pass; full HN colimit not claimed finite; carried from [Prior] |
| 2.6 Inner forms | Two Brauer invariants 1/2, versus one | Sum 1=0 in Q/Z; single invariant 1/2≠0 | Pass; carried from [Prior] |
| 2.7 Elliptic comparison | Rank 2, degree-2 infinity; normalized P¹ degree | Four degree-one quotients raise degree 4=2·2, not 2; marked degree 2(−1)+1=−1, tensor O(1) changes it to +1 | Mathematics passes; R01; carried from [Prior] |
| 2.8 Horocycles | r=2, path N,N+1,N; r=1 | Endpoint difference 0 and two leg parameters; one increment has difference 1 and cannot satisfy same closing condition | Pass; carried from [Prior] |
| 2.9 Partial Frobenius | Degree-2 place, two independent legs | One step exchanges embeddings, two return; degree vectors add (1,0)+(0,1)=(1,1) | Pass; carried from [Prior] |
| 2.10 Coalescence | V⊠V∨, dim V=2; torus weights 2,−1 | Diagonal restriction End(V) has dimension 4; weight sum 1, further restriction unchanged | Pass; composition and unit preserved; carried from [Prior] |
| 2.11 Hecke maps | Torus translations 2,3,0 | Composite shift 5; adjoint/inverse shift −2; unit shift 0 | Pass; direction distinguished; carried from [Prior] |
| 3.1 Creation/annihilation | V=E²; rescale coevaluation by 3 | Evaluation after canonical creation 2; rescaled value 6; unit representation value 1 | Pass; zigzag normalization excludes rescaling; carried from [Prior] |
| 3.2 Integral Hecke finiteness | E line with operator λ⁻¹ versus 2 (ℓ=5) | Orbit valuations −n are unbounded; 2 preserves O_E | Pass; finite E dimension is insufficient; carried from [Prior] |
| 3.3 Horocycle shifts | r=2, #I=2, affine dimension 1 | Compact pushforward [−2](−1) followed by [4](2) gives [2](1), not [−2](−1) | Pass; corrected sign; carried from [Prior] |
| 3.4 mc localization | Finite E² and infinite direct sum at a point | Finite E² becomes zero; infinite direct sum is not a constructible error | Pass; localization does not kill every Ind-object; carried from [Prior] |
| 3.5 Cuspidality | Torus; GL₂ delta at trivial bundle | Intersection over empty proper-parabolic set is whole torus space; GL₂ constant term has a nonzero positive summand | Pass; carried from [Prior] |
| 3.6 Hecke from Frobenius | Unit; rank-one geometric value 2 at degree 2 | Unit eigenvalue 1; two iterations 4; arithmetic inverse would be 1/4 | Pass; carried from [Prior] |
| 3.7 Eichler–Shimura | F=diag(2,3); rank one; mod 2 | F²−5F+6=diag(0,0); 2−2=0; 2·id=0 mod 2 while id≠0 | Pass; rational-projector inference would fail last test; carried from [Prior] |
| 3.8 No-leg cusp | G_m ray level on P¹/F₃; nonzero translation tail | Cusp dimension 2; distinct translates on the degree half-line span infinitely many basis vectors | Pass; carried from [Prior] |
| 3.9 Boundary action | High indices n≥0 with shifts ±1 | T₋T₊=id; T₊T₋ kills e₀, difference rank 1; difference is 0 modulo constructibles | Pass; not an honest restricted group action; carried from [Prior] |
| 3.10 Cusp finiteness | Integral torus ray space; full GL₂ colimit | Cusp lattice O_E² has rank 2; whole GL₂ colimit has dimensions ≥m+1 | Pass; image of one truncation, not injective stabilization; carried from [Prior] |
| 3.11 Any-place finiteness | Degree-2 spherical place | z²+9/z²=t²−6; E[t] finite of degree 2 over E[t²−6], yet infinite-dimensional over E | Pass; no degree-one-only shortcut; carried from [Prior] |
| 3.12 One-place module | O_E[t], and (O_E/λ²)[t] | Rank 1 over respective polynomial algebra, infinite O_E size; torsion killed by λ² | Pass; finite Hecke generation differs from Hecke-finite orbit; carried from [Prior] |
| 3.13 Finite-type iff | r=0, #Σ∞=0 or 2; r=1, #Σ∞=1 | 0<0 false/nonfinite; 0<2 true/finite; 1<1 false/nonfinite | Pass; parity/degree assumptions retained; carried from [Prior] |
| 4.1 Finite-cover descent | Trivial cover; product C₂×C₂ | Trivial cover degree 1; (1,0) acts nontrivially on first factor only, diagonal (1,1) acts on both | Pass; product not replaced by diagonal; carried from [Prior] |
| 4.2 Lisse descent | O_E/λ² constant line; ramified boundary control | Constant stalk length 2 and identity descent; nontrivial inertia action ≠1 cannot extend as unramified local system | Pass; carried from [Prior] |
| 4.3 Frobenius–Weil | Frobenius λ⁻¹; two degree coordinates 2,3 | Degree n has valuation −n; (1,1) acts by 6 | Pass; Weil and profinite Galois continuity differ; carried from [Prior] |
| 4.4 Fusion/Frobenius | Merge two legs | Partial degrees (1,0),(0,1) combine to (1,1); total scalar 2·3=6 | Pass; carried from [Prior] |
| 4.5 Finite envelopes | Recurrences of degrees 2 and 3 | Six monomials F₁^aF₂^b, 0≤a<2,0≤b<3; higher powers reduce to their span | Pass; inverses require invertible constant coefficients; carried from [Prior] |
| 4.6 Specialization | Recurrence with zero initial data; boundary skyscraper | Two initial zeros propagate to zero; skyscraper closed stalk rank 1 versus generic rank 0 | Pass; arbitrary sheaf specialization would be false; carried from [Prior] |
| 4.7 Product Galois action | Integral unit 2 at ℓ=5 versus 1/5 | Powers of 2 have valuation 0; powers of 1/5 have valuation −n | Pass; stable finite lattices used; carried from [Prior] |
| 4.8 H functors | Empty torus legs, insert unit; V⊗V∨ | Cusp dimension 2 remains 2 under unit insertion; dim End(E²)=4 | Pass; carried from [Prior] |
| 4.9 Galois coalescence | S₃, a=(12),b=(23) | Diagonal sends ab to (ab,ab); ab=(123) differs from ba=(132) | Pass; multiplication of arbitrary factors is not the diagonal map; carried from [Prior] |
| 4.10 Leg naturality | Unit retained leg; scalar 3 auxiliary action | Retained identity 1, auxiliary scalar 3, total 3; acting also on retained leg would give 9 | Pass; carried from [Prior] |
| 4.11 Choice independence | Conjugate diag(2,3) by basis swap | Traces 5 and 5; determinants 6 and 6; creation/evaluation remove conjugating basis | Pass; carried from [Prior] |
| 4.12 Full Weil descent | A=O_E[t]/(λt−1)=E; m=0 | A/mⁿ=E, not finite torsion over O_E; integral residue branch gives O_E/λⁿ | Pass with two-branch roadmap proof; source error in [Prior]; carried from [Prior] |
| 4.13 Ind-smoothness | Constant line at diagonal; increasing finite systems | Specialization 1→1 is iso; colimit ranks 1,2,3,… unbounded | Pass; no finite-rank lisse conclusion; carried from [Prior] |
| 5.1 Excursions | Trivial coefficient pairing 3; identity tuple on E² | Operator 3·id; trace pairing 2; zero pairing 0 | Pass; arbitrary scalar excluded by fixed maps; carried from [Prior] |
| 5.2 Invariant indexing | SL₂ A=diag(2,1/2), f(g,h)=tr(gh⁻¹) | f(A,A)=2; wrong gh gives tr(A²)=17/4; tr A=5/2 | Pass; function is regular/algebraic; carried from [Prior] |
| 5.3 Satake/separation | G_m geometric Fr=2; degree d=0,1,2 | Values 1,2,4; arithmetic inverse gives 1,1/2,1/4 | Pass; degree and normalization visible; carried from [Prior] |
| 5.4 Full excursions | Retained J and auxiliary I, pairing 3 | J-action id, auxiliary result 3·id; empty I yields ξ(x)·id | Pass; construction includes noncuspidal compact cohomology; carried from [Prior] |
| 5.5 Identities | Scalars 2,3; ordered S₃ words | Tensor/disjoint union 6, not 5; a b⁻¹=(123) differs from b⁻¹a=(132) | Pass; carried from [Prior] |
| 5.6 Unramifiedness | Inertia i, degree-one Fr with value 2 | σ(i)=1, σ(iFr)=2=σ(Fr); degree-zero partial iterate id | Pass; carried from [Prior] |
| 5.7 Excursion algebra | Jordan J=[[1,1],[0,1]]; zero cusp | ker(J−1) dimension 1, ker((J−1)²) dimension 2; zero cusp has no nonzero blocks | Pass; reducedness not assumed; carried from [Prior] |
| 5.8 Reconstruction | SL₂ unipotent versus I; G_m generator 2 | All unipotent power traces 2, semisimple representative I₂; G_m generator recovered as 2 | Pass; unique semisimple class, not unique raw representation; carried from [Prior] |
| 5.9 Global decomposition | Commuting normal Hecke diag(2,3); one Jordan excursion block | Hecke eigenspaces dimensions 1,1 and scalars 2,3; Jordan generalized block 2, ordinary eigenspace 1 | Pass; normality applied only where justified; carried from [Prior] |
| 5.10 Nonsplit decomposition | Q=C₂ prescribed nontrivial component | Component idempotents evaluate (0,1); wrong trivial projection gives (1,0) | Pass; projection law excludes wrong model; carried from [Prior] |
| 5.11 Modular blocks | Regular representation of C₂ over F₂ | rank(T−1)=1, (T−1)²=0; generalized block dimension 2 versus eigenspace 1 | Pass; no good-prime restriction; carried from [Prior] |
| 5.12 Conditional comparison | Rank-one eigencharacter χ with χ(g)=ζ, ζ³=1; f=0 control | Action χ(g)f=ζf on both sides; zero trace satisfies both sides 0 and implies no nonzero eigenfunction | Pass; conditional, no existence/nonvanishing claim; carried from [Prior] |
| 5.13 Multiplicity conjecture | W=1; nontrivial action on A | Candidate is A^S, not A: for sign on E, dimensions 0 versus 1 | Pass as a labelled conjectural target; not a supplied theorem; carried from [Prior] |
| 6.1 Twists/coefficient fields | ℓ=5, arithmetic scalar 6 and inverse | 6·(1/6)=1; v₅(6)=0 but v₂(6),v₃(6)>0 | Pass; an ℓ-unit need not be a unit at another prime; carried from [Prior] |
| 6.2 Companions | Rank-one root of unity; rank-two slopes ±1/2 | Rank-one slope 0; translation by 1 produces slopes 1/2,3/2 | Pass; norm twists tracked; carried from [Prior] |
| 6.3 GL_r comparison | Rank-one finite-order χ; direct sum of equal trivial lines | Frobenius polynomial 1−χ(Fr)T on both constructions; reducible rank-two polynomial (1−T)² is excluded from irreducible correspondence | Pass; carried from [Prior] |
| 7.2 Restricted shtukas | No legs; G_m/F₃ at first jet; budget 1→0 | Automorphism group G_m(F₃) order 2; no-leg quotient retains it; budget after one allowed step 0 | Pass; negative budget not used; carried from [Prior] |
| 7.3 Nearby cycles | Smooth two-dimensional product versus xy=0 | Product has one irreducible component; crossing has two | Pass; dimension alone does not establish geometric integrality; carried from [Prior] |
| 7.4 Transport | Bounds (2,5), changes (−1,+1); insufficient bound | New bounds (1,6); 0−1=−1 is inadmissible, not truncated to 0 | Pass; explicit inequalities retained; carried from [Prior] |
| 7.5 Local excursions | Constant functions 1 and 3 | Convolution elements 1_K and 3·1_K; unit support K | Pass; identity comparison fixes normalization; carried from [Prior] |
| 7.6 Centre restriction | Coefficients λʲ on cosets ϖʲ | Support sizes mod λˢ are s; inverse-limit support infinite; unit excursion has uniformly one coset | Mathematics passes; R01 ownership; carried from [Prior] |
| 7.7 Local/full comparison | Same coefficient family; extra trivial leg | Valuations j→∞ but support infinite; extra unit leg multiplies action by 1 | Pass; decay is not ordinary finite support; carried from [Prior] |
| 7.8 Local–global semisimple | GL₂ special versus trivial representation | Same semisimple roots {√q,1/√q}; N-ranks 1 and 0 | Pass; general comparison is only semisimple; carried from [Prior] |
| 7.9 Monodromy distinction | q=3,F=diag(1/√3,√3),N=E₁₂ or 0 | FNF⁻¹=N/3; N-ranks 1,0; forgetting N identifies Weil semisimplifications | Pass; carried from [Prior] |
| 7.10 Gamma factors | Special block a=1,b=3,q=3,T=1/9 | Monodromy correction −1/3 times complementary ratio −3 gives 1; trivial-character gamma at s=0 is 0/(2/3)=0 | Pass; nonvanishing is not asserted at zeros; carried from [Prior] |
| 7.10 Additive-character change | ψ→ψ_ϖ, q=3 | Rank-one norm factor 3^(1/2−s), rank-two factor 3^(1−2s) | Pass; self-dual measures included; carried from [Prior] |
| 7.11 Geometric rec | χ(ϖ)=2, arithmetic Fr inverse | D(Fr_arith)=1/2, D∨(Fr_arith)=2, rec(D∨)(ϖ)=2 | Pass; no duplicate bijection construction; carried from [Prior] |
| 7.11 Pairs/segments | Unramified lines 2,3 at T=1/9; lengths 1,2 | L=1/(1−6/9)=3; omitted dual gives 54/53; segment N-ranks 0,1 | Pass; full dual and Z/L convention retained; carried from [Prior] |
| 7.11 Nonintegral domain | ℓ=5, Weil Fr=1/5 | v₅(Frⁿ)=−n; no stable lattice, but raw Weil–Deligne datum with N=0 exists | Pass; correspondence not restricted to Galois-extendible parameters; carried from [Prior] |

## Not verifiable

- Del73 §§8.4–8.6, pp.568–570 remains settled as uncertified. It was not requested again.
- §5.13 remains an explicitly conjectural multiplicity formula, not a proved supplier theorem. Its unchanged diagnostic row is carried from [Prior].
- No changed source text was inaccessible. YZ-I was retrieved legally from arXiv through the sources service. The missing manifest entries are bookkeeping defects, not missing-text requests.
- Unchanged source proofs and source errata are outside this incremental re-review; their evidence and limitations remain in [Prior].

## Source issues

- none

[Prior]: packages/GlobalShtukasAndFunctionFieldLanglands/reports/PRREVIEW-GlobalShtukasAndFunctionFieldLanglands~3.md
