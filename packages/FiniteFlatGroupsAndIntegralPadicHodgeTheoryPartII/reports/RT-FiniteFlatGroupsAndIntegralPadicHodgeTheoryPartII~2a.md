<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1244#issuecomment-6485624239 -->
Red team round 2 pass a (codex) of cf48b63

Verdict: needs_changes

1. **F01** (P1) The repaired unramified reduction still misses transcendental perfect residue fields

   **Location:** packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:110 and :1441, “a field finite over ℚ̆_p”.

   **Claim:** Replacing k by its algebraic closure makes the period-torsor theorem of PadicHodgeTheory §5.5 applicable for every perfect k.

   **Witness:** Take k=an algebraic closure of 𝔽₃(t), K=W(k)[1/3]. Then k̄=k and K̆=K; its residue contains transcendental t. Every finite extension of ℚ̆₃ has residue 𝔽̄₃.

   **Exact repair text:** “For k algebraic over 𝔽_p, unramified base change reaches a finite extension of ℚ̆_p. For arbitrary perfect k we use the following supplier extension. What PadicHodgeTheory must provide (gap:perfect-residue-period-torsor-comparison): For a perfect field k of characteristic p, finite totally ramified K/W(k)[1/p], a connected reductive G/ℚ_p, and two admissible G-valued filtrations on the same tensor G-isocrystal with geometrically conjugate cocharacters, their rational crystalline realizations have tensor-isomorphic underlying ℚ_p-valued fibre functors.” Add this exact slug, supplier and §5.5 contract to design/plan.json's gaps and cite it in §5.17. Remove the assertion that W(k̄)[1/p] is always ℚ̆_p and the unconditional application of the current supplier. Retain the theorem's perfect-residue scope.

   **Repair test:** For the displayed algebraically closed transcendental k the new contract applies directly, without asserting a finite extension of ℚ̆₃. For k=𝔽₃ the existing base-change argument remains in range. PadicHodgeTheory §5.5 explicitly starts its period-torsor target with K/ℚ̆_p finite; the separate general-residue admissibility theorem does not fill this gap. This is the unrepaired part of round-one F02, which the repair report marked applied differently, not settled as non-actionable.

2. **F02** (P3) The new period-torsor Check reverses the local cocharacter convention

   **Location:** packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:1439, “b=3 and μ(z)=z”.

   **Claim:** This is an admissible jump-one test instance of §5.17, whose filtration is induced by μ⁻¹.

   **Witness:** On G_m, μ=z gives μ⁻¹=z⁻¹ and filtration jump −1. Frobenius 3σ has Newton number 1, so t_H=−1≠1=t_N; this is not the asserted admissible instance.

   **Exact repair text:** “For k=𝔽₃, K=ℚ₃, G=G_m, b=3 and μ(z)=z⁻¹, μ⁻¹ induces the jump-one filtration. After base change K̆=ℚ̆₃ the period-torsor cocharacter is μ⁻¹, and κ(b)−(μ⁻¹)^natural=1−1=0. Both realizations have underlying one-dimensional ℚ₃-space.”

   **Repair test:** With μ=z⁻¹, t_H=t_N=1 and μ is the inverse Hodge cocharacter required by §5.17. Kisin17 lines 484–490 explicitly use μ conjugate to μ₀ and the filtration of μ⁻¹. This error was introduced by the repair of F02.

3. **F03** (P2) The global odd-prime convention unnecessarily narrows the perfect-ring comparison

   **Location:** packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:24, :152 and :207, “Let p be a prime with p>2.”

   **Claim:** The global convention also restricts the perfect-ring anti-equivalence and its height-one F/V reformulation to odd primes, although those two targets use the all-prime perfect-ring theorem.

   **Witness:** At p=2, R=𝔽₂, μ₂∞ corresponds to M=ℤ₂, F=2,V=1; the étale line has F=1,V=2. Lau14 Theorem 5.3, line 1730, covers this prime; lines 1723–1726 explicitly discuss it.

   **Exact repair text:** “Except in §§0.2 and 0.5, let p be a prime with p>2. The perfect-ring Dieudonné anti-equivalence and its height-one shtuka reformulation in §§0.2 and 0.5 hold for every prime p, including p=2; they use Lau14's perfect-ring category directly, independently of the odd-prime complete-local Zink-frame construction.” Add to §0.5's Checks: “Over 𝔽₂ the multiplicative line has (F,V)=(2,1), the étale line has (1,2), and each satisfies FV=VF=2.”

   **Repair test:** Both dyadic lines meet the displayed height bound 2M⊂FM⊂M; the proposed V is integral and unique. The complete-local display theorems retain their separately stated source hypotheses. This restores the generality of the cited theorem without importing a dyadic complete-local display construction.

## Round-one finding verification

The six findings of pass a and three findings of pass b were rechecked separately. Pass-b F01–F03 are called B01–B03 in the repair report. Eight are repaired; a/F02 is partly repaired. No finding was marked non-actionable in the repair report, so none is being reopened against a settlement.

| Earlier finding | Status and repaired passage (README lines) | Verification witness |
|---|---|---|
| a/F01, rational σ-centralizer lacks descent | Repaired. §2.0: “Let G be a connected reductive group over ℚ_p” (532); its representation transports the descent action. | For a∈𝔽₉∖𝔽₃ and u=[[1,[a]],[0,1]], u diag(2,1)u⁻¹ has upper-right entry −[a]. Entrywise σ gives −[a³]≠−[a]; transported σ fixes it. The new definition uses the latter. |
| a/F02, missing period-torsor input | Partly repaired. “for K finite over ℚ̆_p” (110) correctly describes the current supplier, but “a field finite over ℚ̆_p” (110,1441) is false for general perfect k. | k=algebraic closure of 𝔽₃(t) remains transcendental after algebraic closure. S01 records the remaining gap; S02 records the new sign error in the repair's Check. Finite k is now covered. |
| a/F03, duplicating separatedness/contraction | Repaired. “These are the T-adic separatedness and ideal-contraction steps of §4.11” (42); the gap at 72 asks only for DVR-point detection. | In B=ℤ₃[[T]], I=(T²), ∩(I+TⁿB)=I and I[1/3]∩B=I. For I=(3), contraction is B≠I and the new torsion-free hypothesis excludes it. Both pinned declarations exist. |
| a/F04, de Jong page locator | Repaired. “Proposition 7.3.6, pp.89–90 and Theorem 7.4.1, pp.90–91” (46). | deJong95 lines 2952, 2984 and 2988 locate the proposition, page transition and theorem. The same corrected locator appears in the reference list and sources.toml. |
| a/F05, trivial horizontality Check | Repaired. “the non-scalar invariant E₁₁ is horizontal” (662). | For diagonal g=diag(2,1), gE₁₁g⁻¹=E₁₁ but gE₂₁g⁻¹=(1/2)E₂₁=2E₂₁ over 𝔽₃. The torus local model is a point and c=id, so the positive Check is an actual canonical transport. |
| a/F06, PD/additivity and basis-transport Checks | Repaired. “second coordinate −x²y−xy², which is nonzero” (198); §2.10 transports the marking as well (727). | In 𝔽₃[x,y]/(x³,y³), the displayed polynomial has two nonzero distinct monomials. The prescribed divided powers exist. Swapping e₁,e₂ gives wE₁₁w⁻¹=E₂₂; leaving E₁₁ unchanged fails since E₁₁e₁=e₁ and E₂₂e₁=0. |
| b/B01, arbitrary smooth model identified with parahoric | Repaired. §4.2 says “If moreover 𝒢=𝒢_z is the Bruhat–Tits stabilizer” (1019). | For the dilatation along diagonal a,b with a^(p−1)=b^(p−1), diag(χ,1) lies in the model but outside its identity component when χ mod p≠1; v_p(det)=0. The general conclusion now is only ker κ; the parahoric conclusion has the missing fixer hypothesis. KP18 lines 2398, 2430 and 2437 distinguish these hypotheses. |
| b/B02, proposed negative controls do not discriminate | Repaired. §2.9 uses “A lift whose generic Hodge line is K(e₁+te₂) with t∈m_K nonzero” (704); §2.10 uses transported versus untransported projectors (727). | E₁₁(e₁+t e₂)=e₁ belongs to K(e₁+t e₂) iff t=0. The t=0 case passes; nonzero t∈m_K fails despite having the same reduction. The basis-swap test above checks the second repair. |
| b/B03, Hoff/KZ/de Jong locators | Repaired. §0.11 cites “Hoff23, Definition 1.10, p.11” (320); §5.9 cites “§3.4.1, pp.25–26” (1306); §6.1 cites “§3.4.1–3.4.2, pp.25–27” (1496). | The defining display is at Hoff23's Definition 1.10; KZ25 line 1115 begins §3.4.1 before the p.26 marker at 1123. The de Jong repair is verified above. |

The rank-swap lead in §0.11 was rejected: the listed ranks are height 2 and Hodge rank 1. They are not the two rank-one summands of an ordinary height-two display.


## Computed adversarial ledger

Notation for this ledger: W=W(k), S=W[[u]], E=u−p in the unramified rank-one examples, P=E₁₁, N=E₂₁, and ε²=0. Unless a row says otherwise, p=3 and the frame is (W,(p),σ,σ/p on (p)). “Retain” means that these instances give no additional defect, not that examples prove the general theorem. An ambient negative control is explicitly distinguished from an instance of a good tensor datum.

The standing mixed-characteristic, perfect-residue and p>2 assumptions exclude equal-characteristic fraction fields, p=2 displays in these layers, and inseparable field extensions of perfect fields. The source-supported perfect-ring anti-equivalence is separately tested at p=2, exposing S03 in the package’s global convention. The zero ring is permitted for the abstract frame/pair algebra and perfect-ring interface, but not as a field, DVR or local ring with specified field residue. Noncommutative groups enter through GL₂ and its noncommuting elementary matrices; the coefficient rings remain commutative. There is no natural-number division, out-of-range array access, finite-set averaging, q=1 residue field, compact-group integration or quasi-separated-space assertion in these target signatures.

| Target | Instances tried; computed values on the two sides / negative control | Result; change |
|---|---|---|
| 0.1 Zink ring | R=k: Ŵ=W(k), kernel VW(k). R=k[ε]: finite ε-coordinate support tends to 0; constant nonzero ε sequence never does. R=W(k): p maps to p≠0, excluding a unital section k→R. | Retain. |
| 0.2 Perfect-ring Dieudonné | R=𝔽₂: (F,V)=(2,1) or (1,2), both FV=VF=2. R=𝔽₃×𝔽₃: M=0×ℤ₃ has ranks (0,1), not (1,1). Zero ring gives M=0 and unique operators. | S03: the dyadic source instances are excluded by the global convention. |
| 0.3 Frames | On W[[u]], φ₁(pu)=u³ whereas pφ₁(pu)=3u³=φ(pu). Multiplying φ₁ by 2 gives 6u³≠3u³. Zero frame: image and unit ideal both 0. | Retain; strictness excludes the rescaling. |
| 0.4 PD logarithm | b=0 gives Î_B. For ε²=0 with trivial higher PD operations, φ₁([ε]_log)=0. Over 𝔽₃[x,y]/(x³,y³), log addition has defect 0, while Teichmüller addition has second-coordinate defect −x²y−xy²≠0. | Retain; F06 repaired. |
| 0.5 Height-one shtuka | Rank one F=3 gives V=1; F=1 gives V=3. F=9 would give V=1/3∉ℤ₃ and fails 3M⊂FM. Rank zero gives the unique 0→0 equivalence. | S03 for prime scope; otherwise retain. |
| 0.6 Normal pair | d=0: M₁=3M, quotient rank h; d=h: M₁=M, quotient 0. For d=1,h=2, N(e₁)=e₂∉Se₁+3Se₂. Zero S gives quotient 0 regardless of rank labels. | Retain. |
| 0.7 Relative frame | B=R gives ordinary V⁻¹. B=k[ε]→k gives φ₁(i+[aε]_log)=V⁻¹(i); ε coefficient contributes 0. A non-PD surjection supplies no logarithmic splitting. | Retain. |
| 0.8 Invariant tilde | At W=ℤ₃, τ([[A,B],[C,D]])=[[A,3B],[C/3,D]]. For f=[[1,1],[0,1]], g=[[1,0],[3,1]], τ(fg)=[[4,3],[1,1]]=τ(f)τ(g); reversing factors gives [[1,3],[1,4]], detecting order. | Retain. |
| 0.9 Strict base change | S→S/(u²) with φ(u)=u³ is strict. Rank-two τ remains (S/(u²))²; reduction of the 0.8 matrices gives identical products. S/(u³)→S/(u²)→S/(u) and direct reduction give the same entries. | Retain. |
| 0.10 Pullback comparison | In a (1,1) split pair j=diag(1,3). After inverting 3 its inverse is diag(1,1/3); mod 3 j has rank 1 and kernel ke₂. Rank zero j is the unique isomorphism. | Retain; no integral invertibility overclaim. |
| 0.11 Display | Étale line: d=0, Ψ=1 and F=1. Multiplicative line: d=1, Ψ=1 and F=3. Their sum has height 2, dimension 1; the rank of M₁/IM is 1. | Retain; no rank-swap defect. |
| 0.12 Display base change | Constant Ψ=diag(2,1) reduces to diag(2,1), not id over 𝔽₃. Two successive strict reductions keep this matrix and its induced filtration. Rank-zero Ψ stays the unique map. | Retain. |
| 0.13 Group/display comparison | ℚ₃/ℤ₃ gives F=1,V=3,dimension 0; μ₃∞ gives F=3,V=1,dimension 1. Cartier dual swaps them and D(H)∨(−1) swaps 1 and 3. Zero group gives rank 0. | Retain. |
| 1.1 Marked universal pair | (h,d)=(1,0),(1,1) give O and tangent dimension 0; (2,1) gives O[[t]] and dimension 1; (3,1) gives dimension 2=d(h−d). | Retain. |
| 1.2 Enlarged-ideal factorization | I′=I gives identity. For a square-zero PD ε direction, enlarged divided Frobenius sends ε to 0, while the rank-two tilde module still has rank 2. Omitting PD data leaves φ₁ undefined on ε. | Retain. |
| 1.3 Canonical first-order comparison | j=diag(1,p) and c=1+εN over characteristic p satisfy jc=j but c≠1. The inverse is 1−εN. Thus the diagram alone does not determine c; the relative-frame construction does. | Retain. |
| 1.4 Rational Witt section | Constant display gives c=id with residual id. Scalar 2 commutes with constant Frobenius but has residual 2≠1 and is excluded. In the prescribed p-adic topology pⁿ→0; 1∉pW. | Retain, using the corrected completeness proof. |
| 1.5 First-order constancy | Ψ=Ψ₀c⁻¹ gives Ψc=Ψ₀ exactly. If p=π², (p,m²) and (π,m²) differ before first-order quotient: π survives mod (p) but vanishes mod (π). | Retain. |
| 1.6 Rational tensor transport | c·id·c⁻¹=id. For the torus point c=id fixes P. On an ambient dual-number module (1+εN)P(1−εN)=P+εN≠P, detecting an incorrectly constant lift. | Retain. |
| 1.7 Crystalline deformation | At a square-zero PD extension, rank-two line lifts are A(e₁+aεe₂), indexed by a∈k; rank-one endpoint filtrations have one lift. At p=2, γ₂(2)=2 on ℤ/4 does not become nilpotent under iteration, so square-zero alone is insufficient. | Retain; stated PD hypotheses retained. |
| 1.8 Universal rigid display | For h=2,d=1 the tangent ring is O[[t]] and Ψc=Ψ₀; d=0 gives O and no tangent parameter. Replacing Ψ by Ψ₀ while c≠id gives Ψc≠Ψ₀. | Retain. |
| 2.0 Rational σ-centralizer | G_m,b=3: J_b(ℚ₃)=ℚ₃×, containing 3 outside ℤ₃×. b=diag(3,1): off-diagonal equations force x=0 by v₃(3x)=v₃(x)+1; diagonal entries lie in ℚ₃. Conjugated torus gives −a versus −σ(a) under the wrong descent. | Retain; F01 repaired. |
| 2.1 Tensor/local-model datum | Empty family gives GL₂; P cuts out the diagonal torus. Over k[ε], [1+εN,P]=εN≠0. A field-point-only stabilizer test would miss such infinitesimal equations. | Retain. |
| 2.2 Tensor filtration lattice | Fil=0 gives E·M, Fil=M/EM gives M; Fil=ke₁ gives Se₁⊕ESe₂. E=u−3 vanishes at u=3, whereas p=3 does not: replacing E by p changes the quotient. | Retain. |
| 2.3 Orbit deformation ring | GL₂ with a line: R_G=O[[t]], tangent dimension 1. Diagonal torus with fixed line: R_G=O, tangent dimension 0. With p=π² the coefficient uniformizer remains π. | Retain. |
| 2.4 Integral filtration tensors | On Se₁⊕ESe₂, P still has matrix diag(1,0); its conjugation by diag(1,E) is P. The tensor-frame torsor has a section. Algebraically closed residue makes the smooth residual torsor trivial; arbitrary residue is not silently substituted. | Retain, conditional on declared purity/patching gaps. |
| 2.5 Breuil–Kisin/tilde comparison | E=u−3 at u=[π]: φ(E)=([π]³−3)=3·unit. Multiplicative filtration gives full rank-one tilde lattice, étale filtration gives image 3W under j. Dividing by 3 distinguishes the lattices before p-inversion. | Retain. |
| 2.6 Integral tilde tensors | Constant f=3 gives f/3=1 integral; f=1 gives 1/3 nonintegral. On O[[x]], x/3 evaluated at x=√3 has valuation −1/2, so ramified DVR points detect the denominator. | Retain; use named bounded-functions and flatness inputs. |
| 2.7 Horizontality | Torus point c=id: cPc⁻¹=P. Ambient c=1+εN gives P+εN≠P although reductions agree. N has torus weight 1/2, giving 2N≠N mod 3. | Retain; F05 repaired. |
| 2.8 Parahoric display | Empty family permits ordinary Ψ. Torus family requires ΨP=PΨ; diag(2,1) passes, 1+εN has commutator εN and fails. Inverting p does not retain a p-torsion discrepancy. | Retain. |
| 2.9 Adapted deformation | P(e₁+te₂)=e₁; this lies in K(e₁+te₂) iff t=0. Thus nonzero t∈m_K fails and the split t=0 passes. Multiplicative rank-one Fil¹ has rank 1, not 0. | Retain; B02 repaired. |
| 2.10 Very good embedding | GL with empty family imposes 0 equations. At torus point c=id fixes P; basis swap sends P to E₂₂ and preserves the transported condition. Untransported P differs on e₁ by e₁−0. | Retain; F06/B02 repaired. |
| 2.11 Cutting-family independence | Families {P} and {1−P} both give the same block-diagonal stabilizer; cPc⁻¹=P iff c(1−P)c⁻¹=1−P. Empty family instead gives all GL₂. | Retain. |
| 2.12 Unramified detection | W(𝔽₃)→W(𝔽₉) is faithful: nonzero 3 stays nonzero. For a∈𝔽₉∖𝔽₃, σ[a]=[a³]≠[a], so scalar extension must transport σ; P stays P on both sides. | Retain. |
| 2.13 Periodic chains | Period one Λ_{i+1}=pΛ_i gives one determining lattice; period two has two distinct terms. Duality gives (pΛ)∨=p⁻¹Λ∨, reversing the index direction. | Retain. |
| 3.1 Formal-curve tensors | On k[[t]], a moving GL₂ line has elementary modification basis e₁+te₂, pe₂. Empty tensor family extends; constant P fails to preserve the moving line for t≠0. | Retain; the latter is outside the torus local model. |
| 3.2 Invariant endomorphisms | Identity is fixed by every c. Torus P commutes with its actual c=id; N is not invariant since diag(2,1) conjugates it to N/2. | Retain. |
| 3.3 Curvewise comparison | Constant torus curve has tangent 0 and c(P)=P. GL₂ line curve t↦e₁+te₂ has derivative N and no cutting equations; first-order restriction sends t to ε on both constructions. | Retain. |
| 3.4 Products | Two rank-one factors give rank 2 and centralizer of P equal to G_m×G_m. Off-diagonal N does not preserve P, excluding GL₂ as the product model. | Retain. |
| 3.5 Neutral closure | In odd characteristic, an orthogonal infinitesimal 1+εX has tr X=0, hence determinant 1; a reflection has determinant −1≠1. Smooth neutral-component lifting cannot be inferred at p=2 from this calculation. | Retain; p>2 is explicit. |
| 3.6 Summand descent | c=c₁⊕c₂ fixes the summand projector. Restriction to its image is c₁. A map with lower-left ε block sends e₁ to e₁+εe₂ and is rejected by that projector. | Retain. |
| 3.7 Curve-spanned tangents | At xy=0, the tangent space is k². Curves (t,0),(0,t) have derivatives (1,0),(0,1), spanning k²; (t,t) is not a curve in the node since t²≠0. | Retain; spanning does not mean every tangent vector is one smooth curve. |
| 3.8 Centralizer criterion | Centralizer(P) in GL₂ is diagonal. A lower infinitesimal entry gives [1+εN,P]=εN≠0; scalar id has centralizer GL₂ and cannot replace P. | Retain. |
| 3.9 Arithmetic curves | On O_E[[t]], choose π_E=π_K² and t↦π_K. Mod π_K² the t-direction is nonzero while π_E is zero. For K=E the corresponding relative closed-fibre tangent is zero. | Retain; ramified arithmetic tests matter. |
| 3.10 Repeated copies | Diagonal G_m→GL₂ has no kernel; with zero copies it has kernel G_m. Intertwiner between two copies forces the two scalars equal, while weights 1 and −1 give unequal values at 2 and are not isomorphic copies. | Retain; nonempty repetition required. |
| 3.11 Wild type A | D=ℚ₃,m=1 gives G_m on dimension 1; D split and m=2 gives GL₂ and ordinary lattice stabilizer GL₂(ℤ₃). For division index d the standard Q₃-rank is m·d², not m·d. | Retain; no prime-to-d assumption introduced. |
| 3.12 Determining segment | Shifting every term by p gives an isomorphic periodic chain; doubling a segment doubles total rank rh→2rh, with original summands recovered by idempotents. Omitting the periodic identification changes the object. | Retain. |
| 3.13 Nonexceptional chains | GL₂, μ=(1,0): flag tangent dimension 1, π₁(SL₂)=0 so the prime-to-p condition holds at p=3. Torus local model has tangent 0. Excluded Dᴴ factors are supplied separately by 3.14. | Retain. |
| 3.14 Dᴴ PEL | Quaternion test of the stated balanced pairing gives −2 on each side; the wrong involution/sign gives +2. Split symplectic test gives ψ(e,f)=1 and ψ(f,e)=−1. Zero multiplicity has zero representation and is not faithful. | Retain. |
| 3.15 Type-A enlargement | On V⊕V∨, ψ((v,f),(w,g))=f(w)−g(v), with reversed value its negative. A factor (a,b) has cross multiplier ab; choosing unequal multipliers on different summands fails the common-similitude condition. | Retain. |
| 3.16 Perfect-pairing chain | For tame quadratic π²=3 and the semilinear example in the README, invariant lattice is 3ℤ₃e⊕ℤ₃f; its dual is ℤ₃e⊕3⁻¹ℤ₃f. Inverse-different corrected invariants give that dual; omitting the different gives ℤ₃². | Retain; source's displayed dual formula corrected. |
| 3.17 Dᴴ enlargement | Opposite scalar factors a,b act on a cross pairing by ab. With a=1,b=2 the multiplier is 2, not 1; noncentral right multiplication does not commute with the prescribed left endomorphisms. | Retain. |
| 4.1 Punctured exactness | The split sequence S→S²→S has kernel/image Se₁. The module S/(p,u) restricts to 0 on the punctured spectrum, although globally it is k≠0; punctured exactness cannot imply whole-ring exactness. | Retain. |
| 4.2 Kottwitz kernel | For ℤ₃⊕ℤ₃(1), det is a unit, so κ=0. In the stated dilatation, residual diag(−1,1) is in a nonidentity component despite κ=0. Fixer=Bruhat–Tits is required for the additional component conclusion. | Retain; B01 repaired. |
| 4.3 Crystalline tensor frames | Trivial rank-one lattice yields M=S and frame 1. Multiplication by p is an isomorphism after p-inversion but has determinant p, not a unit in S, so is not an integral tensor frame. | Retain. |
| 4.4 Integral comparison | H=μ₃∞: T₃H∨=ℤ₃(−1), crystalline F=3σ. Using the untwisted Tate module of H∨ instead would give the constant line F=σ. Identity tensors compare to identity. | Retain; dual-Tate convention agrees with suppliers. |
| 4.5 Hodge and residual lift | Ordinary split Fil=Ke₁; a lift e₁+πe₂ has the same residual line. P preserves the first and not the second. Only the prescribed tensor-compatible orbit is asserted to lift. | Retain. |
| 4.6 Rigid tensor section | Ψ=Ψ₀c⁻¹ gives Ψc=Ψ₀; multiplication by 1+3X keeps the residual matrix but need not preserve first-order rigidity. A lower εN twist gives defect εN in P transport. | Retain. |
| 4.7 Infinitesimal condition | In the torus example both conditions read cPc⁻¹−P=0. In the ambient lower-unipotent control both defects are εN≠0. Equality of residual tensors alone gives 0 after ε↦0 and is insufficient. | Retain. |
| 4.8 DVR tangent lifting | Ordinary height-two filtration over k[ε] is e₁+aεe₂, a∈k; the tangent dimension is 1. Height-one endpoint has dimension 0 and its unique lift. | Retain. |
| 4.9 Interpolation | For congruent scalar endpoints a,b modulo π, a+(b−a)T/π lies in O[[T]], evaluates to a,b at T=0,π. Endpoints (0,π) give T; (0,1) require T/π∉O[[T]]. | Retain. |
| 4.10 Four criteria | GL₂ line has one infinitesimal parameter; torus-adapted line has zero. Map ε↦pε is injective on the O-free tangent coefficient but becomes zero mod p, testing the integral versus residual injectivity distinction. | Retain. |
| 4.11 DVR factorization | Torus quotient O[[t]]→O kills t; a map factors iff t↦0. At t=π, P does not preserve the generic Hodge line. For I=(T²), ∩(I+TⁿB)=I; for I=(p), localization contraction is B, excluded by p-torsion-freeness. | Retain; F03 repaired. |
| 4.12 Versal adapted theorem | Empty GL₂ tensors give identity quotient O[[t]] and one tangent parameter. Torus P gives quotient O and no parameter; t=π is neither adapted nor factoring. | Retain. |
| 4.13 Universal parahoric display | Over k[ε], t↦aε gives all first-order GL₂ deformations. Every map from a nonreduced ring to a DVR kills ε, so DVR detection alone cannot prove this claim; the display lifting step retains ε. ∩(Tⁿ)=0 on O[[T]]. | Retain; local-model lifting is a target here. |
| 4.14 Étale recognition | Split ordinary group with projector P has integral étale projector and matching torus filtration. Rotating only the generic line gives P(e₁+te₂)=e₁ outside it for t≠0 and violates the specified type. | Retain. |
| 5.1 Hyperspecial frames | Trivial rank-one functor gives S and section 1. Connected groups over finite k have torsor class 0 by Lang; over algebraically closed k it is also 0. The target over general perfect k asserts reductivity, not automatic frame triviality. | Retain. |
| 5.2 Relative period evaluation | x=[p♭]−p has θ(x)=0 but θ(φ(x))=pᵖ−p≠0. φ(t)=pt. The larger PD ideal contains p, but Hodge Fil¹ has θ=0 and excludes p, since θ(p)=p. | Retain. |
| 5.3 Toral admissibility | G_m,δ=p,μ_T=z⁻¹: average −1=ν(δ⁻¹); μ_T⁻¹ induces jump 1=t_N. Substituting μ_T=1 gives jump 0≠1. | Retain. |
| 5.4 Hyperspecial adapted lift | μ₃∞ has rank-one Fil¹=D and T₃∨=ℤ₃(−1); constant group has Fil¹=0 and T₃∨=ℤ₃. Empty tensors impose no extra tensor equations. | Retain. |
| 5.5 Relative comparison | Ordinary split comparison has period matrix diag(t,1), becoming invertible after t-inversion. θ(t)=0, so determinant t is not a unit before that inversion. | Retain. |
| 5.6 Cocharacter/double coset | b=diag(p,1), μ₀=diag(z⁻¹,1): σ(μ₀⁻¹)(p)=diag(p,1). Swapping a prescribed Hodge line without transporting the frame leaves the double coset unchanged but changes the line. | Retain. |
| 5.7 Explicit height-one lift | E(0)=ap with a unit; c=σ⁻¹(b)μ₀(ap). For multiplicative rank one b=p, μ₀=z⁻¹, c=a⁻¹ and E specialization gives p. E=u−p has a=−1, yielding −E with value p. | Retain. |
| 5.8 Connection integrality | Constant lattices g=1 and g=p have connection matrix g⁻¹dg=0, so any allowed iterate has integral matrix 0. Differential control: σ*(dt)=p t^(p−1)dt, which turns dt/p into t^(p−1)dt; this control alone does not assert the required Frobenius bound. | Retain. |
| 5.9 Framed datum | b=1 gives ker(F mod p)=0; b=p gives full k; b=diag(p,1) gives ke₁. Prescribing ke₂ for that same marked b fails despite having the correct flag dimension. | Retain; locator repaired. |
| 5.10 Horizontal Fil⁰ locus | For the displayed rank-two example, N=−Σ t^(pʳ−1)E₂₁ and horizontal parameter h=Σ t^(pʳ)/pʳ. Its linear coefficient is 1, so (h)=(t) in K₀[[t]]; t=0 passes, a nonzero formal tangent fails. | Retain. |
| 5.11 Equality of loci | In the torus example both quotient rings are K₀[[t]]/(t)=K₀. With empty GL tensors both are K₀[[t]]. An unmarked line rotation changes the tensor condition and cannot be substituted. | Retain. |
| 5.12 Smooth adapted space | GL₂ line quotient has relative dimension 1; torus fixed-line quotient has dimension 0; rank-one endpoint has dimension 0. A singular ambient local model is not asserted to be hyperspecial smooth. | Retain. |
| 5.13 Étale tensors in family | On the connected split family the identity projector specializes to the same integral projector at every point. On a disconnected union, values (P,p⁻¹P) show one-point integrality does not control the second component. | Retain; connectedness/normality retained. |
| 5.14 Hyperspecial recognition | Split ordinary torus datum has P integral and line ke₁, so both recognition criteria hold. Line e₁+πe₂ fails P-preservation and the fixed tensor type. | Retain. |
| 5.15 Geometric tensors | Identity and algebraic endomorphism tensors have identical crystalline/de Rham matrices on a split abelian example. Dualization sends scalar a to a⁻¹ on the tensor-frame action; omitting it changes a=2 to 2 instead of 1/2. | Retain, conditional on the rational Hodge-realization gap. |
| 5.16 Tate lattice specialization | For G_m,g=p, new Tate lattice is pL while its dual is p⁻¹L∨. The positive Kottwitz value is 1; using the dual as the original lattice would give −1. | Retain. |
| 5.17 Admissible isogenous lift | k=𝔽₃: K̆=ℚ̆₃; k=algebraic closure of 𝔽₃(t): residue stays transcendental, so K̆ is not finite over ℚ̆₃. b=3,μ=z gives (t_H,t_N)=(−1,1); μ=z⁻¹ gives (1,1). | S01 and S02. |
| 5.18 Bound/Kottwitz specialization | Rank-one g=p has κ=1 before and after specialization; an integral unit has κ=0 on both sides. Ordinary b=diag(p,1) has Hodge elementary divisors (1,0). | Retain. |
| 5.19 Central-image quotient | For determinant GL₂→G_m and g=diag(p,1), both quotient cosets are pW×. Killing the central quotient gives the singleton coset; omitting the stated centrality gives no equality of quotient transports. | Retain. |
| 6.0 Ordinary normalization | Supplier label t_RG^(−1) has representative p and κ=+1, as t_here^1. In GL₂, translation (1,0) has length 1; its nth power length n. Slopes (1/2,1/2) are not the ordinary slopes (1,0). | Retain; sign adapter is necessary. |
| 6.1 Ordinary tensor datum | Split b=diag(p,1) gives Newton Levi diagonal torus and Hodge weights (1,0), central in that Levi. Supersingular slopes (1/2,1/2) fail the ordinary equality and are excluded. | Retain. |
| 6.2 Central Levi filtration | λ=diag(z,1) central in M=G_m² fixes line ke₁ and gives a point local model. In ambient GL₂, 1+εN moves e₁ to e₁+εe₂; λ is not central there. | Retain. |
| 6.3 Central Breuil–Kisin lift | For F=Se₁⊕ESe₂, E=u−p, Θ on this basis is diag(1,−1). With c_E=−E, the induced Frobenius is diag(−E,1); at u=0 it is diag(p,1). Using E instead would give −p. | Retain. |
| 6.4 Ordinary existence | The split product μ₃∞⊕ℚ₃/ℤ₃ lifts with F=diag(3,1), dimensions (1,0) and torus tensors unchanged. Its coefficient field can remain unramified in this example; general descent retains λ's field. | Retain. |
| 6.5 Rational action | Multiplication by p on a height-two group has isogeny height 2 and rational inverse 1/p, which is not an integral endomorphism. On the étale rank-two factor, transpose reverses two noncommuting matrices; contravariant composition must be reversed. | Retain; action is in the isogeny category. |
| 6.6 Specified Levi lift | M=diagonal torus and filtration ke₁ give the same adapted lift after M→GL₂. A rotated generic line K(e₁+te₂), t≠0, is not M-induced; its existence is not inferred from ordinary theory. | Retain. |


## Suggested.lean declaration and headline audit

Every line of packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/Suggested.lean was read. The declaration table is empty, rather than omitted:

| Declaration | Section / variables / instances / universe | Computed probe |
|---|---|---|
| None | One namespace, no section variables, definitions, instances, axioms, theorems or examples | Counts: 0 declarations, 0 sorry bodies, 0 stand-ins, 0 padding candidates. |

No elaboration or Lean build was run. There is no named declaration on which to run the requested `#check @name` comparison; the signature audit is vacuous. The one import is `import Mathlib`. No `set_option`, `lemma`, admitted data, extra import or free Prop field occurs.

The 21 headline groups named in the module docstring match the following README endpoints. Each needs at least one substantial missing carrier; none can be recovered from the pinned rational isocrystal class by a few simple native definitions.

| Headline | README targets | Missing carrier checked at the pins |
|---|---|---|
| Perfect-ring anti-equivalence | 0.2,0.5 | p-divisible category over arbitrary perfect rings and integral Dieudonné category |
| Complete-local display anti-equivalence | 0.13 | Zink ring, displays, crystalline group functor |
| Universal marked display | 1.8 | Display deformation functor and formal universal object |
| Integral filtration/tilde tensor torsors | 2.4–2.6 | Local-model filtration, tilde functor, integral fixer torsor |
| Formal/arithmetic curve criteria | 3.7,3.9 | Good embedding and canonical display transport |
| Nonexceptional chain existence | 3.13 | Integral parahoric local model and very-goodness |
| Dᴴ PEL/enlargement existence | 3.14,3.17 | Classical fixer representations with tensor displays |
| Wild type-A/enlargement existence | 3.11,3.15 | Division-algebra integral chains with local models |
| Integral crystalline comparison/recognition | 4.4,4.14 | Crystalline Galois lattice, group Tate module and integral tensor type |
| Versal adapted deformation | 4.12 | Marked adapted p-divisible deformation and quotient |
| Universal parahoric display | 4.13 | Parahoric display deformation category |
| Hyperspecial Breuil–Kisin frames | 5.1 | Crystalline-lattice functor and integral torsor |
| Explicit hyperspecial lift | 5.7 | Integral height-one realization functor |
| Connection integrality | 5.8 | Smooth-base Dieudonné crystal with its connection lattice |
| Toral weak admissibility | 5.3 | Filtered G-isocrystal, Newton datum and admissibility |
| Equality/smoothness of adapted locus | 5.11,5.12 | Universal crystalline connection and the two formal loci |
| Lattice specialization and Kottwitz | 5.16,5.18 | Breuil–Kisin family and integral component maps |
| Admissible isogenous realization | 5.17 | Filtered tensor realization and p-divisible isogeny category |
| Ordinary σ-conjugacy normalization | 6.0 | Parahoric affine Weyl action and ordinary classes |
| Ordinary lift with rational action | 6.4,6.5 | Newton-Levi modification and rational group action |
| Specified nonordinary Levi lift | 6.6 | Compatible Levi local models and marked tensor deformation |

## Supplier, ownership and gap audit

Current main copies were used for SchemeAndStackFoundations, ModularCurves and ReductiveGroupsPartII, not their open revisions. For new supplier folders absent on main, the indexed current head was read with `roadmaps show`. The supplied sibling heads were searched by object with `roadmaps grep`, supplemented by searches of the board's packages and the supplied AdmissiblePairsAndPadicHodgeStructures checkout. This is an ownership search, not a claim to have read every unrelated sibling in full.

| Supplier citation resolved | Current witness and scope comparison |
|---|---|
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.6–1.8,1.22 | README:865,926,968,1838: morphisms, Cartier pairing, dual Tate and generic-fibre extension. Rank-one convention gives μ↦F=p, constant↦F=1. |
| Same, R07.2.10–2.12,2.27 | README:3369,3403,3431,4116: perfect-field classification and bounded formal functions. R07.2.27's formally normal O-flat FS_O hypothesis applies to the maximal-ideal formal spectrum in the package. The completed local ring's special reduction is finite over k. |
| Same, R07.3.2–3.3,4.1,4.13 | README:4613,4663,5440,5978: supplied finite-field period/admissibility interfaces and Kummer coefficients; general perfect-residue admissibility is separately assigned to PadicHodgeTheory. No general-residue realization is inferred from R07.4.20. |
| Same, R07.4.16–4.21,4.25 | README:6111,6198,6223,6266,6329,6365,6522: all-weight functor explicitly not exact; p-divisible crystalline comparison retains perfect residue; R07.4.20 has finite K/ℚ_p, as the declared gap records. Integral φ* specialization retains the Frobenius map and the dual-Tate twist. |
| AbelianSchemesAndArithmeticModuli A4.CR.7.2 | README:2109–2257: crystal, contravariance, duality and locally PD-nilpotent base-compatible deformation. μ has Fil¹ rank 1; constant line rank 0. |
| CrystallineCohomology CR.1,CR.7.1 | README:11243–11276: evaluation on PD objects, finite locally free tensor/dual coefficients, completed systems and connections; no arbitrary-base algebraization. |
| DerivedDeRhamCohomology PD.7 | README:2854–2907: completed general Fontaine envelope; `Crystalline.fontaineEnvelope_initial` at 2885 and `Crystalline.fontaineEnvelope_periodPDEnvelope` are actual planned APIs. The resolver's two unpinned-name leads are not missing supplier targets. |
| PadicPeriodRings §§3,4.1,4.3 | README:427–499: absolute principal envelope, general perfect-residue period structures and absolute fundamental identity. The relative-cover fixed ring remains a declared gap. |
| SchemeAndStackFoundations §§0.6,1.15,2.3 | README:678,2502,3330: reflexive extension, geometric torsors and the common fppf class carrier. Torsor representability alone does not supply flatness of an arbitrary Isom scheme. |
| Same §§4.1–4.4,4.7–4.8,4.12 | README:5066,5110,5135,5194,5339,5383,5613: marked deformation, formal completion and flattening. The more specific detection/flatness/patching results are declared gaps. |
| ModularCurves §0G | README:427–443: relative Grassmannian charts, gluing and universal quotient, before the subgroup equations; it is not merely a finite subgroup parameter set. |
| ReductiveGroupsPartII RG2.1.5,2.2.4,3.3,3.5,3.7,4.3 | README:2446,3408,4151,4664,5201,5992: Kottwitz, lattices, fixers, classical models, Lang and Weyl combinatorics. Its t^λ has representative λ(p)⁻¹; the package's t_here^λ=t_RG^(−λ) correctly restores κ(p)=1. |
| GeometricSatakeAndFusion GS0 | README:825 and 947: component labels and integral v-sheaf local models exist; the four scheme/curve extensions are separately declared. For G_m,p the component is 1; for the standard lattice it is 0. |
| VectorBundlesAndIsocrystals VB0,VB4 | README:229,2294–2304: finite isocrystals over the completed unramified field and exact integral tensor-functor reconstruction for connected smooth models. Whole-ring nonexactness is not fed to that reconstruction. |
| PadicHodgeTheory §5.5 | G-isocrystal invariants and general-residue admissibility exist. The period-torsor theorem itself says K/ℚ̆_p finite. S01 is the scope mismatch, not a missing section. |
| ShimuraVarieties §7.0i | README:1871–1884: absolute Hodge tensors and rational flat-family realizations. The local crystalline comparison is the declared gap, not an integral-moduli input. |
| PELModuli M2.15 | README:2607–2629: W(R) displays/formal p-divisible groups, with Lie rank P/Q; the package's Ŵ(R) contravariant theory is a different extension. It explicitly declines an unproved comparison of the two. |
| LubinTateFormalModulesAndQuasiCanonicalLifts LT.0–LT.6 | Ownership boundary only, not a proof prerequisite; formal-module reciprocity/quasi-canonical lifting is not reconstructed here. |

No duplicated fully qualified Lean declaration is possible because this package has zero declarations. The object search finds the rational σ-centralizer in later BunGAndNewtonStrata work, and its consumption in TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/README.md:118–120. Under the required merge direction, the needed rational construction belongs in this earlier package's §2.0; later work must consume it. It is not an upward supplier here. The formal-local tensor/display applications likewise extend the base roadmap rather than reconstructing its classification. Generic local models, crystalline envelopes, coefficient crystals and torsor descent stay with their named earlier owners.

All 14 declared gap slugs occur both under Exact supplier contracts and in design/plan.json. Each names a supplier and section. The contracts concern: perfect-residue BT realization; relative crystalline constants; local tensor-Isom flatness; reduced formal DVR-point detection; punctured-disc patching; full-fixer cutting tensors; parahoric disc purity; component reduction; ordinary-Levi fixer intersection; scheme local-model representative; Hodge immersion; Schubert curve-spanned tangents; local-model curve-spanned tangents; rational absolute-Hodge comparison. None has supplier `none`. The related conclusions within each contract belong to the same construction. The F03 repair removes already-pinned ideal algebra from the detection gap. No other requested contract was located already supplied at the pins or an earlier owner's cited section. These 14 gaps are accepted as conditional contracts; their absence from suppliers is not counted as a defect.

The mechanical dependency command supplied in the brief returned:

```text
depcheck: 188 roadmaps, 1237 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. All local numbered Needs references resolve to earlier targets; the use of the following family-independence theorem to explain the definition of very-goodness is not an input to its construction. No later ordinary-lift result is used to define adaptedness or prove the earlier comparison.

## Verified sound

Read counts: 1,615 README lines; 60 Suggested.lean lines; 92 numbered mathematical targets; zero Lean declarations. Assessed all 143 Check bullets in 45 blocks, including all nine old findings. The computations above retain both positive and negative controls; S02 is a false new Check. The target definitions have three or more relevant Checks, including the perfect-ring tests shared by §§0.2 and 0.5. There is no separate block of bold theorem labels beyond the numbered targets and their API assertions.

Source audit: 168 explicit line-anchor occurrences (including endpoints and repeated anchors) were opened in the 12 readable cached texts. These are locator checks, not 168 distinct theorems. Published/preprint numbering was compared with sources.toml. Hoff's display definition, KZ's page transition and de Jong's corrected pages were rechecked. The RG71 scan and settled RZ96 citation are exceptions below. Source errors found are separated in the final section. No source passage was copied into this report.

Supplier audit: 12 mathematical supplier roadmaps' contracts, plus the PELModuli ownership boundary, were inspected by section at main or the indexed new-folder head; the separate Lubin–Tate boundary is not a consumed theorem. Every cross-roadmap name in a Needs line was accounted for above. The exact current supplier hypotheses, rather than the prior review's assertions, determined S01. All 14 declared gaps matched the plan.

Pinned API audit: Mathlib/RingTheory/WittVector/Defs.lean:52 defines Witt vectors by coefficients; Frobenius.lean:218 and :283 supply Frobenius and the perfect-ring equivalence; Verschiebung.lean:109 supplies an additive map. Isocrystal.lean:113 extends the module structure by an invertible semilinear operator and contains no finite-dimensional field. DividedPowers/Basic.lean:77 has the ideal-relative operations and scalar law. Filtration.lean:415 has explicit Noetherian and finite-module instances; Localization/Ideal.lean:76 characterizes membership by a multiplier in the localization submonoid. These two algebraic results discharge F03; they are not new targets. Object searches of both pinned libraries found no native carriers for the 21 headline groups above.

Policy audit: the PR diff against origin/main consists only of files under packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII. The roadmap text has no pull-request numbers, review narrative, computational algorithm, prohibited Lean command or imported unfinished-roadmap module. Source manifests and plan were read, not modified. The only package file written during this review is this report. No Lean, git-writing or external-posting command was run.

## Not verifiable

- RG71, I, Theorem 4.1.2, printed p.27: the supplied cache extraction is image-only page markers. No functioning local PDF renderer/OCR was available in this pass. The declared gap is not rejected for being unimplemented, but its source text was not independently re-certified here. No assertion of a new source error is made from that unread scan.
- RZ96 remains settled `uncertified`; it is cited only by its existing locator. It was not requested again.
- Missing headline carriers make a future Lean elaboration/proof audit impossible now. This file has no declarations, so no signature was mechanically elaborated, and no successful build is claimed.
- The ownership index includes open work whose checkout was not supplied in the brief. Its search hits were used only as leads; ownership against those unsupplied open pull requests was not independently checked. In particular the later BunGAndNewtonStrata lead is recorded as a required direction of supply, not certified as repaired in that other package.
- Conditional gap contracts are promises, not implemented mathematics. This pass verifies their ownership, stated scope and declaration matching, not the future supplier proofs. No finite list of computed instances constitutes a proof of the 92 target theorems.

## Source issues

- **Misprint** in KPZ26 at §3.3.1, printed p.20, line 904: the source says the H and G fixer models have bases O_F and O_K respectively; it should be O_K for H and O_F for G; affects a stated result.
- **Misprint** in KPZ26 at §5.1.2, printed p.48, line 2115: the source says the general-frame tilde module is free over Ŵ(R); it should be free over the frame ring S; affects a stated result.
- **Misprint** in KPZ26 at Remark 5.3.8, printed p.56, line 2440: the source says goodness at x suffices for the repeated-copy conclusion; it should be very-goodness at x; affects a stated result.
- **Misprint** in KPZ26 at proof of Theorem 6.1.9, printed p.66, lines 2913–2914: the source says the inverse-different corrected dual is dual to another negatively scaled lattice; it should be dual to the invariants of the original positively scaled lattice; affects the proof.
- **Error** in KPZ26 at proof of Corollary 6.3.5, printed p.71, lines 3139–3140: the source says paired terms of an increasing lattice chain can each be selfdual; it should be an indexed selfdual chain with opposite dual indices; affects the proof.
- **Misprint** in KPZ26 at proof of Theorem 7.1.3, printed p.73, line 3233: the source says the required factorization proposition of KP18 is 2.3.17; it should be Proposition 3.2.17; affects nothing.
- **Error** in KP18 at Lemma 3.1.9, printed p.166, lines 1921–1932: the source says the normal-decomposition comparison is independent of that decomposition; it should be replaced by the relative-frame canonical comparison; affects the proof; corrected in print at KPZ26 Lemma 5.1.15 and Remark 5.1.17, printed p.51.
- **Gap** in KP18 at proof of Lemma 3.1.17, printed p.169: the source says convergence in its auxiliary topology suffices for the rational Witt section; it should be convergence in a complete topology, supplied by the p-adic argument; affects the proof; corrected in print at KPZ26 §7.3.1(2), printed p.86, lines 3790–3800.
- **Gap** in KP18 at §3.2.12, printed p.173, lines 2192–2196: the source says smoothness supplies a tensor-preserving first-order constant section; it should be assumed that the canonical comparison preserves the tensors; affects the proof; corrected in print at KPZ26 Remark 7.1.4(1), printed p.73, lines 3207–3211.
- **Misprint** in KZ25 at §2.2.2, printed p.9, line 408: the source says σ-conjugacy varies u in u⁻¹wσ(w); it should be u⁻¹wσ(u); affects a stated result.
- **Misprint** in KZ25 at §3.2.5, printed p.23, line 1035: the source says the canonical first-order comparison has an unreduced target coefficient ring; it should reduce both sides by the same first-order ideal; affects a stated result.
- **Misprint** in KZ25 at Proposition 3.3.2(1), printed p.25, line 1087: the source says the Tate-side comparison sends the crystalline tensors sα,0; it should send the étale tensors sα,ét; affects a stated result.
- **Misprint** in KZ25 at §3.4.2, printed p.26, lines 1161–1164: the source says the fundamental-group kernel is generated by omitted roots; it should use classes of omitted simple coroots; affects the proof.
- **Misprint** in Kisin17 at §1.1.11, printed p.9, line 402: the source says scalar extension to R′ is denoted X_R; it should be X_R′; affects nothing.
- **Misprint** in Kisin17 at Proposition 1.1.13, printed p.9, lines 412–418: the source says the compared tensors lie in the undualized Tate module; it should use the dual Tate module, equivalently the Cartier-dual Tate module twisted by −1; affects a stated result.
- **Misprint** in Kisin17 at §1.1.15, printed p.10, line 450: the source says R′[1/p] is finite étale over R; it should be finite étale over R[1/p]; affects a stated result.
- **Misprint** in Kisin17 at proof of Proposition 1.2.18, printed p.16, line 708: the source says the rational lattice-changing matrix g₀ is integral; it should belong to G(L), with its class modulo G(O_L); affects the proof.
- **Misprint** in Kisin17 at proof of Proposition 1.2.18, printed p.16, line 718: the source says the Breuil–Kisin lattice-changing matrix is in G(𝔖); it should allow G(𝔖[1/p]); affects the proof.
- **Misprint** in Kisin17 at Corollary 2.2.5, printed p.33, line 1478: the source says the lift's filtration is induced by μ_T; it should be induced by μ_T⁻¹ in the preceding normalization; affects a stated result.
- **Misprint** in vanHoften24 at Theorem 3.1.4, printed p.26, line 1184: the source says q is the torsor and π is the smooth local-model map; it should identify π as the torsor and q as the smooth equivariant map; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "cf48b630bb1c99d04ec2fe544295e53b140c3329", "job": "RT-FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
