<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13156#issuecomment-6868553928 -->
Red team round 2 pass a (codex) of c877c00

Verdict: needs_changes

1. **F01** (P3) The Newton-polygon Check omits the origin

   **Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1767–1768`: “the Newton polygon of `x + z/x` has vertices `(1, 0)` and `(−1, 1)`”.

   **Claim:** These two points are the vertices of the Newton polygon used by §6.3 and its supplier.

   **Witness:** MixedHodgeModulesAndIrregularHodgeTheory §10.4 defines `Δ=conv({0}∪supp φ)` (`README.md:1097`). Here `(0,0)` is a third vertex: the other two have `2α₀+α₁=1`, while the origin has value 0. FSY line 1477–1479 agree.

   **Exact repair:** Replace this Check with: “For `k = 1`, the Newton polygon is `conv{(0,0),(1,0),(−1,1)}` in coordinates `(α₁,α₀)`. Its unique edge not containing the origin joins the latter two vertices and lies on `2α₀+α₁=1`. Its area is `1/2`; the support segment alone has area zero.”

   **Retest:** The determinant of `(1,0),(−1,1)` is 1, so the triangle has area `1/2` and normalized volume 1. The replacement distinguishes the supplier's two-dimensional polytope from the one-dimensional support hull.

2. **F02** (P1) The new finite-inertia proof lacks its existing classification supplier

   **Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:823–831`: “the image in `PGL₂` is finite with a normal Sylow `2`-subgroup”; the proof passes through the cyclic, dihedral and tetrahedral cases and uses the binary octahedral normalizer.

   **Claim:** The listed inputs suffice to classify the finite image and to perform the character averages in §1.6.

   **Witness:** `TauCetiRoadmap/McKaySkewGroup/README.md:336–341,368–391` already owns the concrete binary tetrahedral/octahedral subgroups and finite-subgroup classification with conjugacy. Neither §1.6's Needs line nor the supplier contracts cite it; the listed ramification supplier supplies no such classification.

   **Exact repair:** Add the supplier contract: “McKaySkewGroup §§0.1–0.2 supplies the concrete finite subgroups of `SL₂(ℂ)` and their classification with conjugacy. For §1.6, embed a finitely generated characteristic-zero field containing the finite image's matrix entries into `ℂ`, use that classification, and transport the defining representation back. This roadmap computes the ramification filtration, the normalizer action on tame inertia and the symmetric-power character averages for the Kloosterman image.” Add `McKaySkewGroup §§0.1–0.2` to §1.6's Needs and Layer 1 dependencies. In the proof replace the implicit classification step by: “Apply McKaySkewGroup §0.2. In the projective image, `S₄` and `A₅` have nonnormal Sylow 2-subgroups; exclude the cyclic and dihedral cases as below. The remaining projective image is `A₄`, and §0.1 supplies its binary model.”

   **Retest:** The imported binary models have orders 24 and 48, with central quotient orders 12 and 24; the tetrahedral Sylow 2-subgroup is `Q₈`. On `Sym¹²`, the character average gives two invariant lines, and the outer coset separates them into eigenvalues `+64` and `−64`. McKaySkewGroup is on main, so this introduces no upward edge.

3. **F03** (P3) Four residual Checks repeat statements without an instance

   **Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1267,1271,1741,1763`: respectively the general ranks `k+1,k`, the weight `nk`, the positive exceptional order, and the Newton degrees `2,1`.

   **Claim:** These bullets serve as discriminating Checks.

   **Witness:** The first two repeat §5.4 and §3.6; the last two repeat the displayed conclusions of §§6.2–6.3. None evaluates an instance or supplies an independently checkable value.

   **Exact repair:** Delete the rank and weight bullets at 1267 and 1271; the surrounding concrete Checks already test them. Replace the §6.2 bullet with: “For `k=2`, use formal Morse coordinates `g=x²−y²` and `s=1/t` at a balanced point. On the first blow-up chart `x=sX,y=sY`, the function becomes `s(X²−Y²)`, so its generic order on the exceptional divisor is `+1`; replacing it by a pole would give order `−1`.” Replace the §6.3 bullet with: “For `k=5,j=2`, the classes represented by `z²` and `t²` have Newton degrees 4 and 2, hence lie in `F²` and `F⁴`, respectively. Assigning degree one to `z` would incorrectly put its class in `F⁴`; §6.6 gives a nonzero type `(2,4)` class there.”

   **Retest:** `(s²X²−s²Y²)/s=s(X²−Y²)`; `6−2·2=2`, while `6−2=4`. The replacements test the signs and the cover normalization with values. No Suggested.lean padding was found, so no theorem deletion is requested.

4. **F04** (P1) The real epsilon factor uses the opposite character convention

   **Location:** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:2431–2436,2452`: the character is `ψ_∞(x)=exp(−2πix)`, the constants are those of ArithmeticGaloisRepresentations §2.7, but the odd archimedean factor is `i^{(k²−1)/8}`.

   **Claim:** At `k=3` the real epsilon factor is `i` with that character and that supplier.

   **Witness:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:2291–2304,2320–2322` assigns `i` to real `sgn` for the positive character and multiplies it by `sgn(−1)=−1` on character reversal. Thus the specified negative character gives `−i`.

   **Exact repair:** In §10.3 replace the odd archimedean factor by `(-i)^{(k²−1)/8}` and its `k=3` Check by: “At `k=3`, the real parameter is the sign character times a norm power. ArithmeticGaloisRepresentations §2.7 gives `i` for `exp(2πix)` and `sgn(−1)i=−i` for our character `exp(−2πix)`. Thus the local factor is `−i`.” Add to the proof: “Transport the FSY archimedean formula to the local-constant convention of ArithmeticGaloisRepresentations §2.7 using its character-scaling law. With the supplier's positive real character the factor is `i^A`, `A=(k²−1)/8`; reversal multiplies it by `det(r_{k,∞})(−1)=(-1)^A`, giving `(-i)^A`. The simultaneous reversal of the global additive character changes the product by the global determinant evaluated at the principal element `−1`, hence by 1.”

   **Retest:** For `k=3`, `χ_{3!!}=χ_3` is the odd quadratic character and the Tate exponent is `−2`; its real parameter has sign `−1`. Thus `(-1)i=−i`. For `k=5`, `A=3` and reversal changes `−i` to `i`. For even `k` the real determinant is positive and the displayed real sign is unchanged. The global functional equations and the two Lean functional-equation signatures need no change.

## Earlier findings: verification at this head

The identifiers below retain the earlier reports' identifiers; new findings start at S01. No earlier finding was marked not actionable in the repair report.

| Earlier finding | Status and repaired passage | Independently checked witness |
|---|---|---|
| r1a F01; r1b F02: missing coefficient divisibility headline | Repaired. `Suggested.lean:196–200`: “∃ c : ℤ, coeff n (momentSeries p k) = (p : ℂ) ^ (n * (n - 1)) * (c : ℂ)”. Both `0 < k` and `p ≠ 2 ∨ Odd k` are explicit. README §§9.1, 11.2 supply the two proof routes. | At `(p,k)=(2,5)`, coefficients are `1,−5,68,−64`; their valuations are `0,0,2,6`. At `k=0`, the coefficient of `T²` is `p(p−1)`, valuation 1, so the positivity hypothesis matters. The formal recurrence calculations below also test larger exponents. |
| r1a F02: missing Picard–Vessiot supplier | Repaired. `README.md:334–340`: “§5.4 (Picard–Vessiot fields and analytic solutions)” supplies the field, group, fixed fields and analytic continuation. The §2.5 Needs line cites it. | `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:3117–3155` on main supplies exactly these constructions over `C(z)`, with algebraically closed constants of characteristic zero. Analytic monodromy alone would give the trivial group for `y′=y`, whereas its differential Galois group is `G_m`; the repaired contract includes the missing construction. |
| r1a F03: absent local inertia at infinity | Repaired. `README.md:793–815` now states finite inertia, the odd-prime torus normalizer, binary tetrahedral inertia at 2, the lower filtration, invariant dimensions and Frobenius eigenvalues. §8 cites §1.6. | Yun-moments line 507–550, 1585–1757. At `p=2,k=12`, Swan is 3, invariant dimension 2 and eigenvalues are `64,−64`; the directly computed series is `(1−T)(1−4096T²)`. At `p=3,k=6`, Swan is 2 and the invariant eigenvalue is `−27`. A remaining proof-input ownership omission in this new section is S02. |
| r1a F04: eleven nondiscriminating Checks | Repaired for the eleven examples identified there. Examples now include “`k = 2`: ... `(3,3)`” (§4.1), the eigenvalue change `−2 → −4` (§4.5), `(1,−1,1)` (§6.3), `F²=F³`, `F⁴=0` (§6.5), the characteristic-two boundary chart (§7.1), and `N(e′)=e` with eigenvalues `−81,−27` (§11.2). | The twist multiplies eigenvalues by 2; the critical equations at `(1,−1,1)` give `1−1=0` twice and `1+(−1)=0`; the `k=2` line has type `(3,3)`; `Nφ(e′)=−81e=3φN(e′)`. Other unreplaced restatements, not among that list, are S03. |
| r1b F01: false open-resolution isomorphism | Repaired. `README.md:1981–1987`: “`π^* ... is surjective`” with kernel of dimension `δ_{4∣k}` and isomorphisms on `gr^W_{k−1}` and `W_{k−3}`. `README.md:2003–2005` makes the resolved boundary correction zero. | At `k=4`, the balanced-point stabilizer acts by the sign character on the primitive quadric class, giving a one-dimensional kernel; the middle pieces both have dimension zero. At `k=6`, the half-exchange has character `−1` but preserves the rulings, so the kernel is zero. The localization sequence now includes `H^{k−2}(T)`. FSY line 2012–2051 omit it. |
| r1b F03: wrong p-adic suppliers | Repaired. `README.md:440–448` cites NoncommutativeAndEquivariantIwasawa §F.6 stage 3 and FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.2–R07.3.3. | Those sections contain `deRham_iff_potentiallySemistable`, `isWeaklyAdmissible_iff_polygon` and `dSt_isWeaklyAdmissible`, including 2 and unrestricted Hodge–Tate weights. A Tate line `Q_p(−2)` has filtration jump and Newton slope both 2; the zero module has both polygons of length zero. |

Locations without a prefix in this report refer to `packages/KloostermanMomentsAndPotentialAutomorphy/`. Supplier paths refer to their repository location, at main or the provided open head as appropriate.

## Adversarial statement ledger

The table covers all 60 numbered subsections, with separate rows for additional bold targets. It records calculations, not a claim to have proved the deep theorems by examples. `Q_k=Z_k/(1−T)` below; `M_k(p;T)` is the middle polynomial, distinct from the motive. All numerical finite-field tests used the actual sums, followed by `n c_n=Σ_{j=1}^n m(p^j)c_{n−j}`. No Lean build was run.

| README statement | Instances and computed values on both sides | Result / change |
|---|---|---|
| §0.1 recurrence, symmetric trace, base change, Chebyshev | `α=2,β=1,k=2`: `h₂(3,2)=7=4+2+1`, unlike `tr²=9`. Repeated roots `1,1,k=3`: `4=4`. In characteristic 2, `h₂(0,1)=1=3 mod 2`. In the zero ring, `h₀=1=0`. `U₂(x)=4x²−1=h₂(2x,1)`. | No defect; no division by root difference. |
| §0.2 sum | Over `F₂`, values at `a=0,1` are `−1,1`; the unit-product fibre at zero has sum 0, hence the comparison correctly excludes zero. Over `F₃`, unit values are `−1,2`. Trivial character over `F₅` gives 4 at every parameter. | No defect. |
| §0.2 trace character and tower law | `F₄/F₂`: trace of 1 is 0, so restricted value `1=(−1)²`, not −1. `F₉/F₃`: trace of 1 is 2, so `ζ₃²` on both sides. For `F₄` Frobenius, traces of `ω,ω²` both equal 1. At degree zero the carrier is `F_p`, with relative degree 1 rather than `0/1=0`. | Positive-degree restriction retained; arbitrary embedding has inverse relative trace in degree one. |
| §0.2 moment | Over `F₂`, `k=0,1,2,3` gives `1,−1,−1,3`; over `F₃` first moment is `1−2=−1`, zeroth 2. Trivial character over `F₅` gives first moment `4·(−4)=−16`. | Nontriviality and the minus sign are necessary. |
| §0.3 series, differential equation, polynomial boundary | `(p,k)=(2,3)`: `m₁=3,m₂=−17`, so `c₂=(9−17)/2=−4`; `2c₂=−8=3·3−17`. At `k=0`, `c_n=(p−1)p^{n−1}` for `n≥1`; at `k=1`, series is `1−T`. | No defect; the zero exponent coefficient is explicitly 0 before substitution. |
| §1.1 projection and normalization | `r=2,p=2,a=1`: raw value 1, sheaf trace −1, normalized trace `−1/c`. At `r=3`, normalization is `c^{−2}=p^{−1}`. Replacing `c` by `−c` gives signs −1 and +1 in ranks 2 and 3. | No defect; degree `m` uses `c^m`. |
| §1.2 local structure and pairing | `r=2,p=2`: reciprocal characteristic polynomial `1+T+2T²`, eigenvalue product 2; its polynomial roots have modulus `1/√2`. The Jordan block has invariant dimension 1. Trivial-character rank-two direct image is mixed, not the claimed irreducible object. | No defect. |
| §1.3 monodromy branches | `r=2`: `Sp₂=SL₂`, dimension 3. `r=3,p=2`: `SO₃`, dimension 3, with a line in `Sym²`; `r=3,p=3`: `SL₃`, dimension 8, `Sym²` dimension 6 with invariants 0. `r=7,p=2`: `G₂` dimension 14, not `SO₇` dimension 21. | XZ line 132–139 support all branches; rank 1 excluded. |
| §1.4 concentration, determinant and weights | `k=1`: `−tr(F^m)=−1=m(p^m)` and `Z=1−T`. `k=0`: `H_c²` dimension 1 and series `(1−T)/(1−pT)`, so the positive-exponent hypothesis is essential. `k=3,p=2`: root partner `16/(−4)=−4`, not `4/(−4)=−1`. | No defect; exceptional odd ranks in characteristic 2 retain all degrees. |
| §1.5 integrality and character independence | Over `F₃`, replacing `ψ` by `ψ(−·)` scales `a` by `(−1)²=1`, preserving `−1,2` and their first sum −1. At `p=2,k=12`, coefficients `1,−1,−4096,4096` are integers. | No defect. |
| §1.6 finite inertia, breaks, invariants, Frobenius | At 2, lower filtration gives `2/3+2/12+2/12=1`. `k=12`: invariants 2, eigenvalues ±64, Swan 3, degree 3. At `p=3,k=6`, three of seven weights are wild-invariant, so Swan `(7−3)/2=2`, tame-invariant dimension 1 and eigenvalue −27. Odd `k=3`: infinity invariants 0, while the middle eigenvalue at 2 is −4. | Numerical assertions agree; S02 supplies the missing classification input. |
| §2.1 exponential direct image and cyclic module | Rank 2 has basis `1,θ` and relation `θ²e=ze`; rank 3 changes to `θ³+z` on reversing the exponential. Slopes in rank 2 are `1/2,1/2`, sum 1, not 0. | No defect. |
| §2.2 cover and descent | `r=2`: `x+z/x=t(y+y⁻¹)` and the deck substitution `t,y↦−t,−y` fixes the function. At `r=3`, the wrong deck action produces coefficient `ζ²≠1`; correct action produces 1. `dz/z=2dt/t` in rank 2. | No defect. |
| §2.3 formal local structure, duality, Fourier recursion | Rank 2: residue block size 2, slopes sum `2·1/2=1`. Rank 3: dual requires `z↦−z`, and `3·1/3=1`. Degree-two pole `x²+1` contributes `2·1`, giving index −2 before and after splitting, not −1. | No defect. |
| §2.4 symmetric connection | `r=2,k=2`: rank `binom(3,2)=3`, and `∇(v₀v₁)=v₁²+zv₀²`. `k=1` returns rank 2; `k=0` returns the rank-one trivial connection. | No defect; duality restricted to characteristic zero. |
| §2.5 Picard–Vessiot groups and irreducibility | Rank 2: analytic monodromy closure dimension 1, PV group dimension 3; `y′=y` has monodromy 1, PV group `G_m`. Rank 3 symmetric square has dimension 6 with no invariant line for `SL₃`, unlike `SO₃`. | Prior finding repaired; ordinary-point analytic realization does not replace PV theory. |
| §2.6 Bessel dictionary | Rank 2, `λ=1`: both equations `θ²=x`; rank 3: cyclic `θ³=x`, horizontal coefficient `θ³=−x`. `λ=0` gives regular singularity at infinity, irregularity 0 rather than 1. | No defect; signs differ in odd rank. |
| §3.1 tensor potentials | Rank 2, `k=2`: `x₁+x₂+z/x₁+z/x₂` pulls back to `t(y₁+y₂+y₁⁻¹+y₂⁻¹)`; ambient dimensions are 3 and fibre dimension 2. `k=1` recovers `t(y+y⁻¹)`. | No defect. |
| §3.2 projectors and their images | At `r=2,k=2`, transposition acts −1; at `r=3,k=2`, +1. On a sign/trivial two-line `S₂` representation, `(1−τ)/2` has matrix `diag(1,0)` and its square is itself. At `k=3`, deck eigenvalues `1,−1,1,−1` give ranks 4→2, middle 3→1. Denominator 4 is invertible in `Q₂`, not `Z₂`. | Both image-character implications hold; rational coefficients retained. |
| §3.3 tensor Thom–Sebastiani | Rank 2, `k=2`: tensor rank 4, symmetric rank 3; exchanging two degree-one factors contributes −1, so geometric sign-isotypic cohomology gives symmetric tensors. Rank 3 exchanges degree-two factors with sign +1. | No defect. |
| §3.4 middle image and extension | `k=1,2,4`: middle dimensions 0 while ordinary dimensions are 1,1,2. Identity compact-to-ordinary maps on a proper example have image the whole space; the zero map has image 0. | The construction specifies the actual map, not an arbitrary subspace. |
| §3.5 exponential realization and pairing | Rank 2, `k=3`: degree `nk+1=4` before the one-dimensional-base description; full dimensions 4 on the cover and 2 after deck invariants, middle dimensions 3 and 1. Pairing weight `2·4=8` equals weight of `Q(−4)`. | No defect; separate projectors required. |
| §3.6 inverse Fourier objects | `r=2,k=1`: `rank G=2`, `rank M=1`, `rank ΠM=2`, constant quotient rank 1. `k=2`: primitive `P₁` dimension 1, type after twist `(2,2)`, weight 4, not 3. `k=3`: Fourier cohomology dimension 3, weight 4. At `k=0`, `FT δ₀=O`, with `H⁰=C`, so concentration fails. | S03 removes two redundant Checks; substantive assertions agree. |
| §4.1 classicality, weights and pairing | `k=2`: full Hodge type `(3,3)`, weight 6≥3; middle 0. `k=5`: types `(2,4),(4,2),(6,6)`, weights 6,6,12. `k=6,7`: pairing signs −1,+1 and middle dimensions 2,3. | No purity overclaim for full cohomology. |
| §4.2 hypersurfaces and base change | `k=2`: numerator `(y₁+y₂)(1+y₁y₂)`, a reducible nodal curve. At `k=3`, `(1,1,1)` gives 6 over Q and 0 over `F₃`. Rank 3 deck scaling multiplies `g` by `ζ⁻¹` and its zero value stays 0. | Definition allows singular and nonreduced fibres. |
| §4.3 hypersurface comparison | `r=2,k=3`: degree 2, weight 2 before twist; after `(−1)`, dimension 1, weight 4, type `(2,2)`. The sign-only cover dimension is 3, not 1. At `k=2` the singular-support expression applies; smooth purity does not. | No defect; smoothness is explicitly conditional. |
| §4.4 motive | `d₁=d₂=d₄=0`; `d₃=1`, weight 4. For `r=3`, `sgn²=1` rather than `sgn`. | Conditional on the declared Nori weight-filtration contract. |
| §4.5 finite-field comparison | `r=p=2`: degree-two cover is radicial, reduced deck group has order 1. At `k=3,p=2`, hypersurface eigenvalue −2 becomes −4 under `(−1)`, giving `1+4T`; `(1)` would give −1. | No prime-to-rank shortcut. |
| §5.1 frame | `k=1`: `θv₀=v₁`, `θv₁=zv₀`. `k=2,a=1`: `θu₁=u₂+zu₀`; endpoints are `2u₁` and `2zu₁`. | No missing endpoint term or divided powers. |
| §5.2 formal decomposition and irregularities | `k=2`: cover exponents `−4,0,4`, cover irregularity 2, descended irregularity 1; regular monodromy −1. `k=4`: exponents `−8,−4,0,4,8`, regular monodromy +1. `k=3`: irregularities 4 and 2. | No defect. |
| §5.3 intermediate extensions | `k=2` has regular monodromy −1 and no infinity correction; `k=4` has +1 and one correction. On the cover `k=2` has one correction, `k=3` zero. At zero the unipotent invariant dimension is always 1. | Both directions of each iff distinguish these cases. |
| §5.4 Fourier local structure | `k=3`: singular values `−6,−2,2,6`, each rank-one vanishing cycle of monodromy −1; infinity blocks 4 and 3. `k=2`: values `−4,0,4`, blocks 3 and 2. `k=1`: logarithm ranks 1 and 0. | Conditional on the declared stationary-phase contract. |
| §5.5 cohomology dimensions | `k=1,…,8`: middle dimensions `0,0,1,0,2,2,3,2`; full dimensions `1,1,2,2,3,3,4,4`. Cover at 2 gives full 2, middle 0; at 3 gives full 4, middle 3. At `k=0`, actual full dimension 1, not truncated formula 0. | No defect. |
| §5.6 bases and leading matrix | `k=1`: determinant −z. `k=3`: leading eigenvalues `±√z,±3√z` give determinant `9z²=(3!!)^2(−z)²`. `k=2`: leading kernel vector `u₂−zu₀`, mapped to `2zu₁−2zu₁=0`. Basis sizes 2 and 4 at `k=3`. | No defect; derivative of z is absent only in the leading matrix. |
| §5.7 quotient weights | `k=1,2,3`: primitive weights 0,2,4; variation weights 2,4,6; module weights 3,5,7; Fourier cohomology types `(2,2),(3,3),(4,4)`. | The corrected primitive index is `k−1`. |
| §6.1 fan and projective embedding | `k=1`: 2 rays, 2 cones, 3 lattice sections, conic in `P²`. `k=2`: 8 rays and cones, 21 lattice points (`25−4`), target `P²⁰`; support values 2 and 3. Chart numerator `1+z₁+z₁²z₂²+z₁z₂²` divided by `z₁z₂` gives all four Laurent terms. | No defect; projectivity conditional on named gap. |
| §6.2 nondegenerate compactification | `k=1`: critical values ±2, hence no zero critical value. `k=2`: two balanced points; in a Morse chart the first exceptional order is +1, computed in S03, the second generic order is 0. | S03 replaces a restatement by a chart calculation. |
| §6.3 Newton nondegeneracy and weights | At `k=2`, `(x₁,x₂,z)=(1,−1,1)` solves all logarithmic critical equations; at `k=3`, a sum of three signs cannot be 0. At `k=1`, support-face values of `2α₀+α₁` are 1, origin value 0. At `k=5,j=2`, degrees 4 and 2, Hodge bounds 2 and 4. | S01 and S03. |
| §6.4 cover Hodge numbers | At `k=2`, types `(2,2),(3,3)`, dimension 2, middle 0; at `k=3`, types `(1,3),(2,2),(3,1),(4,4)`, dimension 4, middle 3. For `k=4`, middle `(1,4),(4,1)` plus `(3,3),(5,5)`, total 4. | No defect. |
| §6.5 basis filtration and pullback | At `k=3`, original `F⁴` dimension 1, `F²` dimension 2, `F⁵` dimension 0. At `k=2`, `F²=F³` is one-dimensional, `F⁴=0`. Pullback of `z dz/z` is `2t²dt/t`. | Range `p>k/2` in even exponent retained. |
| §6.6 descended Hodge table | At `k=3,5,6,7`, middle types respectively `(2,2)`; `(2,4),(4,2)`; `(2,5),(5,2)`; `(2,6),(4,4),(6,2)`. At 4, only `(3,3),(5,5)` survive outside the zero middle part. | Counts agree with §5.5 and polarization parity. |
| §7.1 integral boundary smoothness | At `k=2`, boundary chart `g₁=(1+z₁)(1+z₁z₂²)`; on `z₂=0`, the zero locus has `z₁=−1` and derivative 1, including characteristic 2. At `k=3,z₂=−1,z₃=0`, derivative can be 0 off the hypersurface while `g₁=1`. | Correct restriction to the intersection; source's stronger claim fails. |
| §7.1 boundary localization (additional bold theorem) | Empty boundary: only Čech column 0, and the restriction kernel is the entire `H^{k−1}`. At the `k=4` resolution, the χ weight-two boundary term is 0 after the exceptional line is killed; at `k=6,p=3`, the surviving interior vanishing cycle has dimension 1. | Smoothness required only for the specified pure boundary/generic pieces; singular special fibre retained. |
| §7.2 quadratic singularities | `k=3,p=3`: one orbit, constant 6; `k=9,p=3`: two orbits, constants 6 and 18, valuations 1 and 2. `k=6,p=3`: b=0,2, two orbits. At `p=2,k=3`, constant 6 has valuation 1, so total space is regular though the special fibre is singular. | Higher thickness explicitly retained. |
| §7.3 resolutions and open/proper comparisons | `k=4`: 6 balanced points, primitive χ-line dimension 1, killed by the map on `H_c³`; resolved weight-two χ-piece 0. `k=6`: kernel 0, while at p=3 the positive-b orbit survives. | Prior false isomorphism repaired. |
| §7.4 Galois realizations | `k=3`: rank 1, weight 4, pairing symmetric into `Q_ℓ(−4)`; at 2 the eigenvalue is −4, square 16 equals the pairing multiplier. `k=6`: rank 2, weight 7, alternating form. `k=1,2,4`: all realizations 0. | No defect. |
| §8.1 factorization and root weights | At `(2,3)`, `Q=1+4T`, root −1/4 has norm `2⁻²`. At `(2,12)`, `Q=1−4096T²`, roots ±1/64 have norm `2⁻⁶`, the even boundary weight. At `(2,1)`, `Q=1` and root set is empty. | No defect; the final empty-root case does not weaken the positive-rank theorem. |
| §8.2 polynomiality, degree and trivial factors | At p=2, degrees for k=1,2,3,4,5,6,12 are 1,1,2,1,3,2,3. At p=3, degrees for k=3,4,6,9,12 are 1,2,2,3,4. These equal the four parity formulas and computed leading indices; coefficients following each tested degree vanish. | No defect. |
| §8.3 odd-exponent local structure | `k=3,p=3`: `Θ⁻={1}`, middle polynomial 1, motive inertia invariants 0 and conductor exponent 1. `k=9,p=3`: `Θ⁺={3}`, `Θ⁻={1}`, dimensions 1 each; at p=2 odd-exponent representations are unramified. | No good-prime exclusion; quadratic thickness parity matters. |
| §8.4 even-exponent local structure | `k=6,p=3`: `dim V=2`, `rank N=1`, `dim ker N=1`, eigenvalues −27 on the kernel and −81 on the quotient. `Nφ=3φN`. At `p>3`, rank N=0. | No defect; N is not discarded by global semisimplification. |
| §8.5 odd Euler factor and conductor | `k=3`: conductor 3; at p=2 inverse Euler factor `1+4T`, at p=3 inverse factor 1. `k=9,p=3,a=3`: `a′=1`, exponent `(1+ap)/2=5`, Legendre symbol `(-2/3)=1`, extra factor `1−243T`. `N₉=1·3·5·7·1=105`. | Natural division is exact since `a>0`, p prime and `p^{v_p(a)}∣a`. |
| §8.6 even Euler factor and conductor | `k=4,p=3`: `Z=(1−T)(1−9T)`, quotient 1. `k=6,p=3`: inverse Euler factor `1+27T`, odd conductor 3. `k=12`: odd conductor `3²·5=45`. At p=2 the encoded odd-prime Euler factor is 1. | Unknown factor at 2 is kept separately. |
| §9.1 p-adic realization and Newton comparison | `k=5,p>5`: rank 2 on both sides; `k=8,p>4`: rank 2. `k=6,p=3`: compact Newton slopes 0,3 exceed available compact Hodge slopes 0,2. `k=9,p=3`: thickness exponent e=2, so the ordinary e=1 theorem alone is insufficient. | Conditional on declared higher-thickness contract; all odd primes retained. |
| §9.2 regular polarized compatible system | `k=6`: Hodge jumps 2,5, multiplier parity `(-1)^7=−1`, alternating rank 2. `k=7`: jumps 2,4,6, multiplier parity +1, symmetric rank 3. Zero ranks at 1,2,4 have empty Hodge lists. | Serre's semisimplification contract preserves type; no irreducibility of the whole system is assumed. |
| §10.1 determinant | `k=3`: `k!!=3`, cyclotomic exponent −2, imaginary quadratic field `Q(√−3)`; at p=2 determinant is −4. `k=5`: exponent −6, field `Q(√−15)`; at p=2 determinant 64. At k=1 determinant is 1. | No defect. |
| §10.2 gamma factor | `d=0`: empty product 1. `d=1,s=3`: `G₁(3)=π^{-3/2}`, standard `Γ_R(2)=π^{-1}`, ratio `√π=π^{1·2/4}`. `d=2`: constant ratio `π^{3/2}`. | Corrected normalization; constant does not change reflection equation. |
| §10.3 epsilon factors | `k=6,p=3`: u=1,v=0, so sign +1 despite Euler factor `1+27T`. `k=3,∞`: supplier gives `sgn(−1)i=−i`, README gives i. | S04. |
| §10.4 coefficients, Euler product and completion | If `L₂=1+aT+bT²`, `L₃=1+cT+…`, then `a(1)=1,a(2)=a,a(4)=b,a(6)=ac`; n=0 gives empty product 1 but the L-series term is 0. For the even encoding every positive even integer has coefficient 0. At d=0, gamma factor 1. | Correct Euler-product bridge uses the term function with value 0 at n=0, not `eulerCoeff` unchanged. |
| §11.1 potential automorphy | `k=3`: rank-one Hecke character; `k=5`: polynomial `1−4T+64T²`, eigenvalues `2±2√−15`, squared absolute values 64. `k=6,p=3`: local factor degree 1<rank 2. | No claim that the full system is cuspidal or everywhere unramified. |
| §11.2 purity under global semisimplification | `k=6,p=3`: weights 6,8 centred at 7 and N rank 1; keeping N gives degree-one local factor, forgetting N gives degree two. Zero ranks at k=1,2,4 give factors 1. | Correct local/global semisimplification distinction. |
| §11.2 coefficient-prime slope theorem (additional bold theorem) | At `(2,3)`, reciprocal root −4 has valuation 2, equal to Hodge jump 2. At `(2,5)`, Newton vertices `(0,0),(1,2),(2,6)` give slopes 2,4. After residue-degree f extension, valuations multiply by f and divide back by f. | Uses AG2.6 at the coefficient prime; away-prime strictness alone is insufficient. |
| §11.2 divisibility corollary (additional bold target) | `(2,13)`: coefficient valuations `0,0,2,6,12,20,30,42`, exactly `n(n−1)`. `(3,9)`: valuations `0,0,3,10`≥`0,0,2,6`. At k=0, valuation of c₂ is 1<2. | Correct restrictions; added Lean headline matches. |
| §11.3 odd root number | At k=1 all factors are 1. At k=3, the supplier conventions give finite ramified phase i and real phase −i, product 1; the stated real phase i would instead give −1. The general root-number theorem is conditional on its named Saito contract. | S04 fixes consistency; Saito source remains uncertified. |
| §11.4 odd functional equation | k=1: `N=1,d=0,L=1`, so `Λ(3−s)=1=Λ(s)`. k=3: `N=3,d=1`, reflection `s↦5−s`, centre 5/2, matching `L(s−2,χ_{−3})`. | Deep headline correctly stated in Lean; no free-function stand-in. |
| §11.5 even functional equation | k=2,4: `d=0,N′=1`, choose `r=0,P=1,ε=1,Λ=1`. k=6: `d=2,N′=3`, centre 4; the p=2 factor remains existential, not set to 1 in the completed function. | Correctly preserves the unknown local data. |

## Suggested.lean declaration and context ledger

All 22 declarations were read against the supplied elaborated signatures. There are no section `variable` or `include` blocks: all needed binders are on the declarations. The namespace is `TauCetiRoadmap.KloostermanMomentsAndPotentialAutomorphy`. `F` and `R` below are universe-polymorphic `Type u`; the outputs use native `ℂ`, `ℤ`, `Polynomial` and `PowerSeries`. All five theorems have `sorry`; all 17 definitions have bodies. No elaboration was rerun, as this pass is read-only and prohibits Lean builds.

| Declaration / layer | Effective variables and instances | Computed test and conclusion |
|---|---|---|
| `kloostermanSum` / 0 | `F`, `[Field F] [Finite F]`, `ψ : AddChar F ℂ`, `a:F` | `F₂`: at zero −1, at one 1; `F₃`: −1,2 on units. `Field` excludes the zero ring. `finsum` is finite because the units are finite. |
| `traceChar` / 0 | `p:ℕ`, `[Fact p.Prime]`, `m:ℕ` | At `p=2,m=2`, the restriction to 1 gives 1; at `m=1` it gives −1. At m=0 the field is `F_p`, not a field of cardinality 1; the formal series ignores this value. |
| `symmetricTrace` / 0 | `{R}`, `[CommRing R]`, `t d:R`, recursive argument `k:ℕ` | `h₂(3,2)=7`, `h₃(2,1)=4`, `h₂(0,1)=1` over `F₂`; the zero-ring value `h₀=0=1`. No characteristic-zero binder is needed. |
| `moment` / 0 | `p`, `[Fact p.Prime]`, `k m:ℕ` | At p=2,m=1 and k=0,1,2,3: `1,−1,−1,3`. At m=0 the determinant argument is 1 despite carrier cardinality p; no stated theorem uses it. |
| `momentSeries` / 0 | `p`, `[Fact p.Prime]`, `k:ℕ` | Substituted constant coefficient 0; final coefficient 0 is 1. At `(2,3)`: `1+3T−4T²`; at k=0: infinitely many nonzero coefficients. |
| `momentSeries_weights` / 8 | `p`, `[Fact p.Prime]`, `k`, `hk:0<k` | `(2,3)`: root −1/4; `(2,12)`: roots ±1/64. Lean's negative exponents describe polynomial roots, not reciprocal roots. At k=1, Q=1. |
| `momentDegree` / 8 | `p k:ℕ`, no primality instance | Values `(2,12)=3`, `(3,9)=3`, `(3,12)=4`. Junk values `(0,3)=2`, `(1,3)=0`, `(2,0)=0` are not used in a degree theorem without primality and positivity. |
| `momentSeries_eq_intPolynomial` / 8 | `p`, `[Fact p.Prime]`, `k`, `hk:0<k` | Tested integer leading terms at `(2,13)`: `−2^42`, degree 7; `(3,9)`: `−3^10`, degree 3. P cannot be zero because coefficient 0 is 1. |
| `thetaPlus` / 8 | `k p:ℕ`, no instances | `(k,p)=(9,3)` gives `{3}`; `(27,3)` gives `{3}` since `v₃(9)=2`; p=2 gives empty for every k because a is odd. |
| `thetaMinus` / 8 | `k p:ℕ`, no instances | `(9,3)` gives `{1}`; `(27,3)` gives `{1,5,7,9}`. At p=0 the finite range is just a junk extension of the prime-only arithmetic interpretation. |
| `oddEulerFactorInv` / 8 | `k p:ℕ`, `[Fact p.Prime]` | k=3,p=2 gives `1+4T`; k=9,p=3 adds `1−243T` since the Legendre symbol of −2 is +1. Every inverted series has constant term 1. |
| `oddEulerFactor` / 8 | `k p:ℕ`, local primality instance only in the true branch | At p=0,1,4 the factor is 1; at p=2,k=3 it is `(1+4T)⁻¹`, coefficient 1 equal to −4. |
| `oddConductor` / 8 | `k:ℕ` | At k=1,3,5,9: `1,3,15,105`. The empty product is 1. All multiplying primes are ≤k. |
| `evenEulerFactorInv` / 8 | `k p:ℕ`, `[Fact p.Prime]` | At k=4,p=3 the two divided factors cancel Z, giving 1; at k=6,p=3 gives `1+27T`. The p=2 value is not passed into the even L-series. |
| `evenEulerFactor` / 8 | `k p:ℕ`, true branch installs `[Fact p.Prime]` and tests `p≠2` | At p=2 or composite p the value is 1; at k=6,p=3 it is `(1+27T)⁻¹`, coefficient 1 equal to −27. |
| `evenConductor` / 8 | `k:ℕ` | k=2,4 gives 1; k=6 gives 3; k=12 gives 45. At k=0 the empty product is 1. |
| `middleDim` / 8 | `k:ℕ` | k=0,1,2,3,4,5,6,7,8 gives `0,0,0,1,0,2,2,3,2`; the k=0 junk value is excluded from geometric claims. |
| `paperGamma` / 10 | `d:ℕ`, `s:ℂ` | d=0 gives 1; d=1,s=3 gives `π^{-3/2}`, whose standard-factor ratio is `√π`. π is positive, so the complex power has no zero-base ambiguity. |
| `eulerCoeff` / 10 | `L:ℕ→PowerSeries ℂ`, `n:ℕ` | `n=0,1` give 1; `n=4` extracts `[T²]L₂`; `n=6` gives `[T]L₂[T]L₃`. The L-series term at n=0 is separately zero at the pin. |
| `momentSeries_coeff_dvd` / 11 | `p`, `[Fact p.Prime]`, `k`, `hk:0<k`, `hpk:p≠2∨Odd k`, `n:ℕ` | At `(p,k,n)=(2,5,2)`, `68=2²·17`; at `(2,5,3)`, `−64=2⁶·(−1)`. At n=0,1, exponent 0 is correct despite natural subtraction. All dependencies occur in its own type. |
| `oddMoment_functionalEquation` / 11 | `k`, `hk:Odd k`; existential Λ, meromorphic normal form and half-plane identity | k=1 gives `Λ=1`, reflection 3−s. k=3 gives reflection 5−s and conductor 3. The half-plane identifies Λ with the actual coefficient series, so Λ=0 cannot satisfy the nonzero k=1 example. Oddness implies positivity. |
| `evenMoment_functionalEquation` / 11 | `k`, `hk:Even k`, `hk0:0<k`; existential r,P,ε,Λ with P(0)=1, ε=±1 | k=2,4 admit r=0,P=1,ε=1,Λ=1. At k=6, odd conductor 3 and unknown p=2 polynomial remain present. `P(0)=1` excludes P=0; the p=2 data are inside, not hypotheses containing the conclusion. |

The one-tactic probe finds no padding among the five theorems: all concern the actual moment series or its completed L-function, and none is an evaluation, a recurrence, a boundary case or an immediate library corollary. The simple definitions are used by those headlines. Native `MvPolynomial.hsymm` and `Polynomial.Chebyshev.U` supply related polynomial constructions, not polynomiality or functional equations of the moment series.

The headline inventory is: moment integrality/polynomiality/degree; root weights; coefficient divisibility; the two meromorphic continuations and functional equations; monodromy and differential Galois groups; classicality and hypersurface/motive comparison; explicit Hodge numbers and regularity; local Galois structure and potential automorphy. The first five families are the five Lean theorems. The module docstring names the remaining families and the unavailable connection-cohomology, lisse-sheaf, Nori and automorphic carriers. Searches by those objects at the pins found no replacement carrier that would make an omitted geometric headline statable with only simple definitions.

## Dependency, ownership and pin audit

The required read-only dependency check returned:

```text
depcheck: 240 roadmaps, 2189 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The check validates the declared graph; S02 concerns an input omitted from that graph. Adding its owner on main cannot introduce an upward edge.

All 18 Exact supplier contracts blocks were compared with their suppliers: two library blocks and 16 roadmap blocks covering 23 distinct roadmaps. The following is the section-resolution record, grouped as in the package, not a count of repeated citation occurrences.

| Supplier sections | Result of contract comparison |
|---|---|
| CongruenceSpectralGap §§4.2a–4.2b | Product-fibre sum requires a unit parameter; the additive character is nontrivial for the sheaf results. Rank, geometric trace sign, local unipotence and Swan one agree. The new §1.6 supplies the finer symmetric-power inertia information. |
| PadicDifferentialEquationsAndRigidCohomology §§RD.6.52a, RD.6.53, RD.6.94–RD.6.98, RD.7.20–RD.7.22, including RD.7.21a | Formal normal form, residue-degree factors in the index, coprime-rank comparison, conditional boundary factorization and filtered comparison resolve. RD.7.20 has unit thickness; the explicit higher-thickness gap is necessary. |
| SpringerResolutionAndCharacteristicCycles §§8.1–8.4, 9.1–9.7 | Good filtrations, transfer, duality, holonomicity and intermediate extension are present over characteristic-zero fields. FormalConnectionsOpers F2.2 supplies filtered operators, rather than a replacement cohomology theory. |
| MixedHodgeModulesAndIrregularHodgeTheory §§2.1–2.5, 4.3, 4.6, 5.1–5.4, 6.1–6.7, 7.1, 7.5–7.7, 8.1–8.5, 8.7–8.8, 9.1–9.6, 10.1–10.8 | Exponential sign, Fourier localization, classical comparison, weights, supports and good-compactification hypotheses resolve. §10.4 includes the origin in its Newton polytope: S01. Irregular stationary phase is explicitly an extension of the regular-input contract. |
| ComplexComparisonPartII §§C5.1, C5.6–C5.7 | Ordinary differential operators and regular-singular logarithmic comparison resolve. The latter is not used as an irregular comparison. |
| DiophantineApproximationAndTranscendence §5.4 | Main's Picard–Vessiot carrier supplies the repaired §2.5; algebraically closed constants and characteristic zero are retained. |
| EtaleCohomologyFoundations §§F.0.4, F.2.4–F.2.7, F.4.5, F.5–F.7, F.10.1–F.10.2b; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3; EtaleDualityAndPerverseSheaves §§2.3, 2.7–2.8, 3.3, 5.6, 5.10; DeligneWeightsAndPurity §§0.16, 0.18, 7.12, 7.15, 8.14, 8.19, 8.24 | Rational coefficients, finite type, separation, properness and smoothness appear where needed. Radicial topological invariance does not assert étaleness. Artin vanishing and decomposition now supply the repaired even resolution. The smooth-proper weight spectral sequence is not applied to a singular compactification. |
| SchemeAndStackFoundations §§2.11, 4.11, 4.13, 4.17; ShimuraCompactifications §§0.16–0.18 | Artin–Schreier, strict transforms, regularity, strict normal crossings, finite-fan toric schemes, properness and integral boundary flatness resolve over arbitrary commutative rings. |
| AnalyticToricGeometryPartII §§0.3, 0.5 | Character sections and Cartier line bundles are present; the polytope closed immersion is separately declared as a gap. The zero ring gives empty schemes; it does not invalidate the base-change statement. |
| LefschetzPencilsAndVanishingCycles §§2.4–2.8, LPV.2 examples, §6.6 | Ordinary quadratic singularities, discriminant character, arbitrary-thickness Picard–Lefschetz, and the characteristic-two isolated-singularity input resolve. Regular total space is not silently inferred from higher thickness. |
| MotivesAndAlgebraicCycles §2.7 and §§5.3–5.9 | Nori motives and realizations resolve. The motivic weight filtration and orthogonal root-number theorem remain the two stated extensions. |
| ArithmeticGaloisRepresentations §§1.7, 2.5–2.7, 3.3, 5.3, 7.4 | Semisimplification, Weil–Deligne purity retaining N, conductors and polarization resolve. The real additive-character convention does not agree: S04. Preserving the form under semisimplification remains a declared gap. |
| CohomologyComparisons §§2.13, 3.4–3.5, 4.3–4.4; PadicHodgeTheory §§3.2, 5.3 | Filtered de Rham, crystalline and semistable comparisons have the required proper smooth/semistable inputs. The Hodge–Tate sign conversion is explicit. D_pst is used on potentially semistable representations. |
| NoncommutativeAndEquivariantIwasawa §F.6 stage 3; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.2–R07.3.3 | The repaired de Rham/potentially semistable equivalence and Newton–Hodge statements exist with unrestricted weights and p=2. Subobjects and equality of total endpoints remain part of weak admissibility. |
| PotentialModularityAndCompatibleSystems §§1.1, 1.5–1.6, 1.15; ModularityAndLanglandsExtensions §§2.42–2.43, 2.49 | Compatibility, regularity, polarized potential automorphy, irreducibility premise and strict purity resolve. Potential automorphy is constituentwise, not cuspidality of an arbitrary direct sum. |
| AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6 | Away-prime and coefficient-prime compatibility are distinct contracts; AG2.6 retains its irreducibility premise and monodromy. Rank one is treated separately. |

The six gap slugs in the brief occur with matching named owners in both `design/plan.json` and the README. Their hypotheses and outputs are explicit. They ask for extensions rather than results already supplied at the cited sections or pins; none has supplier `none`. The audit accepts them as conditional contracts, not as implemented results. No change to the plan is proposed.

Object searches used `roadmaps grep` and `roadmaps show`, the supplied open-head directories, main active/completed roadmaps, board packages and both pins. No duplicate fully qualified Lean name was found. The closest five roadmaps were compared by scope: KloostermanSheavesAndBesselIsocrystals explicitly consumes these scalar sheaves and connections and owns the reductive-group construction; MixedHodgeModulesAndIrregularHodgeTheory owns generic Hodge/Fourier theory; PadicDifferentialEquationsAndRigidCohomology owns rigid theory; LefschetzPencilsAndVanishingCycles owns generic vanishing cycles; PotentialAutomorphyDworkMotivesPartII owns the Dwork pencil and switching families. Their scopes do not make a second owner of these moment motives. The additional generic finite-group owner found by object search is S02. The supplied overlap record reports no second copy, conflicting edit or dropped cited identifier.

| Pinned object inspected | Exact evidence and limitation |
|---|---|
| Finite field and trace | `Mathlib/FieldTheory/Finite/GaloisField.lean:68`, `Mathlib/FieldTheory/Finite/Trace.lean:37,49`, `Mathlib/RingTheory/Trace/Defs.lean:110,137`. The splitting field at exponent zero does not have cardinality one. Trace transitivity requires the finite free scalar tower stated in the contract. |
| Characters | `Mathlib/Analysis/SpecialFunctions/Complex/CircleAddChar.lean:83`; `Mathlib/Algebra/Group/AddChar.lean`. The trivial character takes value one; restricting a trace character multiplies the trace by the relative degree. |
| Symmetric tensors and polynomials | `Mathlib/LinearAlgebra/TensorPower/Symmetric.lean`; `Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean`. These supply underlying symmetric powers and complete homogeneous polynomials, not their connection or moment cohomology. |
| Euler product and L-series | `Mathlib/NumberTheory/LSeries/Basic.lean:74`; `Mathlib/NumberTheory/EulerProduct/Basic.lean:225`. The term is zero at n=0. The product theorem includes f(1)=1 and coprime multiplicativity through explicit `include`, plus absolute summability and f(0)=0. |
| Meromorphic continuation carrier | `Mathlib/Analysis/Meromorphic/NormalForm.lean:632`. Normal form fixes the values at poles; it is stronger than existence of a meromorphic germ and prevents changing point values arbitrarily. |
| Mixed Hodge carrier and strictness | `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72`; `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110,131`; `TauCeti/Geometry/Hodge/Tate/Basic.lean:93`. Finite filtrations are native, whereas finite dimension and graded polarizability are extra conditions. These definitions do not construct exponential pairs or motives. |

## Verified sound

Read all 2,787 README lines and all 232 Suggested.lean lines. Counts: 22 Lean declarations (17 definitions, five headline theorems), 60 numbered README subsections, 45 bold target paragraphs, and 221 Check bullets assessed against their statements. The 65 README ledger rows and 22 declaration rows record computed instances and negative controls. The four findings above identify the failed comparisons; numerical agreement elsewhere is not a proof of the universal theorem.

The source check covered the available citations to FSY, XZ, Yun-moments and Serre-orthogonal, using their manifest versions. There are 110 source-labelled citation occurrences before References: 98 FSY, six XZ, four Yun-moments, one Serre-orthogonal and one Saito-orthogonal. The 109 occurrences for the four readable works were matched to their locators; the Saito occurrence remains uncertified. This count treats a citation naming several theorem numbers as one occurrence. Source errors and necessary convention corrections are recorded separately below. Supplier checking covered the 16 roadmap contract blocks, 23 named roadmaps, the additional finite-group owner and the five closest-scope comparisons; the library contracts were checked at the pins.

Exact finite-field sums were computed for p=2 through extension degree 8 and p=3 through degree 5, for symmetric exponents 0–14. For the 28 positive-exponent series, all 182 computed nonconstant coefficients were integral and agreed with the applicable degree, sign and divisibility predictions. Vanishing beyond the proposed degree was tested only when that degree was below the computed cutoff. The k=0 series gave the required negative control. Binary tetrahedral and outer-coset character averages were computed for every even exponent through 200 and agreed with the two Frobenius multiplicities; the k=12 example detects loss of the second invariant line.

The five Lean headlines have the README's hypotheses and use the actual moment series and completion. No erased section binder, admitted data, free condition placeholder, conclusion-as-hypothesis, truncated signature, one-tactic padding theorem or omitted statable headline was found. Every Lean declaration name appears in the README. The file has one `import Mathlib`, the required namespace and layer order, declaration docstrings, five `sorry` theorem proofs, no `lemma` and no `set_option`. The README/docstrings contain no pull-request numbers or process narrative. No computational algorithm was introduced into the mathematical plan.

The head diff against origin/main contains ten changed files, all inside `packages/KloostermanMomentsAndPotentialAutomorphy/`. This pass changed only its report and scratch notes; it did not edit package content, run Lean, alter the index or refs, or post externally.

## Not verifiable

- Saito-orthogonal is settled as uncertified. Its main theorem, cited through FSY §5.3.3, p. 58, was not read; the declared orthogonal-motive contract remains conditional. No renewed source request was made.
- Elaboration was not rerun. All 22 supplied elaborated signatures were compared with the current source and README, but this is not a new Lean build or a kernel check of proofs. The five headline proofs remain `sorry` by design.
- The six declared supplier extensions are future mathematical contracts. Their declaration, precision and ownership were checked; their proofs are not supplied by this package.
- The available texts are the manifest's arXiv versions. Corrections listed below have not been certified against later published errata; no claim is made that they remain uncorrected in the journal versions.

## Source issues

- **Misprint** in FSY at §1.2, p. 5 (FSY line 232): the source says middle cohomology for Kl₂ equals an image involving Kl_(n+1); it should be Kl₂ on both sides, or rank n+1 on both sides; affects a stated result.
- **Misprint** in FSY at §1.3, p. 7 (FSY line 300): the source says the periods of x+z/x satisfy the modified Bessel equation in z; it should be y″+y′/z−y/z=0, or the stated equation after changing variable to 2√z; affects a stated result.
- **Misprint** in FSY at (1.10), p. 8 (FSY line 356): the source says the exponential cohomology of the (k+1)-dimensional torus is in degree one; it should be degree k+1; affects a stated result.
- **Misprint** in FSY at §3.2.1, p. 23 (FSY line 987): the source says a single rank-(n+1) Kloosterman sheaf uses the nk-dimensional torus; it should be the n-dimensional torus, with nk reserved for the tensor-power construction; affects the proof.
- **Misprint** in FSY at the proof of Proposition 4.20, p. 33 (FSY line 1408): the source says the primitive term has index k; it should be index k−1, centred at weight k−1; affects the proof.
- **Error** in FSY at §5.1.1, p. 40 (FSY line 1731): the source says the reciprocal-root partner is p^((k+1)/2)/α; it should be p^(k+1)/α, as the root −4 at k=3,p=2 demonstrates; affects a stated result.
- **Misprint** in FSY at §5.1.2, p. 41 (FSY line 1761): the source says the derivative is nonzero on the whole coordinate divisor; it should be nonzero on its intersection with g₁=0; affects the proof.
- **Error** in FSY at the proof of Theorem 5.17, (5.18)–(5.20), pp. 46–47 (FSY line 2012): the source says open resolution induces an isomorphism and retains the old boundary correction; it should be a surjection with kernel dimension δ₄∣k and zero resolved boundary correction; affects the proof.
- **Gap** in FSY at the proof of Proposition 5.23, p. 50 (FSY line 2249): the source says every quadratic point has unit thickness after adjoining √−p; it should be arbitrary thickness, since k=9,p=3,a=3 gives v₃(18)=2; the resolution and comparison must cover this; affects the proof.
- **Misprint** in FSY at Corollary 5.30, p. 52 (FSY line 2350): the source says the standard gamma product equals G_d(s); it should be π^(d(d+1)/4)G_d(s); affects a stated result.
- **Error** in FSY at Remark 5.41, p. 59 (FSY line 2676): the source says the local factor equals the determinant on the full potentially semistable module; it should be the determinant on its monodromy kernel with descent invariants, of degree one rather than two at k=6,p=3; affects the proof.
- **Misprint** in FSY at Appendix A.2, p. 62 (FSY line 2832): the source says the dual constant Hodge module has Tate twist −d; it should be twist +d, changing weight d to −d; affects a stated result.
- **Misprint** in FSY at Example A.3, p. 63 (FSY line 2876): the source says inverse image of the constant perverse Hodge module is concentrated in degree zero; it should be the divisor's constant perverse module shifted by [1], with cohomology in degree −1; affects a stated result.
- **Misprint** in FSY at Example A.27, p. 71 (FSY line 3222): the source says the composite direct-image functor is zero; it should be direct image along the constant zero map, hence supported at zero, not the zero object; affects the proof.
- **Error** in Yun-moments at Lemma 4.2.2, pp. 34–35 (Yun-moments line 1471): the source says all odd-prime infinity-invariant Frobenius eigenvalues are +p^(d/2); it should be the signed eigenvalues determined by p modulo four; at p=3,d=6 the eigenvalue is −27; affects a stated result.
- **Misprint** in Yun-moments at Lemma 4.3.4, p. 37 (Yun-moments line 1660): the source says the invariant lines have positive Tate twist d/2; it should be twist −d/2, giving eigenvalues of absolute value 2^(d/2), as its proof computes; affects a stated result.
- **Misprint** in XZ at §1.1.1, p. 2 (XZ line 62): the source says the holomorphic solution at zero is unique; it should be unique after prescribing value one at zero, since every scalar multiple is also a solution; affects a stated result.
- **Error** in XZ at §1.1.1, p. 2 (XZ line 78): the source says the displayed plus-sign connection and exponential/direct-image equation have the same sign in all ranks; it should be d+λdx in the direct image; horizontal scalar solutions of the displayed connection satisfy θ^r f=(−1)^rλ^rxf; affects a stated result.
- **Error** in XZ at §2.1.5(i), p. 10 (XZ line 489): the source says multiplication by exp(π(x−x^p)) is horizontal from Frobenius pullback to d+πdx; it should be exp(π(x^p−x)) for that arrow and connection; affects the proof.
- **Misprint** in Serre-orthogonal at the proof of Theorem 4.2.1, p. 10 (Serre-orthogonal line 393): the source says isotropy of S means vanishing on all pairs from E; it should be vanishing on all pairs from S; affects the proof.
- **Misprint** in Serre-orthogonal at the proof of Theorem 4.2.1, p. 10 (Serre-orthogonal line 394): the source says orthogonal complements are submodules by (4.2.2); it should be by the original compatibility condition (4.1.1), rather than the property being proved; affects the proof.
- **Misprint** in Serre-orthogonal at the proof of Lemma 4.2.4(ii), p. 10 (Serre-orthogonal line 411): the source says dim S is half dim M; it should be half dim M-perpendicular, as the preceding decomposition shows; affects the proof.

## Source independence check

Compared the statement/construction passages in all 60 numbered sections with their available source passages, plus six further prose passages: the §2.5 proof, §3.2 projector explanation, §4.1 proof, §7.3 repaired localization proof, §10.4 Euler-product bridge and Suggested.lean module docstring. No copied nonmathematical passage, translated passage, copied exercise/figure/table, or clause-for-clause paraphrase was found. Formulae and standard terminology were not counted as copied expression. The independent finite-field and representation calculations above also distinguish the Checks from a transplanted list of examples.

FSY has the largest source-labelled share, 98 of 110 occurrences. Its contents are readable at FSY line 14–35. The comparison is not a one-to-one sequence: Layers 0–1 use FSY §§1.1–1.2 and 3.2 plus XZ and Yun; Layer 2 uses FSY §2.1 and XZ; Layer 3 combines FSY §§2.2–2.3, 3.1 and Appendix A; Layer 4 uses §3; Layer 5 combines §§4.1–4.2 with §2.3; Layer 6 uses §4.3; Layers 7–9 divide §5.1 by integral geometry, local representations and coefficient-prime comparison; Layers 10–11 divide §§5.2–5.3 by local factors and global consequences. Layer 7's model construction precedes Layer 8's local conclusions, whereas FSY §5.1 starts with local factors. The Needs lines force connections before their cohomology, cohomology before motives, explicit filtrations before regularity, and geometric/Hodge/local comparisons before automorphy and continuation. The generic Appendix-A theory is imported from its owner rather than replanned here. No arrangement finding is raised.

Source independence: 66 passages compared with 4 sources, no copied expression found; largest share FSY, 98 of 110 source-labelled citation occurrences; contents compared with FSY: independent.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c877c00ac80017dc297e348e8dfd8c813742f972", "job": "RT-KloostermanMomentsAndPotentialAutomorphy~2a", "model": "gpt-6-astra", "worker": "chris-33"} -->
