# PORT-RankZeroOneBSDPartII

Branch: `roadmap/rank-zero-one-bsd-part-ii`.
Head: `1e5cb6cde1d0a4ef2c0dc8734c58df79e4945b9c`.
Base: `c994070`, initially clean. Only `TauCetiRoadmap/RankZeroOneBSDPartII/README.md`, `TauCetiRoadmap/RankZeroOneBSDPartII/Suggested.lean` and `TauCetiRoadmap/RankZeroOneBSDPartII/metadata.toml` are committed.

## Draft pull request body

This roadmap develops the rank-zero and rank-one Eisenstein-prime converses for rational elliptic curves, combining complementary quadratic twists, anticyclotomic augmentation control, normalized Heegner points and Gross–Zagier. It then converts restricted three-Selmer statistics into positive analytic-rank proportions in quadratic twist families with a good-at-three twist, retaining the local character conditions and the actual density denominators throughout.

AI assistance: Codex performed this port, the source and supplier checks, and the mathematical self-review recorded below. The accepted scope and five conditional supplier contracts are preserved.

## Validation

Targeted command: `lake build TauCetiRoadmap.RankZeroOneBSDPartII.Suggested`.

Exact outcome:

```text
✔ [8954/8954] Built TauCetiRoadmap.RankZeroOneBSDPartII.Suggested (2.7s)
Build completed successfully (8954 jobs).
```

Warning count: **0**. The file contains no admitted declarations, so no sorry warning is expected. All Lean processes have exited.

Exact push-gate summary:

```text
gate RankZeroOneBSDPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate's content checks were also run before committing: every content category was zero, with only its clean-worktree requirement failing on the three intended additions. The passing gate above is the post-commit run.

The prescribed separate dependency check returned exactly:

```text
depcheck: 187 roadmaps, 1146 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. Neither tooling nor merge order was edited.

## Supplier resolution and ownership

Read the normative root README and CONTRIBUTING, and compared the shape of EllipticCurves, GlobalNumberFields, ModularForms and completed roadmap material. Supplier texts were obtained at their indexed open heads with `roadmaps show`; main roadmaps were checked against this checkout. Broad searches used `roadmaps grep` across main and the indexed open heads, with an explicit limit of 3000 to avoid truncation, and `rg` across the board packages and both pinned source trees. Ownership was checked against the supplied open roadmap heads, including the sibling checkouts through the indexed service. Revision-only roadmap pull requests were not substituted for main suppliers.

These dependencies are new roadmap folders still in pull requests: EllipticCurveModularity; SelmerIwasawaCohomology; EulerSystemsAndKolyvaginSystems; HeegnerPointEulerSystems; GrossZagierAndArithmeticHeights; EffectiveClassNumbers; ModularIwasawaMainConjectures; ArithmeticStatisticsPartI; ArithmeticStatisticsPartIII; ArithmeticStatisticsPartVI; ArithmeticStatisticsPartVII. CMRankZeroConverse and RankOneConverse are earlier board designs, not located in the content pull-request index. Their readable design sections were checked directly.

| Citation | Resolved mathematical endpoint |
| --- | --- |
| EllipticCurves Layers 1–2, 4–5, 7 | Stable-kernel quotient, dual isogeny and Weil pairing; local reduction/formal groups; quadratic twists; Kummer/Selmer theory. The rational flex points use its chord/tangent group law. |
| EllipticCurveModularity R29.3–R29.6; ModularForms Layer 7 | Actual rational newform, conductor and all Euler factors; cusp-normalized parametrization; analytic continuation and functional equation. The extra quadratic elliptic comparison remains the declared specialization contract. |
| SelmerIwasawaCohomology §§2.9–2.12a, 4.26 | Compact/rational/discrete Selmer carriers, contragredient duals, finite cotype, elliptic Kummer and Sha exact sequences. |
| SelmerIwasawaCohomology §§3.9–3.11 | Actual local comparison cones, Tor specialization and restriction/localization-image diagrams; they do not assert that all arithmetic errors vanish. |
| SelmerIwasawaCohomology §§4.28–4.29 | Quadratic-character decomposition; elliptic alternating Cassels–Tate pairing, divisible radicals and finite paired reduced-primary groups. Family specialization parity is distinguished from elliptic root-number parity. |
| EulerSystemsAndKolyvaginSystems §8.31 | “Augmentation control” and its corank-one consequence explicitly omit residual irreducibility, (Sc) and (Irr). Its surrounding divisibility theorem has additional hypotheses, which are not borrowed for control. |
| HeegnerPointEulerSystems §§8.5–8.6a, 8.13, 8.24, 8.31–8.35 | Actual normalized families, fixed-isogeny transport, Howard unit-line comparison, nonvanishing and paired tower structure. Section 8.32 is a near-trivial finite-coefficient comparison; the new full-trace identity here is different. |
| HeegnerPointEulerSystems §§8b.2, 8b.10 | Odd-prime rational CGLS comparison and Eisenstein equality. The p>3 integral BCK branch is not used at p=3. The independent elliptic-unit/Katz and reciprocity inputs remain the supplier's obligations. |
| PadicMeasuresIwasawaAlgebras Layer 4 | Height-one DVR localization, pseudo-isomorphism, characteristic ideals, Iwasawa coordinate and module structure. |
| GrossZagierAndArithmeticHeights §§0.1, 8.14, 8.18–8.19 | x-height dictionary, general explicit formula, trace non-torsion criterion and cusp-normalized elliptic formula. Section 8.19 admits nonsquarefree conductor. Its squarefree §8.17 is excluded from the route. |
| EffectiveClassNumbers §2.8 | Named “Gross–Zagier with exact constants” inside “Exact vanishing from a Heegner height gap”; same coefficient and K-relative height, at arbitrary all-split level. |
| ModularIwasawaMainConjectures §6.1 | Comparison interface only. The equality proof comes from HeegnerPointEulerSystems; its p=3 rational branch is not inferred from a p>3 interface. |
| ArithmeticStatisticsPartI §§0.1, 0.2, 0.5, 0.6, 0.15 | Relative ratios/lower limits; local families; twist squareclasses and height; squarefree residue count; positive denominator. All five section headings and endpoints were read. |
| ArithmeticStatisticsPartVI supporting targets | “Heegner logarithm and low rank” explicitly includes the forward theorem over Q for every curve with modular comparison data; “Elliptic p-parity” includes odd p, including reducible p=3. |
| ArithmeticStatisticsPartVII §§5.10, 5.32 | Ratios, Tamagawa formula, strata, corrected Selmer parity, restricted 1/2 and 5/6 bounds; local attainability including the dyadic case and differential tables. |
| ArithmeticStatisticsPartIII supporting “Windowed cubic counting contract” | The seven-part condition C is explicit. A conditional mean does not supply its rational arithmetic instance. |
| CMRankZeroConverse §C.0 | `packages/CMRankZeroConverse/design/README.md`, “The rank-r p-converse proposition”; the implication is notation, not an assumed converse theorem. |
| RankOneConverse §§PC.0–PC.6 | `packages/RankOneConverse/design/README.md`; irreducible-residual localization/Heegner branch, used solely as an ownership boundary. |

The pinned declarations were checked at Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`, matching the manifest and the actual package checkouts. Paths below are relative to those libraries.

| Pinned source | Read declaration and consequence |
| --- | --- |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean` line 120 | Native c4, c6 and discriminant formulas; line 366: IsElliptic asserts a unit discriminant. Line 388 defines j using the inverse discriminant unit; line 401 gives its field formula. Singular raw equations are not elliptic arithmetic inputs. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean` line 299 | Minimal model. Line 323: HasGoodReduction extends minimality and requires multiplicative valuation equal to 1; line 328: equivalence with ellipticity of reduction. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` line 84 | LSeries is the literal coefficient Dirichlet series, not an independently continued elliptic function. |
| `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean` line 71 | tateShafarevich is an intersection of localization kernels on supplied topological representations; elliptic Kummer identifications are extra. |
| `Mathlib/NumberTheory/Height/NumberField.lean` line 431; `Mathlib/NumberTheory/Height/EllipticCurve.lean` line 116 | Number-field Northcott and finite naive-height point sets. |
| `Mathlib/Topology/Algebra/Order/LiminfLimsup.lean` line 133 | le_liminf_mul retains nontrivial filter, eventual nonnegativity, boundedness/coboundedness. All cutoff ratios lie in [0,1]. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean` line 139 | Isogeny bundles the contravariant coordinate pullback and infinity condition, not an arbitrary point map. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean` line 169 | Real five-coefficient twist with parameter t²−4n. Lines 229, 239, 299 and 306 give invariant scaling, ellipticity and j-invariance. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean` line 260 | Nonnegativity. Line 302 transfers Northcott; line 332 retains Northcott in the zero-iff-torsion theorem. Lines 378 and 384 fix the half polar form and its diagonal. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/FinitelyGenerated.lean` line 121 | fg_point_of_numberField supplies finite generation; no duplicate Mordell–Weil target. |
| `TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean` line 204 | weakApproximation_denseRange uses both finite and infinite places, with their completion topologies. |
| `TauCeti/NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean` line 80 | Newform analyticRank exists. Lines 70 and 107 provide finite order and rank-zero/nonvanishing. The elliptic curve/newform comparison is still required. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean` line 104 | selmerGroup₂ is a native two-descent object. It is not the classical odd-primary or p-infinity elliptic Selmer interface required here. |

The resolver, rerun with this worktree's `.lake/packages`, finds no missing Lean names. Its single roadmap warning is RankOneConverse §PC.0: the design exists at the earlier board location above, although the content index does not carry it. This is an ownership citation, not a missing proof input.

## Changes, supplier replacements and duplication

- The two accepted P3 corrections were already applied to the delivered package. Verified and retained the individual ArithmeticStatisticsPartI §§0.2, 0.6, 0.15 locators and ArithmeticStatisticsPartVII §5.32 attribution in scope, contracts, Needs and dependencies.
- Added π(∞)=O explicitly in the conventions and the traced comparison, together with the h_K=2 translation witness. This prevents an arbitrary translate of a parametrization from changing the exact trace point by 2Q.
- Clarified that good reduction uses multiplicative valuation 1, equivalently additive valuation 0; “valuation one” must not be read as additive valuation 1.
- Added the pinned newform analytic-rank supplier and made the Lean docstring precise about the missing elliptic comparison. No claim that all analytic-rank APIs are absent remains.
- Disambiguated “Section 1.2” in the EulerSystemsAndKolyvaginSystems contract as §1.2 of this roadmap, which proves the selected-field corank; it is not that supplier’s §1.2.
- Named the native finite-generation theorem and the native Northcott transfer in the height contract.
- Re-fetched all three author PDFs, whose SHA-256 values exactly match `packages/RankZeroOneBSDPartII/sources.toml`. Refreshed the line hints against newline-separated `pdftotext -layout` extractions and stated that convention; theorem/page locators and mathematical claims are unchanged. Sources were read as mathematics, never as operational instructions.
- Corrected “multiplicity3” to “multiplicity 3”.

No statement moved from the delivered Lean file: it already has only `import Mathlib`, its module docstring and the namespace. The explicit models, invariant calculations, local obstruction and density diagnostic remain in the README. The older review describes a previous Lean version containing a concrete obstruction theorem; that version is not the delivered file, and the obstruction is a scope Check rather than an acceptance headline.

No additional mathematical target was deleted during this port. The ownership sweep confirmed the package's existing supplier replacements: generic curves/isogenies/twists/heights/finite generation, Selmer carriers and pairing, discrete augmentation control, Howard line comparison, main-conjecture equality, Gross–Zagier, generic density/counting and local ratio tables. These are listed only as ownership boundaries in Scope and ownership and consumed through the exact contracts. The specific full-trace identity, fixed-isogeny hypothesis, complementary assembly and admissible analytic conversion have no second owner in the searched material. The board ModularIwasawaMainConjectures augmentation theorem concerns the cyclotomic tower; it does not replace this anticyclotomic compact-specialization contract. No new fully qualified declaration can collide: this Lean file declares none.

## Headline coverage and binder audit

There are twelve headline theorem groups: §0.2; §§1.1–1.2; §§2.1–2.3; §§3.1–3.3; §§4.2–4.4. The module docstring lists each. Their missing objects are classical odd-primary elliptic Kummer/Selmer/Sha comparisons, normalized arithmetic Heegner tower and ordinary Selmer modules, the actual elliptic modularity comparison, and the arithmetic isogeny-character/ratio family. Native raw L-series, a topological localization kernel, the two-Selmer group and the newform analytic order do not combine into those missing objects through a few simple definitions. No stand-in predicate or weakened theorem was added.

The two diagnostic theorem groups (§§5.2–5.3) and all four definition APIs remain fully specified in prose. The universal local obstruction is mathematically statable at the pins, but is not a headline, as the accepted package explicitly decides.

Mechanically enumerated the declarations in Suggested.lean: **zero** definitions, instances and theorems. Thus the requested `#check @name` scratch list is empty. The module itself was elaborated once by the successful targeted build; there is no elaborated declaration type to compare and no section hypothesis to lose. No binder change was necessary. README and Lean agree that no local declaration is claimed.

## Computed adversarial mathematics pass

Each row is a statement or distinct API law. Rational invariant calculations, finite-field point counts, modular roots/residues and fractions were recomputed with exact integer/rational arithmetic. Module, character and cohomological examples are explicit algebraic models of the stated implications; they do not pretend to compute the unknown Selmer groups or L-values of arbitrary curves. The arithmetic implications were additionally checked against their source passages and supplier hypotheses.

| Statement | Instances tried | Values on the two sides or defining conditions | Result; change |
| --- | --- | --- | --- |
| Conventions: odd good prime and determinant | p=3, φ=η and ωη; φ=1,ω | η(Frob)=−1, η(inertia)=1; η·ωη=ω; for 1 or ω one local factor is trivial | Exclusion symmetric; retain. |
| Conventions: no split residual extension required | Nonsplit extension of η by ωη | Semisimplification still η⊕ωη; both excluded-character comparisons are false | Extension splitting is not inserted. |
| Conventions: corank uses dual | S=Q3/Z3; finite S=Z/3 | Dual ranks 1,0; S⊗Q3=0 in both cases | Torsion tensor is not the corank definition. |
| Conventions: quadratic projectors | c=+1 and −1; p=2 | ((1+c)/2,(1−c)/2)=(1,0),(0,1); in F2 the denominator 2=0 | Odd-primary split retained. |
| Conventions: Iwasawa rationalization | Z3[[T]], Z/3, Λ/(T) | 3 becomes a unit; Z/3 becomes 0; (Λ/(T))[1/3]=Q3, so T stays nonunit | Augmentation not inverted. |
| Conventions: involution | γ=1+T | γ inverse sends T to −T/(1+T)=−T+T²+…; T-order 1 on each side | Contragredient convention consistent. |
| Conventions: heights and half polarization | hO(P)=1, hO(2P)=4, P=0 | hx(P)=2, hx(2P)=8; (8−2−2)/2=2; at 0 both sides 0 | Factor 2 retained in every height layer. |
| Conventions: class-number and unit count | D<−4; D=−3,−4 | uK=1; exceptional values 3,2 | Strict discriminant hypothesis excludes exceptional units; no division by hK. |
| Conventions: sign and finite central order | Orders (0,1),(1,0) | Sum 1; signs (+1,−1),(−1,+1), products −1 | Base-change sign agrees with both complementary branches. |
| Conventions: squareclass height | d=2,18,−2 and cutoff X=1 | 18/2=9 is a square; heights of [2],[18] both 2; [−2] distinct; at X=1 classes ±1 | Signed representatives counted once. |
| Conventions: local mass | Classes 1,2,3,6 at 3 | 3/8,3/8,1/8,1/8; sum 1, unit mass 3/4 | Four uniform quarters rejected. |
| Conventions: signed versus absolute ratio | c=3,1,1/3 | Signed exponents 1,0,−1; absolute exponents 1,0,1 | Both odd signed strata used. |
| Native ellipticity contract | Δ=−19 over Q; Δ=2 over Z; Δ=0 over Q | Unit true, false, false, although 2≠0 in Z | Unit discriminant, not mere nonzero over rings. |
| Native good-reduction contract | Unit Δ; raw twist of W at d=3 | Additive valuations 0 versus 9; multiplicative good value is 1 | Clarified valuation wording; minimalization is tested. |
| Native twist parameter and j | t=0,n=−2; d=0 | t²−4n=8; Δ scales by 8⁶, c4 by 8², ratio by 8⁶/8⁶=1; at 0 Δ=0 | d=0 excluded; 4d convention retained. |
| Native Northcott/height input | Torsion, hx(P)=2 | Torsion gives 0; doubling gives 8 and positive non-torsion height | Northcott retained; named transfer. |
| Native newform order | Local models F(s)=1 and s−1 at s=1 | Central orders 0,1; values 1,0 | Newform API acknowledged; no claim these free models are elliptic acceptance statements. |
| Conditional local dictionary | p=3, a3=−2 and its nonsquare twist | a3≡1 versus 2; after allowed twist #E(F3)=4−2=2, hence no 3-torsion | Actual character and good reduction remain required. |
| Conditional quadratic analytic comparison | Two factors with orders (0,1),(1,0) | Product order 1 in both; bad-factor equality is an extra requirement | No arbitrary analytic germ substitutes for elliptic functions. |
| Conditional compact control | R=k[[T]], S=R; kernel of evaluation | T·R maps to 0; S/TS=k; Tor1(k,k)=k has dimension 1 | Injective specialization does not erase cokernel corrections. |
| Conditional complementary-field contract | w(E)=−1,+1 | Complementary target orders 0,1; base-change signs (−1)(+1)=−1 and (+1)(−1)=−1 | Both branches and finite splitting prescription retained. |
| Conditional rational counting contract | Zero/odd strata, empty family | Means bounded by 1,4/3; empty denominator count 0 | C required for both isogenies; no inference from a conditional mean alone. |
| §0.1 definition | p=3 permitted η; forbidden 1; p=2 | Bundle true, false, false; last inequality is 2>2=false | Actual fixed-isogeny condition determines its object. |
| §0.1 construction API | Same E,p,ι and all required proofs | Every conjunct true constructs the bundle; replacing good reduction by multiplicative reduction makes one conjunct false | No arbitrary character field. |
| §0.1 projections API | Bundle at p=3 | p>2 gives 3>2; degree=3; local exclusions η≠1,ω | Hypotheses are real and explicit. |
| §0.1 character/determinant API | φ=η; ψ=ωη | φψ=ω and ωφ inverse=ωη | Fixed kernel, not a freely selected constituent. |
| §0.1 dual API | φ=η and φ=ωη | Duals ωη and η; applying twice gives η and ωη | Local condition preserved. |
| §0.1 isomorphism transport API | Kernel bases changed by a nonzero scalar | Scalar action χ(g) commutes with basis scalar, so character remains χ(g) | Diagram isomorphisms preserve the bundle. |
| §0.1 identity transport API | Identity kernel map | χ(g) maps to 1·χ(g)·1=χ(g) | Identity law retained. |
| §0.1 composition transport API | Two basis changes a,b | (ba)χ(g)(ba) inverse=b(aχ(g)a inverse)b inverse=χ(g) | Composition law retained. |
| §0.2 finite-Selmer dimension formula | (c,s)=(0,0),(1,0),(1,1) | dim=c+2s gives 0,1,3; coranks 0,1,1 | Low-dimension implication has exact range {0,1}. |
| §0.2 pairing requirement | Z/9; paired (Z/3)² | Orders both 9; alternating pairing on cyclic group is 0; standard 2×2 alternating matrix has determinant 1 | Square order alone insufficient. |
| §0.2 divisible conclusion | c=0,1 and s=0 | S=0 or Q3/Z3; finite reduced component 0 | Whole Sha finiteness is not assumed here. |
| §1.1 auxiliary-field theorem | r=0 and 1 | Twist orders 1−0=1,1−1=0; signs +1→−1,−1→+1 | Two source branches verified. |
| §1.1 discriminant/splitting | N=20,D=−71,p=3 | D mod8=1; D mod5=4=2²; D mod3=1; gcd(20,71)=1 | Nonsquarefree level admitted, all required primes split. |
| §1.2 corank sum | r=0,1; complementary ranks 1,0 | 0+1=1 and 1+0=1 | Forward theorem used only on known twist first. |
| §1.2 torsion vanishing | Split p, E(Qp)[p]=0 | E(K)[p] embeds into zero local group, hence cardinal 1 | No global Sha finiteness input. |
| §2.1 coinvariant dimension | X=R and R⊕R/(T) | Residue dimensions 1,2; torsion lengths 0,1 | Dimension one excludes augmentation torsion. |
| §2.1 paired structure at P0 | X=R⊕M⊕M, M=R/(T) | Residue dimension 3, torsion length 2; M=0 gives 1,0 | Rank-one corank rules out nonzero M at P0. |
| §2.1 rational finite errors | Z/3 and Λ/(T) | Inverting 3 gives 0 and Q3 respectively | Finite p-errors vanish, augmentation errors do not. |
| §2.1 compact injection versus surjection | Evaluation R→k; nonflat k | Kernel TR; Tor1(k,k)=k≠0 | No surjectivity claimed. |
| §2.2 traced identity | Full trace over an orbit of size 2 | Trace(σP)=Trace(P); two factors yield (1−α inverse)²Trace(P) | Exact trivial-character identity distinct from near-trivial congruence. |
| §2.2 unit factors | p=3,a3=2; α=5,β=6 mod9 | 25−10+3=18≡0; αβ=30≡3; (1−α inverse)²=1, α²(β−1)²=4 mod9 | Both units; two normalizations distinguished. |
| §2.2 cusp normalization | Translation by Q, hK=2 | Trace(π+Q)=Trace(π)+2Q; π(∞)+Q=Q | Added π(∞)=O and negative-control Check. |
| §2.2 no division by class number | hK=3, p=3 | 1/hK has valuation −1; uK=1 and both stabilization factors valuation 0 | Class-number denominator not used. |
| §2.3 equality forces bottom nonzero | S=R, κ=1 versus κ=T | Square indices (1),(T²); bottom classes 1,0 | Unit characteristic ideal excludes zero bottom. |
| §2.3 height/Gross–Zagier | hx(P)=2 versus torsion 0, constant C>0 | Derivatives 2C≠0 versus 0; sign −1 and nonzero derivative gives order 1 | No analytic order assumed on E. |
| §2.3 all-split nonsquarefree test | N=20,D=−71,c=1,u=1 | μ(N,D)=0; coefficient norm(ω)²/(C²√71)>0 | Squarefree-level §8.17 not used. |
| §3.1 p-converse | r=0,1 | 1−(1−r)=0,1; resulting orders equal r | Only subtraction at r∈{0,1}. |
| §3.2 rank and full Sha | Orders 0,1; abstract finite p-primary part only | Forward outputs ranks 0,1 and finite whole Sha; ⊕ over ℓ≠p of Z/ℓ has p-part 0 but infinite cardinal | Whole finiteness comes from forward theorem, not a single primary part. |
| §3.3 finite-Selmer converse | Dimensions 0,1,3 | Coranks forced 0,1 for first two; dim3 may have c=1,s=1 | Higher dimensions not silently included. |
| §4.1 family definition | Good ordinary trivial kernel; classes 1,2,3,6 | Good flags true,true,false,false; exclusion flags false,true; membership false,true,false,false | Both good reduction and local exclusion required. |
| §4.1 membership API | Good model with φ=η; class1 and class2 | At1 allowed η gives true; at2 η²=1 gives false | Universal rule d≡2 mod3 rejected. |
| §4.1 square-rescaling API | d=2, u=3 | du²=18; ratio 18/2=9 square; same local character and membership true | Count once. |
| §4.1 initial-twist API | Base kernel1, d0=2; d=1,2 | New family admits1, rejects2; products d0d=2 admitted and4 trivial rejected in original family | Both directions tested; height(4 class)=1 versus 2·2=4 | 
| §4.1 dual-family API | Kernel η and dual ωη | Dualizing twice η; forbidden pair 1,ω maps into itself | Same admissible set. |
| §4.1 localization API | Four Q3 squareclasses | Preimage subset {2} for kernel1; {1} for kernelη; empty for v3(j)<0 | Local subset determines membership. |
| §4.1 equivalence with §0.1 | d=2 permitted, d=1 forbidden | Both predicates true at2, both false at1 | No weakened family hypothesis. |
| §4.2 local ratio product | Three-factor1 or3; real1 or1/3 | Products (1,1/3) or(3,1), signed exponents (0,−1) or(1,0) | Both necessary strata reached with fixed admissible class. |
| §4.2 mixed-place approximation | d=−31,137 | Residues (mod3,8,19)=(2,1,7),(2,1,4); 7=8² mod19,4=2² mod19; real signs −,+ | Explicit simultaneous witnesses. |
| §4.2 positive mass | One specified nonempty class at3 and real sign | At3 mass3/8, sign mass1/2; product3/16 times other positive local factors | Positivity requires compatible inhabited rectangle. |
| §4.3 zero-rank lower bound | Rank variable0,2 each mass1/2 | Mean1, zero probability1/2; 2(1−q)≤1 gives q≥1/2 | Restricted denominator retained. |
| §4.3 rank-one lower bound | Rank variable1,3 with probabilities5/6,1/6 | Mean5/6+3/6=4/3; 3−2q≤4/3 gives q≥5/6 | Odd-stratum correction retained. |
| §4.3 actual dimension versus adjusted rank | No rational3-torsion versus torsion dimension1 | r3=dim−0 versus dim−1 | Admissibility provides the zero correction. |
| §4.3 liminf product and no density assumption | Conditional liminf1/2,5/6; strata masses1/8,1/4 | Absolute bounds1/16,5/24; alternating conditional ratios1/2,1 give no conditional limit | No density tower requiring two limits. |
| §4.3 empty denominator | Σi(X)=empty | Numerator0, totalized ratio0; eventual positive stratum denominator required for asymptotic assertion | No 0/0 inference. |
| §4.4 positive absolute proportions | Stratum masses a,b>0; W with empty A3 | Bounds a/2>0,5b/6>0; W admissible mass0 | Good-twist hypothesis retained. |
| §5.1 model definition and coefficients | Tuple(0,1,1,1,0); zero ring target | Projections exactly that tuple; all map to0 in zero ring | Unique explicit native model, no database carrier. |
| §5.1 invariant API | Same tuple | b=(4,2,1,0); c4=−32,c6=8,Δ=−19; c4³−c6²=−32832=1728Δ | Direct exact recomputation. |
| §5.1 ellipticity API | Δ=−19 over Q; singular zero tuple | −19 unit; zero not unit in Q | Native IsElliptic, not free data. |
| §5.1 j API | Same nonsingular tuple | (−32)³/(−19)=32768/19 | Denominator nonzero. |
| §5.1 coefficientwise base change API | Unital Q-algebra map; characteristic3 candidate | Integers0,1 fixed; 3·1 must map to3·1, so no Q→F3 unital map | Reduction uses integral tuple. |
| §5.1 point-count Check | x=0,1,2 over F3 | Affine y-counts2,2,1; total6; trace4−6=−2 | a3 coefficient1 distinguished from Frobenius trace−2. |
| §5.1 tangent Check | (0,0), y=x | Left−right=−x³; contact multiplicity3; point differs from infinity | Nonidentity order3. |
| §5.1 twist Check | Native t=0,n=−2 | Δ=−19·8⁶=−4980736, not −19·2⁶=−1216 | Native twist parameter retained. |
| §5.2 admissible-density theorem | Residue2 mod3; ramified3,6 | Unit density3/4; allowed half3/8; ramified classes0 admitted | Density3/8, not1/2. |
| §5.2 percentage ceiling | Any subset of A3 | Upper density≤3/8=37.5%; 41.6−37.5=4.1 percentage points | Restricts conversion set, not all analytic rank-one twists. |
| §5.3 obstruction model definition/API | Tuple(1,0,3,0,0) | b=(1,3,9,0), c4=−71,c6=−1837,Δ=−2160 | Elliptic over Q. |
| §5.3 invariant identity and j API | Same tuple | c4³−c6²=−3732480=1728Δ; j=357911/2160 | All exact values recomputed. |
| §5.3 tangent and cyclic quotient | (0,0), y=0 | y-partial3, x-partial0; cubic residual−x³, contact3 | Nonidentity order3; stable quotient is supplier. |
| §5.3 base-change/twist API | d=1,3 in Q3 | Raw Δ valuations3,9; c4³ valuations0,6, so j valuations−3,−3 | Minimalization preserves j. |
| §5.3 universal local obstruction | Any d≠0; d=0 | v3(j)=v3(71³)−v3(2160)=0−3=−3; twist contributions6v3(4d) cancel; at0 Δ=0 | Good reduction would require valuation≥0; all nonzero twists excluded. |
| §5.3 denominator convention | 2160=2⁴·3³·5 | Nonzero over Q,Q3; valuation3; numerator357911 has valuation0 | No division by zero; sign is −3. |
| Downstream height-ordering condition | Same class[2]=[18] | Squareclass height2 for both; raw integer absolute values2,18 differ | Different orderings need an actual comparison. |

Context audit: all arithmetic statements restrict to actual elliptic curves over Q or number fields and odd primes, with good reduction at the converse prime. No arbitrary DVR, characteristic-p field, nonabelian quadratic Galois group, singular curve, inseparable extension or nonreduced arithmetic base is silently admitted. Generic coefficientwise formulas remain valid over rings; the zero ring is only a coefficient-map test. The trivial/zero modules, p=2 and3, identity/composite transports, both directions of membership equivalences, empty strata and the singular d=0 parameter were evaluated above. Every constructed comparison names its arithmetic source and target in the README; no free map is assumed to be the constructed one.

## Source checks and remaining conditions

The CGLS, BKLOS and PS copies were opened online and downloaded only as PDFs. Their hashes match the accepted source manifest. The following anchors use the extraction convention now stated in the README:

- CGLS line 73: standing good odd-prime setup; line 1745: Corollary 3.4.2; line 1828: Remark 4.1.3 and stabilization/trace; line 1891: Corollary 4.2.3; line 2027: Theorem 5.2.1; line 2033: complementary-field proof; line 2068: finite-Selmer passage; line 2078: statistical corollary; line 2086: numerical conversion remark.
- BKLOS line 90: rational signed-squarefree ordering; line 149: Theorem 2.5 and absolute exponent convention; line 612: signed convention; line 624: restricted-rank argument; line 644: real/complex ratios; line 681: differential comparison; line 728: away-three attainability including two; line 762: global weak-approximation assembly.
- PS line 59: elliptic alternating pairing modulo divisible radicals; line 403: Theorem 5; line 432 and line 437: Corollaries 6–7. No whole-Sha finiteness hypothesis is imported.

The accepted source limitations remain: CGLS's unrestricted statistical conversion does not by this route establish the good-at-three hypothesis for every family; its nineteen-a3 percentages cannot be transferred solely through the admissible set of density 3/8. The roadmap asserts its explicitly scoped theorems and keeps the obstruction as a diagnostic. These are not new allegations against the full unrestricted density statements by other methods.

The five accepted conditional supplier obligations remain unresolved implementation targets:

| Contract | Owner and obligation retained |
| --- | --- |
| eisenstein-local-dictionary | EllipticCurves Layers 2,4,5: actual kernel/quotient characters, ordinary/local-torsion consequences, good versus ramified three-adic twists. |
| complementary-heegner-twists | ArithmeticStatisticsPartVI supporting low-rank target: both sign branches with every prescribed finite splitting set and infinitely many odd D<−4. |
| quadratic-analytic-factorization | EllipticCurveModularity R29.6: actual elliptic quadratic base change, all bad factors, finite orders and all-split imaginary-quadratic sign. |
| cgls-ordinary-control | SelmerIwasawaCohomology §§3.9–3.11: rational compact kernel for the CGLS ordinary local conditions, retaining localization-image/H²/Tor cokernel terms. |
| rational-three-isogeny-count | ArithmeticStatisticsPartIII supporting counting contract: prove all seven rational unweighted family/stratum conditions for the isogeny and its dual. |

They are stated explicitly as mathematical supplier obligations, not asserted to be already proved or silently inserted as assumptions of the final converse. No supplier was moved from later in the merge order and no new cycle was introduced.

The base RankZeroOneBSD folder is absent from the supplied main/open-head index. The Part II introduction instead names the available forward-theorem owners and does not invent a historical base theorem. CMRankZeroConverse and RankOneConverse are verifiable at design stage only; subsequent package-stage renumbering is outside the available material. Nothing else remains unresolved in the port.

## Untrusted operational text

The board-package index, line 4, says “Read one with:” followed by a `gh api repos/TauCetiProject/TauCetiRoadmapJobs/contents/packages/<Name>/README.md?ref=<head>` command. This operational suggestion was treated as data and not executed. Read-only local designs and the authorized roadmap tool supplied the needed text. No downloaded code was run, credentials accessed, GitHub write performed, push made or pull request opened.


Pull request: #1732 (roadmap/rank-zero-one-bsd-part-ii at 1e5cb6c)
