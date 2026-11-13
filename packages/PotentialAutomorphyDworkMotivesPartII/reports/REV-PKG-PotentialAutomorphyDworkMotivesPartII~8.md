<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13001#issuecomment-6856761417 -->
Review (codex) of 3e807ed

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Restore the cohomological degree bound in the supplier contract

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:107`, “outside the middle degree … for `q` even, `H^q(X, Λ(q/2))` is free of rank one”.

   **Claim:** The newly expanded complete-intersection contract asserts rank one in every even degree other than the middle degree. It omits the supplier's bound `0 ≤ q ≤ 2m`.

   **Witness:** A smooth plane conic over ℂ has `m = 1` and `H⁴(X, ℚ₃(2)) = 0`: rank zero, not one. Pull request #1040, `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:4222`, explicitly restricts (a) to `0 ≤ q ≤ 2m`.

   **Exact repair:** In (a), replace “outside the middle degree” with “for `0 ≤ q ≤ 2m`, `q ≠ m`”. Say that the hyperplane power spans after rationalization for integral coefficients, or with rational coefficients; do not apply “rationally spanned” to a torsion coefficient module. Add the negative-control Check that a smooth conic has ranks `1, 0, 1, 0, 0` in degrees `0,…,4`. The repaired range retains degrees zero and two and excludes degree four, resolving the witness. This is a regression in the expansion made for previous finding F05, not a rejection of that expansion's purpose.

2. **F02** (P2) Specify a lattice before reducing the all-prime rational sheaf

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:1516`, “`λ | l` a place of `M` … `W_{t,λ}/l^c ≅ W_{t′,λ}/l^c`”.

   **Claim:** The Dwork instance of finite-level local constancy quantifies over every coefficient prime but reduces the integral sheaf `W_λ`. Section 3.6 defines that sheaf only for `λ ∤ 2N`; only `W^ℚ_λ` is defined at every finite place.

   **Witness:** Take `N = 401`, rank three, `F = ℚ(ζ₄₀₁)`, `v | 2`, `λ | 2`, `t = 0`, `c = 1`. The point is integral and smooth, but README:719 supplies no `W_λ`. Reducing `W^ℚ_λ` instead gives zero, since 2 is invertible.

   **Exact repair:** Preserve the all-prime statement by choosing a lisse `O_{M_λ}`-lattice `L_λ` in `W^ℚ_λ` restricted to `T₀,F_v`, and state local constancy for `L_{λ,t}/l^c`. A continuous representation of the profinite fundamental group has compact image and admits a stable lattice; use this to justify the choice. At `λ ∤ 2N`, choose the lattice already called `W_λ`. Apply the following general finite-lisse-sheaf assertion to these quotients, and update the proof and Checks consistently. No canonical lattice at the other primes is required or claimed. At the witness, the chosen rank-three lattice has quotient `(O_{M_λ}/2)^3`, whereas the rational quotient is zero; the former is precisely the finite sheaf to which the existing argument applies. This retains the general library statement rather than restricting it to good coefficient primes.

3. **F03** (P3) Include the Hermitian descent input in the unitary recognition dependencies

   **Location:** `packages/PotentialAutomorphyDworkMotivesPartII/README.md:901`, “`*Needs:* §§0.3–0.7, 0.9, 0.11, §§1.4–1.5.`”

   **Claim:** This list omits §0.8, which the immediately following proof route uses to turn the conjugate-duality intertwiner into an invariant Hermitian form.

   **Witness:** README:903 explicitly invokes “Schur's lemma with Hilbert 90 … (§0.8)”. The listed §0.7 classifies already Hermitian forms; it does not supply that descent step.

   **Exact repair:** Change the first range to `§§0.3–0.8`. This places the actual input before its consumer without changing any ownership or theorem. For the quadratic-field test `σζ = ζ⁻¹`, the intertwiner gives a scalar discrepancy of norm one; §0.8 removes it by Hilbert 90 before §0.7 changes the basis.

## Verified sound

The four package inputs were read; none was edited. There are 84 numbered targets, each with a Checks block, and ten mathematical layers. The previous review's computed rows were used only for unchanged statements covered by their explicit values. The seeded targets and changed passages were read again. No maintainer notes were supplied. No second copy on main, forbidden supplier, computational algorithm, copied passage, sorry'd data, `set_option`, or import-policy violation was established.

### Previous findings, checked individually

The identifiers below are the repair report's F01–F08. Quotations are from the repaired README.

| Previous finding | Repaired passage | Assessment and recomputation |
|---|---|---|
| F01, determinant hypotheses | §6.4: “For a zero-shaped datum”; §6.6 has the same restriction; §6.7 adds `N > 2n + 1`; §9.1 distinguishes Qian's data and the self-dual rank-two case | Repaired. In §1.4 the added law is “For a zero-shaped datum `∑_{b∈B(a)} b = 0`”. For `(0,0,0,0,1,2,4)` modulo 7, `B={1,2,4}`, sum 0; for the rejected `(0,0,0,1,3,5,5)`, `B={1,3,5}`, sum 2. The latter is no longer admitted by these determinant arguments. |
| F02, overly narrow determinant-descent route | §5.9: “For every rank-`n` exponent datum”; proof uses loops around the `N` roots of unity | Repaired. Each loop acts unipotently, hence with determinant 1; generators give determinant 1 without a trivial-stabiliser assumption. The extra datum modulo 7 tests this independently of Qian's family. |
| F03, Kummer ownership | §3.1: “use the Kummer sheaf … of FourierDeligneTransform §§2.3, 2.6” | Repaired. README:99 gives the exact character, inverse pushout and unit hypotheses. The new work is the relative convolution and rational coefficient extension, not a second construction of ordinary Kummer sheaves. |
| F04, BLGHT pagination | §§2.3 and 2.5: “pp. 26–29” | Repaired. BLGHT11 lines 963–1062 include the projectors, real form, pairing and Betti system. Printed p.29 contains the Betti construction. |
| F05, missing supplier contracts | README:67 names `Nat.exists_prime_and_dvd` and `IsAdicComplete.henselianRing`; README:107 adds `completeIntersectionCohomology`; README:111 names Tougeron's theorem | Partly repaired. The omitted inputs now have contracts and resolve at their suppliers. The added complete-intersection paraphrase loses a degree hypothesis: R01. |
| F06, unsupported downstream use | Downstream consumers now has only PotentialAutomorphyInfrastructurePartII | Repaired. The Kloosterman consumer claim is gone; the retained consumer uses the symplectic switching and local-property targets. |
| F07, forward dependency | §2.1 Needs now lists the comparison and complete-intersection suppliers, without §2.2 | Repaired. The argument gets the rank and all-prime torsion-freeness independently; §2.2 then deduces integral Betti torsion-freeness. No edge back from §2.1 to §2.2 remains. |
| F08, diagonal point-count owner | §6.1 Needs: “CharacterSumsOverFiniteFields §2.4”; proof also names SchemeAndStackFoundations §1.16 | Repaired. The character-sum expansion is imported; the Dwork eigenline extraction is owned here. The inverse-character/Gauss sign agrees with the imported unnormalised sum. |

The repeated-pattern search covered the remaining determinant claims, all integral/rational coefficient distinctions, Kummer and Jacobi-sum mentions, forward references and downstream claims. It found R02 in the coefficient distinction and R03 in a proof-route dependency. No earlier finding was marked not actionable in this package.

### Computed adversarial evidence

The table records the seeded sample, all five Lean headlines, the repaired patterns and the new findings. “Excluded” means that the actual hypotheses reject the test; it is not a claim that the conclusion holds there. Algebraic identities in the value column are the computations, not results inferred from a successful `sorry` build.

| Statement | Instances tried | Values on the two sides / separating value | Result; change |
|---|---|---|---|
| Complete-intersection contract | Conic, `m=1`, `q=4`, `Λ=ℚ₃` | Actual rank 0; claimed rank 1; `h²=0` | R01 |
| 0.1, pseudo-reflections | Identity; `diag(1,2)`; size-three unipotent block | Displacement ranks 0,1,2; determinants 1,2,1 | Identity excluded; rank-one condition separates unipotence from transvection |
| 0.2–0.4, companion orientation and Levelt adapter | `p=(X−1)²`, `q=X²+X+1` | `C(p)=[[0,−1],[1,2]]`, `C(q)=[[0,−1],[1,−1]]`; difference rank 1; constants both 1 | Signs and column convention agree; common-root hypothesis necessary |
| 0.5–0.7, finite Hermitian forms (sample) | `𝔽₉=𝔽₃[i]`; dimension one; characteristic two | `N(i)=1`, `N(1+i)=2`; scaling changes coefficient 1 to 2. In `𝔽₄/𝔽₂`, `Tr(ω)=1` and every nonzero element has norm 1 | Norm/trace argument works also in characteristic two; complex signature counterexample excluded by finite-field assumption |
| 0.8 and 5.3 route | Quadratic involution; two-dimensional trivial representation | Applying conjugate transpose twice gives `λσ(λ)=1`; after Hilbert 90 the discrepancy is 1. `diag(1,1)` and `diag(1,2)` are not proportional | Absolute irreducibility is needed for uniqueness; R03 adds the input |
| 0.9 (sample) | `SL₃(𝔽₃)`, `SL₂(𝔽₃)`, `SL₃(𝔽₇)` | `27·8·26=5616`; exceptional abelianisation has order 3; centre size `gcd(3,6)=3` | Exceptional pair excluded; normal-subgroup deduction uses perfectness, not simplicity alone |
| 0.10 and 0.12 | Cross-characteristic rank two; diagonal subgroup | `#PSL₂(𝔽₁₁)=660`, `#PSL₂(𝔽₉)=360`; diagonal in `G×G` has size `#G`, not `(#G)²` | Distinct simple quotients needed for product conclusion |
| 0.11 (sample) | Characteristic-three binary icosahedral exception; upper unitriangular group | `#SL₂(𝔽₅)=120`, `#SL₂(𝔽₉)=720`; upper unitriangular matrices preserve `⟨e₁⟩` | Rank-two exception retained; reducible example excluded |
| 1.2–1.3 | Hesse pencil; diagonal scalar | Smoothness condition at `t=0`: `t³−1=−1`; diagonal character is `ζ^{Σa}=1` when `Σa=0` | Singular parameter `t=1` and non-descending characters excluded |
| 1.4 (sample and repair) | Qian `(N,n)=(401,3),(501,4)`; self-dual `(7,2)` | `B={1,2,398}`, sum 401; `B={1,2,3,495}`, sum 501; `B={3,4}`, sum 7 | Cardinalities 3,4,2; all sums zero modulo N |
| 1.4, zero-shaped converse | `(0,0,0,1,3,5,5)` and `(0,0,0,0,1,2,4)` modulo 7 | Zero multiplicities 3 versus 4; nonzero 5 repeated versus no repeat; B-sums 2 versus 0 | Correctly separates rank data from zero-shaped data |
| 1.5 | `(401,3)` | `2B={2,4,395}≠B`; `−B={400,399,3}≠B` | Trivial stabiliser/asymmetry tests distinguish wrong data |
| 1.6 | Power cover away from 0,1,∞ | Derivative of `t↦tᴺ` is `Nt^{N−1}`, nonzero on this domain with N invertible; degree N | No étaleness asserted at excluded points |
| 2.1–2.3, all-prime rational extension | Hesse fibre; coefficient prime dividing N | Two Fermat eigenlines; rank 2. The scalar `N^{N−2}` is invertible in `M_λ` but not in `O_{M_λ}` at `λ|N` | Rational projector is legitimate at every coefficient prime; integral scope matters in R02 |
| 2.4–2.5 (sample) | Self-dual projector and twist | `e=((1+s)/2)(eχ+eχ⁻¹)` has `e²=e`; reversed exponents give `−a`; `2−N+(N−1−n)=1−n` | Correct real descent and alternating-pairing twist |
| 2.6–2.7 | `N=5`, `a=(1,0,0,0,4)` | Nonzero eigenlines indexed by `{2,3}`, hence rank 2; other three indices give zero | Rank agrees with index-set count |
| 3.1–3.4 | One character; dual pair; N-th power pullback | Rank-one trace `ρ((1−x)^{(q−1)/N})`; weights `n−1=0,1`; a Kummer character of order N becomes trivial under `[N]` | Character orientation and comparison twist consistent |
| 3.5–3.6 | `N=401,n=3` | Original weight 399 minus comparison weight 397 equals 2; determinant exponent `3(1−3)/2=−3` | Pure weight and determinant agree |
| 4.1 (sample) | Supplier loops `p₀,p₁,p∞` | `γ₀γ₁γ∞=p₀(p₀⁻¹p₁p₀)p∞=p₁p₀p∞=1`; power-cover subgroup index N | Order translation correct |
| 4.2–4.3 | `(401,3)`; `N=3` Hesse | Eigenvalue exponents sum 401, determinant 1; Hesse local unipotent matrix has displacement rank 1 even with three vanishing cycles | No confusion between number of nodes and displacement rank |
| 4.4 (sample) | Scalar part c, `N=401,n=3`; excluded `N=n=3` | `cᴺ=cⁿ=1` and `gcd(401,3)=1` force c=1; `c=ζ₃` has `c³=1` but c≠1 | Roadmap supplies the missing quotient-unipotence step, with its hypotheses |
| 4.5–4.7 | Rank two unipotent companion | `C−1=[[-1,−1],[1,1]]≠0`, `(C−1)²=0`; `(X−1)` and the nonzero-index root polynomial have no common root | Maximal block and residual irreducibility tests agree |
| 5.1, SL headline (sample) | Qian `(401,3)`; coefficient characteristics 5 and 3 | `ord₄₀₁(5)=25`, so −1 is not a power; `ord₄₀₁(3)=400`, so `3²⁰⁰=−1` | 5 meets SL hypothesis; 3 belongs to unitary branch, not SL branch |
| 5.2, Sp headline | `m=2,N=7` | `B={2,3,4,5}=−B`, sum 14; over characteristic 3 the root field has degree 6 and real subfield degree 3 | Correct field of definition; boundary `N=2m+1` excluded |
| 5.3, SU headline | `σζ=ζ⁻¹`, primitive root of order N>2 | `σ²ζ=ζ`; generation of k forces `σ²=id`; `σ≠id` | Unique quadratic involution, correct determinant-one unitary group; R03 |
| 5.4, two-prime headline | Distinct characteristics versus the same pair twice | Same-pair subgroup is diagonal, order `#SL`, rather than product order `#SL²`; distinct-characteristic simple quotients cannot be identified | Distinct-prime and size hypotheses essential, present |
| 5.5–5.8 | Restriction and Hermitian multiplier | An index dividing N in a perfect SL/SU image cannot be a nontrivial abelian quotient; `ε^{2−N}ε^{−(n+1−N)}=ε^{1−n}` | Image and pairing calculations agree |
| 5.9 (repair) | Every datum, including non-zero-shaped rank three modulo 7 | Seven unipotent peripheral generators each have determinant 1; their products also have determinant 1 | General descent route valid without spectral-stabiliser restriction |
| 5.10–5.12 | Paired versus unpaired level structures | Forgetting an alternating pairing allows distinct determinant scalars; fixing the pairing leaves Sp, while fixing determinant and Hermitian form leaves SU | Torsor group matches the monodromy, rather than all GL or GU |
| 6.1–6.2, Gauss headline | Zero-shaped datum modulo 7; rank zero; trivial Gauss character | Pairing nonzero indices gives `∏g(a)=q³`; six ordered differences pair to give `q³`; exponent `3(7−3)/2=6`. Rank zero gives `1=1`. Primitive ψ gives `g(0)=−(−1)=1` | Formula has exponent 6, with determinant exponent 3 after q⁻³; zero denominator avoided |
| 6.3–6.4 (repair) | N=301; non-zero-shaped datum modulo 7 at q=29, λ=43 | Orders of 3 and 5 modulo 301 are 42; `29¹⁴≡6 (mod43)`, so 29 is not a cube | Finite-field root argument is not an assertion for arbitrary exponent data |
| 6.5–6.7 (repair) | A character with values in `𝔽_{l^s}` | Requiring `(l^s−1)n` to divide the multiplicative order available in the enlarged residue field supplies n-th roots; just containing `𝔽_{l^s}` does not | Root-field condition retained; zero-shaped hypothesis propagated |
| 6.8 and 7.11 (sample) | Rank three Frobenius polynomial | `det(Frob)=q³`, constant coefficient of `det(X−Frob)` is `−q³`; for `det(1−TFrob)` constant coefficient is 1 | Polynomial normalizations are not interchanged; all finite coefficient places retained rationally |
| 7.1 (sample) | `N=401,n=3`, identity and complex-conjugate coefficient embeddings | Fermat grades `{198,199,200}` versus `{199,200,201}`; each component has dimension 3 | Coefficient conjugation cannot be omitted; comparison uses `K⊗E`, not a K-action on V |
| 7.2–7.4 (sample 7.4) | `N=5,n=2`, `a=(1,0,0,0,4)` | Positive-residue sums at i=2,3 are 10,15; grades 1,2; twist 1 gives labelled weights 0,1 | Consecutive-weight statement and twist agree |
| 7.5–7.7 | Qian `(401,3)` | Minimum grades 198 and 199; their sum 397 equals `N−n−1`; subtracting minima gives `{0,1,2}` at both labels | Character weight and de Rham normalization agree; crystallinity retains good-reduction hypothesis |
| 7.8–7.9 (sample 7.9) | Rank three, quadratic residue field | Inertia summands have exponents `(0,2),(1,1),(2,0)` in θτ,θcτ; determinant `(θτθcτ)³=ε⁻³`, not ε³ | Inverse tame characters are required and used |
| 7.10 | Two-dimensional block, valuation −d | `log([[1,1],[0,1]])=[[0,1],[0,0]]`; scaling by d≠0 preserves rank 1 and nilpotence index 2 | Specialization contract includes the ramification factor |
| 7.12–7.13 | Rank two weight one; hypergeometric Hasse polynomial at zero | Extremal ordinary slopes 0,1 have sum 1 and gap 1; Hasse polynomial constant coefficient 1 excludes the zero polynomial | Generic locus nonempty; slope result is not a statement at every point |
| 8.1 | Maximal N with nonconsecutive weights | `φ=diag(5,25)`, `N(e₂)=e₁`: `Nφ=5φN`, Newton sum 3; weights `{0,3}` also sum 3 but do not force a stable Galois line | Roadmap imports the consecutive-weight criterion, not the overbroad source assertion |
| 9.1–9.3 (repair) | `(N,n,l)=(401,3,5)` | Residue degree 25 is odd, so `𝔽_{5²}` is not a subfield of `𝔽_{5²⁵}` | Worked example correctly changes N before using the switch |
| 9.4 (sample) | Rank two; two parameters | `GSp₂=GL₂`, multiplier=determinant=`ε⁻¹`; product torsor has two independent parameters | Pairing compatibility and product base retained |
| 9.5 (sample and repair regression) | Rank three at λ|2; square cover over ℚ₅ | Rational quotient by 2 has size 1, whereas lattice quotient has size `#(O/2)³`. Permutation-module invariants at 1 and 2 have dimensions 2 and 1; all `1+5ℤ₅` give 2 | R02; general finite-level local constancy itself passes |
| 9.6–9.7 | m=1; excluded m=p+1 | `ω₂⁻¹⊕ω₂⁻p` has determinant ε⁻¹; at m=p+1 the character extends and the induction is reducible | Bounds and dualization correct |
| 9.8 | CM character with paired weights | A conjugate pair with exponents a and w−a has sum w; induced Hodge multiset is the union of the labelled singletons | Purity condition is the prescribed pair-sum, not arbitrary infinity data |
| 9.9–9.10 (sample 9.10) | Rank three arithmetic image | Over `𝔽₉/𝔽₃`, `diag(i,1,1)` has multiplier 1 but determinant i∉𝔽₃; a Dwork determinant ε⁻³ takes values in the prime field | Correctly uses actual arithmetic image G containing SU, not full GU |
| 9.11–9.12 | `(n,m)=(2,3),(3,2),(1,2)` | Tensor weights respectively `{0,…,5}`, `{0,…,5}`, `{0,1}`; determinant exponents −15,−15,−1; form signs respectively Hermitian, skew-Hermitian, skew-Hermitian | Rank-two modular-curve branch and trace-zero rescaling retained |

### Seeded locators and wording

No additional locator was marked unverified by the author. The following checks use the cached editions named in the manifest, including arXiv version numbering and author pagination. A secondary application of an inaccessible classification is distinguished from reading that classification itself.

| Target | Text and exact location read | Outcome |
|---|---|---|
| 0.7 | BCGNT25 lines 2328–2352, Lemma 4.3.4/proof, p.46; LEWIS82 §4 | BCGNT gives the form-normalization input and cites uniqueness; the roadmap supplies its own norm/trace proof. Lewis remains uncertified. |
| 0.9 | QIAN23 lines 682–715, 738–756, Lemma 3.6/Proposition 3.7, pp.15–16; BCGNT25 lines 2578–2584, Lemma 5.2.3, p.51; BLGHT11 lines 1245–1254, pp.33–34 | Applications and exceptions agree; SL perfectness/simplicity separately checked at Tau Ceti. These passages are not a primary proof of all SU structure facts. |
| 0.11 | QIAN23 lines 691–709, proof of Lemma 3.6, p.15; BLGHT11 lines 1178–1230, proof of Lemma 4.6, pp.32–33; DICKSON01 lines 10079–10117, §260, pp.285–286 | The applied dimension>2 theorem and the rank-two exception agree. Dickson's summary is readable by OCR. ZS76 itself remains uncertified. |
| 1.4 | QIAN23 lines 467–488, §3, pp.10–11; BLGHT11 lines 954–1007, §4/Lemma 4.1, pp.26–27; BCGNT25 lines 1977–1996, §4.1, p.40 | Vectors, omitted residues, parity and rank ranges match; general zero-shaped formulation is the roadmap's extension. |
| 2.5 | BLGHT11 lines 963–1021 and 1047–1062, §4, pp.26–29 | Projector, real coefficient field and alternating pairing agree; repaired page range includes Betti realization. |
| 4.1 | QIAN23 lines 577–599, p.13; BLGHT11 lines 1102–1106, p.30 | Loop order translated explicitly to the BelyiMaps/Mathlib convention. |
| 4.4 | QIAN23 lines 600–622, Lemma 3.3(2), pp.13–14; BLGHT11 lines 1113–1147, Lemma 4.3, pp.30–31 | Roadmap distinguishes pencil monodromy from quotient monodromy and supplies the scalar-eigenvalue argument. |
| 5.1 | QIAN23 lines 682–715, Lemma 3.6 and proof, p.15 | Finite field generated by ζ, odd characteristic, large N and exclusion of inversion retained. |
| 7.1 | QIAN23 lines 937–976, pp.18–19; BLGHT11 lines 1300–1334, §5, p.35 | Twisted coefficient convention agrees; roadmap writes a correctly typed labelled de Rham comparison. |
| 7.4 | QIAN23 lines 1010–1020, Lemma 3.10(1), p.20; BLGHT11 lines 1352–1355, Lemma 5.3(1), p.37 | Consecutive lists and self-dual twist agree. General proper-smooth rational comparison supplies the all-place extension. |
| 7.9 | BCGNT25 lines 2429–2450, Lemma 4.4.4, p.48; BLGHT11 lines 1363–1365, Lemma 5.3(5), p.37; CEGS lines 190–240, §1.4, p.5 | Roadmap uses inverse direct-reciprocity tame characters, as required by determinant ε⁻³ in rank three; source sign issue recorded below. |
| 7.11 | BCGNT25 lines 2074–2123, Proposition 4.2.5, pp.42–43; BLGGT14 lines 2820–2858, §5.1 | Semisimplified all-place family, finite bad set, purity and polynomial convention match. Rational extension at coefficient primes dividing 2N is explicit. |
| 9.4 | BLGGT14 lines 1852–1975, Theorem 3.1.2/proof, pp.42–44; especially lines 1960–1968 | Geometric switching step isolated from automorphy lifting; paired level structures and separate parameters agree. |
| 9.5 | BCGNT25 lines 3278–3290, proof of Theorem 6.2.4, p.66; KIS99 Theorem 5.1 | The source uses finite-level congruence neighbourhoods. The general finite-cover proof is valid; the package's all-prime integral notation needs R02. Kisin remains uncertified. |
| 9.10 | BCGNT25 lines 3293–3317, proof of Theorem 6.2.4, pp.66–67 | R_aux construction and prescribed local conditions agree; roadmap correctly replaces full GU by the actual image and retains avoidance. |

Five further wording comparisons were made at §3.4 against KATZ09 lines 493–513 (Theorem 5.3, pp.96–97), §7.13 against DK17 lines 1364–1449 (Proposition A.3.1 and Corollary A.3.2), §8.1 against QIAN21 lines 919–935, §9.6 against BER10 lines 626–640 (Theorem 3.2.1, pp.277–278), and the Gauss-product Lean docstring against QIAN23 lines 796–833. Shared formulas, mathematical names and necessary hypothesis lists do not constitute borrowed prose. No copied sentence, example list, table or figure was found.

The References contain 21 works, each with one manifest key. All sources used were already cached or settled as uncertified; no source was fetched and no manifest entry changed. The six settled inaccessible works were not requested again.

### Lean acceptance test and pinned library audit

The requested `lake env lean` elaboration of `packages/PotentialAutomorphyDworkMotivesPartII/Suggested.lean`, from the pinned content checkout, exited 0. Its only diagnostics were `declaration uses 'sorry'`, at lines 97, 116, 136, 155 and 190. No Tau Ceti module build was needed: the file has exactly `import Mathlib`.

All ten declarations were checked with `#check @name` on a scratch copy. That elaboration also exited 0 with only the five sorry warnings. Comparison with the README found no dropped section binder: finite-field assumptions, odd characteristic, primitive root, field-generation condition, rank-one displacement, distinct primes, exact character order and primitive additive character are in the theorem signatures. The five real-body definitions are the two index sets, the zero-shaped structure and its index set, and the normalized Gauss sum. Their total-function boundary values are not used to evade the headline hypotheses.

Every sorried theorem was tested on a separate copy with `solve | simp | rfl | infer_instance`. All five failed to close. The pinned near-match statements were then read: the matrix-group membership definitions do not identify the subgroup generated by the pair, and the Gauss/Jacobi lemmas do not state the zero-shaped product. There is no applicable one-library-lemma `exact` proof among the supplied near-matches. No theorem mirrors a Check or a boundary case, so no padding deletion is requested.

The headline inventory is:

- **Stated:** residual SL, Sp, SU and two-prime SL×SL recognition (§§5.1–5.4), and the zero-shaped Gauss determinant identity (§6.2).
- **Named as not statable in the module docstring:** Katz comparison (§3.4); Dwork monodromy and its companion model (§§4.4–4.6); geometric residual monodromy and torsors (§§5.5–5.12); Hecke realization of the comparison character (§7.5); local p-adic properties and weak compatibility (Layers 7–8); switching theorems and auxiliary systems (Layer 9). The missing carriers are the relative cohomology/eigensheaves and their arithmetic realizations, rather than the finite matrix algebra that the file does state.
- **Imported:** Levelt rigidity from HypergeometricMotives §3.4. It is not missing from this package's acceptance test.

Pinned declarations opened in this round include the following; paths here are relative to the corresponding pinned library repository.

| Library file and line | Declaration / comparison |
|---|---|
| `Mathlib/Data/Nat/Prime/Defs.lean:403` | `Nat.exists_prime_and_dvd`, hypothesis `n ≠ 1`, including n=0 |
| `Mathlib/RingTheory/Henselian.lean:154` | `IsAdicComplete.henselianRing`, complete along the specified ideal |
| `Mathlib/LinearAlgebra/Transvection/Basic.lean:56`, `:138`, `:408`, `:527`, `:674` | Real transvection definitions, finite-dimensional displacement criterion, scalar extension and determinant one |
| `Mathlib/LinearAlgebra/Transvection/Generation.lean:487` | Nonexceptional generation theorem, with its exception hypothesis and natural-subtraction exponent |
| `Mathlib/LinearAlgebra/UnitaryGroup.lean:121`, `:278`, `:285` | `star A*A=1`; SU is the unitary group intersected with determinant one |
| `Mathlib/LinearAlgebra/SymplecticGroup.lean:102` | `A*J*Aᵀ=J` on the sum-index carrier; not a theorem about generators |
| `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:297` | Centre identified with roots of unity |
| `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:525` | `SeparatingLeft`, the zero-kernel condition used for nondegeneracy |
| `Mathlib/FieldTheory/Finite/GaloisField.lean:219` | Norm on units is surjective for finite-field extensions |
| `Mathlib/RingTheory/Trace/Basic.lean:519` | Trace surjectivity assumes finite dimension and separability |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:84` | Multiplicative Hilbert 90 for the automorphism action |
| `Mathlib/NumberTheory/GaussSum.lean:200` | `gaussSum_mul_gaussSum_eq_card`, with χ nontrivial and ψ primitive; no zero-character exception silently discarded |
| `Mathlib/NumberTheory/JacobiSum/Basic.lean:194`, `:325` | Gauss quotient and product of Jacobi sums; neither is the zero-shaped headline |
| `Mathlib/CategoryTheory/Galois/Equivalence.lean:40`, `:90` | Continuous finite-set action functor and equivalence for a fibre functor |
| `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:76` | Absolute cohomology of one scheme, not the relative lisse object |
| `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Perfect.lean:102`, `:116` | Perfectness with respectively field-size or rank bounds |
| `TauCeti/LinearAlgebra/Projectivization/PSL/Simple.lean:127`, `:142` | Simplicity with the stated rank/field-size alternatives |
| `TauCeti/AlgebraicGeometry/FiniteEtale/Basic.lean:66` | Full subcategory of finite étale morphisms over S; includes the identity and does not itself define a module-valued lisse sheaf |
| `TauCeti/AlgebraicGeometry/FiniteEtale/Galois/Category.lean:111`, `:122` | Galois-category instance and isomorphism of fibre functors assume connected S |
| `TauCeti/AlgebraicTopology/Singular/Fibration/LocalSystem.lean:102` | Fibre homology local system of a topological fibration, not an analytification/relative étale comparison |

The five unresolved-name leads in the supplied citation scan were checked as context-sensitive names: the three `VanishingCycles` names belong to the cited supplier targets; `ZeroShapedDatum.indexSet` and `ZeroShapedDatum.injOn_nonzero` are declared locally. They are not missing pinned-library declarations. The roadmap's own advertised Lean names resolve to its ten declarations and generated structure fields.

### Ownership, suppliers, gaps and shape

Ownership was searched by object with the roadmap service and against the pinned libraries, not just by this package's declaration names. The board-package index was read before drawing absence conclusions. The three other branch packages in that index concern different subjects; no ownership conclusion here depends on their unseen contents. The supplied overlaps report has no second copy, conflicting head, dropped citation or revision-only identifier to repair.

The current supplier heads were obtained through `roadmaps show`; the changed contracts were compared with their supplying passages. In particular:

- FourierDeligneTransform #2132, `TauCetiRoadmap/FourierDeligneTransform/README.md:299`, §2.6, supplies ordinary Kummer sheaves; CharacterSumsOverFiniteFields #1712, `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md:915`, §2.4, supplies the diagonal expansion. Both repairs correctly cite these owners.
- HypergeometricMotives #1716, `TauCetiRoadmap/HypergeometricMotives/README.md:1042`, §3.4, has the field-general Levelt theorem, including the triple-order adapter. ClassicalArithmeticCompletion on main supplies the companion orientation in §§2.46, 2.60.
- ModularityAndLanglandsExtensions #1180, `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:941`, `:962`, `:985`, `:1005`, §§2.9–2.12, owns pointwise eigenrealizations, equivariant semistable models, the consecutive-weight ordinary criterion and semisimplification transport. Its §§2.14 and 2.18 supply the self-dual sheaf input and auxiliary elliptic primes. This package's relative sheaves and monodromy do not replace them.
- PotentialModularityAndCompatibleSystems §§1.1, 1.3, 1.4, 1.7, 1.9, 1.11 and 2.14–2.20 supply the family operations and point-selection/field constructions. Its §2.20 begins at `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md:855`; it allows the finite quotient used in §9.10.
- PotentialAutomorphyInfrastructure #1081, `TauCetiRoadmap/PotentialAutomorphyInfrastructure/README.md:1044`, §2.20, supplies the density-one rank-two input. It does not consume this package to prove that input.
- ComplexComparisonPartII §§C5.2–C5.3 and C6.5–C6.6, EtaleCohomologyFoundations §§F.0.2, F.0.A2, F.2–F.4 and F.6, InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–T3 and IG.1.3, and DeligneWeightsAndPurity §§0.1, 3.2, 7.15, 8.19 supply the relative comparisons, traces, purity and specialization named here. No missing heading was established.
- PadicHodgeTheory §§3.2–3.6, 6.1, 6.4, 8.1–8.2 and LocalGaloisDeformationRings §§1.7, 6.8, 6.19, 6.25 have the indicated sign and component interfaces. The latter's §6.19 has weights `0,−m,…` in its own convention; this package translates to `0,m,…` and keeps `ε₂ε′₂=ε⁻¹`.
- PadicDifferentialEquationsAndRigidCohomology §§RD.2.3, RD.3.34, RD.3.37, RD.3.43, RD.5.8 and RD.7.7 supply the isocrystal, specialization and Katz–Messing interfaces. The missing companion theorem is explicitly a gap, not silently attributed to §RD.3.34.
- ArithmeticGaloisDuality §R02.4.6 contains the prescribed totally real base-change root theorem. SchemeAndStackFoundations §§1.15–1.16, AbelianSchemesAndArithmeticModuli §§A6.30–A6.31 and AlgebraicModuliForArithmeticGeometry §3.4 supply twisting/Weil restriction. BelyiMaps §§5.2, 5.6 fixes the loop convention; Chebotarev Layer 10, EllipticCurves Layers 3–4, GlobalNumberFields Layers 9–10, ModularCurves §5C and ModularCurvesPartII §5.14 supply the other named base constructions.

All five gap slugs agree between the README contracts and `packages/PotentialAutomorphyDworkMotivesPartII/design/plan.json`. Each names a supplier. The compactified twisted-curve contract includes composite level and integral/local-monodromy requirements not supplied by the prime-level extension in ModularityAndLanglandsExtensions §2.23; that extension alone does not discharge it. Waterhouse's Theorem 4.1, WATERHOUSE69 lines 619–628, includes ordinary trace 1 and supersingular trace 0 over every prime field. The contracts are not counted as missing prerequisites merely because their suppliers have not yet fulfilled them.

Dependency check, run with the requested `--movable` mode and the supplied merge order:

```text
depcheck: 223 roadmaps, 1993 edges, 0 problem(s)
```

Exit 0; no UPWARD, CYCLE or moved line. The local Needs-list omission is R03 and is not detected by this inter-roadmap check.

For house style, the scopes and organization of ClassicalArithmeticCompletion, GlobalNumberFields and BelyiMaps on main were read. This README has the requested scope, conventions, supplier contracts, build explanation, ten named mathematical layers with Examples and Dependencies, downstream use and references. Definitions have prose API bullets and at least three Checks. Mathematical prose is Unicode with code-span formulas. The Lean file has a module docstring, namespace, declaration docstrings and `theorem` rather than `lemma`; it contains no API catalogue, stand-in predicate, admitted definition, algorithm or process residue. The missing hypotheses found are R01 and R02.

Overlap check: read PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, PotentialAutomorphyInfrastructure, HypergeometricMotives, EllipticCurveModularityImaginaryQuadratic and ClassicalArithmeticCompletion from the closest-roadmap lists; companion matrices — ClassicalArithmeticCompletion; Levelt rigidity — HypergeometricMotives; pointwise Dwork realizations, equivariant semistable models and local ordinary criterion — ModularityAndLanglandsExtensions; rank-two density-one input — PotentialAutomorphyInfrastructure; polarized automorphy lifting — PotentialAutomorphyInfrastructurePartII; prime-level elliptic switching — EllipticCurveModularityImaginaryQuadratic; relative Dwork eigensheaves, their monodromy and the Dwork switching points — this package. Also read PotentialModularityAndCompatibleSystems for family operations and Moret-Bailly, and FourierDeligneTransform/CharacterSumsOverFiniteFields for the repaired ownership citations.

The source arrangement was compared against the section headings of QIAN23, BLGHT11 and the contents of BCGNT25. QIAN23 §3 spans this roadmap's Layers 1, 2 and 4–7, rather than providing one layer per source section. BLGHT11's automorphy-lifting and corrections sections are not layers here. BCGNT25 puts its unitary-group discussion after the Dwork construction; this roadmap puts finite linear groups first and leaves its deformation-ring and lifting chapters to suppliers. The actual order is forced by eigenprojectors needing the family, comparison needing eigensheaves, residual monodromy needing complex monodromy, local comparison needing the computed Hodge data, and switching needing both torsors and local loci. There is no one-to-one reproduction of a run of source chapters.

Source independence: 20 target/prose passages compared, using 10 readable sources including the sign cross-check in CEGS; no copied expression or reused table found. Counting explicit author-led citation occurrences before References gives 176, with QIAN23, BLGHT11 and BCGNT25 tied at 45 each. Their section arrangements were compared: independent. The inaccessible primary texts are identified below rather than represented as read.

## Not verifiable

- LEWIS82, KM74, KIS99, KATZ90, ARTIN55 and ZS76 remain settled as uncertified. Their primary text and exact internal statements were not read; their locators and accessible applications are recorded above. No request for these texts was made.
- The published Inventiones numbering of QIAN23 was not separately checked. The verified statements use the explicitly cited arXiv v1 numbering; the publication-number correspondence in References remains uncertified here.
- DICKSON01 and WATERHOUSE69 are OCR extractions; the indicated classification summaries are readable, but typographical details of every displayed symbol in the scans were not independently inspected.
- Ownership against the three other board branch packages was limited to their index descriptions; their contents were not available in this checkout. The named open roadmap heads used in the ownership audit were available and read through the roadmap service.

## Source issues

- **Misprint** in BCGNT25 at Lemma 4.2.4 and proof, arXiv v3 pp.41–42: the source says the duality twist is 1−N and the weight relation has exponent N−n; it should be 2−N and N−n−1 respectively; affects a stated result.
- **Misprint** in BCGNT25 at §4.1, arXiv v3 p.40: the source says the eigensheaf is obtained from a direct image without its degree; it should be the higher direct image in degree N−2; affects nothing.
- **Misprint** in BCGNT25 at Definition 4.3.1, arXiv v3 p.45: the source says the special unitary group is the multiplier kernel; it should be the multiplier kernel intersected with determinant one; affects nothing.
- **Error** in BCGNT25 at Lemma 4.4.4, arXiv v3 p.48: the source says the cohomological inertia formula uses positive powers of the direct-reciprocity residue characters; it should use their inverses, giving determinant ε to the power −n(n−1)/2; affects a stated result.
- **Misprint** in BCGNT25 at proof of Lemma 4.4.4, arXiv v3 p.48: the source says the Fermat eigenlines lie in degree N−1; it should be degree N−2; affects nothing.
- **Error** in BCGNT25 at proof of Theorem 6.2.4, arXiv v3 p.67: the source says the first auxiliary residual image is the full unitary similitude group; it should be the actual arithmetic image, with linked cyclotomic determinant and multiplier; affects the proof.
- **Gap** in QIAN23 at proof of Lemma 3.3(2), arXiv v1 pp.13–14: the source says semistability of the pencil establishes unipotence of the quotient monodromy; it should additionally eliminate the scalar semisimple part of the quotient monodromy; affects the proof.
- **Misprint** in QIAN23 at the comparison formulas preceding Lemma 3.9, arXiv v1 p.19: the source says to tensor the coefficient-field representation over the local base field; it should tensor with B_dR over ℚ_l, then take the labelled component over the base-field/coefficient tensor product; affects a stated result.
- **Error** in QIAN21 at Lemma 4.2, arXiv v1 p.20: the source says maximal semistable monodromy alone implies regular ordinarity; it should retain the consecutive-weight, appropriately twisted weight-zero hypothesis of the cited BLGHT criterion; affects a stated result.

## For the human reviewers

- **Licence:** QIAN21 and ACAMPO24 are cited as arXiv preprints in `packages/PotentialAutomorphyDworkMotivesPartII/README.md`, References. No copied prose or external Lean formalization was identified; publication and licence decisions remain with the human reviewers.
- **Not tested:** Six primary sources remain explicitly uncertified, including the finite-group classification ZS76. Accessible applications and the roadmap's calculations were checked; certification of those primary texts was not claimed.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3e807ed2cf5e92a862e1e0f414027cedc7e557ba", "job": "REV-PKG-PotentialAutomorphyDworkMotivesPartII~8", "model": "gpt-6-astra", "worker": "chris-3"} -->
