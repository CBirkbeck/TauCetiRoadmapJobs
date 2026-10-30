# Review of AnabelianGeometryAndNonabelianChabauty (pull request #1021 at f8c6414)

**Verdict:** accepted

Incremental re-review of the 137 lines changed since 8cf11a2. No P1 or P2 finding remains; the three findings below are P3 notes the author may take or leave.

## R01 (P3) — Supply the source manifest

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/` contains README.md, Suggested.lean and metadata.toml only; `sources.toml` is absent.

**Claim:** The bibliography (47 entries, several works in two versions) records no source-service provenance or verification status, which the roadmap contract requires in the manifest.

**Witness:** Folder listing at this head: three files, no `sources.toml`. The brief records no manifest sources for this roadmap. This is the previous report's R04, unchanged.

**Repair:** Add `sources.toml` with one lifetime key per work, both locators for the works read in preprint and published form (Achinger preprint Proposition 3.4 versus the published numbering; Kim 2008 arXiv versus Publ. RIMS pagination; the two Stix cuspidal-section versions under one key), `cited_for`, and the service's `url`, `fetched_from`, `sha256`, `licence_class` and `status`; paywalled items stay `uncertified`. No source text goes into the folder.

**Repair test:** The Stacks Project tags 0A3K, 0A3L, 0A3N, 04DZ and 03RQ now cited in §1.9 must appear under the existing `stacks` key, not a new one.

## R02 (P3) — Remove the dangling dilogarithm identifier

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:7016`: “Thus `colemanDilogarithm=−I_(01)`; using the forward coefficient without the minus sign fails both the derivative and normalization.”

**Claim:** The repair of the previous R03 renamed the definition in §5.0 to “the tensor-path dilogarithm” with `Li₂⁰=−I_(01)` (line 7010), but this Check still names `colemanDilogarithm`, which is now defined nowhere and declared nowhere.

**Witness:** `grep colemanDilogarithm README.md` returns only line 7016; `Suggested.lean` declares one theorem, `anabelian_isom`.

**Repair:** Write the Check as “Thus `Li₂⁰=−I_(01)`”, matching the definition paragraph.

**Repair test:** The computed values are unchanged: the series `∑ zⁿ/n²` has constant term 0 and linear coefficient 1, while `I_(01)=−z−z²/4−⋯`, so `Li₂⁰=−I_(01)` and the forward sign fails the derivative `−log(1−z)dz/z`.

## R03 (P3) — Record the new curve inputs in the supplier contracts

**Location:** `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:4187` (“AlgebraicCurves Layers 0 and 12 (constant fields and the scheme dictionary); SchemeAndStackFoundations SF.0, SF.3 and §4.9”) and `:4439`; against `:13` (“AlgebraicCurves Layers 4, 7, 9 and 12 supply Riemann–Roch, Hurwitz, complete-DVR differentials and the function-field/scheme dictionary”) and the SchemeAndStackFoundations contract at `:67–75`.

**Claim:** The any-field curve branch added in §1.9 consumes AlgebraicCurves Layer 0 (the relative algebraic constant field, finite and separable for a geometrically reduced curve) and SchemeAndStackFoundations §4.9 (Stein factorisation), but the scope sentence lists AlgebraicCurves Layers 4, 7, 9 and 12 only, and the SchemeAndStackFoundations contract paragraphs name SF.0–SF.5 without §4.9. Both cited sections exist on main (AlgebraicCurves `README.md:403`, Layer 0 “function fields, constant fields, and places”; SchemeAndStackFoundations `README.md:5448`, “4.9 The theorem on formal functions and Stein factorisation”), so this is a contract-listing gap, not drift.

**Witness:** `grep -n AlgebraicCurves README.md` before line 125 hits only line 13; `grep -n '4.9' README.md` before line 125 hits nothing.

**Repair:** Add Layer 0 to the AlgebraicCurves clause at line 13 and a clause “§4.9 supplies Stein factorisation and geometric connectedness of the fibres of a proper morphism with `f_*O=O`” to the SchemeAndStackFoundations contract.

**Repair test:** An elliptic curve over `F₄` read as a connected `F₂`-curve has constant field `F₄`, and the factorisation through `Spec F₄` makes it geometrically connected with two conjugate geometric components of genus one; the contract must name the supplier of that constant field.

## Previous findings

- R01 — repaired: README:3412 “The nonabelian constructions use §0.1 for continuous ordered cocycles and their gauge quotient, and §§0.16–0.18 for quotient descent, inflation and finite-quotient comparison.” Neither `ContCohomology.Nonabelian` module is named anywhere in the folder.
- R02 — repaired: README:4176 “For a connected smooth separated finite-type curve C over any field k, if C is affine or is proper of positive genus, prove Is(C,x;all finite coefficients)”; the new target at README:4106 supplies the characteristic-p vanishing and the inseparable transport. Verified below against Stacks 0A3K/0A3L/0A3N/04DZ, Schmidt 1996 Proposition 15 and Schmidt–Stix Lemma 2.7(a).
- R03 — repaired: the six witnesses (`MixedExtension.pi1`, `.pi2`, `.baerSum₁`, `.baerSum₂`, `localHeight_biadditive`, `localHeight_symm`) are gone; README:7697 “The adjacent extension classes in `H¹(G,V)` and `H¹(G,Hom(V,ℚ_p(1)))`”. The repair left one dangling name: this report's R02.
- R04 — not repaired: no `sources.toml` at this head; this report's R01.
- R05 — repaired: README:2306–2308 give the `C₉→C₃` nonzero obstruction, the split `C₃×C₃` zero obstruction and the change of lift by `3a`; all three recomputed below.
- R06 — repaired: README:7432 “[Minhyong Kim], §3 Comments I, the dimension-to-finiteness argument, pp. 120–121”; the cached text begins §3 Comments I at its line 1211 on the pages printed 120–121.

## Verified sound

### Gate, dependency order and elaboration

- The worker's gate at f8c6414 reports every counter zero, including `build=0`, `depcheck=0`, `stray-files=0`, `outside-folder=0`, `sorry-data=0` and `set_option=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- The independent dependency check: `depcheck: 205 roadmaps, 1421 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; the shared packages directory was at these pins with a complete olean set (8570 oleans for 8569 Mathlib files) and `TauCeti/AlgebraicGeometry/Cohomology/Genus.olean` present, so no build was needed. `lake env lean` on a scratch copy of `Suggested.lean` with `#check @anabelian_isom` appended elaborated with `sorry` as the only warning. The printed signature keeps every binder: `Fact p.Prime`, both fields, `Algebra ℚ_[p] L`, the embedding and finite-generation witness, both `SmoothOfRelativeDimension 1`, `IsProper` and `GeometricallyConnected` instances, both `FiniteDimensional K (Cohomology (InvertibleSheaf.trivial _).obj 1)` instances, and both genus bounds; nothing silently disappeared. The statement is unchanged since the previous review.
- One-tactic probe, same scratch file: copies of the theorem closed with `simp`, `infer_instance` and `rfl` all fail (`simp` leaves the full goal; `infer_instance` reports “type class instance expected”; `rfl` reports no binary relation). The headline is not padding. The file has one theorem, no data definition, no `set_option`, imports `Mathlib` and one existing `TauCeti` module.
- The docstring change (line 18, “arbitrary-field smooth-curve and characteristic-zero product and Artin-tower K(π,1) theorems”) agrees with the README's new generality.

### Changed passages: sources opened

| Passage | Text and locator | Result |
|---|---|---|
| §1.9 characteristic-p curve cohomology, affine case | Stacks tag 0A3K, Lemma 59.63.1: scheme of characteristic p; affine gives `H^q(Z/p)=0` for `q≥2`; qcqs of dimension d gives vanishing for `q≥d+2` | Supports the affine branch and SchemeAndStackFoundations §2.11's statement (`README.md:3656–3680` on main, `artinSchreier_sequence`, affine vanishing). |
| §1.9 the linear input | Stacks tag 0A3L, Lemma 59.63.2: k algebraically closed of characteristic p, V finite-dimensional, F Frobenius-linear; `F−1` surjective with kernel of `F_p`-dimension at most dim V | Supports the stated linear input, including the dimension bound. The roadmap's nilpotent/bijective split and open-subgroup route is an alternative proof; the Fitting decomposition is by k-subspaces because k is perfect. |
| §1.9 proper case | Stacks tag 0A3N, Lemma 59.63.5: X separated of finite type over algebraically closed k of characteristic p; `H^q(Z/p)=0` for `q≥dim X+1`; proof via `H^d(O)` finite-dimensional, `F−1` surjective | For a curve, `q≥2`, as stated. The roadmap's reduction “H² is the cokernel of F−1 on H¹(Y,O)” is the proof's exact sequence. |
| §1.9 inseparable transport | Stacks tag 04DZ, Theorem 59.45.2: integral, universally injective, surjective f gives the base-change equivalence of étale categories | Supports the transport along `Y_k̄→Y_(k_s)`, a base change of the universal homeomorphism `Spec k̄→Spec k_s`. SchemeAndStackFoundations §0.23a (`README.md:1508–1591` on main) states the cover-preserving equivalence with exactly this hypothesis; EtaleCohomologyFoundations §F.0.4 (`README.md:248–275`) supplies the sheaf and cohomology transport. |
| §1.9 prime-degree cover and degree-two torsion | Stacks tag 03RQ, Lemma 59.69.1: smooth projective curve over algebraically closed k, n invertible: `H¹=Pic⁰[n]`, `H²=Z/n`, `H^q=0` for `q≥3` | Supports the invertible-prime branch; the roadmap now uses it only for p invertible in k. |
| Smooth curves of affine or positive-genus type | Schmidt 1996, `schmidt-curve-1996 lines 309–336` (printed pp. 243–244), Proposition 15: any field k, connected smooth curve, incomplete or `g(C)>0`; proof reduces to a geometrically connected curve over a separable closure and treats `p=char k` by vanishing in degrees `≥2` | Supports the any-field statement and the constant-field and separable-closure reductions used. |
| Same | Schmidt–Stix 2016, `schmidt-stix-2016 lines 411–417` (printed p. 827), Lemma 2.7(a): a field k, connected smooth curve, affine or positive genus | Supports the statement; (b) keeps characteristic zero for products, as the roadmap does. |
| Separable-closure invariance, any field | Achinger, `achinger-effacement-2014-v1 lines 278–293` (pp. 7–8), Definition 3.3 and Proposition 3.4(c): K(π,1) for the primes invertible on Y; invariance under any field extension | Achinger's statement covers invertible primes only. The roadmap says so and uses only its own finite-separable descent and continuity argument for all finite coefficients; that argument uses no invertibility. Honest attribution. |
| §5.6 Strassmann locator | Kim 2009, `kim2009 lines 1211–1227`, printed pp. 120–121, §3 Comments I: the dimension inequality gives a proper closed image, a nonzero function, and finiteness on residue discs by Theorem 1 | The repaired locator is correct. |
| §0.28 Checks | Kim 2005, Proposition 2 proof, pp. 7–9, as before | The three new Checks are derived examples, recomputed below. |

### Supplier citations resolved at this head

| Citation | Where it resolves | Contract |
|---|---|---|
| SchemeAndStackFoundations §0.23a | main, `README.md:1508` | Universal-homeomorphism étale-site equivalence, cover-preserving, no Noetherian or coefficient restriction. |
| SchemeAndStackFoundations §2.11 | main, `README.md:3656` | Artin–Schreier sequence; affine vanishing for `q≥2`; the `q≥d+2` bound. |
| SchemeAndStackFoundations §4.9 | main, `README.md:5448` | Formal functions and Stein factorisation for proper morphisms of Noetherian schemes. |
| EtaleCohomologyFoundations §F.0.4 | main, `README.md:248` | Sheaf, constant, stalk and cohomology transport along §0.23a's equivalence. |
| AlgebraicCurves Layer 0 | main, `README.md:403` | Function fields, the relative algebraic constant field `k̃`, places. |
| AlgebraicCurves Layer 12 | main, `README.md:1468` | Function-field/scheme dictionary. |
| EtaleCohomologyFoundations §F.2.6 (`VanishingCycles.etaleKunneth`), FiniteFlatGroupsAndIntegralPadicHodgeTheory (`GaloisRep.deRhamSupplierEquiv`), HeightsRationalPointsAndObstructions (`SmoothGroup.formalIdentityChart`), AlgebraicVectorBundles Layers 0A/0B | as in the previous report | The worker's four resolver leads are planned supplier targets, not missing library declarations; unchanged since the previous review. |

Every supplier named above is on main. Ownership of the proper-curve characteristic-p vanishing (Stacks 0A3N) and the `F−1` surjectivity lemma: no roadmap on main cites tags 0A3L/0A3N or Lemmas 59.63.2/59.63.5, and `roadmaps grep` over the 424 open pull requests finds them only in this roadmap (ClassicalAdicEtaleCohomology's hit is an unrelated `F_p`-coefficient Check). SchemeAndStackFoundations §2.11 owns the affine case and the `q≥d+2` bound only, so this roadmap is the owner of the `q≥d+1` proper-curve statement. Ownership against open pull requests whose files the brief does not provide was not checked.

### Pinned declarations opened

The rewritten Layer 0 dependency line (README:3412) names library declarations; the following were located at the pins: `TauCeti.ContCohomology.descendZ1` and `explicitFiniteQuotientCocone1`/`explicitFiniteQuotientTransition1` (`TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteQuotient/Colimit.lean`, `…/Explicit.lean`), `explicitInfl1` (`…/ContCohomology/FiveTerm.lean`), `H1EquivOfSmulEqSelf` and `H2pi_eq_zero_iff` (`…/ContCohomology/LowDegree.lean`), `coe_smul_fixedPoints_of_normal` (`Mathlib/GroupTheory/GroupAction/SubMulAction.lean`), `MulAction.coe_quotient_smul_fixedPoints` (`Mathlib/GroupTheory/GroupAction/OfQuotient.lean`), `IsTopologicalGroup.exist_openNormalSubgroup_sub_clopen_nhds_of_one` (`Mathlib/Topology/Algebra/ClopenNhdofOne.lean`), `Subgroup.quotient_finite_of_isOpen` (`Mathlib/Topology/Algebra/OpenSubgroup.lean`), `QuotientGroup.isQuotientMap_mk` (`Mathlib/Topology/Algebra/Group/Quotient.lean:38`), `IsOpenQuotientMap.prodMap`, `TauCeti.kummerMap_eq_kummerCocycleClass` (`TauCeti/FieldTheory/GaloisCohomology/Kummer.lean`), `CategoryTheory.PreGaloisCategory.autEmbedding_isClosedEmbedding` (`Mathlib/CategoryTheory/Galois/Topology.lean`) and `TauCeti.AbsoluteGaloisGroup`. The additive carriers remain abelian, as the line now says; the nonabelian objects are owned by §0.1 and §§0.16–0.18.

### Adversarial pass

New rows carry computed values; rows for statements the diff leaves untouched are carried from the previous report (its 108-row table, including the exhaustive 7,200-equality `S₃` test), and are listed here for the seeded targets and the headline.

| Statement | Instance | Values on each side | Result/change |
|---|---|---|---|
| §0.28 nonzero obstruction (new Check) | `0→C₃→C₉→C₃→0`, kernel `a↦3a`, identity cocycle, least-residue lift s | `D(2,1)=2+1−s(0)=3`, kernel coordinate 1; inverse convention `−3=6`, coordinate 2. Lifts of 1: 1, 4, 7 with triples 3, 12≡3, 21≡3, so no lift of order 3 | Nonzero class; sign pinned. Retain. |
| §0.28 split obstruction (new Check) | `C₃×C₃→C₃`, `s(g)=(0,g)` | `D(g,h)=(0,g)+(0,h)−(0,g+h)=(0,0)` for all 9 pairs; neutral cocycle with zero lift gives `D=0` in the nonsplit sequence | Zero class. Retain. |
| §0.28 change of lift (new Check) | `s′=(0,4,2)`, `a=(0,1,0)` | `D_s(1,1)=1+1−2=0`; `D_s′(1,1)=4+4−2=6`, coordinate 2; `d¹a(1,1)=a(1)+a(1)−a(2)=2`; in general `D_s′−D_s=3(a(g)+a(h)−a(g+h))` | Same `H²` class. Retain. |
| §1.9 characteristic-p vanishing, affine | `A¹` over `F̄₂`, coefficient `F₂` | `deg(f²−f)=2deg f≠1`, so `[t]≠0` in `H¹=k[t]/(F−1)`; cover `y²−y=t` has `∂_y=2y−1=1≠0`, étale, and `t=y²−y` pulls back to 0; `H^q=0` for `q≥2` by 0A3K | Retain; nonzero `H¹` does not obstruct K(π,1). |
| §1.9 proper supersingular curve | `E: y²+y=x³` over `F̄₂` | Negation `(x,y)↦(x,y+1)` has no affine fixed point, `E[2](k)=0`, p-rank 0; Hasse invariant 0 gives `F=0` on `H¹(E,O)`, so `F−1=−1` is bijective: `H¹(E,F₂)=ker=0` (no connected degree-2 étale cover) and `H²(E,F₂)=coker=0` | Identity cover suffices; invertibility hypothesis of the prime-degree cover is essential. Retain. |
| §1.9 same curve, invertible prime | `F₃` coefficients | `H²(E,F₃)=Z/3` (03RQ, g=1); `Pic⁰[3]` has order 9, giving a connected degree-3 cover; pullback on `H²` is `×3=0` | Retain. |
| §1.9 `F−1` surjectivity | `V=0`; `V=k`, `F=0`; `V=k`, `F=Frob`; `V=F_p` over `F_p` | `0→0`; `−id`, kernel 0; `a^p−a=b` separable of degree p, p roots, kernel `F_p`; `F−1=0` on `F_p`, not surjective | Algebraic closedness necessary; dimension bound `≤dim V` holds. Retain. |
| §1.9 `P¹` control | `P¹` over `F̄_p`, `ℓ≠p` and `ℓ=p` | `ℓ≠p`: `H²=F_ℓ`, `π₁=1`, comparison `0→F_ℓ` not iso; `ℓ=p`: `H¹(P¹,O)=0`, so `H²(P¹,F_p)=0` passes the single test | Full property still fails through `ℓ≠p`. Retain exclusion. |
| §1.9 inseparable transport | `k=F₂(t)`, `k′=F₂(√t)`; `F₄/F₂` | `k′⊗_k k′=k′[x]/((x−√t)²)`, one point: universally injective, equivalence applies; `F₄⊗F₄=F₄×F₄`, two points: not universally injective, `π₁` index-2 inclusion | Retain; matches §0.23a's own `F_(p²)/F_p` Check. |
| §1.9 constant-field reduction | Elliptic `E/F₄` as an `F₂`-curve; positive-genus proper curve over `F₂(t)` | `E×_{F₂}F̄₂=E×_{F₄}(F₄⊗F̄₂)`, two components of genus 1; constant field `F₄` separable of degree 2; `k_s` of `F₂(t)` imperfect, `k̄/k_s` purely inseparable, hence a universal homeomorphism | Retain. |
| §1.9 unramified Riemann–Hurwitz in characteristic p | genus 2, degree 3 étale | `2g′−2=3·2=6`, `g′=4`; étale covers are separable with zero different | Retain. |
| §1.9 prime-degree cover | `g≥1`, p invertible; `g=0` | `|Pic⁰[p]|=p^(2g)≥p²>1`; `Pic⁰(P¹)=0` | Retain. |
| Separable-closure invariance, any field | `k=F_p(t)`, `X=A¹` | A finite étale cover of `X_(k_s)` is finitely presented, hence defined over a finite separable `k₀`; cohomology continuity along the filtered colimit needs no invertibility | Retain. |
| §1.3 Checks (changed) | affine curve over any field; proper positive geometric genus over any field | `A¹_(F̄₂)` and `E/F̄₂` above pass; `P¹` fails | Retain. |
| SF.3–SF.5 contract (changed) | genus under field extension, smooth proper geometrically connected curve | `H¹(X,O)` commutes with flat base change; degree of a divisor is preserved | Retain. |
| §5.6 compact-chart Strassmann | `f(s)=s−a`, `|a|≤1` | `N=1`, one root; locator now §3 Comments I pp. 120–121 | Carried from the previous report; locator repaired. |
| Headline `anabelian_isom` | genus-2 curve, identity versus hyperelliptic involution | induced maps on `H⁰(Ω¹)` are `+I` and `−I`, distinct outer classes; `∃!` is uniqueness within one outer class | Carried from the previous report; re-elaborated here. |
| §0.12 coefficient naturality | trivial `C₂`-action on `C₂` | `Z¹` has 2 elements, `H¹` 2 classes on both presentations | Carried from the previous report. |
| §0.15 additive comparison | abelian `U`, `G=C₂` | gauge orbit of 0 equals `B¹`; comparison bijective | Carried from the previous report. |
| §0.16 quotient descent | trivial cocycle, quotient by `G` | descended value 1, inflated value 1 | Carried from the previous report. |
| §0.25 exactness, normal subgroup | `A₃⊂S₃`, trivial `C₃`-action | 3 domain classes map to 2; classes 1 and 2 coincide | Carried from the previous report. |
| §2.2 unipotent categories | finite-length quotient by `T²` | `Δ(T²)` has `2T⊗T≠0` | Carried from the previous report. |
| §2.8 abelian Kummer | `G_m`, `b=1`, `x=1+p` | Kummer period `log(1+p)` equals the normalized integral of `dt/t` | Carried from the previous report. |
| §2.9 depth-one bridge | proper genus 2 | `dim H¹_dR=4`, `F⁰` of the dual 2, quotient 2 | Carried from the previous report. |
| §3.6 canonical relations | `N=1` | `μ_1=id`, `R_1=0`; an injective map violating the relation/transport equivalence is excluded | Carried; wording change only. |
| §3.11 general Hom | `P¹−{0,1,∞}`, identity; `C×A¹→C` | degree 1, index 1; source dimension 2 to 1 with identity on geometric `π₁` | Carried from the previous report. |
| §4.9 tangential Selmer | `P¹−{0,1,∞}` over Z, tangent base point | no integral point; tangential realization used | Carried from the previous report. |
| §5.2 Coleman charts | `G_m` at 1, `p=3` | `d(log t)/dt=1`, `log 4≠0` | Carried from the previous report. |
| §6.1 mixed extensions and heights | split mixed extension; symplectic `a₁,a₂,b₁,b₂` | both adjacent classes 0, height 0; pairing `(b₁,b₂)=0`, `(b₁+a₂,b₂)=1` | Carried; API wording change only. |
| §6.2 rank obstruction | `g=2`, `ρ=2`, `r=2` or 3 | `2<3` true, `3<3` false | Carried; API wording change only. |
| §7.6 eventual equality | `p=3,5,7` sixth roots of unity | 0, 0, 2 primitive sixth roots in `Q_p` | Carried; identifier wording change only. |

### Shape of the changed passages

The new target “Characteristic-p curve cohomology and inseparable base change” has a statement with hypotheses (smooth connected separated finite-type curve over an algebraically closed field of characteristic p), a proof route, four Checks including a negative control (`F_p` itself) and a `*Needs:*` line. The regeneralised “Smooth curves of affine or positive-genus type” target has three Checks (two positive, `P¹` negative), a `*Needs:*` line that cites only suppliers on main or earlier targets, and locators to Schmidt 1996, Schmidt–Stix and Achinger. The Layer 0 and Layer 1 dependency paragraphs name owned sections and existing library declarations. No process words, pull-request numbers, LaTeX or `lemma` were introduced; the gate's scanners agree.

## Not verifiable

- The passages the diff does not touch were not re-examined; the previous report's unverifiable items stand for them: Hadian's thesis (publisher endpoint 404), Labute 1967 (GDZ catalogue page only), the published Achinger, Serre Chapter V and Stix 2013 locators (uncertified publisher copies), and Kim 2008's published pagination.
- Achinger's published numbering: the roadmap cites the readable arXiv v1 (Proposition 3.4(c), p. 8), verified; the Compositio numbering was not collated.
- Ownership against open pull requests whose files the brief does not supply was not checked.

## Source issues

- none
