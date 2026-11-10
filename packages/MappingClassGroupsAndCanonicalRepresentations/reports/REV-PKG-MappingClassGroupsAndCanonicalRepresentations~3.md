<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13100#issuecomment-6782288816 -->
Review (codex) of d295a92

Verdict: needs_changes

1. **F01** (P1) Low rank does not make arbitrary logarithmic lattices semistable

   **Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:1467`, §5.3: “if `rk E < 2√(g + 1)` then for every parabolic structure refined by the one of `∇`”.

   **Claim:** Arbitrary regular-singular flat bundles, including reducible ones on noncanonical logarithmic lattices, become parabolically semistable on an analytically general nearby curve.

   **Witness:** On an elliptic curve marked at `p`, take `E=O(p)⊕O(−p)` with connection induced by `d`. Residues are `−1,+1`, weights zero, slopes `+1,−1`; rank `2<2√2`, yet the first summand destabilizes every deformation.

   More explicitly, a local frame `z⁻¹` of `O(p)` has connection form `−dz/z`; the frame `z` of `O(−p)` has `dz/z`. On the complement both connections are trivial. The full residue parabolic structure defined using fractional real parts has weight zero, so `par-deg(E)=0` and `µ(O(p))=1>0=µ(E)`. On the universal pointed elliptic family the relative logarithmic connection on `O(D)⊕O(−D)` gives the isomonodromic family; the two degrees remain `+1,−1` on every fibre. Hyperbolicity holds because `2g−2+n=1`.

   LL22 Definition 3.3.1, lines 742–756, permits these integer residue shifts. Corollary 6.1.2, lines 1310–1316, repeats the overclaim. Its proof, lines 1834–1836, uses extensions of constituents of the same slope without establishing that their slopes agree. The earlier review checked agreement with this corollary; agreement does not establish truth.

   **Exact repair:** Keep the general irreducible-monodromy theorem of LL22 Theorem 6.1.1, including its arbitrary compatible parabolic structures. For reducible monodromy, state the conclusion for the canonical Deligne extension with its full residue parabolic structure; its flat irreducible factors all have parabolic degree zero. More generally allow a compatible flat filtration whose irreducible factors have equal parabolic slope, and explain this extra condition. Do not retain “every” coarsened parabolic structure in the arbitrary-monodromy consequence without that condition. In §5.11 use the canonical full parabolic extension of each PVHS factor. Add the example above as a negative-control Check and record the source error.

   **Repair test:** The example is excluded from the irreducible theorem. Its canonical extension is `O²`, residues and weights zero, slopes `0,0`, hence semistable on every fibre. Its original lattice fails the equal-slope condition (`1≠−1`). Thus the repair preserves the valid general theory and removes precisely the exhibited failure.

2. **F02** (P2) The quotient supplier covers only integral schemes

   **Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:866`, §1.4's Needs, and the supplier contract at line 399: “ArithmeticGaloisRepresentations §1.11”.

   **Claim:** This supplier provides the quotient properties used for arbitrary representation schemes, including all connected components, without integrality or reducedness assumptions.

   **Witness:** PR #856, `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1436`, requires an integral affine variety. The package's own `Γ=C₂,r=2,χ=1` Check has coordinate ring `C×C`, with nonzero idempotents `(1,0),(0,1)` whose product is zero.

   The existing earlier owner is PR #1202, `TauCetiRoadmap/LanglandsParameterStacks/README.md:585`, §2.2: it explicitly extends finite generation, closed images, separation and unique closed orbits to reducible and nonreduced affine schemes of finite type. Its dual-number Check is at line 593. LanglandsParameterStacks occurs before this package in the merge order (positions 81 and 291). This is a supplier-scope defect, not a false GIT theorem or a request to narrow representation schemes to integral ones.

   **Exact repair:** Import LanglandsParameterStacks §2.2 in Scope and ownership, Exact supplier contracts, §1.4 and the corresponding dependencies for the general affine quotient assertions. Retain ArithmeticGaloisRepresentations §1.11 for the closed-tuple/complete-reducibility criterion. Do not plan the general quotient extension again or add a gap for it. Carry that import through the §5.8/§8.2 proof route where needed.

   **Repair test:** The trivial conjugation action on the two scalar involutions has invariant algebra `C×C` and quotient the same two points, so both components survive. The same supplier covers the trivial action on `C[ε]/ε²`, retaining the nilpotent. Both fall outside the old integral-only contract and inside the replacement.

3. **F03** (P3) The companion weight formula puts the sheaf on the wrong space

   **Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:1724`: “the weight-one part of `⊕_j H^j(X̄_s̄, A)` is `H¹(X̄_s̄, j_{!*} A)`”.

   **Claim:** The left-hand cohomology is taken on the compactification, although `A` is a lisse adjoint sheaf on the open variety.

   **Witness:** EG18 Lemma 3.4, lines 410–423, uses open-variety cohomology on the left and compactification cohomology of the middle extension on the right. A nontrivial tame Kummer sheaf on `G_m` has no lisse extension to `P¹`.

   **Exact repair:** Introduce `j_s:U_s=X°_s→X̄_s` and write `W₁H¹(U_s̄,A) ≅ H¹(X̄_s̄,j_{s,!*}A)` with the source's unshifted convention. Equivalently retain the direct sum over all degrees, but take it on `U_s̄`, and explain that purity puts its weight-one part in degree one. Preserve geometric base-change bars separately from the compactification bar.

   **Repair test:** In characteristic different from two, the quadratic Kummer character has inertia `−1`, so it cannot extend lisse to the simply connected geometric `P¹`. Its open cohomology and middle-extension `H¹` are zero: the corrected comparison reads `0=0`; the original left-hand expression lacks the stated coefficient sheaf. No change to the integrality theorem is required.

4. **F04** (P3) The auxiliary Artinian map needs a positive index

   **Location:** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:824` and line 836: “`R_n = B_{n−1}[ε]/ε²`”, “`d_n` is injective”; line 829 divides the correction by `n`.

   **Claim:** The auxiliary map and its injectivity Check are stated without specifying `n≥1`, next to a quantifier over all deformation orders.

   **Witness:** At `n=0`, `B₀=C` but `B_{−1}` is outside the nonnegative indexing. Extending the displayed quotient formula gives `B_{−1}=C[t]/(1)=0`, so `d₀:C→0` is not injective and division by `n` is unavailable.

   Natural-number truncated subtraction does not fix this: interpreting `B_{0−1}=B₀` makes the derivative rule depend on the representative (`t=0` in `B₀` but its derivative is `1`).

   **Exact repair:** Define `B_n` for `n≥0`; introduce `R_n`, `d_n`, its injectivity and the correction `id+C t^n/n` only for `n≥1`. The constancy hypothesis can still quantify over all `B_m`, `m≥0`. Add a boundary Check explaining that no `d₀` is used.

   **Repair test:** At `n=1`, `a+bt↦a+bε` is injective; at `n=2`, `a+bt+ct²↦a+bt+ε(b+2ct)` is injective. For every permitted positive index, `n` is nonzero and invertible in `C`. LL24's proof of Proposition 3.2.1, line 920, already runs the correction with `n≥1`.

Four findings: one P1, one P2 and two P3. The acceptance file elaborates, and none of its three admitted theorems is padding. The principal defect is a false semistability assertion, also present in the cited source. The files under review were not changed.

## Previous findings: repair verification

Locations in this table are in `packages/MappingClassGroupsAndCanonicalRepresentations/README.md`. The previous repair report marked all sixteen findings applied; none was marked not actionable. Quotes below identify the actual replacement, rather than accepting the repair report as evidence.

| Previous finding | Current passage and verification | Status |
|---|---|---|
| R01: forbidden supplier | Lines 277–289: “From TauCetiRoadmap.GeometricTopology”; §§1.7.2 and 11.2.1 replace the SurfaceTopology contract. No SurfaceTopology citation remains. The main-branch compact-surface owner was opened. | Repaired. |
| R02: shared topological ownership | Lines 291–315 import MordellLawrenceVenkatesh LV.5; line 313: “the inverse of the twist of GeometricTopology §1.7.2”. §§0.3–0.4 now give convention, pure-group and simultaneous-capping adapters. The earlier owner remains earlier in the order. | Repaired. |
| R03: finite-image arithmeticity | Lines 375–378 import the finite-image criterion; lines 2469–2470: “(1) ⇒ (2) is the finite-image criterion of §IG.1.4”. The duplicate target is absent. | Repaired. |
| R04: unspecified companion inputs | New §5.9a states weights, companions and the pro-semisimple comparison; §§5.10 and the contracts name `gap:curve-companions` and `gap:tame-specialization`. Dri18, Dri12, KP20 and both supplier statements were opened. The new weight argument has the domain error R03 below. | Partly repaired: ownership and mathematical inputs repaired; new formula needs correction. |
| R05: stale inflation names | Lines 239–243: `TauCeti.groupCohomology.HInfRes_exact` and `TauCeti.groupCohomology.mono_HInfRes_f`, with vanishing for `0 < i ≤ n`. Both declarations exist at the pin. | Repaired. |
| R06: nonexistent compactification exports | Lines 415–423: “§6.2 (SNC compactification)” of ResolutionOfSingularitiesCharacteristicZero. The contract states the open embedding, projectivity and strict SNC boundary without invented export names. | Repaired. |
| R07: peripheral inverse exception | Lines 593–601 exclude `(g,n)=(0,1)` and distinguish nonzero peripheral homology from the free-group argument for one puncture. The Check has `c₁=c₁⁻¹=1` on the once-punctured sphere. | Repaired. |
| R08: sphere freeness | Lines 264–265: “not free when `g ≥ 1`”, and “for `g = 0` it is the trivial group, free of rank zero”. The torus and sphere Checks distinguish `Z²` from `1`. | Repaired. |
| R09: projection formula | Lines 357–358: “for a local system `W` of finite free `A`-modules”. The plan has the same qualification. Lines 359–363 calculate dimensions two and one for the nonflat counterexample. | Repaired. |
| R10: duality labels | Lines 1827–1832: evaluation pairs dual labels; compact Poincaré duality “preserves labels”. The order-three matrix Check gives the same explicit matrix on both sides. | Repaired. |
| R11: quotient versus subspace | Lines 2247–2250: “Dualize” to an injection of `I_σ^∨` into open `H¹`, in the dual isotypic component. The shear has no equivariant section; its dual quotient does inject. | Repaired. |
| R12: three moduli fundamental groups | Lines 999–1004 distinguish the stack `SL₂(Z)`, effective orbifold `PSL₂(Z)` and coarse line with group `1`. | Repaired. |
| R13: relative decomposition Check | §4.5's Check now requires finite-order determinant for `U₁=V`; for a pulled-back infinite character it instead uses `U₁=C`, `W₁=χ`. Determinant orders are respectively finite and infinite as required. | Repaired. |
| R14: zero-homology exceptions | Lines 694–697 exclude the disc; §§3.1, 9.1, 9.3, 9.7 and the worked unipotent example distinguish `H≠0` or positive genus/rank from `H=0`. For `F₀`, image size is one and the extension splits. | Repaired. |
| R15: integral uniformization | Lines 1381–1388 give the quaternion algebra `(−1,3)/Q` and distinguish its arithmetic uniformizations from very-general curves. Matrices square to `−I,3I` and anticommute; the rank-two very-general bound is impossible. | Repaired. |
| R16: parabolic definitions | Lines 1395–1424 define filtration, weights, induced structures, degree, positive-rank slope, semistability, coparabolic zero term and Deligne extension. Lines 1470–1474 require the Clifford input to be nonzero and specify its slope. | Repaired. The separate semistability error R01 below survives these repairs. |

The repaired patterns were also sought outside these passages: no stale inflation/compactification names, forbidden SurfaceTopology supplier, universal closed nonfreeness, dual-label Poincaré identification, or unqualified infinite-image zero-homology example remains. The new companion and parabolic passages were reviewed afresh. Earlier computed rows were used only for unchanged statements, not as certification of the source's generality.

## Verified sound

### Coverage, principles and shape

Read the four package inputs, previous review and repair, board-package index, overlap/citation leads, 13 layers and their dependencies. Reviewed all changed mathematical passages, the fifteen seeded targets, all three Lean headlines, and the other statements not supported by an earlier computed row. The table below is the compact review evidence required for the report, not a replacement for the README's target catalogue.

The package develops general surface-group, deformation, Hodge and representation theory; it is not a replanning of a roadmap on main. Shared surface, moduli, quotient, Jordan and representation objects were searched by object in the pins, main roadmaps, board packages and indexed open heads using `roadmaps grep`/`roadmaps show`. R02 is the remaining supplier-scope defect found. The residual obstruction's explicit prime restriction states the range of that obstruction theorem; the surrounding library is not restricted to good primes. Arbitrary finite ramified coefficient extensions remain allowed. No computational algorithm, copied source passage, sorry'd data, `set_option`, source-chapter heading or instruction-following from fetched text was found.

The organization is tied to its dependency chain: cohomology and lifting supply relative local systems; the Hodge rank bound supplies Prym and rigidity; integrality and all-conjugate unitarity supply the unitary case; formal constancy supplies the semisimple case; extension splitting supplies the general theorem. These are mathematical layers, not unconstrained adoption of a book's chapter order. Main-branch FreeGroupsAndLimitGroups, AlgebraicTopology and GeometricTopology were read for shape. Definitions carry prose APIs and discriminating Checks; ordinary theorem sections need not each define another carrier. The repaired parabolic and new companion definitions have their requisite Checks. The source locators and precise hypotheses were inspected with the exceptions and corrections recorded here.

All 35 works in the bibliography have a manifest key; the two new Drinfeld entries are single entries with version-specific arXiv locators. The thirteen settled uncertified works are listed below, not requested again. Metadata is `topic = "math.GT"`. No new source was fetched, no manifest entry was changed, and no content file was edited. The README and Lean file contain no machine paths, job IDs or pull-request numbers. The only apparent unresolved identifier from the supplied resolver, `StableCurves.Mbar`, is an actual supplier target, not a missing pinned declaration.

### Computed adversarial table

`C` means the complex field. A pass means agreement on the displayed inputs, not a proof by examples. All repaired patterns were recomputed; unchanged inherited checks are included only when they have actual values. Boundary cases outside a theorem's hypotheses are marked excluded rather than used to infer its conclusion.

| Statement | Instances tried | Computed values on both sides | Result / change |
|---|---|---|---|
| §0.1 presentation, convention transport | `(g,n)=(0,0),(0,1),(1,0),(1,1),(0,3)` | Relators `1,c,[a,b],[a,b]c,c₁c₂c₃`; groups `1,1,Z²,F₂,F₂`; homology ranks `0,0,2,2,2`. Handle inversion sends the supplier's commutator to `aba⁻¹b⁻¹`. | Pass; sphere exception now present. |
| §0.2 pure action, sampled | One-punctured sphere, two-punctured sphere, one-punctured torus | Peripheral values `1`; homology `1,−1`; homology `0` but free word `[a,b]≠1`, respectively. Inner automorphisms preserve all peripheral conjugacy classes. | Repaired non-inversion proof separates these cases. |
| §0.3 twists/push | Torus, homologous push-offs | `T_a(b)=b+a`, `T_b(a)=a−b`; matrices `[[1,1],[0,1]]`, `[[1,0],[−1,1]]`. Push product `T_a⁻¹T_b` has homology increment `−î(a,x)a+î(b,x)b=0`. | Matches inverse LV convention and positive compact twist. |
| §0.4 capping, sampled | Disc, once-bordered torus, pants, no boundary | Disc kernel `0`; torus kernel `Z`, quotient `SL₂(Z)`; pants kernel `Z³`, quotient `1`; `b=0` kernel `0`, map identity. | Hyperbolic free-kernel range correct. |
| §0.5 finite abelianization | Genus one, two, at least three without boundary | Abelianizations `Z/12`, `Z/10`, `0`; all finite, only the last perfect. | No false perfectness claim. |
| §1.1 transgression | `C₄` over `C₂` versus split `C₂²`; `N=1,G` | Nonzero kernel character extends in the split case (`tg=0`), not in `C₄` (`tg=1∈C₂`). At the endpoints inflation/restriction is identity in degree one. | Pass; higher spectral sequence is not supplied by the three-term pinned lemma. |
| §1.2 finite-isogeny obstruction | Rank one; Klein four in `PGL₂`; `Z⊃2Z` | Rank-one `PGL=1`, kernel `D`; Pauli lifts anticommute, obstruction nonzero, killed on `Q₈`. Square root of `−1` exists in `μ₄`, not `μ₂`; mismatch transgression accordingly `0` or nonzero. | Finite coefficient refinement and prescribed restriction distinguished. |
| §1.3 derivative map | `n=0,1,2` | `C→0` at the formal negative index; `a+bt→a+bε`; `a+bt+ct²→a+bt+ε(b+2ct)`. Last two kernels `0`. | R04, require positive auxiliary index. |
| §1.3 deformation nonexample | `G=N=Z`, trivial rank two | `ρ_t(1)=I+tE₁₂`, determinant `1`, `H¹(Z,sl₂)=sl₂` dimension `3`; not conjugate to constant identity for `t≠0`. Rank-one `ad=0`, fixed determinant forces constant character. | Constancy hypothesis discriminates. |
| §1.4 schemes, sampled | Trivial group; `Z`; `C₂` rank two, determinant one | First quotient a point; unipotent and identity have same quotient but distinct actual classes; last coordinate/invariant rings `C×C`, two components. | Mathematics passes; supplier generality fails, R02. |
| §1.5 Jordan identity | `S₃`, opposite unipotents, reduction modulo `p` | Squares in `S₃` lie in abelian `A₃`. `u^m l^m−l^m u^m=diag(m²,−m²)`, zero over `F_p` iff `p` divides `m`. | Correct identity and prime obstruction. |
| §2.1 finite actual orbit | Rank zero, trivial action, unipotent `Z` | Image size `1`, orbit size `1`; nonidentity unipotent is not conjugate to identity despite identical semisimplification. | Actual-conjugacy predicate excludes GIT stand-in. |
| §2.2 versality, sampled | `(g,n)=(0,3),(1,1)`; map `z↦z²` | Moduli dimensions `0,1`; point family is versal only in the first; derivative of the ramified map at zero is `0`, not an étale chart. | Dominance and étaleness do distinct work. |
| §§2.3–2.4 moduli/point-pushing, sampled | Four-pointed sphere, one-pointed torus, three-pointed sphere family | `π₁(M₀,₄)=F₂`; stack/effective/coarse torus groups `SL₂(Z),PSL₂(Z),1`; fibre sequence `1→F₂→F₂→1`. | Passage with extra point uses `PMod(g,n+1)`; source typo avoided. |
| §§2.5–2.7 fundamental groups | Squaring on `C*`, dense open, point inclusion; base pullback | Images `2Z` (index `2`), all target group (index `1`), `0⊂Z` (infinite index); pulled-back system has fibre orbit/image `1`. | No assumed `π₂(M)=0`; universal family gives injection. |
| §3.1 closure, sampled; §9.1 | Unipotent on `H⊕C`, `dim H=2`, versus `H=0` | Socle `H`, quotient `C`; quotient kernels `span(e₁+k e₂)` form infinitely many distinct lines. At `H=0`, socle is all `C`. | Characteristic/socle transport valid; arbitrary quotient claim absent. |
| §§3.2–3.3 point-pushing, characters | Symplectic representation; genus-zero character `2,1/2`; torus shears | Point-pushing restriction `1`; genus-zero pure orbit `1` but image infinite; torus finite shear orbit forces `λ^k=μ^l=1`. | Positive genus needed and retained. |
| §3.4 projective uniqueness | `Q₈×C₂` with irreducible two-dimensional fibre | Projective centralizer is `V₄`: four arbitrary extensions on `C₂`; actual intertwiner class for trivial action is `1`. | Correct uniqueness only for exact intertwiners. |
| §§4.1–4.3 pointed lifting | Squaring map on `G_m`, `μ₂` class; rank-one finite character | Pullback multiplies `H¹(Z,μ₂)` by `2`, giving `0`; prescribed fibre character remains that character, not its finite twist. | Base point `1` survives; finite obstruction and positive genus explicit. |
| §4.4 normal restriction | `ρ(n,k)=2^kσ(n)`; `N=G` | Fibre finite/unitary, total determinant includes `2^{kr}`, total image infinite and norm scales `2^k`; when `N=G`, restriction equals total. | Finite determinant excludes counterexample. |
| §4.5 decomposition | Pulled-back infinite character, zero system | Correct `U=1,W=χ`, determinant orders `1,∞`; zero system has zero summands. | Repaired finite-determinant Check. |
| Direct-image gap | `A=C[x,y]/(x,y)²`, multiplication monodromy `1+x` | `ker x=(x,y)`, dimension `2`; tensor with `A/m` leaves dimension `2`, but invariants after tensor have dimension `1`. For `W=A`, both are `(x,y)`. | Finite-free condition in both declarations repairs failure. |
| §5.1 integrality | Quaternion matrices; very-general genus-two curve | `i²=−I`, `j²=3I`, `ij=−ji`; arithmetic norm-one subgroup integral and infinite. Very-general bound would demand `2≥2√3`, false. | Repaired distinction passes. |
| §5.2 parabolic definitions | Weights `a,1−a`; trivial line; `O⊕O(1)` | Degrees `−1+a+1−a=0`; coparabolic term `O(−D)` has `h⁰=0` for `n>0` versus `h⁰(O)=1`; destabilizing slopes `1>1/2`. | Sign, zero-weight term, induced weights and positive rank discriminate. |
| §5.3 semistability, sampled | Elliptic `O(p)⊕O(−p)`; canonical replacement | Rank `2<2√2`; full fractional weights `0,0`; subbundle slope `1>0`. Canonical replacement `O²` has slopes `0=0`. | False as written, R01. |
| §5.3 Clifford bound | `g=0,D=0,E=O`, `U=0` | Slope `0>−2`, `c=1,δ=1`, so `1>−1`; zero bundle has undefined slope and is excluded. | Repaired input has meaningful slope/zero term. |
| §§5.4–5.6 Hodge/rank headline | Trivial coefficients, `g=3,n=0` or `n=2`; nontrivial Kummer line | Closed `H¹` rank `6`, lower bound `4`; two punctures add weight-two quotient rank `1`; Kummer inertia has no invariants, `j_*=j_!`, boundary weight-two part `0`. | Subspace bound does not apply to boundary quotient. |
| §5.5 derivative | `E=O`, nonzero differential on genus `g≥3` | Multiplication on `H⁰(ω)` is injective, rank `g`; inequality `1≥g−g=0`. In genus zero right side nonpositive. | Trace/multiplication conventions consistent. |
| §5.7 Artinian headline | `g=3`, ranks `1,2,3`, zero coefficients | Strict inequalities true,true,false; invariant-section conclusion `0` in first two; zero coefficients give `0`. Product inference for positive integers `u,w`: `w+2u≥2g` forces `uw≥g`. | Finite-free projection input retained. |
| §§5.8–5.9 deformation and rigidity | Uniformizing rank two; `g=4,r=2`; reducible trivial fibre | Uniformizing `dim H¹(ad)=6g−6>0`; low-rank adjoint `3<4`; reducible fibre `1⊕1` has trace-zero endomorphism invariants dimension `3`. | Rigidity hypothesis is substantive; reducible Schur shortcut excluded. |
| New §5.9a companions | `Spec F_q`, finite character, Frobenius scalar `q` | Completion is profinite `Zhat`; finite-character weight/slope `0,0`. Scalar `q` has weight `2`, slope `1` at `p`; twist by `q⁻¹` gives `0,0`. | Determinant/admissibility condition is necessary. |
| New §5.9a group-valued comparison | `SO₄` rotations `(π/2,±π/3)` | Same faithful polynomial `(x²+1)(x²−x+1)`; self-dual exterior-square traces `1−√3` versus `1+√3`. | One faithful polynomial does not determine group conjugacy; full comparison required. |
| New §5.10 step 4 | Quadratic Kummer on `G_m`, characteristic not two | Boundary inertia `−1`, no lisse extension to `P¹`; open weight-one and middle-extension cohomology both `0`. | Corrected formula `0=0`; R03. |
| §5.10 hypotheses | `GL₁` character with monodromy `2`; finite character | Derived adjoint `0`, but `2⁻¹` nonintegral; finite character and its inverse are algebraic units. | Quasi-unipotence and finite abelianization cannot be dropped. |
| §5.11 all-conjugate unitarity | Salem polynomial `x⁴−x³−x²−x+1` | `y=x+x⁻¹` gives `y²−y−3=0`; root moduli `1,1,about 1.722,about 0.581`. | A single unitary embedding is insufficient; uses canonical case after R01. |
| §6.1 Prym and duality | Identity cover of pants, closed genus two, order-three action | Open/compact dimensions `2/0`, closed dimension `4`. For `A=[[0,−1],[1,−1]]`, `J⁻¹A⁻ᵀ=AJ⁻¹=[[-1,0],[-1,-1]]`; `A³=I`. | Compact carrier and label-preserving duality agree. |
| §§6.2–6.4 cover comparison | Trivial genus-zero cover; double cover genus-two once-bordered surface | Compact fixed space `0`; Euler characteristic `−6=2−2g′−2` gives `g′=3`, open `H¹` dimension `7`. Boundary replacement keeps `g′=3`. | PW vacuity/compactification correct. |
| §6.6 sampled; §§6.5–6.8 headline | `S₃,Q₈,C_m`, `g=3` | Squared degree sums `1+1+4=6<9`, `1+1+1+1+4=8<9`; lower bounds `4,2`. Cyclic irreducible degrees all `1`; at degree `g`, lower bound `0`. | Degree, order and individual isotypic statements distinguished. |
| `putmanWieland_of_card_lt` | `g=0,1`; `g=2,H=1`; infinite relative index | `#H≥1`, so first hypotheses impossible; genus-two carrier dimension `4`, invariant part `0`; infinite relative index has value `0`, expressly excluded. | Lean statement is substantive and correctly scoped. |
| §§7.1–7.3 multitwists/boundary | `A₃⊂S₃`, character `ω`; unipotent twist | Restricted induction `ω⊕ω²`, not two copies of `ω`; unipotent eigenvalues `1` so semisimple order `1`. | Original summand rather than false whole restriction identity is used. |
| §7.4 projective integrality, sampled | `g=8,r=2`, and rank one | `r²=4<9`, adjoint rank `3<8`; `PGL₁=1`. | Rigidity then quasi-unipotence then KP20 integrality; no reversed dependency. |
| §§7.5–7.7, §7.6 sampled | `g=8,r=2`; rank-one torsion | Hodge threshold `2√9=6`, hence `2<6`; roots of unity have every absolute value `1`. Integral matrices in all compact conjugate groups form a finite set. | All embeddings required; rank-one and small genus treated separately. |
| §8.1 formal constancy, sampled | `r=1`; `g=4,r=2` | Fixed determinant itself fixes rank-one character; in rank two `ad` rank `3<4`, invariant `H¹=0`; the `Z` unipotent family instead has dimension `3` and is excluded. | Formal theorem matches source and actual matrices. |
| §§8.2–8.3 connected constancy | Nonreduced point; reducible connected curve; unipotent family | Dual numbers have one closed specialization; intersecting curves share the same actual fibre class; `I+tE₁₂` has classes `I` at zero and nontrivial unipotent elsewhere. | Closed orbit alone is insufficient; formal constancy supplies missing condition. R02 fixes general scheme input. |
| §9.2 splitting | `a=b=1,g=4`; shear quotient | `ab=1<5/4`, rank lower bound `6>1`. No fixed lift of quotient vector since `(x,1)→(x+1,1)`; dual quotient covector is fixed. | Dual injection repair valid. |
| §9.3 / `mcgFinite_finite_image` | `g=0,1,3,4`, rank zero; closed orientation extension | Allowed ranks `0`; `0,1`; `0,1`; `0,1,2`; rank-zero image size `1`. Orientation extension has index at most `2`. | Actual orbit and strict bound match prose. |
| §9.4 fibral headline | Base-pulled system; genus-three finite character | Fibre image `1` even for infinite base image; rank-one inequality `1<4`. | Fibral conclusion does not assert total finiteness. |
| §9.5 isomonodromy, sampled | Trivial hyperbolic connection; unmarked torus | Orbit size `1`, algebraic constant deformation; torus hyperbolicity expression `0`, excluded. | Mildness and the source's semisimplicity condition are respected. |
| §§9.7–9.8 / free headline | `N=0,1,2,3`; tuple `(1,2)`; third roots | Allowed ranks `0,0,≤1,≤1`; repeated Nielsen shear gives `(2^k,2)` infinitely many; third-root tuples lie in a set of size `9`. | No padding or rank-one counterexample inside range. |
| §§9.9–9.10 characteristic/total consequences | Abelianization quotient; scalar extension `2^k` | Pullback image unchanged; `GL_N(Z)` shear forces torsion characters. Without finite determinant total scalar image is infinite while fibre image remains finite. | Characteristicity and determinant retained. |
| §10.1 sampled; §§10.2–10.3 headline | Trivial system, finite cover descending over degree `d`, nonreal order-three character | Orbit sizes `1,≤d`; image `μ₃`; integral lattice over `Z[ζ₃]`, no rank-one `Z` lattice. Dense topological restriction has same finite image. | Genericity, arithmetic action and all embeddings retained; imported finite-image direction. |
| §10.4 wider Hodge range | `g=2,r=2` | Square-rank condition `4<3` false, Hodge condition `2<2√3` true. | Distinct stronger hypothesis gives wider rank range, not an illicit inference from §10.2. |
| §§11.1–11.4 residual headline | `g=4,r=2`; primes dividing/not dividing `m`; rank one | `4<5`; commutator discrepancy `±m²` survives exactly when `p∤m`; rank-one commutator `1`. | Arbitrary finite ramification does not change residue obstruction. |
| §§11.5–11.6 | Nonabelian `F₂` versus torus; `Z_p[[x]]/(p)` | Opposite unipotents fail the identity; torus commutators all `1`, torsion characters dense. Ring generic fibre `0`, not flat, yet a hypersurface/complete intersection. | Correct source exceptions and conditional deformation-ring conclusion. |
| §12.1 unipotents | `F₀,F₁,F₂` | Matrices `1`, `I₂+E₁₂`, `I₃+E₁₃,I₃+E₂₃`; image sizes `1,∞,∞`; split iff homology map zero. | Repaired zero cases consistently applied. |
| §§12.2–12.4, §12.3 sampled | Genus-two primitive quotient; `F₂` augmentation; closed torus; Morita restriction | Primitive quotient dimension `4−4=0`; `I/I³` dimension `2+4=6`, `a⊗b−b⊗a≠0`; torus commutator `0`, log `x−x²/2` splits; Morita coefficients at genera two, three `−2,−4`. | Nonsplit range and nonzero rescaling denominator correct. |
| §12.5 genus-one classification | `D=diag(λ,λ⁻¹)`, `J=[[0,1],[-1,0]]` | `J²=−I`, `JDJ⁻¹=D⁻¹`, trace triple `(λ+λ⁻¹,0,0)`; finite signed-permutation orbit, infinite image for nontorsion `λ`. | “Dihedral” is the source's torus-normalizer convention, not a claim `J²=I`. |
| §12.6 sampled rank-two theorem | `g=2,3,4`; determinant order `m` | `4<g+1` false,false,true; separate rank-two theorem covers all three. Root twist has finite order dividing `2m`. | Does not claim the low-rank theorem alone covers genera two and three. |
| §§12.7–12.9 range examples | `F₁` nontorsion character; punctured-sphere character `2,1/2,1,1` | `Out(F₁)` orbit `{λ,λ⁻¹}` size `2`, image infinite; sphere local classes fix rank-one representation, orbit `1`, image infinite. | Outside positive-genus low-rank hypotheses; quantum examples have higher rank. |

### Seeded source verification

Page numbers refer to the manifest's preprint versions unless the source is a book or printed scan. Primary text was read for thirteen of the fifteen sampled targets. The two FM12 book samples remain expressly uncertified; their supplied roadmap interfaces and examples were checked independently. No unread page is described as verified.

| Sample | Locator actually opened | Result |
|---|---|---|
| 0.2 Pure mapping class groups | FM12 §8.2 is uncertified; current TeichmullerGeometry §5.2 and MordellLawrenceVenkatesh §5.9 were opened. | Peripheral-preserving automorphisms, based action and closed orientation index agree; exceptional trivial peripheral corrected. Book theorem/page not certified. |
| 0.4 Capping boundary circles | FM12 Theorem 3.18 / Proposition 3.19 uncertified; LL24 Lemma 7.2.5, lines 1496–1507, p.36, and current MLV §5.21. | Pure simultaneous capping and excluded disc consistent. Package uses covering genus `g′`, avoiding source typo. |
| 1.4 Representation schemes | Sik12 Theorem 30, lines 572–586, pp.12–13. | Closed orbit iff complete reducibility supports the complex semisimple criterion. General quotient supply still needs R02. |
| 2.2 Punctured étale-versal families | LL24 Notation 1.10.1, lines 432–447, pp.10–11. | Smooth proper curve, disjoint sections, smooth base and dominant étale classifying map match. |
| 2.4 Moduli/point-pushing | LL24 Lemma 2.0.1, lines 503–521, p.12. | Diagram supports comparison; source's prose drops `+1` in the total-space group while its diagram retains it. Package has correct extra marking. |
| 3.1 Closure properties | LL24 Proposition 2.1.1, lines 525–529, p.12; LL19 Lemma 2.2.1, lines 296–314, pp.7–8. | Semisimplification/constituents, tensors and sums supported. Characteristic socle transport does not assert closure under arbitrary nonsplit quotients. |
| 5.3 Isomonodromy | LL22 Definitions 3.4.3–3.4.4, lines 821–833, p.22; Theorem 6.1.1 / Corollary 6.1.2, lines 1296–1316, pp.34–35; Proposition 6.3.6, lines 1538–1546, p.41. | Locator correct; source itself has the R01 reducible-lattice error. Positive-rank Clifford input and coparabolic notation now agree. |
| 6.6 Putman–Wieland small degree | LL24 Corollary 7.2.3, lines 1481–1487, p.36. | Every irreducible degree strictly below `g`; compact carrier and all boundary/puncture counts match. |
| 7.4 Projective integrality | LL24 Lemma 8.3.3, lines 1643–1672, p.40; KP20 Theorem 1.2, lines 62–74, p.2. | `PGL` abelianization trivial, rigidity and quasi-unipotence present before integrality. |
| 7.6 All conjugates unitary | LL24 Proposition 8.4.1, proof lines 1710–1725, p.41. | Strong rigidity and finite determinant survive coefficient automorphisms; nearby general fibre plus unchanged monodromy gives each conjugate unitary. |
| 8.1 Formal constancy | LL24 Lemma 8.5.1, lines 1735–1745, p.42. | Fixed determinant, unitary central fibre, strict rank bound and actual conjugacy over `C[[t]]` retained. |
| 9.5 Algebraic isomonodromy | CH19 Theorem A, lines 174–180, p.4; LL24 Corollary 1.2.3, p.3. | Hyperbolicity and mildness, semisimplicity when rank exceeds two, and finite orbit versus algebraization agree. Low-rank finite image supplies the needed semisimplicity. |
| 10.1 Generic orbit comparison | LL24 proof of Theorem 9.1.2, lines 1945–1980, pp.46–47. | Generic moduli image supplies the finite-index Galois/monodromy comparison; density uses continuous representations. |
| 12.3 Augmentation extension | LL24 Example 10.1.6(2), lines 2137–2143, p.51. | Source needs low-genus correction; roadmap excludes the split once-pointed-torus case and uses the nonabelian range. |
| 12.6 Rank two | LL24 Remark 10.2.2, lines 2192–2201, p.52; BGMW17 Theorem A, lines 53–55, p.2; CH19 Theorem B, lines 268–274, pp.6–7. | Semisimple `SL₂` case and reducible rank-two case together support all rank-two `GL₂` classes after finite determinant twisting. |

Additional new-source checks: Dri18 §§1.1–1.4 (lines 111–184, pp.3–4), Proposition 2.3.3 (lines 447–459, §2.3), Theorem 5.1.1 and Remark 5.1.2 (lines 1164–1181, p.25); Dri12 Theorem 1.1/Remark 1.2 and §1.2 (lines 20–50, pp.1–2); KP20 §§4–6 (notably lines 390, 407, 449, 567, 632, 666–761); EG18 Lemma 3.4 (lines 410–423, pp.10–11). The pro-semisimple morphism descends modulo identity-component conjugacy; it is not inferred from a single faithful trace polynomial. Curve companions and tame specialization have explicit earlier suppliers and matching gaps. No new unidentified input was found in that route after these contracts, apart from R03's wrong cohomology domain.

### Lean acceptance, signatures, headline coverage and padding

Ran the prescribed `lake env lean` from the content checkout on `packages/MappingClassGroupsAndCanonicalRepresentations/Suggested.lean`. Exit status zero; the only warnings were `declaration uses sorry` at lines 160, 175 and 184. The sole import is `import Mathlib`; there are no Tau Ceti object files to build.

A separate scratch copy with `#check @name` for all eleven declarations elaborated. Seven definitions, the Group instance and three theorems retain the needed parameters. The Prym theorem keeps the finite group, surjection, subgroup containment, nonzero relative index and fixed-class hypothesis. The two image theorems keep actual-conjugacy orbit finiteness and the strict numerical bounds; the free theorem keeps `N=2g` or `N=2g+1`. No binder was lost; no signature changed.

On that copy each admitted theorem was tested with `simp`, `rfl`, `infer_instance`, `exact Subsingleton.elim _ _`, and `exact Set.toFinite _`, separately under `fail_if_success solve`. All fifteen attempts failed to close their goal; the complete probe file then elaborated with only the three expected sorry warnings. The fixed-class conclusion is not a globally subsingleton cohomology assertion (the genus-two trivial-cover carrier has dimension four); finite conjugacy orbit is not finite representation image. Library near-matches do not supply any of these three results. No padding deletion is required.

| README headline (summary and end theorems) | Suggested.lean disposition |
|---|---|
| Canonical finite-image theorem | `mcgFinite_finite_image`, line 175. |
| Free-group/Nielsen finite-image theorem | `freeGroup_finite_image`, line 184; `FreeGroup.lift` supplies the tuple dictionary. |
| Small-group Putman–Wieland | `putmanWieland_of_card_lt`, line 160; the explicit compact cohomology submodule kills all conjugate peripheral powers. |
| Sub-local-system rank bound; Artinian invariant vanishing; finite fibral monodromy | Docstring lines 28–33 names each and the missing pointed-curve family/higher-direct-image carriers. |
| Higher Prym bound and individual isotypic orbit theorem | Docstring lines 34–37 names missing geometric deck/stabilizer cohomology action. It is not replaced by an arbitrary representation. |
| Algebraic isomonodromy | Docstring lines 38–39 names missing family/logarithmic connection/isomonodromy carriers. |
| Generic arithmetic finiteness, Hodge characterization and residual nonlifting | Docstring lines 40–43 names missing étale moduli/fundamental-group and PVHS carriers. |

All explicitly attributed local backticked names resolve to these ten named declarations; the eleventh declaration is the generated Group instance. The namespace does not collide with an inspected supplier. Rank-zero matrix units form the trivial group, so the two finite-image signatures intentionally include rank zero; the irreducible geometric steps use positive rank separately.

### Pinned declarations opened and compared by object

Pins read from `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Paths here are library-relative. Where the native definition lacks a property, that omission was checked rather than inferred from its name.

| File and line at pin | Verified contract |
|---|---|
| `Mathlib/AlgebraicTopology/FundamentalGroupoid/FundamentalGroup.lean:44` | Multiplication traverses the right loop first; push and commutator conventions account for this. |
| `Mathlib/GroupTheory/PresentedGroup.lean:42`, `Mathlib/GroupTheory/FreeGroup/Basic.lean:666` | Normal-closure presentation and `FreeGroup.lift` generator-assignment equivalence; neither supplies the topological comparison. |
| `Mathlib/GroupTheory/Index.lean:62`, line 712 | `relIndex` is subgroup index; nonzero is equivalent to finite relative index, with infinite index represented by zero. |
| `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:43`, `Projective.lean:46` in that directory | Matrix units and projective quotient, including the empty matrix index type. |
| `Mathlib/RepresentationTheory/Irreducible.lean:29`, line 65; `Mathlib/RingTheory/SimpleModule/Basic.lean:500` | Simple module predicate and bijective-or-zero intertwiner theorem. Complex scalar Schur uses finite dimension and algebraic closure. |
| `Mathlib/RingTheory/SimpleModule/Isotypic.lean:182` | Supremum of submodules isomorphic to the specified simple module; distinct from the multiplicity space. |
| `Mathlib/RepresentationTheory/Induced.lean:77` | Induction through coinvariants; the original normal-subgroup character is a summand of restricted induction, not the whole restriction. |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean:402` | Three-term `H1InfRes_exact`, not the five-term transgression sequence. |
| `TauCeti/AlgebraicTopology/LocalCoefficient.lean:46`, lines 78, 367 | Functor from the fundamental groupoid to modules, pullback and monodromy on the actual fibre. No finite-rank or flatness condition is built into the carrier. |
| `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59` | `IsAspherical` includes `PathConnectedSpace X` and higher homotopy vanishing. This corrects the previous report's description, which omitted its connectedness conjunct. No CW structure is part of this predicate. |
| `TauCeti/RingTheory/SimpleModule/Socle.lean:42`, line 57 | Supremum of simple submodules and semisimplicity of the socle. |
| `TauCeti/RepresentationTheory/Continuous/InvariantComplement.lean:190` | `ContRepresentation.IsUnitary.isSemisimpleRepresentation` under finite dimension and continuity. The arbitrary discrete group application is valid; no compactness of the group is inferred. |
| `TauCeti/RepresentationTheory/CharacterTable/Table.lean:294` | Sum of squared irreducible degrees is group order under algebraically closed coefficients with invertible order; complex coefficients satisfy this. |
| `TauCeti/RepresentationTheory/Homological/GroupCohomology/InflationRestriction.lean:132`, line 139 | Correct injectivity/exactness names and lower-degree vanishing hypotheses; at `n=0` the latter are empty. |
| `TauCeti/RepresentationTheory/ProjectiveRepresentation/Basic.lean:97`; `PGL/Basic.lean:59`, line 182; `SchurMultiplier.lean:149`, line 270; `Extension.lean:343` in that directory | Normalized factor sets, PGL maps/lifts, cohomology obstruction, linearization criterion and extension equivalence. Faithful scalar action in the equivalence is satisfied by the positive-rank complex use. |
| `TauCeti/GroupTheory/GroupExtension/Character/Basic.lean:55`, line 90 | Character transgression and extension criterion for factor-set extensions with **commutative kernel**. This near-match does not supply the package's arbitrary nonabelian-kernel five-term sequence or its degree-two filtration. |

Searches by surface presentation, compact/peripheral cohomology, finite conjugacy orbit, projective obstruction, transgression, socle/isotypic action, unitary semisimplicity and invariant affine quotients found the owners recorded here. None of the three accepted-signature targets is already proved by a pinned declaration. Native Scheme, PowerSeries, Matrix, representation and free-group carriers used by the signatures/README exist at these pins.

### Cross-roadmap resolution, overlap and supplier order

The current main/head copies were used, including every cited section and Needs line; the provided package index was read before making ownership judgments. The following table records resolved contracts. Open-roadmap numbers identify the inspected head in this report only; they are not proposed README citations.

| Supplier / other open roadmap | Resolved location and result |
|---|---|
| FreeGroupsAndLimitGroups, main | `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:1461`, 1492, 1510: §§6.1, 6.1a, 6.2. §6.1a expressly does not require the topological fundamental-group comparison, so this package owns that adapter, not a second presentation theorem. |
| GeometricTopology, main | `TauCetiRoadmap/GeometricTopology/README.md:1049`, 1212, 7817: §§1.7, 1.7.2, 11.2.1. Compact classification, twist and smooth/topological comparison match the replacement contract. |
| MordellLawrenceVenkatesh, #1231 | `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md:1710`, 1747, 1784, 1816–1943, 1966–1977: §§5.1, 5.4, 5.7, 5.9–5.13, 5.15–5.17, 5.19–5.21. Surface, twist, evaluation, Birman and capping ownership imported with inverse twist convention. |
| TeichmullerGeometry, #1169 | `TauCetiRoadmap/TeichmullerGeometry/README.md:449`, 471, 483, 495, 595, 608, 661: §§2.4, 3.1–3.3, 5.1, 5.2, 5.6. Closed genus-at-least-two theory does not duplicate the pointed punctured adapter. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3422`, 6039, 6044, 6046, 6102, 6106, 6127, 6232: Leray, `StableCurves.Mbar`, smooth/forgetful maps, level covers and projective compactification. Resolver's Mbar lead is a false positive against a planned supplier target. |
| ComplexCurveModuli, main | `TauCetiRoadmap/ComplexCurveModuli/README.md:47`, 51, 97, 119, 192, 215: D0.4–D0.5, D3.4's Kodaira–Spencer map, D5, D7, D8. Stable marked atlases/universal curve and analytic stack adapter are imported. |
| ComplexComparisonPartII, #848 | `TauCetiRoadmap/ComplexComparisonPartII/README.md:3257`, 4438, 4680, 4741, 4853, 4896: C5.2, C5.6, C6.0–C6.3. Finite coefficients in C6.1 do not already provide the complex/Artinian direct-image gap. Canonical residue-strip sign matches §5.2. |
| InverseGaloisAndArithmeticFundamentalGroups, #850 | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:1299`, 1401, 1421, 1438, 2637, 2690, 5920: IG.1.2–IG.1.4, IG.3.1, IG.5.4. Prime-to-p specialization, finite-image arithmeticity, family exactness, Artin neighborhoods, density and specified-monodromy versal refinement resolve. Full tame surjection is the declared gap. |
| ArithmeticGaloisRepresentations, #856; LanglandsParameterStacks, #1202 | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1436`, 1496; `TauCetiRoadmap/LanglandsParameterStacks/README.md:581`, 585, 593. Integral GIT/closed tuples versus general affine extension: R02. |
| FiniteGroupInvariants, #1708 | `TauCetiRoadmap/FiniteGroupInvariants/README.md:1646`, §10.5 supplies the Jordan bound and normal-abelian-index theorem; factorial identity is a consequence here. |
| LocalGaloisDeformationRings, #923; DeformationAndDerivedPatchingAlgebra, #1034 | Current F.1.1–F.1.7, F.2.1/F.2.3/F.2.5/F.2.9 resolve arbitrary profinite deformation and fixed determinant interfaces. `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:914`, 943 supplies valued points/generic fibres (§§4.2,4.4). Universal ring existence remains conditional. |
| ResolutionOfSingularitiesCharacteristicZero, main | `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:893`, §6.2: SNC compactification supplies all three properties actually used. |
| AutomorphicLFunctionsAndLocalFactors, #924 | `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2054`, 2064, AL.3.10.13–14: all-level GL correspondence and pure realization. Local-compatible companions are the additional declared contract, not supplied silently. |
| DeligneWeightsAndPurity, #929 | `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:1565`, 2196, 2562, 2718: §§5.5, 7.8, 8.14, 8.19. Rank-one twists, weight bounds, reductive geometric monodromy and geometric semisimplicity resolve. |
| AlgebraicTopology; DGFloer; UniversalCovers; ClassifyingSpaces, main/completed | Stages 1,2,5,6; DGFloer Layer 1 item 2; completed cover/deck classification; `TauCetiRoadmap/ClassifyingSpaces/README.md:238` Stage 4 item 17 supplies local-coefficient group cohomology comparison. These do not construct the package's finite-cover stabilizer action. |
| HodgeStructures; ComplexKahlerGeometry, completed/main | Fibrewise pure/mixed/polarized structures; K4–K5 bundles, Hermitian metrics, Dolbeault and Serre duality. K4/K5 numbering is explicitly mapped to current Layers 4/5 in the supplier; no drift finding. |
| RepresentationTheory, main | `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md`, Layer 2, and `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md`, Layer 7: finite-group isotypic and factor-set interfaces. Arbitrary-group Schur is taken from the pins. |
| GroupActionsOnRiemannSurfaces, #1728 | `TauCetiRoadmap/GroupActionsOnRiemannSurfaces/README.md:337` already imports MLV §§5.9/5.21. Its ownership is finite surface actions/Hurwitz geometry, not these canonical representation results. |
| SheafConvolutionOnAbelianVarieties, #1809 | `TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/README.md:8`, Scope: abelian-variety convolution/microlocal theory, not surface-group orbit finiteness. |
| GlobalShtukasAndFunctionFieldLanglands, #1490 | §6.2 owns curve companions in its direction but lies later in the order. The package correctly gives its curve companion gap to the earlier AL.3 owner and owns the higher-dimensional comparison here. |

The supplied head-based overlap facts show no other PR changing this roadmap, no dropped cited IDs, no revision-only cited IDs and no conflicting head requiring an order. The five closest open roadmaps were inspected by scope and ownership as above; no mutually assigned object remains among them. R02 identifies an additional earlier general quotient owner found by object search. The remaining roadmap targets are representation/family adapters or the particular rank and orbit theorems, rather than duplicate declarations of those owners.

The exact prescribed dependency check completed with:

```text
depcheck: 236 roadmaps, 2149 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. The manual scope check still finds R02, which an edge-only check cannot detect. No merge-order file was changed.

All three declared gaps have identical slugs and named suppliers in `design/plan.json` and the README: `local-system-direct-images` / ComplexComparisonPartII C6.1, `curve-companions` / AutomorphicLFunctionsAndLocalFactors AL.3, and `tame-specialization` / InverseGaloisAndArithmeticFundamentalGroups IG.1.3. They specify coefficients, hypotheses and compatibility rather than an unowned placeholder. Each is one mathematical interface with its necessary compatibility clauses. The finite coefficient, GL correspondence and prime-to-p statements currently present are strictly weaker. No gap has supplier `none`; none is counted as a finding. An eventual acceptance would be conditional on these three contracts.

## Not verifiable

These thirteen source texts are settled uncertified; no new request was made and none was treated as read:

- FM12: the primary Dehn–Nielsen–Baer, capping, twist and Birman book pages, including the two sampled targets §0.2 and §0.4. The current named roadmap contracts and numerical examples were verified, not the book pages.
- MS80 Theorem 4.1 and Del70 Remarques 5.5(i): primary parabolic correspondence and canonical-extension pages. Accessible LL22/LL24 and the supplied canonical-extension interface corroborate the stated conventions.
- SZ85 §4.19, PS08 Theorem 14.52 and Tim87 Theorem 7.1: primary fixed-part/mixed-Hodge references.
- Deb01 Lemma 4.19: dominant-map finite-index primary locator.
- CR62 Theorem 36.13 and Wat89 main theorem: primary Jordan/two-generator references.
- Nie24 and MKS04 Theorem 3.2, p.131: primary Nielsen generation references.
- Mor93: the Johnson-extension paper's internal proof/locator. Mor89 is a different readable paper and does not certify Mor93.
- Kat96: the primary rigid-local-system book locator.

There is no outstanding Lean execution or missing accessible-source request. Supplier targets are contracts checked for existence, scope and direction; this review does not claim their future proofs are implemented. The false LL22 assertion is reported despite its accessible text, not classified as unverifiable. No acceptance is claimed for the package while the four repairs remain.

## Source issues

- **Error** in LL22 at Corollary 6.1.2, printed p.35: the source says arbitrary low-rank logarithmic lattices become parabolically semistable; it should require irreducibility or an equal-parabolic-slope flat filtration, including canonical full residue extensions; affects a stated result.
- **Gap** in LL22 at proof of Corollary 6.1.2, §6.4.10, printed p.49: the source says reduction to irreducible monodromy follows from equal-slope extension closure; it should first ensure the constituent parabolic slopes agree; affects the proof.
- **Misprint** in LL24 at §3.2 before Proposition 3.2.1, printed p.21: the source says the auxiliary derivative map is injective without restricting its index; it should specify positive indices, as the proof does on p.22; affects a stated result.
- **Misprint** in LL24 at Lemma 2.0.1, printed p.12: the source says the total universal-curve fundamental group is the mapping class group with n markings; it should have n+1 markings, as its diagram does; affects a stated result.
- **Misprint** in LL24 at Lemma 7.2.5, printed p.36: the source says boundary replacement changes the covering genus to the base genus; it should retain the covering genus on both sides; affects a stated result.
- **Error** in LL24 at Example 10.1.6(2), printed p.51: the source says the augmentation extension is nonsplit without excluding the torus fibre; it should exclude the split abelian case and use the nonabelian surface range; affects a stated result.

Previously recorded LL-P04 corrections to projective uniqueness, fibre-prescribed lifting, positive-genus decomposition, rigidity order, residual primes and the complete-intersection inference remain reflected in the package. They are author-adopted online corrections; no claim is made that they appeared in a later printed edition. No instruction in the reviews displayed on that source page was followed.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "d295a9204bf5ba5f486dd4b3b52e9875229a1676", "job": "REV-PKG-MappingClassGroupsAndCanonicalRepresentations~3", "model": "gpt-6-astra", "worker": "chris-4"} -->
