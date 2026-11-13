# Review of LocalFieldsRamificationPartII (pull request #2258 at 68e1c85)

**Verdict:** needs changes

## R01 (P2) — Do not restrict the algebra theorem to fit the proof route

**Location:** TauCetiRoadmap/LocalFieldsRamificationPartII/README.md:798–801; Suggested.lean:80–83: “this roadmap states and proves the Prüfer case only, by the route below, which needs no flattening technique.”
**Claim:** The algebra headline excludes arbitrary domains specifically to avoid their proof prerequisites. This violates the requirement to retain the general theorem rather than narrow its domain for a preferred route.
**Witness:** Take A = k[x,y], B = A[T]. B is flat and finitely presented with zero relations; A is not Prüfer: neither x/y nor y/x belongs to A_(x,y).
**Repair:** State “Every flat finite-type algebra over a domain is finitely presented,” with the cited Raynaud–Gruson locator and explicit ownership of its proof prerequisites. Remove hA from the algebra headline; retain the separately scoped module theorem. The generalized signature elaborates and includes this example.

## R02 (P3) — Distinguish rational henselization from the p-adic field

**Location:** TauCetiRoadmap/LocalFieldsRamificationPartII/README.md:1406: “For K = ℚ_pʰ, which is henselian and not complete”; also §§1.4, 2.8, 4.2–4.3.
**Claim:** No convention defines ℚ_pʰ differently from the henselization of ℚ_p. Under the stated Kʰ convention, ℚ_pʰ = ℚ_p and is complete; the intended noncomplete field is the henselization of (ℚ,v_p).
**Witness:** README:701 makes henselization fix complete height-one fields. The henselization of (ℚ,v_p) is countable and properly contained in uncountable ℚ_p; henselizing ℚ_p changes nothing.
**Repair:** Add “Write H_p = (ℚ,v_p)ʰ ⊂ ℚ_p for the henselization of the rational field at p.” Replace ℚ_pʰ and ℚ_7ʰ throughout by H_p and H_7. The Check then reads “H_p is henselian and not complete.”

## Verified sound

In the table, H_p denotes (ℚ,v_p)ʰ, and T/F mean true/false. “Retain” concerns the tested statement, not a proof of its general case.

| Statement | Instances tried | Computed input / left side | Computed output / right side | Result; change |
|---|---|---|---|---|
| Conventions: valuation sign | Composite valuation on ℚ_p((t)) | v(t)=(1,0), v(p)=(0,1) | Both positive; absolute values below 1 | Agrees; retain |
| Conventions: exponent and empty prime set | Residue characteristic 0; 2; 3 | Exponents 1; 2; 3 | Allowed power degrees {1}; {2^r}; {3^r} | Agrees; retain |
| Conventions: relative henselianity | ℚ/ℚ at 7 | One prolongation | Relative henselian T; base henselian F | Agrees; retain |
| §0.1 definition and positivity | P=∅; P=all primes | n=0;1;2 | F,T,F for ∅; F,T,T for all primes | Agrees; retain |
| §0.1 multiplication | P={3}, a=3, b=2 | 6 has prime factors 2,3 | F = T ∧ F | Agrees; retain |
| §0.1 monotonicity | {3}⊂{2,3}, n=6,9 | Smaller-set results F,T | Larger-set results T,T | Agrees; retain |
| §0.1 powers | p=2,3; n=1,6,9 | 1=2⁰=3⁰; 6 neither; 9=3² | Power test T,F,T for p=3 | Agrees; retain |
| §0.1 nonprimes and finite support | P={1,4}; s={2,3} | P has no prime; factors(6)={2,3} | Only 1 admitted for P; 6∈factoredNumbers(s) | Agrees; retain |
| §0.2 finite P-extensions | ℚ(∛2)/ℚ, P={3} | Degree 3; normal closure degree 6 | P-extension T; normal-closure test F | Agrees; retain |
| §0.2 tower iff | ℚ⊂ℚ(√2)⊂ℚ(√2,√3) | Degrees 2,2,4 | For P={2}: T↔T∧T; P={3}: F↔F∧F | Agrees; retain |
| §0.2 descent of degree | L=ℚ(√2), E=L(√3,√6) | Degree over L=2; naive ℚ-descent degree 4 | Product coordinate √2 restores degree 2 | Agrees; retain |
| §0.2 unions and subextensions | Union of 𝔽_(2^(2^r))/𝔽₂ | Finite subdegrees divide powers of 2 | All subdegrees remain 2-powers | Agrees; retain |
| §0.2 isomorphism invariance | ℚ(∛2) and its conjugate | Both degrees 3 | Both {3}-extensions | Agrees; retain |
| §0.2 compositum negative control | Two cubic subfields in S₃ closure | Individual degrees 3,3 | Compositum degree 6: not {3}-supported | Agrees; retain |
| §0.3 closedness definition | 𝔽₂, P=∅ and {3} | Only degree 1; extension 𝔽₈ of degree 3 | Closed T; F | Agrees; retain |
| §0.3 closure-independent condition | Finite field extension in two closures | Embedded degree remains 3 | Nontriviality remains T | Agrees; retain |
| §0.3 inclusion of prime sets | ℝ, {3}⊂{2,3} | Finite extension ℂ has degree 2 | {3}-closed T; {2,3}-closed F | Correct direction; retain |
| §0.3 full implies separable | Algebraically closed K | Finite subextensions have degree 1 | Both predicates T | Agrees; retain |
| §0.3 characteristic-zero equality | K=ℝ, P={2} | Only nontrivial finite degree 2 is separable | Both predicates F | Agrees; retain |
| §0.3 imperfect separation | K=𝔽_p(t)ˢ, P={p} | No finite separable extension; [K(t^(1/p)):K]=p | Separable closedness T; full F | Agrees; retain |
| §0.3 perfection equivalence | K=𝔽_p(t)ˢ | Perfection is algebraically closed | Separable closedness T = perfect-closure closedness T | Agrees; retain |
| §0.4 maximal P-extension | P=∅; all primes | Allowed subfields K only; all algebraic subfields | Maxima K; Kᵃ | Agrees; retain |
| §0.4 perfection forced | K=𝔽_p(t) | Missing t^(1/p); degree p | {p}-closedness F; perfection F | Agrees; retain |
| §0.4 maximal separable variant | Maximal separable p-extension of 𝔽_p(t) | t^(1/p) absent; further inseparable degree p | Separable p-closed T; perfect F | Agrees; retain |
| §0.5 splitting definition | ℚ(√2,√3)/ℚ(√2)/ℚ | Complement ℚ(√3), degrees 2×2 | Tensor and compositum dimensions both 4 | Agrees; retain |
| §0.5 identity tower | M/M/K | Complement K; tensor K⊗M | Multiplication is identity on M | Agrees; retain |
| §0.5 converse and factor maps | Prescribed inclusions of two quadratic factors | Multiplication injective; image degree 4 | Kernel 0; image entire biquadratic field | Agrees; retain |
| §0.5 isomorphism transport | √3↦−√3 in biquadratic example | Same complement; same inclusions after transport | Tensor dimension 4 remains 4 | Agrees; retain |
| §0.5 intersection negative control | Distinct cubic S₃ subfields | Intersection degree 1; tensor dimension 9 | Compositum dimension 6; kernel dimension 3 | Agrees; retain |
| §1.1 normalization and centres | ℚ(√2)/ℚ at 7 and 3 | X²−2 has 2 and 0 roots modulo the primes | 2 and 1 prolongations respectively | Agrees; retain |
| §1.1 residue-product bound | Quadratic example at 7 | B/J(B)=𝔽₇×𝔽₇ | Residue dimension 2 = extension degree 2 | Agrees; retain |
| §1.1 Prüfer localization | x=(3−√2)/(3+√2) at 7 | Values (1,−1) at the two primes | x,x⁻¹ both absent from B; one present at each localization | Agrees; retain |
| §1.2 étale valuation-ring theorem | Identity; ℤ_(p)[√p] | Value maps ℤ→ℤ; ℤ→½ℤ | Identity étale; ramified example not étale | Agrees; retain |
| §1.2 henselization and strict version | Trivially valued 𝔽₂ | Henselization 𝔽₂; strict version 𝔽̄₂ | Value groups 0,0; residues 𝔽₂,𝔽̄₂ | Agrees; retain |
| §1.3 valued henselization | (ℚ,v_p); complete ℚ_p | H_p algebraic over ℚ; ℚ_p already henselian | Residues 𝔽_p, groups ℤ unchanged | Agrees; retain |
| §1.3 universal property | K henselian, target K | Structure map K→Kʰ is an isomorphism | Unique extension is identity | Agrees; retain |
| §1.3 functoriality | Identity and composition of identities | Two identity maps on K | Induced composite id on Kʰ | Agrees; retain |
| §1.3 uniqueness criterion | ℚ at 7, extension ℚ(√2) | Number of prolongations 2 | Henselian-base criterion F | Agrees; retain |
| §1.4 tensor decomposition | ℚ(√2)/ℚ at 7 | Dimension 2 over H_7 | H_7×H_7 has dimension 1+1=2 | Agrees after notation repair R02 |
| §1.4 inseparable case | 𝔽_p(t^(1/p))/𝔽_p(t) | Degree p; one prolongation | Tensor is a field of degree p | Agrees; retain |
| §1.5 homogenization | B=𝔽₂ over ℤ | S=ℤ[X]/(2X), f=X | S₀=ℤ; S_(X)=𝔽₂ | Agrees; retain |
| §1.5 module homogenization | B=R[x], M=B; M=0 | N=S; N=0 | Degree-zero localizations B;0 | Agrees; retain |
| §1.5 dehomogenization | S=R[X], f=X | Full localization R[X,X⁻¹] | Quotient by X−1 is R | Agrees; retain |
| §1.5 graded finite presentation | R a field; S=R[X,Y], N=S/(X) | Base flatness T; module has one generator | Algebra has 0 relations; module has 1 | Agrees; retain |
| §1.5 finite-prime hypothesis | R=∏ℕ𝔽₂, I=⊕ℕ𝔽₂ | Infinite R cannot inject into finite 𝔽₂^m | R[X]/(IX) flat, finite type, not finitely presented | Agrees; retain |
| §1.5 flatness negative control | Nondiscrete rank-one V, non-f.g. maximal ideal m | V[X]/(mX) has torsion X | Flat F; finitely presented F | Agrees; retain |
| §1.5 algebra headline | A=k[x,y], B=A[T] | Domain T; flat T; Prüfer F | Finite presentation T: one generator, zero relations | Unnecessary exclusion; R01 |
| §1.5 algebra converse | V[X]/(aX), a nonzero nonunit | One generator, one relation | Finitely presented T; flat F | Agrees; retain |
| §1.5 module headline | B=A, M=A; M=A/m with m non-f.g. | Flatness T; F | Finite presentation T; F | Agrees; retain |
| §1.5 zero module/algebra | Domain A, B=0, M=0 | Finite type T; flat T; finite module T | Algebra A/(1) and zero module finitely presented | Agrees; retain |
| §1.5 localization warning | R=∏ℕ𝔽₂, B=R/(⊕ℕ𝔽₂) | Every localized B is 0 or 𝔽₂ | Local finite presentation T; global F | Agrees; retain |
| §2.1 étale criterion | Identity; ℚ_p(√p)/ℚ_p | e=1; e=2 | Essentially étale T; F | Agrees; retain |
| §2.1 strict version | 𝔽_p((t)) identity | Residue degree 1; residue field not separably closed | Strictly unramified T | Agrees; retain |
| §2.2 tower and fixed fields | Trivial valuation on 𝔽_p(t) | D=G_K; I=W=1 | Kʰ=K; Kᵘ=Kᵗ=Kˢ≠Kᵃ | Agrees; retain |
| §2.2 residue quotient | Trivial valuation on 𝔽₂ | D/I=G_(𝔽₂)=Ẑ | Residue absolute Galois group Ẑ | Agrees; retain |
| §2.2 tame character group | Strictly henselian DVR, Γ=ℤ | Prime-to-p divisible quotient ℤ_(p)/ℤ | Character group ∏_(ℓ≠p)ℤ_ℓ(1) | Agrees; retain |
| §2.2 normality and conjugation | S₃ splitting field of X³−X−2 at 2 | D=I=W=C₂ in this finite quotient | Conjugate transpositions; W normal in D, not S₃ | Agrees; retain |
| §2.2 exponent one | Trivial valuation on ℚ | W=1 | Kᵗ=Kˢ=ℚ̄ | Agrees; retain |
| §2.3 unramified definition | 𝔽₄((t))/𝔽₂((t)) | e=1, f=2, separable residue | Unramified T; strictly unramified F | Agrees; retain |
| §2.3 henselization invariance | H_7/ℚ | Both henselizations H_7 | Unramified and strict T on both sides | Agrees; retain |
| §2.3 residue classification | Henselian 𝔽₂((t)), residue extension 𝔽₄ | One degree-2 residue extension, two embeddings | One unramified degree-2 extension, two embeddings | Agrees; retain |
| §2.3 strict containment | H_7/ℚ; identity over ℚ₇ | H_7⊆H_7; ℚ₇⊆ℚ₇ | Residue degrees 1;1 | Agrees; retain |
| §2.4 finite tame criterion | ℚ₃(√3); ℚ₃(∛3) | (degree,e,f)=(2,2,1);(3,3,1) | Tame T; F | Agrees; retain |
| §2.4 inseparability control | 𝔽_p(t^(1/p))/𝔽_p(t), trivial valuation | Residue degree p inseparable; e=1 | Tame F despite e prime to p | Agrees; retain |
| §2.4 defect control | Immediate Artin–Schreier degree-p extension | e=f=1, degree=p | Defect p; tame F | Agrees; retain |
| §2.4 base change | Tame quadratic L/ℚ₃, base change to L | Compositum L/L has degree 1 | Tame T; degree drops 2→1 | Agrees; retain |
| §2.4 finite Galois predicate | ℚ₂(i); unramified quadratic over ℚ₂ | Inertia orders 2;1, exponent 2 | Coprimalities F;T | Agrees; retain |
| §2.4 p=1 Galois predicate | ℂ/ℝ, trivial valuation | Inertia order 1, exponent 1 | Coprime(1,1)=T | Agrees; retain |
| §2.4 Galois tame part | S₃ example at 2 | Cubic decomposition field ⊂Kʰ; quadratic subfield ramified | Kᵗ∩N cubic; Galois tame part∩N=ℚ | Agrees; retain |
| §2.4 henselian tame part | K separably closed imperfect | Finite Galois subextensions: K only | galoisTamePart=K=Kᵗ | Agrees; retain |
| §2.5 henselian extension iff | ℚ(√2)/ℚ at 7 | Two prolongations; tensor H_7×H_7 | Henselian extension F; linear disjointness F | Agrees; retain |
| §2.5 inseparable extension | 𝔽_p(t^(1/p))/𝔽_p(t) | One prolongation | Disjoint from separable Kʰ; tensor a field | Agrees; retain |
| §2.6 total ramification iff | 𝔽_p(u^(1/p))((t))/𝔽_p(u)((t)) | e=1, f=p inseparable; one prolongation | Totally ramified T; f=1 test F | Agrees; retain |
| §2.6 purely wild iff | a^p−a=t⁻¹ over 𝔽_p((t)) | v(a)=−1/p; degree=e=p; f=1 | Pure wildness T; p-primary value quotient C_p | Agrees; retain |
| §2.6 tame negative control | ℚ₃(√3)/ℚ₃ | e=2; value quotient C₂ | 3-primary F; purely wild F | Agrees; retain |
| §2.6 exponent one | Trivially valued ℚ | Kᵗ=ℚ̄ | Only disjoint algebraic extension K | Agrees; retain |
| §2.7 field predicates | Trivially valued 𝔽_p(t) | Every finite inertia order 1; perfect F | Separably tame T; tame F | Agrees; retain |
| §2.7 algebraic inheritance | Trivial valuation on perfect 𝔽₂, extension 𝔽₄ | Both perfect; inertia orders 1 | Both tame T | Agrees; retain |
| §2.7 residue characteristic zero | ℚ((t)) | p=1; characteristic K=0 | Perfect T; every inertia order coprime to 1 | Agrees; retain |
| §2.8 strict/unramified/tame tower laws | 𝔽₂((t))⊂𝔽₄((t))⊂𝔽₁₆((t)) | Residue degrees 2,2,4 | Strict F↔F∧F; unramified/tame T↔T∧T | Agrees; retain |
| §2.8 henselian/total/wild tower laws | 𝔽₂((t))⊂𝔽₂((t^(1/2)))⊂𝔽₂((t^(1/4))) | Degrees 2,2,4; unique prolongations; residue degrees 1 | All three properties T at both steps and composite | Agrees; retain |
| §2.8 filtered union | Union of the preceding inseparable tower | Degrees 2^r; residues 𝔽₂; values ℤ[1/2] | Henselian, total, purely wild all T | Agrees; retain |
| §2.8 compositum identities | L=ℚ(√2), chosen 7-adic prolongation | L⊂H_7 | L·Kʰ=H_7=Lʰ; L·Kᵘ=Kᵘ; L·Kᵗ=Kᵗ | Agrees after R02 |
| §2.9 local-field comparisons | ℚ₃(√3); unramified quadratic | (e,f)=(2,1);(1,2) | Total T,F; unramified F,T; tame T,T | Agrees; retain |
| §2.9 imperfect residue convention | y^p−y=s t^(−p) over 𝔽_p(s)((t)) | e=1, f=p inseparable, degree=p | Total here T; supplier f=1 notion F | Agrees; retain |
| §2.9 arithmetic Frobenius | ℚ₂(ζ₇)/ℚ₂ | Frobenius ζ₇↦ζ₇² | Inverse ζ₇↦ζ₇⁴ differs | Agrees; retain |
| §2.10 perfection | 𝔽_p(t), t-adic | Γ=ℤ; residue 𝔽_p | Perfected Γ=ℤ[1/p]; residue unchanged | Agrees; retain |
| §2.10 separable tame transport | t^(1/ℓ), ℓ≠p; a^p−a=t⁻¹ | Degrees ℓ;p before perfection | Degrees ℓ;p after; tame T;F on both sides | Agrees; retain |
| §3.1 pro-p-kernel headline | S₃→C₂, p=3 | Kernel C₃; cd₃(C₂)=0 | Transposition gives section; composite=id | Agrees; retain |
| §3.1 non-split control | C₄→C₂, p=2 | Kernel C₂; cd₂(C₂)=∞ | Preimages of generator have order 4; no section | Agrees; retain |
| §3.1 trivial kernel | id:S₃→S₃, p=5 | Kernel 1; cd₅(S₃)=0 | Section id; composite id | Agrees; retain |
| §3.1 source need not be pro-p | Ẑ→∏_(ℓ≠p)ℤ_ℓ | Kernel ℤ_p; quotient cd_p=0 | Section g↦(0,g); projection returns g | Agrees; retain |
| §3.2 maximal prescribed classes | Trivial valuation on K; S=∅ and {tame} | Every algebraic field; every separable field | Maxima Kᵃ;Kˢ | Agrees; retain |
| §3.2 relative maximality | Tame K; purely wild property | Allowed field K only | Further allowed degree 1 only | Agrees; retain |
| §3.2 separable maximal variant | K separably closed imperfect | Kˢ=K | Unique maximal separable choice K | Agrees; retain |
| §3.2 transport | Identity valued isomorphism | Maximal field E | Transport E, no larger admissible field | Agrees; retain |
| §3.3 unramified complement | Trivial valuation | Kʰ=K; K_hu=Kˢ | K⊗Kˢ=Kˢ=Kᵘ | Agrees; retain |
| §3.3 tame complement | Trivial valuation | K_rt=K; Kᵘ=Kˢ | Kˢ⊗K=Kˢ=Kᵗ | Agrees; retain |
| §3.3 disjointness control | ℚ₃(√−1) unramified quadratic | Tensor with Kᵘ has dimension 2 | Compositum Kᵘ has dimension 1; kernel dimension 1 | Agrees; retain |
| §3.4 four splitting conditions | Trivially valued perfect K | Kᵗ=Kᵃ; maximal K_w=K | Conditions (0),(1),(2),(3) all T | Agrees; retain |
| §3.4 separable conditions | Trivially valued imperfect K | Kᵗ=Kˢ; maximal K_sw=K | Separable splitting and separable tameness T | Agrees; retain |
| §3.4 group formulation | S₃ with W=C₂, H=C₃ | W∩H=1; size product 2×3=6 | WH=S₃; S₃/W not a quotient group | Agrees; retain |
| §3.5 KPR headline | Henselian separably closed imperfect K | galoisTamePart=K; maximal E=Kᵃ | E⊔K=Kᵃ; K⊗E=E | Agrees; retain |
| §3.5 characteristic-zero residue | Trivially valued ℚ | Tame part ℚ̄; maximal disjoint E=ℚ | E⊔ℚ̄=ℚ̄ | Agrees; retain |
| §3.5 cohomological input | Residue 𝔽₂ | G_κ=Ẑ; cd₂=1 | Bound 1≤1 attained | Agrees; retain |
| §4.1 Krasner headline | √2,3 over ℚ at 7 | Norm gap 1; approximation norm 1/7 | √2∉ℚ(3); henselian hypothesis F | Agrees; retain |
| §4.1 noncomplete henselian Check | Literal ℚ_pʰ versus H_p | ℚ_pʰ=ℚ_p; H_p countable | Complete T versus F | Notation defect; R02 |
| §4.1 root continuity | f=X, g=X−2 over ℚ₂ | n=1, γ*=0, threshold=1 | v(0−2)=1 | Agrees; retain |
| §4.1 uniqueness threshold | f=g=(X−1)(X+1), 2-adic | kras=1; tolerance 1 or 2 | Two roots within tolerance 1; one within 2 | Agrees; retain |
| §4.1 negative root values | f=X²−1/16, g=f+2X | γ*=−2; threshold=−3/2 | Nearest-root values at most 0; threshold hypothesis F | Agrees; retain |
| §4.1 degree zero | f=g=1 | Root sets empty | No threshold, no division by zero | Agrees; retain |
| §4.2 decompletion headline | L=H_p(√p) | [L:H_p]=2 | E=ℚ(√p), degree 2; Eʰ=L | Agrees after R02 |
| §4.2 identity case | L=Kʰ | Degree 1 | E=K, E⊗Kʰ=Kʰ | Agrees; retain |
| §4.3 maximal wildness iff | K=ℚ(t), t-adic; E=Kʰ | Eʰ/Kʰ identity; p=1 | Maximal wild upstairs T; henselian E/K F; left side F | Agrees; retain |
| §4.3 admissible extension | E=K in residue characteristic zero | E/K henselian T; upstairs identity | Both maximal-wild predicates T | Agrees; retain |
| §4.4 height-one splitting headline | K=ℚ((t)) | p=1; K_w=K; Kᵗ=Kᵃ | Kᵃ⊗K=Kᵃ | Agrees; retain |
| §4.4 imperfect control | Separable closure of 𝔽_p((t)) | Kᵗ=K; K_sw=K; K_w=Kᵃ | Separable tensor K; full tensor Kᵃ | Agrees; retain |
| §4.5 height-one tameness | ℂ_p; ℚ₂ | Closedness T; F via X²−2 | Tameness T; F via inertia order 2 | Agrees; retain |
| §5.1 composite valuation definition | ℚ_p((t)) | t↦(1,0), p↦(0,1) | p⁻¹∉composite; p⁻¹∈coarse ring | Agrees; retain |
| §5.1 residue and value exactness | Same composite | ℤ²→ℤ, (a,b)↦a; kernel 0×ℤ | Final residue 𝔽_p; convex kernel ℤ | Agrees; retain |
| §5.1 inverse and associativity | Three nested Laurent valuations | Values (a,b,c) | Both parenthesizations give lexicographic ℤ³ | Agrees; retain |
| §5.2 coarsening chain | ℚ_p((t)) composite | Heights 0,1,2; three primes | Residual heights 2,1,0 | Agrees; retain |
| §5.2 residue exponents | Same composite | Exponents 1,1,p | Transition index n=2 | Agrees; retain |
| §5.2 rank-one criterion | ℤ and lexicographic ℤ² | Proper convex-subgroup counts 1;2 | Archimedean T;F | Agrees; retain |
| §5.3 Abhyankar headline | 𝔽_p(t)/𝔽_p, t-adic | Rational rank 1, residue trdeg 0 | 1+0=trdeg 1 | Agrees; retain |
| §5.3 residue-independent case | Same extension, trivial/Gauss valuation | Rational rank 0, residue trdeg 1 | 0+1=trdeg 1 | Agrees; retain |
| §5.3 empty families | Identity extension, empty x,y | No nonzero exponent vector; residue independence T | Empty family algebraically independent T | Agrees; retain |
| §5.3 zero-value junk control | x₁=0, exponent vector (1) | Product value 0=v(0) | hx would force (1)=0, contradiction | Excludes zero; retain |
| §5.3 height headline | ℚ(t)/ℚ, composite t-adic/p-adic | Height W=2; restriction height 1; trdeg 1 | 2≤1+1, equality | Agrees; retain |
| §5.3 algebraic height | Finite extension of ℚ_p | Height 1; restriction 1; trdeg 0 | 1≤1+0, equality | Agrees; retain |
| §5.4 unramified composition headline | 𝔽₄((t))/𝔽₂((t)), i=0,1 | Total e=1,f=2 | Both coarse and residual steps degree 2 and unramified | Agrees; retain |
| §5.4 inseparable endpoint | 𝔽_p(u^(1/p))((t))/𝔽_p(u)((t)) | Residual degree p inseparable | Residual unramified F; total unramified F | Agrees; retain |
| §5.5 tame composition headline | ℚ_p((s))/ℚ_p((t)), s^p=t | Coarse tame T; residue identity tame T; quotient C_p | No-p-torsion F; total tame F | Agrees; retain |
| §5.5 equal residue prime | 𝔽_p((t))((u)), adjoin u^(1/ℓ), ℓ≠p | Coarse tame T; value quotient C_ℓ | p-torsion 0; total tame T | Agrees; retain |
| §5.5 exponent one | ℂ((s))/ℂ((t)), s²=t | Coarse tame T; residual tame T | 1-torsion 0; total tame T | Agrees; retain |
| §5.6 field composition | ℚ_p((t)) composite | Coarse tame T; residue ℚ_p tame F; ℤ p-divisible F | Composite tame F | Agrees; retain |
| §5.6 algebraically closed case | Algebraic closure of preceding valued field | Divisible value groups; algebraically closed residues | All three conditions T; field tame T | Agrees; retain |
| §6.1 p-th roots and divisibility | Algebraically closed valued K | Each x has p-th root | Γ/pΓ=0 | Agrees; retain |
| §6.1 residue closedness | K=(𝔽̄_p((t)))ᵃ | Residue 𝔽̄_p | Finite residue extension degrees 1 only | Agrees; retain |
| §6.1 trivial coarsening | Same K | Coarse residue K | Closedness predicate unchanged T | Agrees; retain |
| §6.2 height zero | Perfect algebraically closed trivially valued K | Height 0; p-closed T | Inertia 1; tame T | Agrees; retain |
| §6.2 height one | ℂ_p; ℚ₂ | Heights 1,1; closedness T,F | Tameness T,F | Agrees; retain |
| §6.2 finite-height induction | Algebraic closure of ℚ_p((t)), composite | Height 2; coarse and residual heights 1 | Both tame; coarse Γ=ℚ p-divisible | Agrees; retain |
| §6.3 descent | K=ℚ(t), L=K(√t), p=1 | K₀=K; [L₀:K₀]=2 | Tensor degree 2=[L:K] | Agrees; retain |
| §6.3 wrong coefficient model | Omit t and take K₀=ℚ | Constant extension L₀(t) has constants L₀ | Constants of ℚ(√t) are ℚ; forces degree 1≠2 | Agrees; retain |
| §6.3 algebraic base | K algebraic over its prime field | Relative algebraic closure K₀=K; trdeg 0 | Height at most 1; identity descent | Agrees; retain |
| §6.4 tameness headline | ℚ with trivial valuation; ℂ((t)) | Exponent 1; allowed degrees {1} | Perfect T; inertia coprimality T | Agrees; retain |
| §6.4 positive-prime controls | ℚ₂; 𝔽₃((t)) | Degree-2 radical; degree-3 Artin–Schreier extension | Closedness F; tameness F | Agrees; retain |
| §6.4 P-form | Algebraically closed valued K; p∈P | No finite degree greater than 1 | Every prolongation tame T | Agrees; retain |
| §6.5 separable export headline | K=𝔽_p(t)ˢ, P={p} | Separable p-closed T; residue exponent p∈P | Separably tame T; full tame F | Agrees; retain |
| §6.5 empty set | K=ℚ₂, P=∅ | Closedness T; residue membership F | Conclusion tame F; implication still T | Agrees; retain |

- 15 seeded targets: 14 checked directly in temkin17 §§2.1–2.6, pp. 103–112 (lines 249–638); §3.1 checked indirectly in kpr86 line 230, p. 44; its Serre locator remains uncertified.
- 5 additional wording samples: §1.2/stacks-more-algebra line 17762; §1.5/line 2906; §4.1/cks23 line 640; §5.3/kkv16 line 238; §5.4/temkin10 line 520.
- 8 readable source texts inspected; 2 settled uncertified texts; 3 declared gaps agree exactly between packages/LocalFieldsRamificationPartII/design/plan.json and README §§supplier contracts.
- 7 pinned declaration comparisons recorded: Mathlib/RingTheory/Valuation/RamificationGroup.lean:29,49; Mathlib/Analysis/Normed/Field/Krasner.lean:56,73,117; TauCeti/Topology/Algebra/Group/Profinite/EmbeddingProblem/Projective.lean:150; TauCeti/FieldTheory/Minpoly/IsIntegrallyClosedIn.lean:138.
- 6 supplier roadmaps resolved by section; 7 closest roadmaps read, including both main and #617 LocalFieldsRamification; #617's former-layer mapping preserves Layers 2–4.
- 16 elaborated signatures compared with the README: 0 dropped hypotheses; 9 headline theorems, 7 supporting definitions; 27 simp/rfl/infer_instance attempts close 0 headlines.
- Gate: every recorded check passed; independent dependency output: “depcheck: 212 roadmaps, 1880 edges, 0 problem(s)”; direct Lean elaboration and generalized algebra signature pass with only sorry warnings.
- 0 outside-folder changes; new folder, 2092 inserted lines, 0 removed declarations; title and description agree with that change.

Headline coverage: finite presentation of algebras and modules (§1.5), pro-p sections (§3.1), henselian KPR (§3.5), henselian Krasner (§4.1), algebraic independence and height (§5.3), tameness (§6.4), separable tameness (§6.5) are stated. Tensor decomposition (§1.4), decompletion (§4.2), nonhenselian height-one splitting (§4.4), and composition criteria (§§5.4–5.5) are named with their missing carriers in the module docstring.

Overlap check: read AdicCoefficientsAndComparisonsPartII, EtaleDualityAndPerverseSheavesPartII, LocalFieldsRamification (main and #617), QuadraticFormInvariantsPartII, DiamondEtaleCohomology, RamificationOfCompleteDiscretelyValuedFields, PadicExtensionFamilies; local-field ramification belongs to LocalFieldsRamification, complete-DVR comparisons to RamificationOfCompleteDiscretelyValuedFields, extension-family invariants to PadicExtensionFamilies, complete algebraically closed field-action kernels to DiamondEtaleCohomology; general henselization, composition, Abhyankar and pointwise tameness belong here and are imported by the two Part II consumers; no shared owned target with EtaleDualityAndPerverseSheavesPartII.

Source independence: 20 passages compared with 6 sources, no nonmathematical copied wording or reused material identified; largest share temkin17, 48 of 74 explicitly attributed citation groups before References. Contents compared with temkin17: dependency-forced splitting → decompletion and composition → induction, with a separate composition branch and added finite-presentation/profinite/Abhyankar interfaces, rather than a one-to-one chapter plan.

## Not verifiable

- serre-cg, I §3.4 Proposition 16 and II §2.2 Proposition 3/Corollary 1: settled uncertified in sources.toml; no text supplied; kpr86 line 230 independently supports the section-theorem application.
- rg71, Corollaire 3.4.7: settled uncertified in sources.toml; no text supplied; temkin17 line 380 and temkin10 line 548 cite its finite-presentation application.

## Source issues

- **Error** in temkin17 at Lemma 2.3.2, printed p. 104 (line 318): the source says tensor factors are indexed by isomorphism classes of valued extensions; it should be distinct prolongations on the fixed extension field; affects a stated result.
- **Misprint** in temkin17 at Lemma 2.3.4, printed p. 105 (line 330): the source says all localizations are valuation rings; it should be localizations at prime ideals; affects a stated result.
- **Error** in temkin17 at §2.4.6 assertion (4), printed p. 108 (line 464): the source says a tame Galois quotient exists without henselianity; it should be a closed complementary subgroup formulation, restricting the quotient formulation to normal wild inertia; affects a stated result.
- **Misprint** in temkin17 at proof of Lemma 2.6.3(ii), printed p. 112 (line 610): the source says p equals the coarse residue characteristic; it should be the final residue characteristic exponent; affects the proof.
- **Misprint** in temkin17 at proof of Theorem 2.6.6, printed p. 112 (line 627): the source says the height-one case is Corollary 2.5.6(ii); it should be Corollary 2.5.6, which has no numbered parts; affects nothing.
- **Misprint** in cks23 at proof of Theorem 16(c), cited preprint p. 14 (line 684): the source says the root-distance valuation is strictly greater than the threshold; it should be greater than or equal to it; affects the proof.

## For the human reviewers

- aid25 is cited as arXiv:2511.07177v1, without a published venue (TauCetiRoadmap/LocalFieldsRamificationPartII/README.md:1835); §1.1 also cites the published temkin17 statement. Publication and licence status of this preprint remain for human review.
