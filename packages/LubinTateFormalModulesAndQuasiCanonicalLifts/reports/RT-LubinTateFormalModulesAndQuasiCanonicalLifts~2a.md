<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13044#issuecomment-6860689472 -->
Red team round 2 pass a (codex) of 281d0dd

Verdict: needs_changes

1. **F01** (P2) The finite-residue supplier comparison needs connectedness

   **Location:** `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:1346`: “At `B = O_r` for the residual modules of the supplier, identify both functors”. Also the supplier contract at line 299 and scope at line 69.

   **Claim:** The residual objects of EndoscopicTransferAndUnitaryTraceComparison §10.2 are all the formal modules of §3.1, with the same height and deformation functor.

   **Witness:** `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:3625` allows `β = diag(p,1)`, hence `μ_(p∞) ⊕ ℚ_p/ℤ_p`: total height 2, connected height 1. Its deformation dimension is 1; the formal completion's is 0. Its Checks explicitly include connected height `k<n`.

   **Exact repair text:** “For the connected residual strict `O`-modules of EndoscopicTransferAndUnitaryTraceComparison §10.2, identify the specialization at `B = O_r` with that supplier's marked deformation functor. The supplier also treats groups with nonzero étale part; those deformation problems are not identified with the deformation functor of their formal completion.” Apply this qualification also to the scope and exact supplier contract. Add the Check: “For `μ_(p∞) ⊕ ℚ_p/ℤ_p`, the supplier has one deformation parameter, whereas its height-one formal completion has none; this object is outside the connected specialization.” The connected height-two case still has one parameter on both sides.

2. **F02** (P2) Uniformizer norms and the degree do not determine the norm subgroup

   **Location:** `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:1090`: “the norm subgroups ... and the degree ... identify the norm group with `π^ℤ U(K,m)`”.

   **Claim:** Knowing that `π` is a norm and knowing the extension degree identifies the stated open subgroup of `Kˣ`.

   **Witness:** For unramified quadratic `K/ℚ₃`, choose `O_K=ℤ₃⊕ℤ₃α`. Both `3^ℤ exp(9O_K)` and `3^ℤ exp(27ℤ₃⊕3ℤ₃α)` have index 72 and contain 3; only the first is `3^ℤ U(K,2)`.

   **Exact repair text:** “First prove the inverse-unit formula by the uniformizer-comparison argument over `K̂^ur`, using §1.2 and the arithmetic normalization of Artin. At level `m`, the scalar action of §2.3 then shows that the kernel on `Kˣ` is exactly `π^ℤ U(K,m)`. Use `TauCeti.ClassFieldTheory.artinMap_restrict` and `TauCeti.ClassFieldTheory.localArtinMap_eq_zero_iff` to identify this kernel as the norm subgroup; the degree calculation checks its index.” In the witness, `exp(3α)` acts nontrivially modulo 9, so the second subgroup is excluded. This repairs the proof route, not the true norm-group theorem.

3. **F03** (P3) The cocycle definition has no three discriminating Checks

   **Location:** `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:1272`, the four Checks of §3.3: “`I = 0` gives the zero space”; “A correction to the linear coefficient ... is rejected”.

   **Claim:** These checks test the action-sensitive cocycle quotient. The first three merely repeat the vector-space, coboundary and fixed-tangent definitions; the last gives no cocycle or value to test.

   **Witness:** Replacing the quotient by the space of all coupled corrections passes the zero-space and tangent checks; the fourth bullet supplies no explicit input. It does not test whether a nonzero correction represents zero cohomology.

   **Exact repair text:** Replace the four bullets by the following computed checks, explicitly using ordinary coefficient differences for the linearized presentation:

   - “Over `R=𝔽₂[ε]/(ε²)`, transport `F=X+Y+XY` by `h=(1+ε)X`, with new law `h(F(h⁻¹X,h⁻¹Y))`. The new law is `X+Y+(1+ε)XY` and its `[2]` is `(1+ε)X²`. Thus the coupled correction has nonzero `XY` and `X²` coefficients, both `ε`, but its cohomology class is zero.”
   - “For `E_t: y²+txy+y=x³` over `𝔽₂[ε]/(ε²)`, compare `t=ε` with `t=0`. The discriminant is a unit, the special fibre has height two, and the `X²` coefficient of `[2]` changes from `0` to `ε`. A marked coordinate correction changes `[2]` by `εψ([2])`, whose order is at least four. Hence this cocycle is not a coboundary.”
   - “With `O_K=ℤ₂` and the same dual-number base, replacing `[2](X)` by `[2](X)+εX` changes its linear coefficient from `0` to `ε`, whereas the structure map sends `2` to `0`. This candidate fails the fixed-tangent condition even though its reduction agrees.”

   The first two distinguish a nonzero representative of zero from a nonzero class; the third excludes a plausible wrong tangent condition. LT66 §3.5 (LT66 line 358) provides the elliptic family; the degree-two calculations follow from the formal parameter `−x/y`.

## Verification of the first-round repairs

All eleven earlier findings were marked applied, not settled as non-actionable. Quotations below are from the package.

| Earlier finding | Repaired passage and location | Witness at this head | Status |
|---|---|---|---|
| 1a/F01, logarithm normalization | README:630, “`ℓ_G(φ(x)) = c·ℓ_F(x)`” | Additive group over ℤ₃, φ=2X,x=3: both sides 6; unscaled value 3. | Repaired |
| 1a/F02, missing Honda headlines | Suggested.lean:176 and :196 now state the Honda-type and strict-isomorphism theorems; README:1506–1518 names them. | For `ℓ_s=Σ(sp)^(−j)X^(p^(2j))`, `pℓ_s−sℓ_s(X^(p²))=pX`; p=2,s=−1 gives coefficients 1,−1/2,1/4. | Repaired |
| 1a/F03, arity-one interpolation | Suggested.lean:104, “`(n : ℕ) (a : Fin n → O)`”; README:751–765 states fraction-field uniqueness. | n=0 gives H=0. For n=2,f=g=2X+X²,a=(1,1), H=X+Y+XY gives both sides `(1+X)²(1+Y)²−1`; linear H gives unequal mixed coefficients 2,0. | Repaired |
| 1a/F04, coefficient-algebra Checks | README:1232–1249, “`(0, 0)`”, “`(1, 1)`”, “`1 − 2·2 = −3`”. | Additive/multiplicative laws give those pairs. Transport by X+cX² gives −2c and c(a−a²), the latter a unit for primitive a in W(F₄). Multiplicative transport by X+2X² changes XY coefficient 1 to −3. | Repaired |
| 1a/F05, former identifiers | README:426–486, “Former numbering” table. | All 10 former layers and 51 design identifiers resolve; `LT.2/finite-height-torsion` resolves to §2.1. | Repaired |
| 1b/F01, supplied tower identification | README:993–1005 now targets the normalized module whose series “is a Lubin–Tate series for `π`”. | This is owned here. Cyclotomic `[p]=(1+X)^p−1` reduces to X^p; replacing π by uπ introduces `[u⁻¹]`, not identity for u≠1, including u≡1 mod π. | Ownership defect repaired |
| 1b/F02, framed versus marked space | README:299–312 and :1347–1352, “height-zero level-zero component”. | Height-zero elements of the division algebra's maximal order are units. Composing with [ϖ] changes framing height by h. S01 is a different, connectedness restriction. | Repaired |
| 1b/F03, former identifiers | README:426–486, same table. | The analytic-logarithm, Tate-module and Artin-comparison aliases resolve, including those used by downstream consumers. | Repaired |
| 1b/F04, equal-characteristic scope | README:121–127, “`O` may be any discrete valuation ring with finite residue field”. | Over F_q[[t]], tX+X^q commutes with the additive law and has height 1. | Repaired |
| 1b/F05, analytic attribution | README:637–641, “for the formal logarithm”, with convergence from the declarations in *Needs*. | H70 line 241 gives the formal identity. At p=2, evaluation on 4ℤ₂ satisfies 1/4<1/2 using the separate analytic input. | Repaired |
| 1b/F06, final-square dependencies | README:2385 includes §4.4 and omits §§3.6,5.5. | At p=5 the degree factors are 6·5=30=5·6. Elliptic coordinate comparison uses §4.4, not either removed input. | Repaired |

## Verified sound

Read all 2,431 README lines and all 235 Suggested.lean lines, including all 50 numbered mathematical targets and 204 Check bullets. The ledger records computed tests by target, including the failed tests behind S01–S03. Read the repository README and CONTRIBUTING rules, all nine Lean declarations (two definitions and seven theorems), and all nine supplied elaborated signatures. Source and supplier counts are specified below.

### Declaration, binder and computed-instance ledger

All declarations are in `TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts`. q in theorems is the actual residue cardinality. O_K denotes the native valuation ring. Contexts include the instances retained by the supplied elaboration.

| Declaration / section | Variable and instance context | Computed instances and sides | Result / change |
|---|---|---|---|
| `IsLubinTateSeries`, :65 / §1.1 | O:Type*, CommRing O, IsLocalRing O; π:O,q:ℕ,f:PowerSeries O | πX+X^q, q≥2: coefficients 0,π and reduction X^q. q=0 would force 0=1 in a nonzero residue field; q=1 forces π̄=1, excluded for a uniformizer. | Real predicate needed by headlines. |
| `IsLubinTatePolynomial`, :71 / §1.1 | Same local-ring context; f:Polynomial O | πX+X^q has degree q and leading coefficient 1. Over ℤ₂, 2X+X²+2X³ is an admissible series but has degree 3 and leading coefficient 2, so fails the q=2 polynomial predicate. | Distinct predicate, not padding. |
| `exists_formalGroup_of_isLubinTateSeries`, :86 / §1.3 | DVR domain O, finite residue field, irreducible π, admissible f | f=2X+X² gives F=X+Y+XY and both endomorphism sides `(1+X)²(1+Y)²−1`. Equal-characteristic tX+X^q gives additive F. Zero ring, field and unit π fail hypotheses. | Generality agrees; no completeness needed. |
| `exists_lubinTate_interpolation`, :104 / §1.2 | Same DVR; field K, Algebra O K, IsFractionRing O K; n:ℕ,a:Fin n→O; f,g for same π | n=0 gives H=0; n=1,a=0,1,f=g gives 0,X; n=2 above gives X+Y+XY. Difference in degree r≥2 is killed by nonzero π−π^r=π(1−π^(r−1)). | Both directions of the K-solution iff hold. |
| `finrank_adjoin_primitive_lubinTate_root`, :138 / §2.3 | K field, valuation relation, topology, IsNonarchimedeanLocalField, CharZero; irreducible π; polynomial predicate; m≥1; primitive t | ℚ₂ at m=1,2: degrees 1,2. ℚ₃: 2,6. Zero t fails primitiveness; m=0 excluded. All roots lie in K(t). | No natural-subtraction junk case. |
| `artinMap_fixes_lubinTate_roots_iff`, :154 / §2.5 | Same local field; m≥0; ϖ:Kˣ representing π; x:Kˣ; all lifts of Art(x) | m=0: roots {0}, all fixed, and ⟨ϖ⟩U₀=Kˣ. At m=1 over ℚ₃, −1 acts by inverse −1 and fails; units ≡1 fix. ϖ² fixes every level. | True signature; S02 concerns the proof route. |
| `exists_hondaType_log_of_map_zsmulSeries`, :176 / §4.3 | p prime; s=±1; K characteristic-zero fraction field of W(F_(p²)); commutative formal G; reduction [sp]=X^(p²) | Model ℓ_s gives left side pX, hence A=X. p=2,s=1,f=2X+X⁴ has log X⁴ coefficient −1/14 and type-expression coefficient −8/7∈2ℤ₂. Additive/multiplicative reductions 0,X^p fail the premise. | Scalar-Frobenius premise retained. |
| `exists_strictIso_hondaLog_of_map_zsmulSeries`, :196 / §4.3 | Same context; ℓ with c₀=0,c₁=1 and exact Honda equation | Model G gives φ=X. For f=2X+X⁴, φ has X⁴ coefficient −1/14−1/2=−4/7∈ℤ₂. Opposite signs give 2s/p, nonintegral at odd p; at 2 the full type congruence separates signs. | Integral comparison, not an identity on free scalars. |
| `exists_lubinTate_endomorphism_formalGroup`, :221 / §4.4 | p prime, s=±1; Weierstrass curve over W(F_(p²)); unit Δ; residue point count p²+1−2sp | y²+y=x³ at p=2: Δ=−27, #E(F₂)=3, #E(F₄)=9; s=−1, parameter −2. Both signs give counts (p∓1)². | Dyadic case admitted; singular curves excluded. |

Headline coverage: interpolation and the Lubin–Tate law (§§1.2–1.3); division fields and reciprocity (§§2.3–2.5); marked deformation representability (§3.6); Honda integrality and comparison (§§4.2–4.4); integral lattice quotients and classification (§§5–6); finite-residue quasi-canonical moduli and quadratic valuations (§§6.6–7.2); primed/anticyclotomic tower comparisons (§§7.3–8.4); formal-trace comparison (§9.3). The seven statable headlines are present. The docstring identifies the missing formal-module/action, deformation, Tate-lattice, finite-residue-moduli and evaluated-trace carriers for the others. The two predicates are used. No theorem is a one-tactic API lemma, boundary-case stand-in, or definition restatement. No additional omitted headline was found statable using only a few native definitions.

I compared all nine supplied `#check @name` results with the source and README: none loses a section hypothesis. I did not run Lean or claim a fresh elaboration; this is an audit of the supplied elaboration at the unchanged head.

### README target and adversarial-value ledger

Rows cover the definitions, conventions, API and Checks in each target. Rejected instances fail explicit hypotheses. q₀ is the smaller residue cardinality in the quadratic setting; q is the LT coefficient-field residue cardinality.

| Target | Instances tried and values computed on both sides | Result / change |
|---|---|---|
| §0.1 formal modules | Additive [p]=0 has infinite height; multiplicative [p]=X^p has height 1. Quadratic restriction gives p-height 2. Structural tangent i differs from conjugate −i; tangent 1 permits nonidentity X+X^p. | Strict action, strict coordinate and identity distinguished. |
| §0.2 evaluated points | Multiplicative p+p gives 2p+p²; zero gives 0. In ℤ₃, ideal 9ℤ₃ excludes 3 while its radical 3ℤ₃ includes it. Nilpotent points in reduced ℤ₃ are {0}, unlike topologically nilpotent points. | Ideals/topologies required and present. |
| §0.3 logarithm | ζ−1≠0 maps to 0. Additive φ=2X,x=3 gives 6=2·3. At p=2,r=2 the norm is 1/4<1/2; r=1 is the excluded boundary. | Repair holds. |
| §0.4 local/global model | ℚ completes to ℚ_p. Nonsquare unramified unit gives degree 2; square gives two degree-one factors. At 2, √−3 is unramified, √−1 ramified. | Fixed completion and separability matter. |
| §1.1 series | πX+X^q gives 0,π,X^q. q=0 forces 0=1; q=1 forces π̄=1. 2X+X²+2X³ gives admissible series but wrong degree and leading coefficient for polynomial q=2. | Definitions exclude wrong models. |
| §1.2 interpolation | n=0 gives 0; n=2 for 2X+X² gives X+Y+XY, mixed coefficients 2=2. Linear candidate gives 2≠0. 1/2 is integral at odd p, not at 2. In F_(p²), some ā have ā^p≠ā. | All arities and full residue cardinality retained. |
| §1.3 formal law | Cyclotomic f gives multiplicative F; tX+X^q in equal characteristic gives additive F. In characteristic zero nonlinear f is not additive: mixed binomial coefficients are nonzero. Parameter −p in quadratic case has p-height 2. | No good-prime shortcut. |
| §1.4 coordinates | For f=πX+X^q,g=f+πX², recursion gives c(π−π²)=π and c=(1−π)⁻¹. f=g,a=1 gives X. Over ℤ₂, [3]=3X+3X²+X³, and [2][3]=[3][2]=(1+X)^6−1. | Direction and action agree. |
| §2.1 finite torsion | m=0 rank 1. μ₃ over ℤ₃ has ordinary spectrum with three prime points, 3-adic formal spectrum with one. Over F₃[ε]/ε², X³ still gives rank 3. Additive [p]=0 gives nonfinite torsion. | Ordinary scheme and finite height essential and explicit. |
| §2.2 Tate module | Height h gives ℤ_p-rank h. Quadratic LT: O-rank 1, ℤ_p-rank 2. Cyclotomic T=ℤ_p(1), rational quotient ℚ_p/ℤ_p. | No dual/twist reversal. |
| §2.3 primitive tower | At p=2 degrees 1,2; p=3 degrees 2,6. Zero not primitive. Parameter uπ changes residual scalar to [u⁻¹]≠id. BKO n means division exponent n+1. | Added bridge owns normalization comparison. |
| §2.4 character | Cyclotomic ζ↦ζ^a; mod π image size q−1; basis u cancels by u⁻¹au=a. Level-m restriction gives U_m; level 0 all units. | Rank-one commutativity justifies basis independence. |
| §2.5 norms | m=0 gives Kˣ and fixed root 0. Arithmetic u acts by u⁻¹, geometric by u. π² fixes its tower; Art(π) on uπ tower has value u. S02 gives two index-72 candidate subgroups. | Theorem true, route needs S02. |
| §2.6 parameter change | u=1 identity; u≠1 gives Frobenius value u instead of 1. u=−1 gives −1. Art(uπ) gives u⁻¹u=1; on units v both values v⁻¹. Inverse twist would give u⁻². | Sign and direction tested. |
| §3.1 deformations | h=1 dimension 0. Multiplicative [1+p] reduces to X+X^p+X^(p+1), tangent 1 but nonidentity. Over R=O_F/(π²), π²=3, the height-two ℤ₃ problem has parameter choices 0,π,2π; the height-one O_F-action problem has one class. | Marking and structural map not suppressed. |
| §3.2 coefficient algebra | Additive/multiplicative (0,0),(1,1); transported additive −2c,c(a−a²), the latter a unit at primitive a in W(F₄). Multiplicative XY coefficient 1→−3 under X+2X². | Repaired Checks discriminate. |
| §3.3 cocycles | I=0 gives 0 but does not test the quotient. Multiplicative dual-number scaling gives nonzero ε corrections with class 0. Elliptic t=ε gives X² correction ε with nonzero class. | S03: existing Checks do not compute these distinctions. |
| §3.4 rigidity | Multiplicative coordinate change gives nonzero εXY correction with class 0. Additive εX^q reduces to 0 but can be nonzero as a homomorphism. Finite-height hypothesis excludes this additive countermodel. | Hypothesis retained. |
| §3.5 tangent spaces | h=1 dimension 0; h=2 dimension 1. Quadratic coefficient action, O-height 1: dimension 0; underlying ℤ_p-height 2: dimension 1. | Action-sensitive dimension. |
| §3.6 universal rings | Connected h=1 gives B, h=2 gives B[[t]]. Framing [ϖ] changes height by h. μ_(p∞)⊕ℚ_p/ℤ_p gives dimension 1 versus formal completion's 0. Specified B avoids a canonical Cohen ring for F_p(t). | S01 only on supplier specialization. |
| §3.7 elliptic comparison | Supersingular height 2 gives one parameter on both sides. Local O_F action need not be global: intersection with the global elliptic endomorphism ring can be ℤ. Parameter uX has tangent u, not 1. | Restricted comparison correctly scoped. |
| §4.1 Honda operators | p−sT² cancels model sum to pX. At p=2 the wrong sign gives X¹⁶ coefficient 2/p=1∉2O. q=1 would give infinitely many contributions to one coefficient; q≥2 avoids that. | Twisting and local finiteness correct. |
| §4.2 integrality | Multiplicative type p−T. Arbitrary log X+X²/p gives XY coefficient −2/p; at p=2 a higher coefficient is −5/2. Same-type comparison uses C=t=1. | Integrality theorem has substantive hypotheses. |
| §4.3 Honda model | pℓ_s−sℓ_s(X^q)=pX; p=2,s=−1 coefficients 1,−1/2,1/4. For f=2X+X⁴: log −1/14, coordinate −4/7. Opposite signs give 2s/p. | New headlines match. |
| §4.4 elliptic Frobenius | y²+y=x³ at 2 has counts 3,9 and parameter −2. Counts (p∓1)² correspond to scalar ±p. Ordinary height-one reduction degree p differs from required p². | Includes 2 and 3, sign correct. |
| §5.1 lattices | L=T kernel 0; π⁻ᵐT kernel size q^(hm). Rank-two residue line has q elements, not q². O-stability need not imply Galois stability. | Finite index and stability separate. |
| §5.2 quotients | Zero kernel gives X. Full π-torsion gives degree q^h. Multiplicative product has leading unit ∏(1+c)⁻¹, not automatically 1. Residual degree q^N gives Frobenius twist N. | Source, target and unit normalizations distinguished. |
| §5.3 homomorphisms | a=0 gives zero. L=T gives integral endomorphism ring. L₂=π⁻¹L₁ admits scalar π⁻¹ as isomorphism although it does not preserve L₁. | Correct source-to-target lattice criterion. |
| §5.4 definition fields | q₀=2: point and line orbits both 3. q₀=3: nonzero points 8, lines 4. A unit of order q₀+1 and its square need not stabilize a line. | Uses lattice, not point, stabilizer. |
| §5.5 elliptic quotients | Zero subgroup identity. Ordinary connected p-torsion degree p versus full E[p] degree p². An F_p-line is not stable under all F_(p²) scalars. | Action-stable subgroup restriction present. |
| §6.1 canonical lift | Quadratic O-height 1 gives underlying height 2; T ranks 1 over O_F, 2 over ℤ_p. Conjugate CM embeddings have different tangent action. | Embedding and marking are data. |
| §6.2 lattice lifts | L=T canonical. Degree q^N quotient shifts twist by N; shifting by residue degree f restores coefficient-field Frobenius. | Marking retains twist. |
| §6.3 classification | uT=T for integral units, but uL≠L can be unmarked-isomorphic with different marking. Cubic order O+πO_F has colength 2, conductor colength 3. | General lattices, not only invertible ideals. |
| §6.4 orders | O₀=O_F, conductor O_F; O₁ index q₀. Ramified conductor π^sO_F has F-valuation 2s. 1+O_F contains 0. | Level-zero unit convention correctly separate. |
| §6.5 quadratic quotients | L_s/T has q₀^s points; q₀=2,s=1 gives 2, not 4. Marked orbit size 3 unramified, 2 ramified. Scalar outside O₁ fails endomorphism condition. | Order, kernel and orbit agree. |
| §6.6 moduli fields | Canonical field F. Art(π_F) sends T to π_F⁻¹T in same homothety class. Order≥3 unit distinguishes inverse from direct action. Unmarked orbit can be 1 while marked orbit is larger. | Marking and inverse convention retained. |
| §7.1 degrees | s=1 gives q₀+1,q₀; s=2 gives q₀(q₀+1),q₀². q₀=2: 3,2 then 6,4. s=0 degree 1 differs from positive-level formula. | Dyadic and ramified cases included. |
| §7.2 valuations | Positive level 1 valuations 1/(q₀+1),1/q₀. Canonical ramified parameter valuation 1 versus base maximal ideal minimum 2. π²=3: [π]² has X³ coefficient 4π, vertices (1,2),(3,1),(9,0). | Positive-level condition avoids source's level-zero error. |
| §7.3 primed tower | p=5 degrees 6,30,150, ratio 5; level 0 degree 1. First nonzero point degree 24 differs from quotient field degree 6. | Fields and indexing distinguished. |
| §7.4 primed Galois group | p=5 orders 6,30,150; torsion order 6, pro-p rank 1. Full LT pro-p rank is 2. | Correct quotient. |
| §7.5 endomorphism parameter | At p=5 first extension e=6, so v(−5)=6, not 1. Endomorphism order index 5; residual [−5]=X²⁵. | Parameter not called extension uniformizer. |
| §7.6 neighbors | p=5 first shell 6; later one inward and five outward. Unit quotient has 25 elements but acts through order 5. | Stabilizer quotient counts children. |
| §8.1 full/tame tower | p=5 degrees 24,600; tame group order 24, pro-p rank 2. Arithmetic Artin on Teichmüller ζ gives ζ⁻¹. | Convention consistent. |
| §8.2 plus/minus units | Log plus=pℤ_p, minus=trace-zero line. Tr(log(1+p))=2log(1+p)≠0; intersection 0 because 2 is a unit. | Odd-prime condition local to this specialization. |
| §8.3 anticyclotomic | p=5 initial degree 1, first Θ degree 25 and Ψ degree 5. Gal(Ψ_n/Φ) order 5^n; over ℚ₅ also an involution of order 2, acting by γ↦γ⁻¹. | No pro-p assertion over ℚ_p. |
| §8.4 tower comparison | p=5 primed 6,30,150 versus anticyclotomic 1,5,25 with shift. First intersection Φ, compositum degree 30. Tame factors 6 and 24 differ. | Shift and tame quotient agree. |
| §8.5 signs | [−p]v_(n+1)=v_n and w_n=[(−1)^n]v_n give [p]w_(n+1)=w_n. Unmodified sequence gives −v₀ at n=0. Formal inverse can be −X+2X², unlike ordinary negation. | Group inverse used. |
| §9.1 trace | Identity trace identity; rational point trace [d]x. Multiplicative conjugates ±√p give (1+√p)(1−√p)=1−p, trace point −p, while ordinary trace is 0. | Formal sum differs from parameter sum. |
| §9.2 tame descent | At p=5,d=6, D_s(x)=[6]x for base-field x; 6 is a unit of O, so the integral action [1/6] gives D_s([1/6]x)=x. Zero returns 0; the normalized projector fixes x, while D_s gives [6]x. | Integral section exists because p does not divide p+1. |
| §9.3 square | At p=5, 6·5=30=5·6. Log value 25 gives 750 on both paths; odd sign step gives −750 on both, wrong sign +750. Full division field degree 600 differs from primed 30. | Dependencies and signs consistent. |

### Supplier, ownership and pinned-library audit

Checked 11 named supplier contracts, covering 32 section/layer addresses with the finite Dieudonné range expanded, and the former ClassFieldTheory §2.6 alias. Repeated citations in *Needs* refer to these same addresses. The five unresolved-name leads supplied with the job are planned supplier declarations, not claims that the names exist at the pin.

| Supplier | Current address and result |
|---|---|
| RelativeFarguesFontaine | §2.5, README:1297: finite fields E_m, compatible scalar-action groups and infinite unit comparison are present. Its LT is the VectorBundlesAndIsocrystals object. This package owns the arbitrary-series/primitive-root comparison, not another division tower. |
| VectorBundlesAndIsocrystals | Layer 5, README:1099: G_LT, the renormalized Dieudonné module F=σ/π, descent to O_E and universal cover are stated. The new §2.3 explicitly owns the normalization bridge. |
| GrossZagierAndArithmeticHeights | §7.2, README:2944 at the supplied open head: marked quadratic lifts, fixed Lie embedding, orders, quotient degrees and orbit sizes, including ramification at 2. This package adds finite-residue descent and higher-degree lattices. The strict completed base is not erased. |
| EndoscopicTransferAndUnitaryTraceComparison | §§10.2,12.3, README:3623,:4593: the addresses exist. The quasi-isogeny-height restriction is repaired. §10.2 also includes an étale part, causing S01. Its geometric Artin convention is not imported into this package's arithmetic scalar character. |
| BordismFormalGroups | F1, README:46, and F5 deformation paragraph :543: formal homomorphisms, evaluated-point extension, logarithm, Lazard/cocycle theory and perfect-field deformation theorem. This package adds structural coefficient actions and the specified-base comparison; it does not rebuild generic formal-group algebra. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.1.1, .8, .12, .13, .20, .20a, R07.2.6–.8: the quoted actions, radical point carrier, connected formal/p-divisible equivalence, Tate module, closures, quotient and contravariant Dieudonné inputs exist under the stated hypotheses. The five names in the citation leads occur in these planned interfaces. |
| EllipticCurves | Layers 1,3: isogenies, formal-group milestones and finite-field Frobenius polynomial with positive multiplicative degree are present. They justify the implication `(Frob−[sp])²=0 ⇒ Frob=[sp]`; an arbitrary endomorphism algebra with nilpotents would not. |
| ModularCurves | Former 0B,0C,2B,7C,7D,7E,7F resolve through README:4504–4538 to §§0.2,0.3,2.2,7.2,7.4,7.1/7.3,7.5. Read the current targets, including PD-1–PD-5 and ST-1/ST-2. The supersingular/complete-local/marked restrictions match the uses here. The former-number table means no supplier-drift finding. |
| ClassFieldTheory | Layers 6–8 and former §2.6→C.6: arithmetic Artin normalization, finite reciprocity and mixed-characteristic existence match. S02 is not a missing class-field theorem; it is an invalid inference from its application. |
| LocalFieldsRamification | Completed roadmap Layers 0–2: local fields, unit filtration, Teichmüller, logarithm and algebraic maximal unramified field. README:395 requires `(p−1)i>e`; at p=2,e=1, i=2 passes and i=1 fails. |
| RamificationOfCompleteDiscretelyValuedFields | Main §4a.3, README:1185: completed maximal unramified base, e=1, separable-extension equivalence and inertia identification. The package's finite-residue local fields satisfy the supplied hypotheses. |

Supplier paths in this table are `TauCetiRoadmap/<Supplier>/README.md`, except `Completed/LocalFieldsRamification/README.md`. Sources were resolved against main or the readable open heads, not against a remembered section number. The different board draft of GrossZagierAndArithmeticHeights was not used for its citation numbering.

Ownership searches used objects (formal coefficient actions, Honda types, LT series, G_LT, lattice quotients and quasi-canonical lifts), across main, board packages and the open heads through `roadmaps grep`. Read the closest scope/ownership texts: AnticyclotomicLocalUnits, FiniteFlatGroupsAndIntegralPadicHodgeTheory, FunctionFieldArithmetic, NonordinaryCMSpecialValues and BordismFormalGroups. AnticyclotomicLocalUnits explicitly consumes the geometric towers and formal traces; NonordinaryCMSpecialValues consumes Layers 2 and 4 for its global CM application. FunctionFieldArithmetic explicitly consumes §§0–1 in either characteristic and supplies the equal-characteristic torsion/reciprocity extension in its §4.1. No upward dependency on those consumers was added. G_LT's universal cover and Gross's strict-base quadratic lift remain with their earlier owners; the added comparisons belong here. No same fully qualified declaration name was found in a different roadmap. The namespace/name search's hit in the submitted roadmap is its own indexed copy, not a second owner. The overlap lead identifies that same open roadmap; main contains no second copy, and no dropped supplier identifier was reported.

The pins read from `lake-manifest.json` are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Native object checks included:

- `Mathlib/RingTheory/FormalGroup/Basic.lean:57`: the carrier has the formal law and linear terms; commutativity is an additional property. Its original points are power series with nilpotent constant coefficient, not arbitrary valued-field elements. `Mathlib/RingTheory/LocalRing/Defs.lean:30` includes nontriviality. Multivariate substitution is native in `Mathlib/RingTheory/PowerSeries/Substitution.lean`; Lagrange interpolation of polynomials does not prove the functional equation of §1.2.
- `TauCeti/RingTheory/FormalGroup/Hom.lean`, `TopNilpotentPoint/Basic.lean` and `TopNilpotentPoint/Hom.lean`: actual homomorphism and evaluated-point carriers, with completeness/separation/evaluation hypotheses. The bare carrier does not manufacture a coefficient action or Tate module.
- `TauCeti/RingTheory/FormalGroup/Logarithm/Basic.lean:333` (`FormalGroup.log`) and :489 (base change); `Logarithm/Convergence.lean:44,:71` (coefficient bound and summability); `Exponential/Padic.lean:76` (strict radius); `Rigidity.lean:186` (Hausdorff maximal-ideal topology and finite residual height). The README retains their domains rather than claiming unconditional evaluation or rigidity.
- `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58,:75`: formalGroup and map_formalGroup; `FormalGroup/Point/AdicCompletion.lean:273,:292` and `FormalGroup/Point/Range.lean:158`: point map, injectivity and range. Their Dedekind-completion hypotheses explain §0.4's number-field model.
- `TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:114,:132,:205`: absolute map, restriction and existential norm subgroup; `Local/Reciprocity.lean:139`: `localArtinMap_eq_zero_iff` for the specified finite extension. The existential result alone does not select the claimed open subgroup in S02. `TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:104,:145` retains the separate depth-zero convention.
- Native Weierstrass preparation and quotient algebra supply finite freeness; finite-projective Hopf spectra are ordinary spectra. `TauCeti/AlgebraicGeometry/FormalScheme/Spf/Carrier.lean`, `carrier_eq_zeroLocus`, limits the formal spectrum to open primes. These do not duplicate the compatible finite-height torsion construction.

The nine-declaration near-match list was read. Its polynomial interpolation, substitution/base-change, monic-polynomial, and special elliptic/cyclotomic hits do not imply the general seven headlines in one tactic or one library invocation. No padding deletion is requested.

For nonabelian controls, scalar characters factor through abelianization: S₃ gives C₂, and Q₈ gives C₂×C₂. Inversion is not asserted to be a homomorphism of those nonabelian groups. Zero rings, height zero, q=1 and unit uniformizers fail the explicit local/domain/positive-height hypotheses where used; rank-zero kernels and level zero are computed in the ledger. The additive infinite-height model is explicitly excluded from rigidity and finite torsion. All point topologies are specified; no arbitrary-topology carrier was used to make a theorem vacuous.

The requested read-only dependency check returned exactly:

```text
depcheck: 239 roadmaps, 2175 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The layer arrows also run forward: in particular §2.5 uses §1.2, not the later change-of-uniformizer theorem; §6.6 uses the already-built marked quotients; §9.3 now uses §4.4. S02 supplies the missing logical step inside the claimed §2.5 route without adding a cycle. There are no declared gaps to audit.

`git diff --stat origin/main...HEAD` and the complete changed-path list contain ten files, all inside this package: README, Suggested.lean, sources.toml and seven existing repair reports. No outside-package edit, computational algorithm, `set_option`, sorry'd data, process narrative in mathematical text, or `lemma` declaration was found. The imports are Mathlib plus five existing individual Tau Ceti modules. No repository, source, manifest or Lean file was changed during this review; only the report and scratch evidence were written.

### Source verification and expression audit

Checked 48 distinct locator groups against the seven readable sources below; repeated source-ID citation occurrences before References total 91. This is locator/statement verification, not formal certification of the source proofs. LT65's 15 occurrences remain settled uncertified and are excluded from the 48. Source errors are separated below from package findings.

| Source; citation occurrences | Locator groups read and result |
|---|---|
| LT66; 6 | Six groups: Propositions 2.4 and 2.6, Remark 2.5, Theorem 3.1, Proposition 3.3 and §3.5. LT66 lines 148, 190, 214, 284, 331, 354–358. Fixed-base deformation, cocycles and the elliptic family match their uses. |
| H70; 7 | Eleven groups: Theorem 1 (line 241), condition (F) (305), Lemmas 2.3–2.4 (373,380), Theorems 2–3 (431,482), Proposition 3.3 (537), Theorem 4 (607), Proposition 3.5 (668), Lemma 4.2 (738), Theorem 9 (1100). Formal identities and the integrality/type criterion match; convergence is no longer attributed to Theorem 1. |
| H68; 3 | Theorem 2 (H68 line 210) and Corollary 4 (497). The latter's elliptic setting is not used to bypass the general scalar-Frobenius argument. |
| G86; 15 | Three groups: Proposition 2.1 (G86 line 77), §5 quotient construction (180), Proposition 5.3 (204). The strict completed base and positive-level formula are preserved; finite-residue descent is separately justified through Y95. |
| Y95; 23 | Nine groups: §2 (line 84), §3 (116), Propositions 1–2 (186,200), Theorem 1 (212), Proposition 4 (305), Theorem 2′ (350), §6 canonical/quadratic example (361–376), §9 Lemma 3 (469). Rendered the cached pages 301,302,305 to read displayed formulas lost in extraction. Theorem 2′ requires a break; §7.2 retains the positive-level restriction. The source's residue-ring and level-zero overstatements are not repeated by the package. |
| VZ07; 7 | Twelve groups: Definition 1.1 (2697), Theorem 1.4 (2739), Lemma 2.1 (2799), Definition 2.2 (2833), Lemma 2.6 (2859), equations (3.1)–(3.7) (2877), Proposition 3.2 (2903), Lemma 3.3 (2939), Corollary 3.4 (2951), Lemma 3.5 (2976), Proposition 3.6 (3000), Theorem 3.8 (3021). The package explicitly adds the fixed tangent condition omitted in the displayed cocycle definition. |
| BKO21; 15 | Five groups: §2 (230–280), §4 (525 onward), §5.0.1 (554 onward), Lemma 5.1 (573–588), §5.0.2 (712–768). Compared inverse Artin action, tame factors, generator signs, ring-class shift and trace operations. The package's scalar-Frobenius sign is corrected. |
| LT65; 15 | §1 condition (1), Lemma 1, Theorems 1–2; §2 Lemma 2, Theorem 3 and corollary. Settled uncertified; no fetch or missing-reference request. Algebraic examples above are not misrepresented as reading its text. |

Expression comparisons comprised 42 principal passage pairs: VZ07 with §§0.1,2.1,3.2,3.4–3.6 (6); LT66 with §§3.1,3.3,3.7 (3); H70 with §§0.3,4.1–4.4 (5); H68 with §1.2 (1); G86 with §§5.2,6.1,6.4,7.1,7.5 (5); Y95 with §§2.2,5.1,5.3–5.4,6.2–6.3,6.5–6.6,7.2 (9); BKO21 with the elliptic theorem docstring and §§5.5,7.3–7.4,7.6,8.1–8.5,9.1–9.3 (13). All locators just listed were compared within these groups. Five further comparisons used the §0.1 tangent-action explanation (VZ07 line 2697), §3.2 relation-module proof plan (VZ07 line 2718), §4.1 local-finiteness explanation (H70 line 305), §6.3 non-Gorenstein Check (Y95 line 186 onward), and §7.2 coordinate-invariance explanation (Y95 line 350 onward). No copied expressive sentence, clause-by-clause paraphrase, source table, figure or exercise sequence was found. Standard mathematical names and forced formulas are not expressive-copying findings.

Y95 has the largest share, 23/91. Its numbered sections were compared with the layers: Layer 3 uses Y95 §2 but develops action-sensitive algebra with LT66 and VZ07; Layer 5 uses §3; Layer 6 combines §§4–5 and G86; Layer 7 combines §6 and its later proof with BKO21. These are not a one-to-one run of equal-scope source sections. The *Needs* arrows force marked deformations before moduli, §5.2 before §6.2, and §6.6 before §7.2. Y95's valuation-function development (§§7–8) and later proof sections are not made separate roadmap layers. The Honda layer and BKO field/trace layers serve different outputs. No arrangement or verbatim-reuse finding.

For the imperfect-field source error, `k=F_p(t)` has two maps to `k[ε]/ε²`, taking t to t and to t+ε, with the same residue map. Composing either with a proposed initial coefficient object's residue map contradicts uniqueness. For VZ07, take a ramified coefficient ring with uniformizer π and ramification index at least two: its height-one LT law over O/π² has tangent π=ε, whereas the constant residual lift has tangent 0. Their difference satisfies the unrestricted linearized identities; a coordinate coboundary cannot change the tangent of [π]. This extra class is excluded by the package's explicit tangent condition. Y95's zero-kernel-point control gives `g_L(0)=0`, valuation infinity, rather than the finite displayed expression. BKO21's pro-p assertion fails because the extension over ℚ_p has a quotient of order 2 for odd p.

Source independence: 47 passage pairs compared with 7 readable sources; no copied expression found; largest share Y95, 23 of 91 locator occurrences; contents compared with Y95: independent. LT65 wording remains untested because its text is settled uncertified.

## Not verifiable

- LT65 text and its proof details are settled uncertified. No new request was made under another key. The proposed reordering in S02 still relies on the cited uniformizer-comparison argument, whose complete source proof was unavailable here.
- The full proof computations in Y95 §§9–10 were not independently reconstructed. The cited theorem, break hypothesis and quadratic formulas were inspected; source Lemma 3's domain error was checked on the rendered page. The computed low-level Newton polygons in the ledger are independent checks, not a certification of every induction in that proof.
- No fresh Lean elaboration or proof build was run. The nine supplied elaborated signatures were compared with the unchanged source. A `sorry` elaboration would not certify the mathematics in any event.
- The ownership search covers the available main, board and indexed open heads, not unknown or inaccessible private work. No evidence of adaptation of a declaration from a separate public formalization was found.

## Source issues

The package avoids the following source defects; they are recorded for the errata register, not additional package findings.

- **Misprint** in BKO21 at Lemma 5.1(ii), printed page 956 (BKO21 line 576): the source says trace `2sp` gives type `p+sT²` and parameter `−sp`; it should be type `p−sT²` and parameter `sp`; affects a stated result.
- **Error** in BKO21 at §2, printed page 948 (BKO21 line 248): the source says the anticyclotomic extension containing the quadratic base is pro-p over ℚ_p; it should be pro-p over the quadratic base, and generalized dihedral over ℚ_p; affects a stated result.
- **Misprint** in BKO21 at §5.0.2, printed page 958 (BKO21 line 728): the source says the ring-class degree is attached to `Φ′_s`; it should be attached to the just-defined `Ψ′_s`; affects nothing.
- **Error** in Y95 at §2, printed page 294 (Y95 line 85): the source says every residue-field extension has an initial complete noetherian coefficient ring; it should be restricted to perfect residue fields, or formulated over a specified coefficient ring; affects a stated result.
- **Error** in Y95 at §6, quadratic example, printed page 302 (Y95 line 372): the source says the unramified quadratic modulus formula applies at every level; it should be restricted to positive levels, since level zero has no required Newton break; affects a stated result.
- **Error** in Y95 at §9, Lemma 3, printed page 305 (Y95 line 469): the source says its finite valuation formula applies to arbitrary torsion points of the quotient; it should be applied to torsion points of the source outside the kernel; affects the proof.
- **Gap** in VZ07 at §3, equations (3.1)–(3.7), printed page 62 (VZ07 line 2877): the source says coupled corrections satisfying the displayed identities define the relevant cocycle space; it should be restricted to corrections with zero tangent variation for the fixed structural coefficient action; affects a stated result.



## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "281d0dddbebc8fcd941a54f0771c0ea699b94f43", "job": "RT-LubinTateFormalModulesAndQuasiCanonicalLifts~2a", "model": "gpt-6-astra", "worker": "chris-30"} -->
