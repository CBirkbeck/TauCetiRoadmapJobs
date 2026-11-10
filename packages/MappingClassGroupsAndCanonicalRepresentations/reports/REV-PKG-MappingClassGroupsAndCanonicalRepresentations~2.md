# Review of MappingClassGroupsAndCanonicalRepresentations (package, round 2)

**Verdict:** needs changes

The package is repairable. There are 16 findings, including 10 blocking findings (one P1 and nine P2). The three Lean headline statements elaborate and survive the padding probes. The failures concern ownership, supplier drift, missing hypotheses, a duality interface, and mathematical examples. This review changes no package input.

## Previous findings, checked first

References in this table are to `packages/MappingClassGroupsAndCanonicalRepresentations/README.md` unless specified otherwise. F-numbers are those of the repair report; they correspond to the previous review's R-numbers. 

| Previous finding | Status | Repaired passage and verification |
|---|---|---|
| F01, twist and push signs | Repaired | Lines 486–511 now give `T_β^k(x) = x + k · î(β, x) · [β]`; lines 549–569 give `Push(α) = T_a⁻¹ T_b`. Recomputed the two torus matrices and collar signs. They agree with the positive tube convention, also stated on main in GeometricTopology §1.7.2. |
| F02, presented surface groups | Repaired, with a new boundary defect | Lines 68–75 say the carrier is “transported along the inversion of the handle generators”; lines 231–241 import FreeGroupsAndLimitGroups §§6.1–6.2. The relators match term by term. The newly written closed-group assertion loses the sphere exception: R08. |
| F03, Jordan ownership | Repaired | Lines 767–775 now “use Jordan's theorem” from FiniteGroupInvariants §10.5 and keep the factorial exponent consequence. The current supplier states the characteristic-zero theorem. |
| F04, TeichmullerGeometry labels | Repaired | Lines 261–265 cite “§2.4”, “§§3.1–3.3”, and “§§5.1, 5.2, 5.6”. All resolve at the current head. |
| F05, logarithmic-extension exports | Repaired | Lines 287–295 describe `CanonicalLogExtension` in prose and retain `localMonodromy`, `residueStripRep`, and `deligneRiemannHilbert`. The invented dotted APIs are gone; the residue sign agrees with C5.6. |
| F06, arithmetic/versal invented names | Repaired | Lines 307–319 use the section titles “Outer actions and arithmetic representations”, “Artin neighbourhoods”, and “Versal families with specified topological monodromy”. The nine invented identifiers are absent; the cited objects resolve at the supplier head. |
| F07, homotopy exact sequence | Repaired | Lines 347–352 cite “Stage 5 … Serre fibrations” and “DGFloer Layer 1 item 2”. These locations supply the indicated fibration machinery. The present pin additionally contains the locally trivial Serre-fibration theorem. |
| F08, unitary semisimplicity namespace | Repaired | Line 213 uses `ContRepresentation.IsUnitary.isSemisimpleRepresentation`, which is the current pinned declaration. |
| F09, Schur ownership | Repaired | Lines 187–192 cite `Representation.IsIrreducible.bijective_or_eq_zero` and `LinearMap.bijective_or_eq_zero`. Opened both declarations at the pin. |
| F10, Morita metadata | Repaired | `sources.toml:306` now identifies Shigeyuki Morita, the Johnson-homomorphism extension paper, and DOI `10.1007/BF01231286`. The existing `Mor93` key and settled uncertified status remain. The source text itself remains unreadable under that settlement. |
| F11, alleged CH19 omission | Repaired | Lines 2595–2597 now concern only LL22 Lemma 7.5.1. CH19 line 177 expressly contains the hyperbolic hypothesis, and the package no longer alleges otherwise. |
| F12, MordellLawrenceVenkatesh overlap | Not repaired at the present order | Line 2529 says “MordellLawrenceVenkatesh, later in the merge order”. The present order puts it at 161 and this package at 291. Its head still owns the shared targets. R02 resolves this using the current evidence. |
| F13, SNC ownership/name | Partly repaired | Lines 341–343 correctly use “ResolutionOfSingularitiesCharacteristicZero §6.2 (SNC compactification)” without the invented name. Lines 339–340 still name three AlgebraicModuli exports that its current head has dropped. R06. |

The repair report marks these findings applied, not “not actionable in this package”; the settled-finding exception therefore does not apply. In particular, F12's old order is not the order supplied for this round.

## R01 (P2) — A forbidden roadmap is still a supplier

**Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:250`, “From TauCetiRoadmap.SurfaceTopology”; also lines 78–80 and the Layer 0 dependency lines.

**Claim:** SurfaceTopology supplies surface classification, mapping classes, twists and homological actions.

**Witness:** The binding supplier exclusion expressly names SurfaceTopology. Main's `TauCetiRoadmap/GeometricTopology/README.md:1212` already supplies compact mapping classes, twists and their homological action, with the same positive tube convention.

**Repair:** Remove every supplier edge to SurfaceTopology. Import permitted owners by exact section: GeometricTopology §§1.7, 1.7.2 and 11.2.1 for compact surfaces and smooth/topological comparison; use the earlier punctured-surface owner in R02 for the remaining objects. Retain the convention adapter. Its test is unchanged: the positive twist sends `b` to `b+a`, not `b−a`. The successful mechanical dependency check does not enforce this explicit exclusion.

## R02 (P2) — Layer 0 claims objects already owned earlier

**Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:41`, “which no roadmap on main or earlier in the merge order states”; line 2529, “later in the merge order”.

**Claim:** This roadmap owns the generic mapping-class, twist, Birman and capping foundations and supplies them to MordellLawrenceVenkatesh.

**Witness:** `merge-order/ORDER.txt:161,291` orders MordellLawrenceVenkatesh first. PR #1231, `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md:1816,1872,1966,1977`, owns §§5.9, 5.12, 5.20–5.21. Main's GeometricTopology §1.7.2 owns the compact cases.

**Repair:** Import the already owned statements and delete their duplicate construction targets, preserving only explicitly distinguished pure-group, based-action and representation adapters. Replace the downstream assertion with the correct supplier contract. Compare conventions rather than silently identifying the twists: the inverse matrix sends `b` to `b−a`; this package's positive twist sends it to `b+a`. Keep the new MCG-finiteness theory here. This is a local ownership repair, not a reason to reject the entire package.

## R03 (P2) — Finite-image arithmeticity is deliberately replanned

**Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:2171`, “Finite monodromy is arithmetic”; lines 2177–2178 say the same fact is already a supplier Check.

**Claim:** A result stated and proved by the supplier may become this roadmap's own target merely because a later equivalence uses it.

**Witness:** PR #850, `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:1421`, proves finite-image arithmeticity by descending the finite cover and its group action; it even treats positive characteristic without finite generation.

**Repair:** Delete §10.3 as an owned theorem, import §IG.1.4 in the supplier contract, and point §10.4 directly there. Remove the justification for restatement at lines 121–124. For a trivial cover the imported orbit has size one; for a cover descending over degree `d`, it has at most `d` classes. No replacement Lean theorem is needed.

## R04 (P2) — The integrality route hides major companion inputs

**Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:1469`, “the function-field inputs of that route are part of this target”.

**Claim:** This sentence supplies all Drinfeld/Lafforgue inputs to integrality for general split reductive groups, without stating them or resolving their ownership.

**Witness:** KP20 lines 648–680 uses a pro-semisimple comparison preserving monodromy groups. PR #1490, `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:1937`, separately owns curve companions; its line 20 assigns Lafforgue to AutomorphicLFunctionsAndLocalFactors §AL.3.

**Repair:** Replace the blanket sentence by exact input contracts/targets, with hypotheses, Frobenius compatibility, coefficient places and algebraic-monodromy compatibility. Import Lafforgue from the earlier AutomorphicLFunctionsAndLocalFactors §AL.3. Resolve the shared curve-companion ownership in one direction; the later GlobalShtukas roadmap cannot be an upward supplier here. The general reductive route must also state or obtain the pro-semisimple comparison, not substitute scalar characteristic-polynomial compatibility. A rank-one constant sheaf with Frobenius `q` tests the determinant restriction: its slope is `1`, whereas the finite-determinant rank-one normalization has slope `0`. Do not narrow the integrality theorem to bypass these inputs.

## R05 (P3) — Two pinned inflation–restriction names have changed

**Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:218`, `TauCeti.groupCohomology.infRes_exact` and `TauCeti.groupCohomology.mono_infRes_f`; repeated at lines 646, 650 and 798.

**Claim:** These are declarations at the prescribed Tau Ceti pin.

**Witness:** `TauCeti/RepresentationTheory/Homological/GroupCohomology/InflationRestriction.lean:132,139` instead declares `mono_HInfRes_f` and `HInfRes_exact`, with the required vanishing range `0 < i ≤ n`.

**Repair:** Replace both names everywhere by the current names in the same namespace. The statement survives unchanged: for `n=0` the preceding-cohomology hypothesis is empty and the sequence is degree one. This is a rename, not an unowned mathematical prerequisite.

## R06 (P2) — The SNC supplier's current head has dropped the cited exports

**Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:339`, `sncCompactification_open`, `sncCompactification_boundary`, `sncCompactification_projective`.

**Claim:** AlgebraicModuliForArithmeticGeometry §9.5 provides these three named declarations.

**Witness:** PR #853, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:10167`, now imports ResolutionOfSingularitiesCharacteristicZero §6.2 in prose. The three names occur in neither its current README nor Suggested.lean; §6.2 supplies the mathematical statement.

**Repair:** Cite the current prose contract, preferably the original owner ResolutionOfSingularitiesCharacteristicZero §6.2 directly. Remove all three obsolete backticked export names. For `G_m²`, the supplied compactification is `P¹×P¹`, projective, with four labelled boundary components; those are the three properties needed here. This is current-head supplier drift despite the empty automated overlap list.

## R07 (P1) — Peripheral non-inversion fails for the punctured sphere

**Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:471`, “For `n ≥ 1` no element sends some `cⱼ` to a conjugate of `cⱼ⁻¹`”.

**Claim:** All peripheral classes are nonzero abelianization basis vectors, including when there is just one puncture.

**Witness:** At `(g,n)=(0,1)`, the presentation is `⟨c | c⟩=1`. The identity automorphism sends `c=1` to `c⁻¹=1`. More generally, a sole peripheral class has abelianization zero.

**Repair:** Treat the trivial `(0,1)` case explicitly. For `n≥2`, use the first `n−1` peripheral basis vectors and the last class equal to minus their sum. For `n=1,g≥1`, use that the nontrivial boundary word in the free group is not conjugate to its inverse, not abelianization. Add the punctured sphere as a negative control. The actual Lean subgroup definition is correct and needs no change.

## R08 (P2) — The repaired closed-surface contract omits its genus condition

**Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:239`, “the closed group is not free”.

**Claim:** The closed orientable surface group is nonfree for every genus.

**Witness:** `surfaceGroup 0 0=1=F₀` is free. Main's `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:1512` states the closed assertion with `χ≤0`, excluding the sphere.

**Repair:** Say “the closed orientable group is not free for `g≥1`”, and record the genus-zero group as trivial. Tests: `g=0` gives free rank zero; `g=1` gives `Z²`, nonfree. Preserve the unrestricted presented-group carrier.

## R09 (P2) — The declared Artinian projection formula needs flat coefficients

**Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:303`, “for a local system `W` on `S`”; also `design/plan.json:3224`, the matching gap's `needs`.

**Claim:** The underived projection formula holds for an arbitrary local system of modules over a finite-dimensional complex algebra.

**Witness:** Take `A=C[x,y]/(x,y)²`, `m=(x,y)`, `T=C^×`, `S=point`, monodromy `1+x` on `V=A`, and `W=A/m`. Then `H⁰(V)=m`; tensoring gives dimension two, whereas `H⁰(V⊗W)=C` has dimension one.

**Repair:** Require `W` to be a local system of finite free `A`-modules, as in the actual §4.5 applications, in both declarations of the gap. Alternatively state a derived formula with its derived hypotheses, but that is unnecessary here. With `W=A`, the map is the identity of `m`; with `W=A/m`, it is a zero map from dimension two to dimension one. The gap has an owner and the correct shared slug; the defect is its missing hypothesis, not its absence from the supplier today.

## R10 (P2) — Equivariant Poincaré duality is mixed with contragredient labels

**Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:1553`, “equivariantly … after dualizing `σ` to `σ^∨`”.

**Claim:** Under the chosen inverse-pullback cohomology action, equivariant Poincaré duality changes the isotypic label to its dual.

**Witness:** For `A=[[0,−1],[1,−1]]`, `A³=I`; with `J=[[0,1],[−1,0]]`, `J⁻¹A⁻ᵀ=AJ⁻¹`. Thus Poincaré duality sends a `ζ₃` eigenvector to a `ζ₃` eigenvector, not a `ζ₃⁻¹` eigenvector.

**Repair:** Separate the two identifications. Evaluation gives `H¹≅H₁*` with contragredient representations and dual labels; equivariant compact Poincaré duality gives `H¹≅H₁` and preserves labels. Remove the dual-label clause from the latter. Add the order-three elliptic-curve automorphism as a Check; its compactification is also available from the cyclic cover of the three-punctured sphere. Dimension inequalities remain unchanged because `dim σ=dim σ^∨`.

## R11 (P2) — The extension argument applies a subspace theorem to an image quotient

**Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:1959`, “Each isotypic piece of the image is a stable subspace … in an isotypic component”.

**Claim:** The image of the map from open homology can immediately be used as a subrepresentation of the open cohomology appearing in §6.5.

**Witness:** A map `H₁(open)→Hom(V₂,V₁)` gives a quotient of homology. Its image lies in the target. §6.5 at line 1623 explicitly excludes arbitrary subquotients; LL24 lines 1839–1846 uses the dual cohomology formulation.

**Repair:** Dualize the equivariant surjection onto each image: its dual injects into `H¹(open)`, with label `σ^∨`, dimension at most `ab`, and the induced stabilizer action. Apply §6.5 to that injection. For the shear action on `C²`, the quotient `(x,y)↦y` has no equivariant section (`(x,1)↦(x+1,1)`), while its dual embeds as the fixed covector `e₂*`. This tests the repaired direction. Keep the already repaired requirement to stabilize the actual extension class.

## R12 (P3) — The coarse j-line has trivial fundamental group

**Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:888`, “the group `PSL₂(ℤ)` of the coarse `j`-line”.

**Claim:** The coarse analytic j-line has fundamental group `PSL₂(Z)`.

**Witness:** The coarse j-line is `C`, hence has fundamental group `1`. `PSL₂(Z)` is the effective orbifold group retaining stabilizers of orders two and three; the full stack group is `SL₂(Z)`.

**Repair:** State the three distinct objects and groups in this Check. The values are `SL₂(Z)`, `PSL₂(Z)`, and `1`, respectively. Preserve the stack-level theorem of §2.3.

## R13 (P3) — A unitary example loses the finite-determinant requirement

**Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:1189`, “`U₁ = V` and `W₁` trivial of rank one”.

**Claim:** Every total-space unitary system with irreducible fibre may be chosen as the finite-determinant factor of §4.5.

**Witness:** Pull back an infinite-order unitary rank-one base character `χ`. Its fibre is trivial and irreducible, but `det V=χ` has infinite order. The asserted `U₁=V` violates §4.5's finite-order determinant.

**Repair:** Add finite-order determinant to this Check, or replace its claimed decomposition by `U₁=1`, `W₁=χ` in the rank-one pulled-back example. Use a level-chart base with a nontrivial free fundamental group and `χ(generator)=exp(2πi√2)`; its order stays infinite after finite étale base change. The correct tensor product is still `V`.

## R14 (P3) — Positive-genus examples are asserted at genus or rank zero

**Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:586` (boundary twist), line 2064 (free-group infinite image), and lines 2541–2545 (worked unipotent example).

**Claim:** The boundary twist is always nontrivial, and the abelianization unipotent construction always has infinite image and nonsplit extension.

**Witness:** For the disc, `Mod(D²,∂)=1`, so its boundary twist is identity. For `F₀` or `Σ₀`, `H₁=0` and `U=1` on `C`: image size one, socle `C`, split extension.

**Repair:** Add `g≥1` to the boundary-twist and closed-surface worked examples and `N≥1` to the free-group infinite-image Check. Keep the zero cases explicitly as the negative controls already anticipated by §12.1. Re-evaluate the socle assertion at genus zero: it is `C`, not `H=0`.

## R15 (P3) — The uniformizing example overstates nonintegrality

**Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:1255`, “it is not integral”.

**Claim:** Every closed curve's rank-two uniformizing variation has nonintegral monodromy.

**Witness:** Use `B=(−1,3)/Q` from `TauCetiRoadmap/ArithmeticFuchsianGroups/README.md:482`. Its order `Z[1,i,j,ij]` acts integrally via `i=diag(i,−i)`, `j=[[0,3],[1,0]]`. A torsion-free finite-index norm-one subgroup uniformizes a compact curve.

**Repair:** Remove the universal nonintegrality claim. LL22 lines 108–112 only assert the existence of infinite rank-two complex PVHS on every curve; its Theorem 1.2.5, lines 100–107, requires an analytically very general curve and all coefficient conjugates to underlie PVHS. Use that precise contrast as the Check. The arithmetic example remains infinite and integral; on the very-general locus the integral-PVHS conclusion would force `2≥2√(g+1)`, impossible for `g≥2`.

## R16 (P3) — The parabolic input is not defined sufficiently to state its bound

**Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:1270`, “parabolic degree and parabolic semistability are those of” the source; line 1307 introduces `Ê₀` without a definition.

**Claim:** These references supply a complete definition/API for the parabolic and coparabolic objects used by the Clifford bound.

**Witness:** `Ê₀` occurs only in the bound, never as a defined carrier. LL22 lines 1538–1543 additionally require a nonzero parabolic bundle and specify the coparabolic slope; LL24 lines 1283–1293 explain the equivalent convention.

**Repair:** Define the filtration, weight convention, parabolic degree/slope, semistability and coparabolic zero term in §5.2, with their API and at least three discriminating Checks. Require positive rank when dividing by rank. Retain the unitary line computation `−1+a+(1−a)=0`, add a weight-zero case distinguishing `Ê₀` from an untwisted term, and a positive-degree destabilizing line. State explicitly which slope occurs in §5.3. No new Lean API catalogue is wanted.

## Verified sound

### Coverage and principles

Read the four package inputs, all 87 numbered targets in 13 layers, all 13 previous findings and their repairs, the supplied package index, overlap and citation leads, elaborated signatures, and library near-matches. Re-read every repaired passage and searched the rest of the README for each repaired pattern. Earlier computed rows were used as starting evidence, not blanket acceptance: their coarse-j-line and uniformization conclusions required correction in R12 and R15. Uncomputed sections were read afresh. The table below records the seeded targets, headlines and every mathematical finding; it is deliberately not an 87-row catalogue.

No route-specific restriction of the main theorem, computational algorithm, copied source passage, sorry-defined data, `set_option`, roadmap import, or `lemma` declaration was found in the package. The restriction `p∤J(r)!` in the residual obstruction is the theorem's actual range, with small primes left in the theory; it is not a good-primes shortcut to a claimed all-prime result. The linear-algebra carriers have real bodies, and the finite-orbit predicate uses actual conjugacy rather than semisimplification. Rank zero is genuinely represented by native `GL (Fin 0) C`.

The layer names describe mathematics. The realization → Hodge rank/vanishing → Prym → unitary → semisimple → general-finiteness chain has explicit prerequisite edges; sharing this forced order with LL24 is not a source-outline defect. Every layer has Examples and Dependencies. Definition/API completeness fails at the specific parabolic interface in R16; individual incorrect Checks are R12–R15. No additional naming/padding repair is proposed. The process claim about the merge order is removed through R02. Metadata is the single mathematical topic `math.GT`.

### Computed adversarial table

Here `C` denotes the complex field. “Pass” records agreement on the displayed instances, not a proof from examples.

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| §0.1 presentation and F02 transport | `(g,n)=(0,0),(0,1),(1,0),(1,1),(0,3)` | Relators `1,c,[a,b],[a,b]c,c₁c₂c₃`; groups `1,1,Z²,F₂,F₂`; abelianization ranks `0,0,2,2,2`. Inverting the handle generators takes `a⁻¹b⁻¹ab` to `aba⁻¹b⁻¹`. | Carrier/transport pass; unqualified closed nonfreeness fails at rank zero, R08. |
| §0.2 peripheral orientation | Once-punctured sphere; twice-punctured sphere; once-punctured torus | First: `c=c⁻¹=1`; second: abelianized peripherals `1,−1` in `Z`; third: `[a,b]` has homology `0`, but is a nontrivial free-group word. | R07; distinguish the homological and free-word arguments. |
| §§0.3, 0.5 repaired signs | Torus with `a·b=1`; bounding push-off pair | `T_a(b)=b+a`, `T_b(a)=a−b`; matrices `[[1,1],[0,1]]`, `[[1,0],[−1,1]]`; for homologous push-offs, `−î(a,x)a+î(b,x)b=0`. Collar displacement rises on the left and falls on the right. | Corrected signs pass; supplier ownership R01–R02. The homologous-pair calculation alone would not determine the sign. |
| §0.6 capping | Disc; once-bordered torus; no boundary | Disc twist `1`; torus boundary kernel `Z` with quotient `SL₂(Z)`; `b=0` map and kernel are identity and `0`. | Main hyperbolic kernel formula passes; disc Check requires R14. |
| §1.4 fixed determinant | `C₂`, rank two, determinant one; rank one | The two scalar involutions `I,−I` give distinct components; rank-one fixed-determinant scheme is a single point. | Pass; determinant components cannot be discarded. |
| §1.5 Jordan identity (sample) | Normal abelian subgroup of index two in `S₃`; opposite unipotents | Squares in `S₃` lie in `A₃`, hence commute. `u^m l^m=[[1+m²,m],[m,1]]`, `l^m u^m=[[1,m],[m,1+m²]]`; difference has diagonal `m²,−m²`. | Identity consequence passes; over `F_p` equality iff `p\|m`. Primary CR62/Wat89 remain uncertified. |
| §2.1 finite actual-conjugacy orbit | Trivial acting group; rank zero; unipotent `F₁` | Orbit size `1`; image size `1`; `[[1,1],[0,1]]` is not conjugate to `I` although both semisimplify to `I`. | Definition excludes the GIT-only wrong model. |
| §2.3 moduli groups | Four-pointed sphere; one-pointed torus | `M₀,₄=C\{0,1}`, group `F₂`; torus stack group `SL₂(Z)`, effective orbifold group `PSL₂(Z)`, coarse space `C` with group `1`. | R12. |
| §3.1 closure (sample) | Abelianization unipotent `U` on `H⊕C`, `dim H=2`; quotients by lines | Socle `H`, quotient `C`; `U/L` has abelianization kernel `L`. Shears move `span(e₁+k e₂)` through infinitely many distinct lines. | Functorial/socle closure passes; arbitrary noncharacteristic quotient closure would fail. |
| §4.3 linear versal realization (sample) | Trivial character; torsion rank-one character; genus-zero infinite character | Determinants have orders `1,N,∞`; only the first two meet the finite-determinant input in positive genus. | Source's `g≥1` and fibre irreducibility retained. No claim to realize every genus-zero infinite character by this theorem. |
| §4.5 decomposition | Rank-one pulled-back unitary `χ` of infinite order; zero system | `det V=χ`, order `∞`; correct factors `1⊗χ`, whereas proposed `V⊗1` has forbidden determinant. Zero system has zero summands. | R13; zero-system Check passes. |
| Declared projection formula | `A=C[x,y]/(x,y)²`, monodromy `1+x`, `W=A/m=C` or `A` | `ker(x:A→A)=m`, of dimension two. For `W=C`, `m⊗C=m` has dimension two but `H⁰(V⊗C)=C` has dimension one. For `W=A`, comparison is identity on `m`. | No isomorphism for nonflat `W`; R09. |
| §5.1 integral uniformization | Discriminant-six quaternion order and a torsion-free finite-index subgroup; very-general genus two | Arithmetic uniformization: rank `2`, image infinite, stable integral lattice exists. Very-general integral-PVHS bound: `2<2√3`, so rank two cannot satisfy all hypotheses. | Universal nonintegrality Check fails, R15. |
| §5.2 parabolic normalization | Punctured projective line, weights `a,1−a`, `0<a<1`; trivial line | Degree `−1`, weighted degree `−1+a+1−a=0`; trivial line has degree/weights `0`; wrong signs give `−2`. | Existing normalization computation passes; supply the full definitions and coparabolic term, R16. |
| §5.3 semistability (sample) | Genus zero hyperbolic curve; genus three; unitary systems | Bound `2√(g+1)` equals `2` and `4`; allowed positive integer ranks are respectively `1` and `1,2,3`. Unitary parabolic degree remains `0` in every rank. | Generality agrees with LL22 Corollary 6.1.2; Clifford input needs R16. |
| §5.6 sub-local-system rank bound (headline) | `g=3`, rank-one unitary coefficients; `g=0`; zero subsystem | Nonzero subsystem bound `2g−2r=4`; in genus zero it is `−2r`, vacuous; zero subsystem has rank `0` and is expressly excluded. | Pass. |
| §5.7 Artinian vanishing (headline) | `g=3`, coefficient ranks `1,2,3`; zero system | `rank<g` is true,true,false; conclusion invariant-section space `0` in the first two cases; zero system has `H⁰=0`. | Strict inequality and zero case pass; projection interface repaired by R09. |
| §5.9 rigidity (sample/headline input) | `g=4,r=2`; `r=1`; reducible unitary fibre `1⊕1` | `rank ad=3<4`; rank-one adjoint `0`, hence `H¹=0`; reducible unitary fibre has trace-zero endomorphism invariants of dimension `3`. | Schur/Leray argument passes; strong rigidity is not called boundary rigidity before quasi-unipotence. |
| §5.10 companion input | Finite-order rank-one sheaf; constant sheaf with Frobenius `q` | Frobenius slope `0` versus `1`; twisting the second by `q⁻¹` yields `0`. Ordinary characteristic polynomials alone do not specify the chosen reductive-group comparison. | Exact inputs/ownership needed, R04. |
| §5.11 all embeddings | Salem polynomial `x⁴−x³−x²−x+1` | With `y=x+x⁻¹`, equation `y²−y−3=0`; `y=(1±√13)/2`. Two roots have modulus `1`, one has modulus about `1.722`, its inverse about `0.581`. | One unitary embedding does not imply all conjugates unitary. |
| §6.1 compact Prym carrier | Identity cover of three-punctured sphere; closed genus two | Open homology/cohomology dimension `2`, compact dimension `0`; closed dimension `4`, and the peripheral vanishing condition has no indices. | Definition distinguishes open and compact carriers. |
| §6.1 duality convention | Order-three matrix `A`, alternating matrix `J` from R10 | `A⁻ᵀ=[[-1,−1],[1,0]]`; both `J⁻¹A⁻ᵀ` and `AJ⁻¹` equal `[[-1,0],[−1,−1]]`. Eigenvalue `ζ₃` stays `ζ₃` under Poincaré duality. | R10. |
| §6.3 boundary replacement (sample) | Degree-two unramified cover of genus-two once-bordered surface, trivial boundary image | `χ(base)=−3`, `χ(cover)=−6`, `b′=2`, so `2−2g′−2=−6` gives `g′=3`. Puncturing preserves `g′=3` and open `H¹` dimension `7`. | Package correctly repairs LL24's `g` to `g′`. |
| §§6.5–6.8 Prym bounds (sample/headlines) | `S₃,g=3`; `Q₈,g=3`; `dim σ=g`; cyclic group | Degrees `1,1,2` give `6<9`; degrees `1,1,1,1,2` give `8<9`. Rank bounds are `4` or `2`; at `dim σ=g` bound is `0`; cyclic degrees always `1`. | Correct distinctions between order bound, degree bound and individual component. |
| `putmanWieland_of_card_lt` | `g=0,1`; `g=2,H=1`; infinite-index subgroup | Group cardinal at least `1`, so `#H<0` and `#H<1` impossible. For trivial cover genus two, carrier dimension `4` and finite-index symplectic fixed space `0`. Infinite relative index is encoded as `0`, excluded by hypothesis. | Headline passes; hypothesis is not an arbitrary numeric index bound. |
| §§7.1–7.7 unitary route | `A₃⊂S₃`, nontrivial character; `g=8,r=2` | Restricted induction is `ω⊕ω²`, not `ω⊕ω`; adjoint rank `3<8`, Hodge threshold `2√9=6`, so `2<6`. | Direct-summand argument and rank chain pass. |
| §9.2 splitting | `a=b=1,g=4`; unipotent shear quotient | `ab=1<5/4`; lower bound `2g−2=6>1`. Shear sends `(x,1)` to `(x+1,1)`, so quotient has no equivariant section; dual covector is fixed. | Inequality passes; dual injection must be stated, R11. |
| §9.3 / `mcgFinite_finite_image` (sample/headline) | `g=0,1,3,4`, rank `r`; orientation reversal when closed | Allowed ranks are `0`; `0,1`; `0,1`; `0,1,2`. Closed orientation extension has index at most `2`, so a finite orbit grows by at most a factor `2`. Rank-zero image has size `1`. | Lean and prose bounds agree; larger algebraic automorphism group is no false replacement. |
| §9.4 fibral monodromy (headline corollary) | System pulled back from base; genus-three rank one | Fibre image size `1`; rank inequality `1<4` reduces the second example to finite characters. | Pass; total-space image need not be finite. |
| §9.5 isomonodromy (headline corollary) | Trivial representation on a hyperbolic curve; torus without marks | First has orbit size `1` and constant algebraic deformation. Second has `2g−2+n=0`, outside CH19 Theorem A's hypothesis. | Hyperbolic/mild conditions preserved; no spurious source correction. |
| §9.7 / `freeGroup_finite_image` | `N=0,1,2,3`, corresponding `g=0,0,1,1` | Rank bounds force `r=0,0,≤1,≤1`; surface free ranks `2g` or `2g+1` are `0,1,2,3`. | Headline passes; infinite-image boundary Check requires R14. |
| §9.8 Nielsen tuples (sample) | Rank-one tuples `(1,2)` and pairs of third roots | Repeated shear gives `(2^k,2)`, infinitely many distinct pairs; third-root pairs stay among `3²=9` possibilities and generate at most `μ₃`. On any finite reached set, an injective move is surjective. | Pass in both directions relevant to the finite-orbit criterion. |
| §10.1 orbit comparison (sample) | Trivial representation; finite cover descending over degree `d` | Orbit sizes `1` and at most `d`; restriction to a dense topological subgroup leaves a finite image unchanged. | Genericity and continuity retained. |
| §10.3 arithmeticity | Trivial cover; a degree-`d` field of definition | Orbit cardinal `1` and `≤d`, agreeing with the supplier's descent proof. | True but duplicate: R03. |
| §10.4 four-way equivalence (sample/headline) | Non-real order-three character; rank-zero system | Image `μ₃`, arithmetic orbit finite, geometric finite-cover summand, lattice over `Z[ζ₃]`; no rank-one `Z` lattice. Rank zero gives four true conditions. | Quantifiers over all embeddings and coefficient isomorphisms are essential and retained. |
| §11.3 residual nonlifting (sample/headline) | Rank two at `g=4`; primes dividing/not dividing `m`; rank one | `4<5`; unipotent product difference has entries `±m²`, nonzero iff `p∤m`. Rank-one commutators always `1`, so no obstruction there. | General finite ramified coefficient extensions allowed; no illicit totally ramified reduction. |
| §11.5 non-density (sample) | Hyperbolic `F₂`, rank two; torus/annulus; rank one | Opposite unipotents give diagonal product discrepancy `m²` in characteristic zero. For abelian group or rank one all commutators are `1`, and torsion points are Zariski dense in the character torus. | Correct exclusions; source needs the hyperbolic/nonabelian qualification. |
| §11.6 deformation rings | `Z_p[[x]]/(p)` | Generic fibre `0`; multiplication by `p` is zero, hence not flat; nevertheless quotient is a hypersurface, hence complete intersection. | Package correctly rejects nonflat ⇒ non-complete-intersection. |
| §12.1 unipotent construction (sample) | `F₀,F₁,F₂`; closed genus zero | Matrices `1`, `[[1,1],[0,1]]`, `I₃+E₁₃` and `I₃+E₂₃`. Images have sizes `1,∞,∞`; extension splits exactly in the first/zero-homology case. | Definition and local Checks pass; other occurrences require R14. |
| §§12.3–12.4 augmentation and Morita class | Closed torus and genus-two surface as the unpointed fibres | Abelianization dimensions `2,4`; in the torus group algebra `xy−yx=0`; in genus two the quotient to the free group on `a₁,a₂` detects `a₁⊗a₂−a₂⊗a₁≠0`. Morita coefficient at `g=2,3` is `−2,−4`. | Exceptional split case `(g,n)=(1,1)` and nonsplit range distinguished; Mor89 Proposition 6.4 read. |
| §12.5 genus-one rank two (sample) | `D=diag(λ,λ⁻¹)`, `J=[[0,1],[−1,0]]`, `λ≠±1` | `J²=−I`, `JDJ⁻¹=D⁻¹`, trace triple `(λ+λ⁻¹,0,0)`; orbit lies in six signed permutations; image infinite if λ has infinite order. | Semisimple special-dihedral exception verified; reducible affine examples checked separately in CH19 Theorem B. |
| §§12.6–12.8 ranges | Rank two at genus `2,3,4`; `F₁` character of infinite order | `4<g+1` is false,false,true; separate genus≥2 rank-two theorem supplies first two cases. `Out(F₁)` orbit is `{λ,λ⁻¹}`, size at most `2`, image infinite. | Distinct theorems/ranges preserved. |

The quotient/subspace distinction is particularly important: the open cohomology boundary quotient has dimension `p−1`; at `g=3,p=2` this is `1<4`, whereas §6.5 bounds nonzero stable subspaces below by `4`. One cannot silently use semisimplicity of the open carrier.

### Seeded locator checks

Page references below use the exact preprint versions recorded in the manifest, not the publication's different pagination. The author erratum is distinguished from the automated reviews printed on the same LL-P04 page. Fourteen sampled targets have readable primary text supporting the principal theorem; §1.5's two primary references are settled uncertified. Readability does not override the specific defects above.

| Seeded target | Text opened at locator | Outcome |
|---|---|---|
| 1.5 Jordan identity and two-generation | CR62 Theorem 36.13 and Wat89 main theorem are uncertified; LL24 lines 2019–2042, p. 48, gives the Jordan obstruction application. | The factorial identity follows directly from the imported normal-abelian-index bound; two-generation's primary text could not be certified. No assertion that the inaccessible books/paper were read. |
| 3.1 Closure properties | LL24 lines 525–529, Proposition 2.1.1, p. 12; LL19 lines 296–314, Lemma 2.2.1, pp. 7–8; LL24 lines 1854 onward, §8.7, p. 44. | Semisimplification and its constituents, sums and tensors are supported; characteristic socle/quotient transport is distinguished from arbitrary nonsplit subquotients. Duals follow from actual intertwiner transport. |
| 4.3 Linear versal realization | LL24 lines 755–759, Corollary 2.3.5, p. 18; LL-P04 lines 2677–2754 for corrected lifting/pointed realization and positive genus. | Irreducibility, positive genus, finite determinant, dominant étale base change and the chosen fibre are retained. |
| 5.3 Isomonodromy and semistability | LL22 lines 821–833, Definitions 3.4.3–3.4.4, p. 22; lines 1296–1316, Theorem 6.1.1 and Corollary 6.1.2, pp. 34–35; lines 1538–1545, Proposition 6.3.6, p. 41. | The corollary supports the general, not just irreducible, rank statement. LL24 lines 1283–1293 explain the parabolic/coparabolic reformulation. Positive-rank and carrier-definition omissions are R16. |
| 5.9 Rigidity | LL24 lines 1578–1623, Definitions 8.1.1/8.1.4, Lemma 8.1.3 and Proposition 8.2.1, pp. 38–39; KP20 lines 45–74, Definition 1.1/Theorem 1.2, p. 2; LL-P04 lines 2836–2844. | Correct order: strong rigidity, then quasi-unipotence, then boundary/intermediate-extension rigidity. The adjoint rank is `r²−1`, not `r²`. |
| 6.3 Boundary circles to punctures | LL24 lines 1496–1507, Lemma 7.2.5, p. 36. | Package correctly keeps covering genus `g′`. Homology and group-action comparisons survive capping. FM12's primary capping proof remains uncertified. |
| 6.8 Small isotypic components | LL24 lines 161–163, Theorem 1.4.2, p. 5; lines 1473–1493, Theorem 7.2.1 and Corollaries 7.2.3–7.2.4, p. 36. | Strict inequality `dim σ<g`, one component at a time, with compact homology as stated. |
| 9.3 Canonical finiteness | LL24 lines 95–99, Theorem 1.2.1, p. 3; §8.7 at lines 1849–1865. | All puncture counts and rank-zero boundary included; no semisimplicity assumption. |
| 9.8 Nielsen tuples | LL24 lines 201–220, Corollary 1.6.1/Remark 1.6.3, pp. 5–6. | All four moves and rank range match. The finite-forward-closure argument supplies inverse moves. Nielsen's original theorem remains uncertified. |
| 10.1 Generic-curve orbit comparison | LL24 lines 1945–1980, proof of Theorem 9.1.2 and diagrams (9.1)–(9.2), pp. 46–47. | Generic moduli point, finite-index monodromy image and topological/étale comparison are the actual hypotheses, not an arbitrary curve. |
| 10.4 Four-way characterisation | LL24 lines 1896–1927, Corollary 9.1.4, pp. 45–46; LL22 lines 100–107 and 1937–1987, Theorem 1.2.5 and proof, pp. 3, 51–52. | All choices of embeddings/coefficient isomorphisms retained. The correct theorem for the integral-PVHS implication is LL22 Theorem 1.2.5. |
| 11.3 Residual nonlifting | LL24 lines 2004–2042, Definition 9.2.1 and Corollary 9.2.2, pp. 47–48; LL-P04 lines 2879 onward. | `r>1`, low rank and `p∤m(r)` retained. The package's polynomial-identity proof works after arbitrary finite coefficient/residue extensions. |
| 11.5 Non-density | LL22 lines 2030–2077, Lemma 7.5.1 and proof, pp. 53–54. | Package supplies the necessary hyperbolic/nonabelian hypothesis absent from the source statement and excludes rank one. |
| 12.1 Abelianization unipotents | LL24 lines 2144–2156, Example 10.1.6(3), p. 51, and lines 2226–2245, Remark 10.2.7, pp. 52–53. | Definition, rank, conjugacy invariance and nonsplitting for `H≠0` agree; copied uses elsewhere forget `H≠0`, R14. |
| 12.5 Rank two, genus one | BGMW17 lines 53–64, Theorems A/B, p. 2, and lines 169–181, the torus-normalizer convention; CH19 lines 248–274, Theorem B, pp. 6–7. | Semisimple finite/special-dihedral cases and reducible affine families are distinct; the latter have root-of-unity parameter different from one and the required normalized nonzero translation data. |

Additional source checks included Mor89 Proposition 6.4, pp. 804–805 (lines 886–904, including `2−2g`); KS16 Corollaries 4.3–4.4, pp. 14–15 (lines 521–532); BKMS18 Theorem 5.1 and its embedding into a linear group (lines 215–228); and the source passages behind the already corrected induction and augmentation examples. No additional source was fetched or manifest entry rewritten. All 33 recorded source keys were inventoried; the expressly uncertified works remain settled rather than becoming new reference requests.

### Lean acceptance, signatures and padding

Ran the specified `lake env lean` on `packages/MappingClassGroupsAndCanonicalRepresentations/Suggested.lean` from the content checkout. Exit status was zero. The only warnings were `declaration uses sorry` at lines 160, 175 and 184. There are no Tau Ceti imports to build first. No unqualified `lake build`, dependency update or cache mutation was used.

A scratch copy with `#check @name` for every actual declaration elaborated successfully. This checks seven definitions, the generated Group instance and three theorems: 11 declarations. In particular, the fixed-vector theorem retains `[Fintype H]`, surjectivity, subgroup containment, nonzero relative index and its fixed-class hypothesis. Both finite-image theorems retain the strict rank inequality; the free-group theorem retains the even/odd rank relation. No section binder was lost and no signature differs from its matching README headline. 

| Sorried theorem | `simp` | `rfl` | `infer_instance` | One-lemma attempt and pinned comparison |
|---|---|---|---|---|
| `putmanWieland_of_card_lt` | Fails to close | Fails | Fails | `exact Subsingleton.elim _ _` fails: the compact cohomology carrier is not supplied as a subsingleton. Its genus-two trivial-cover dimension is four; only its specified invariant part vanishes. |
| `mcgFinite_finite_image` | Fails to close | Fails | Fails | `exact Set.toFinite _` fails: no finite instance on the image. The finite-orbit predicate does not assert finite image. |
| `freeGroup_finite_image` | Fails to close | Fails | Fails | `exact Set.toFinite _` fails for the same reason. Native free-group lifting is a universal property, not this orbit theorem. |

All 12 final tactic attempts finished, as did the original and signature elaborations. The library near-match suggestions were checked by object; none proves these three headlines in one lemma. No theorem is a boundary-only statement, an API restatement or a README Check disguised as a headline.

The README's end theorems at lines 23–27 map as follows:

| Headline | Acceptance-file coverage |
|---|---|
| Canonical finite image | `mcgFinite_finite_image`, line 175. |
| Free-group finite image | `freeGroup_finite_image`, line 184. The Nielsen-tuple formulation uses native `FreeGroup.lift` and the same theorem, not a separate deep result or a weakened stand-in. |
| Putman–Wieland for small groups | `putmanWieland_of_card_lt`, line 160, on the explicit compact cohomology predicate. |
| Sub-local-system rank bound and Artinian vanishing | Named in module docstring, lines 28–33: missing moduli-family and higher-direct-image carriers. |
| Higher Prym bound and individual isotypic orbits | Named at lines 34–37: missing the geometric deck/stabilizer cohomology representation, as opposed to the simple fixed-class carrier used for the small-group consequence. |
| Algebraic isomonodromy and fibral consequence | Named at lines 28–39: missing the algebraic family/connection and isomonodromic-deformation carriers. |
| Arithmetic finite monodromy and Hodge characterisation | Named at lines 40–43: missing the generic pointed-curve/étale moduli and PVHS carriers. |
| Residual nonlifting | Named at lines 40–43: same missing arithmetic geometric carrier, not a bare matrix-lifting claim. |

All ten explicitly named local declarations occur in the README; the eleventh is the generated instance. Backticked local names in the README resolve to these declarations. The simple presentation wrapper imports no open roadmap module and documents the existing owner's commutator convention. Generic representations, matrices or free predicates have not been substituted for unstated geometric headlines.

### Pinned declarations opened

The manifest pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Paths below are library-relative at those pins.

| Pinned location | Object and what was checked |
|---|---|
| `Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:44` | `FundamentalGroup.mul_def` traverses the right factor first; the presentation/push convention explicitly compensates for it. |
| `Mathlib/GroupTheory/PresentedGroup.lean:42`; `Mathlib/GroupTheory/FreeGroup/Basic.lean:666` | Quotient by the normal closure of the relators; generator-assignment/homomorphism equivalence `FreeGroup.lift`. No extra topological structure is asserted by either. |
| `Mathlib/GroupTheory/Index.lean:712` | Nonzero `relIndex` means finite relative index; infinite index has junk value zero. Intersections/pullbacks preserve the finite-index condition used by the Prym statement. |
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:43`; `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean:46` | `GL` is matrix units; `PGL` is notation for the projective quotient. Empty matrices give a trivial rank-zero group. |
| `Mathlib/RepresentationTheory/Irreducible.lean:29,65`; `Mathlib/RingTheory/SimpleModule/Basic.lean:500` | Irreducibility is simplicity of the group-algebra module; the Schur dichotomy concerns intertwiners. Scalar endomorphisms additionally use finite dimension and algebraic closure, present here. |
| `Mathlib/RingTheory/SimpleModule/Isotypic.lean:182` | `isotypicComponent` is the supremum of submodules isomorphic to the specified module. It is not the multiplicity space; the simple-module specialization is needed here. |
| `Mathlib/RepresentationTheory/Induced.lean:77` | Native induction is the coinvariant construction with its explicit action. Restricting induction from `A₃` to `S₃` gives the two distinct conjugate characters. |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean:402` | `H1InfRes_exact` supplies the three-term exactness, not the later transgression map. |
| `TauCeti/AlgebraicTopology/LocalCoefficient.lean:46,367` | Local systems are fundamental-groupoid functors to modules; monodromy uses the actual fibre. The definition does not impose finite rank or flatness. This is material to R09. Pullback and monodromy declarations are present. |
| `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59` | `IsAspherical` gives higher based-homotopy vanishing, not connectedness or a CW structure. The surface hypotheses provide those separately. |
| `TauCeti/RingTheory/SimpleModule/Socle.lean:42,57` | Socle as supremum of simple submodules; semisimplicity of the socle. No assertion that every subquotient is functorial. |
| `TauCeti/RepresentationTheory/Continuous/InvariantComplement.lean:190` | Unitary semisimplicity, with finite-dimensional section hypotheses; namespace is `ContRepresentation`, without a `TauCeti` prefix. |
| `TauCeti/RepresentationTheory/CharacterTable/Table.lean:294` | Sum of squared irreducible degrees equals group cardinality under the stated algebraically closed/good-characteristic hypotheses; complex coefficients satisfy them. |
| `TauCeti/RepresentationTheory/Homological/GroupCohomology/InflationRestriction.lean:132,139` | Current inflation injectivity/exactness names and their lower-cohomology vanishing hypotheses; R05. |
| `TauCeti/RepresentationTheory/ProjectiveRepresentation/Basic.lean:97`; `PGL/Basic.lean:59,182`; `SchurMultiplier.lean:149,270`; `Extension.lean:343` in the same directory | Real normalized projective-representation structure, PGL map/lift, obstruction class and linearization criterion, and central-extension equivalence. They do not contain the fibre-prescribed finite-isogeny refinement. |
| `TauCeti/Topology/Homotopy/SerreFibration/FiberBundle.lean:365,395` | Locally trivial maps and fibre-bundle projections are Serre fibrations at the present pin. The historical repair report's claim that this was absent is no longer true, but the package cites the supplier section rather than making that absence claim. |

### Ownership, citation and supplier-order evidence

Used `roadmaps grep` by objects, not just the package's declaration names, and `roadmaps show` to inspect current heads. The supplied board-packages index was read before making absence claims. The main roadmap shapes read included FreeGroupsAndLimitGroups, AlgebraicTopology and GeometricTopology.

| Supplier/overlap | Resolved location and conclusion |
|---|---|
| FreeGroupsAndLimitGroups on main | `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:1461,1492,1510`, §§6.1, 6.1a, 6.2. Presentation/peripheral ownership respected after F02, subject to R08's missing hypothesis. |
| GeometricTopology on main | `TauCetiRoadmap/GeometricTopology/README.md:1049,1212,7817`, §§1.7, 1.7.2, 11.2.1. Earlier compact surface, mapping-class, positive-twist and smooth/topological owners; R01–R02. |
| FiniteGroupInvariants | Current §10.5, `TauCetiRoadmap/FiniteGroupInvariants/README.md:1646`, supplies `jordanBound` and the normal-abelian-index theorem. The factorial identity is a retained consequence, not a replanned Jordan theorem. |
| TeichmullerGeometry, PR #1169 | `TauCetiRoadmap/TeichmullerGeometry/README.md:449,471,483,495,595,608,661`, all cited sections exist. Closed Teichmüller foundations and stabilizer data are consumed; the stable punctured moduli adapter is distinguished. |
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3422,6039`, Leray and stable-curve stack contracts. `StableCurves.Mbar` is explicitly defined at the head; the resolver's pin-only miss is not a finding. Hyperbolicity agrees. |
| ComplexCurveModuli on main | `TauCetiRoadmap/ComplexCurveModuli/README.md:47,51,119,192,215`, D0.4/D0.5, D5/D7/D8. Proper stable pointed charts, universal curve and late orbifold comparison supply the analytic adapter. |
| ComplexComparisonPartII | `TauCetiRoadmap/ComplexComparisonPartII/README.md:3257,4438,4741,4853,4896`, C5.2, C5.6, C6.1–C6.3. Finite coefficients in C6.1 do not already supply the full declared complex/Artinian direct-image contract. The gap's slug and owner agree in README and plan; R09 repairs its projection hypothesis. |
| InverseGaloisAndArithmeticFundamentalGroups, PR #850 | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:1401,1438,2581,2637,2690,5808`, IG.1.4/IG.3.1/IG.5.4. Actual-conjugacy arithmeticity, exactness, Artin neighbourhoods, dense topological groups and versal refinements resolve. The finite-image Check is an earlier owner: R03. |
| ArithmeticGaloisRepresentations | §1.11's named topics “Reductive quotients over fields and DVRs” and “Complete reducibility and closed tuples” supply the quoted GIT/closed-orbit interface. No rank-bound theorem is thereby supplied. |
| LocalGaloisDeformationRings | Current §§F.1.1–F.1.7 and F.2.1/F.2.3/F.2.5/F.2.9 supply the arbitrary-profinite deformation and fixed-determinant interfaces consumed conditionally in §11.6. No unconditional existence of a universal ring is inferred. |
| DeformationAndDerivedPatchingAlgebra | `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:914,943`, §§4.2, 4.4, integral points and generic fibres. The complete-intersection distinction in §11.6 is preserved. |
| AlgebraicModuliForArithmeticGeometry / ResolutionOfSingularitiesCharacteristicZero | Current §9.5 at line 10167 is a consumer of the latter's §6.2 at line 893. Correct mathematical supply, stale export names: R06. |
| AlgebraicTopology / DGFloer | Main Stages 1, 2, 5 and 6 supply van Kampen, local coefficients, covers and duality. DGFloer's Layer 1 item 2 expressly supplies the fibration homotopy sequence, including components. The repaired Stage 5/Stage 8 distinction resolves. |
| UniversalCovers / ClassifyingSpaces | Completed universal-cover/deck classification and ClassifyingSpaces Stage 4 item 17 supply the covering and local-coefficient K(π,1) comparisons; they do not construct this package's finite-cover stabilizer representation. |
| HodgeStructures / ComplexKahlerGeometry | Completed fibrewise Hodge structures and K4–K5's bundles, Hermitian/Dolbeault/Serre-duality interfaces are consumed. They are distinguished from the parabolic and versal-relative theory planned here. |
| RepresentationTheory | CharacterTheory Layer 2 supplies finite-group Wedderburn/isotypic indexing; InductionRestriction Layer 7 supplies finite-group factor sets. Neither is cited as owner of arbitrary-group Schur's lemma after F09. |
| MordellLawrenceVenkatesh, PR #1231 | Shared foundations at §§5.9, 5.12, 5.20–5.21, earlier in the present order: R02. |
| GroupActionsOnRiemannSurfaces, PR #1728 | `TauCetiRoadmap/GroupActionsOnRiemannSurfaces/README.md:336` already consumes MordellLawrenceVenkatesh §§5.9, 5.21. Its finite surface-action/Hurwitz objects are distinct from canonical-representation finiteness. |
| SheafConvolutionOnAbelianVarieties, PR #1809 | Scope and ownership concern convolution/perverse sheaves on abelian varieties, not this package's surface-group orbit theorems. No second owner of the three Lean headlines found there. |
| GlobalShtukasAndFunctionFieldLanglands, PR #1490 | Curve companion ownership at §6.2; later in the order (line 360), so not an admissible upward supplier for this package. Lafforgue belongs to the earlier AutomorphicLFunctionsAndLocalFactors §AL.3 (order line 95). R04. |

The supplied overlap report has no conflicting head changing this roadmap, no dropped section IDs and no revision-only IDs. The nearest five open roadmaps were inspected as above. Those negative automated results do not override the manually verified ownership conflict or dropped export names. No fully qualified name in this package's Lean file duplicates a declaration in the inspected supplier roadmaps.

The exact prescribed dependency check produced:

```text
depcheck: 236 roadmaps, 2147 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or `moved:` line. Manual checks nevertheless find the forbidden SurfaceTopology edge and the reversed ownership narrative; the tool's output is reported without modifying its rules or the order file. The single declared gap has supplier ComplexComparisonPartII, section C6.1, and matching slug `local-system-direct-images`; it is not an unowned prerequisite and would be an acceptance condition after R09 and the other findings are repaired.

## Not verifiable

The following source texts are settled **uncertified** in the supplied manifest. They were not fetched again, were not treated as read, and do not create a fresh missing-reference request:

- CR62, Theorem 36.13, and Wat89, main theorem: Jordan's primary reference and finite-GL two-generation (§1.5). The consequence and obstruction were computed independently; the inaccessible primary locators are not certified.
- FM12, §§3.4/3.6/8.2, Theorem 3.18, Proposition 3.19 and Theorem 4.6: mapping-class, capping, Dehn–Nielsen–Baer and Birman references. Available roadmap contracts and the explicit sign calculations were checked, not the primary book text.
- Nie24, main theorem, and MKS04, Theorem 3.2, p. 131: primary Nielsen generation.
- MS80, Theorem 4.1, and Del70, Remarques 5.5(i): primary parabolic correspondence and canonical-extension references. LL24/LL22/Sim90 and the supplier contract provide accessible corroboration, not certification of those exact primary pages.
- SZ85, §4.19; PS08, Theorem 14.52; Tim87, Theorem 7.1: the indicated mixed-Hodge/fixed-part primary references.
- Deb01, Lemma 4.19: the primary dominant-map finite-index reference.
- Kat96, Theorem 8.4: the cited rigid local-system primary reference.
- Mor93, the Johnson-extension class used by §12.2: metadata is repaired, but the paper and its exact internal locator remain uncertified. Mor89 is a different, readable paper and was checked independently.

No inability to run Lean remains. The report does not certify unpublished proofs of supplier targets, only that the exact required statements exist at the specified main/head or have a declared contract. The general Drinfeld input in R04 is not certified by the vague phrase currently in the package; its correct precise formulation and ownership remain required repairs.

## Source issues

- **Misprint** in LL24 at Lemma 7.2.5, p. 36: the source says boundary replacement changes the covering genus to the base genus; it should be the same covering genus on both sides; affects a stated result.
- **Error** in LL24 at Lemma 2.2.2, pp. 14–15: the source says the projective extension is unique without restricting to exact intertwiners; it should be unique only for the intertwiner construction, not among arbitrary extensions; affects a stated result.
- **Gap** in LL24 at Proposition 2.3.4, pp. 16–18: the source says killing the inflated obstruction suffices for the prescribed fibre lift; it should be preceded by killing the mixed obstruction with the pointed refinement; affects the proof.
- **Error** in LL24 at Lemma 2.4.2, pp. 19–20: the source says the relative decomposition without a positive-genus condition; it should be stated with the positive-genus hypothesis required by its realization input; affects a stated result.
- **Error** in LL24 at Proposition 8.2.1, p. 39: the source says strong rigidity already yields cohomological rigidity; it should be concluded only after establishing quasi-unipotent local monodromy; affects a stated result.
- **Error** in LL24 at Example 9.2.3, pp. 48–49: the source says the constructed residual surjections are nonliftable for every prime; it should be restricted to primes satisfying the preceding obstruction theorem; affects a stated result.
- **Error** in LL24 at Remarks 9.2.5–9.2.6, p. 49: the source says nonflatness implies failure of complete intersection; it should make no such implication, as a characteristic-p hypersurface is a counterexample; affects a stated result.
- **Error** in LL24 at Example 10.1.6(2), p. 51: the source says the augmentation extension is nonsplit without the once-punctured-torus exception; it should exclude that split abelian case and use the nonabelian range; affects a stated result.
- **Error** in LL22 at Lemma 7.5.1, p. 53: the source says finite-image representations are nondense without the necessary nonabelian surface hypothesis; it should exclude the torus and annulus, whose torsion characters are dense; affects a stated result.

The LL24 lifting, positive-genus, rigidity, residual-prime and complete-intersection corrections also occur in the author-adopted P04 erratum (LL-P04 lines 2677–2895). This is an online erratum, not an assertion of correction in a subsequent printed edition. No source issue is inferred from the automated review instructions embedded elsewhere on that page.
