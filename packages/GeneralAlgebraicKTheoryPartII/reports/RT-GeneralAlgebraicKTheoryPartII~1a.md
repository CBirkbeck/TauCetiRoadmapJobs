<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1197#issuecomment-6421676352 -->
Red team round 1 pass a (codex) of f0cf796

Verdict: needs_changes

1. **F01** (P2) Connected-cover indices change in the Thom constructions

   **Location:** packages/GeneralAlgebraicKTheoryPartII/README.md:889, 1201, 1219. “X⟨r⟩=fib(X→τ_≤(r−1)X)” versus “S³⟨3⟩ … fiber … S³→K(ℤ,3)”.

   **Claim:** The same connected-cover notation specifies the general Postnikov convention and the integral Thom families.

   **Witness:** Under §4.13, S³⟨3⟩=S³ and π₃=ℤ; the fiber specified in §4.31 has π₃=0. Likewise J₁S²⟨2⟩=S² has π₂=ℤ, but the §4.32 fiber has π₂=0.

   **Exact repair text:** Keep §4.13 and replace the Thom notation by “S³⟨4⟩=fib(S³→K(ℤ,3))” in §4.31 and “J_rS²⟨3⟩=fib(J_rS²→K(ℤ,2))” throughout §4.32, including z(m)'s defining source. Add: “These indices use §4.13; the removed homotopy groups are π₃ and π₂ respectively.”

   **Retest:** τ≤₃S³=K(ℤ,3) and τ≤₂S²=K(ℤ,2), so the corrected fibers have π₃=0 and π₂=0 as required; their looped sources have the connectivity used to obtain integral π₀.

2. **F02** (P3) The rational circle-Tate Check is false before completion

   **Location:** packages/GeneralAlgebraicKTheoryPartII/README.md:206. “For the trivial rational spectrum each Tate value is zero”.

   **Claim:** The paragraph includes the raw circle Tate construction among these zero values.

   **Witness:** For trivial X=Hℚ, ΣX_hS¹ is 1-connective and π₀(X^hS¹)=ℚ. The norm cofiber therefore has π₀(X^tS¹)=ℚ, whereas the claimed zero spectrum has π₀=0.

   **Exact repair text:** “For trivial Hℚ, finite C_p Tate spectra and the p-completed circle Tate spectrum vanish. The raw circle Tate spectrum does not: π₀((Hℚ)^tS¹)=ℚ. The comparison here concerns its p-completion.”

   **Retest:** The finite-group norm is multiplication by p, invertible on ℚ; the raw circle cofiber has π₀=ℚ and its derived p-completion is zero. Both sides of the stated completed comparison are zero.

3. **F03** (P2) The Witt-series gap duplicates the current supplier

   **Location:** packages/GeneralAlgebraicKTheoryPartII/README.md:248; packages/GeneralAlgebraicKTheoryPartII/design/plan.json:4258. “What QWittVectors must provide (gap:witt-characteristic-series)”.

   **Claim:** The characteristic-series identification is missing from QWittVectors.

   **Witness:** TauCetiRoadmap/QWittVectors/README.md:203–231 already supplies γ∞=∏(1−a_dtᵈ)⁻¹, its additive comparison and finite-restriction compatibility. Ordinary series inversion gives χ. §§1.3–1.4 supply the ring operations and ghosts.

   **Exact repair text:** Replace the gap paragraph by: “Consume QWittVectors §§1.3–1.4a. Our characteristic-series convention is χ(a)=γ∞(a)⁻¹, using ordinary multiplication of power series. Transport the supplied Witt multiplication along χ; then χ(0)=1, χ(1)=1−t, χ(τ(a)τ(b))=1−abt, and −tχ′/χ=∑wₙ(a)tⁿ. Inversion commutes with finite restrictions.” Remove the redundant gap entry and repoint its dependencies to those sections.

   **Retest:** Over ℤ, χ(1,0)=1−t and χ((1,0)+(1,0))=χ(2,−1)=(1−t)². Over 𝔽₂, χ(0,1)=1−t²≠1 despite both first ghosts vanishing. Thus inversion preserves the requested generality and topology without another supplier construction.

4. **F04** (P1) Chromatic field maps assume their unsupplied detection theorem

   **Location:** packages/GeneralAlgebraicKTheoryPartII/README.md:1661–1668. “Use chromatic Nullstellensatz residue-field detection”.

   **Claim:** Hahn acyclicity and realization of Morava E-theories provide a route to maps from arbitrary nonzero localized commutative rings to chromatic fields.

   **Witness:** bsy lines 2423–2436 derive the field map from Theorem 5.1, using E-colocalization, nilpotence-detecting modifications and transfinite iteration. Neither listed supplier constructs these. Realizing the target E_n(L) does not construct a map R→E_n(L).

   **Exact repair text:** Insert a prerequisite before §6.2: “Lubin–Tate covers. For n≥1 and R∈CAlg(Sp_T(n)), construct a perfect characteristic-p algebra A of Krull dimension zero and a nilpotence-detecting map R→E_n(A). Construct E_n on perfect algebras and its colocalization adjunction, not only on fields. Prove preservation of nilpotence detection under the small-object construction, and construct the three modifications imposing dimension zero, surjectivity of π₀E_n(R♭)→π₀R, and vanishing of π₁R. Prove that these conditions characterize E_n(A). For rational R, construct the corresponding cover by E₀(A) with A reduced of dimension zero. These are targets of this roadmap (BSY Theorem 2.38; Corollary 4.37; Theorem 4.40; Corollary 4.44; Theorems 5.1, 5.3; Propositions 5.9, 5.15, 5.17).” Replace §6.2's proof route by: “Apply the cover theorem. Nonzero R forces A≠0 by nilpotence detection; take an algebraically closed residue-field extension A→L and compose R→E_n(A)→E_n(L).” Add the new prerequisite to its Needs line and develop its stated constructions before using them.

   **Retest:** For R=E_n(L), take A=L and the identity cover; for R=Hℚ, use the rational cover and a characteristic-zero residue field. R=H𝔽_q with q≠p has zero rationalization and cannot enter the rational construction. The repaired route supplies an actual map, including for non-field R, without assuming the headline.

5. **F05** (P3) Four stable-envelope locators point to an earlier cross-reference

   **Location:** packages/GeneralAlgebraicKTheoryPartII/README.md:558, 619, 636, 2241. “lmmt line 644, Proposition 3.12 and proof”.

   **Claim:** Line 644 locates the stable-envelope construction, bounded-heart proof, and Proposition 3.12.

   **Witness:** lmmt line 644 ends an earlier cross-reference on p.1024. The actual construction starts at line 753, Proposition 3.12 at line 765, and its proof at line 771.

   **Exact repair text:** In §3.2 replace “lmmt line 644” with “lmmt lines 753–764”. In §3.5 use “lmmt lines 771–790”. In §3.6 use “lmmt lines 765–799”. In §10.1 use “lmmt lines 765–799”, retaining its separate Corollary 4.31 locator.

   **Retest:** The replacement passages respectively define Stab and Kadd,nc, identify the finite-limit kernel, state and prove its bounded t-structure, and give both positive-height comparison ranges. Their printed pages are 1026–1027 as claimed.

6. **F06** (P3) Height-one comparison has only secondary citations

   **Location:** packages/GeneralAlgebraicKTheoryPartII/README.md:1005–1007. “secondary citation of Mahowald and Miller for height one”.

   **Claim:** The primary height-one telescope comparison is supported by LMMT's introduction and BHLS Theorem A.

   **Witness:** lmmt lines 71–72 only attribute the result; bhls line 98 starts a theorem for heights at least two. The primary computations are mah81 Theorem 1.1 and Theorem 6.3, and mil81 Theorem 4.11/Corollary 4.12.

   **Exact repair text:** Replace the citation paragraph with: “At p=2, use Mahowald, bo-Resolutions, Theorem 1.1, pp.365–366, and Theorem 6.3, p.382 (mah81 lines 46–60 and 633–650). At odd primes use Miller, On relations between Adams spectral sequences, with an application to the stable homotopy of a Moore space, Theorem 4.11 and Corollary 4.12, pp.294–295 (mil81 lines 272–286). Combine these periodic computations with the supplied K-theory localization comparison to identify the Bousfield classes.” Record these two primary works in sources.toml using the legal copies linked below; keep BHLS only as background on the higher-height distinction.

   **Retest:** The p=2 argument uses the bo resolution and retains the real-theory contribution; the odd-prime argument uses the periodic Moore spectrum with homotopy 𝔽_p[v₁,v₁⁻¹]⊗Λ(δv₁), so it does not substitute an odd-prime proof at 2. Hℤ is killed and KU_p^∧ detected in both cases.

   Legal copies fetched through the sources service: [mah81, publisher archive](https://msp.org/pjm/1981/92-2/pjm-v92-n2-p11-s.pdf); [mil81, author's page](https://math.mit.edu/~hrm/papers/miller-relations-between-adams-spectral-sequences.pdf).

7. **F07** (P3) Some Checks repeat the interface instead of testing it

   **Location:** packages/GeneralAlgebraicKTheoryPartII/README.md:841–843, 1177–1178. “Passing from v to a positive power preserves Φ_v”; “The conclusion begins one height above i”.

   **Claim:** These bullets supply discriminating checks of the finite telescopic functor and Tate-height theorem.

   **Witness:** Lines 841–842 repeat interface laws at 834 and 836; 843 repeats the same zero/power tests. Lines 1177–1178 repeat the bound and hypothesis at 1169. No instance is evaluated by these assertions.

   **Exact repair text:** Replace §4.10's repeated bullets with: “Put E=tel(v:ΣᵈΣ∞V→Σ∞V), with V nonzero of type n. For X=Ω∞E, π₀Φ_v(X) contains the nonzero class V→E, detected by K(n). Periodicity gives nonzero groups in negative degrees −kd for k>0; a connective truncation of the output would lose them.” Keep the finite-Postnikov zero test, giving three explicit controls. Replace §4.29's first two bullets with: “At p=2, R=KU₂^∧ has π₀(R^tC₂)=ℚ₂, from ℤ₂[[x]][x⁻¹]/(2+x). Thus the i=0 vanishing hypothesis fails, consistently with nonzero T(1)R.” Keep the existing zero and rational tests.

   **Retest:** A zero functor passes the old Postnikov test but fails the new π₀ test; a connective-only output fails the negative-degree test. The height-one Tate coefficient is ℚ₂≠0, so the repaired Tate Check tests the boundary hypothesis rather than repeating it.

## Verified sound

Read all 2412 README lines and all 52 Suggested.lean lines. The inventory is 103 numbered targets, two further theorem paragraphs in §4.32, and zero Lean declarations. All 106 Checks blocks (346 bullets) were read; the 105-row table below records the computed target-level tests, with repeated Check bullets consolidated. The successful calculations are limited to the displayed instances, not independent proofs of the general theorems. R02 and R07 record failed Check obligations.

Resolved and inspected 119 distinct source-line anchors across the 30 recorded works; the four uses of the incorrect anchor 644 are R05. Two additional primary works were retrieved and inspected for R06. Checked 17 named roadmap supplier groups and 11 explicitly named pinned declarations, with details below. All 33 gap slugs agree between README and plan; R03 is the redundant one. The remaining contracts are accepted conditionally, not reported as missing implementations.

### Computed target audit

The target keys below are the numbered headings of packages/GeneralAlgebraicKTheoryPartII/README.md. There are 103; the additional two theorem paragraphs in §4.32 are split out. The file does not use bold theorem labels: its bold labels are Summary, Checks, and reference keys. Contexts in this table are mathematical contexts, not Lean section variables. Here K denotes the nonconnective algebraic K-spectrum, k a field, p a prime, and zero means the zero spectrum where appropriate. Each row records actual calculations or reductions; it is not a claim to have proved the general theorem from a test case. Findings take precedence over a successful boundary calculation.

| Statement and context | Instances and computed values on the two sides | Result / change |
|---|---|---|
| 0.1; compactly generated stable localization | q=id gives K(ker q)=0=fib(id); q:D→0 gives K(D)=fib(K(D)→0). | These endpoints agree. |
| 1.1; connective E₁-ring, rank r≥0 | GL₀(A)=*; GL₁(Hℤ) has π₀={±1}; A=Hk⊕ΣHk has π₁GL₁(A)=k, not 0. | Higher mapping data cannot be replaced by π₀. |
| 1.2; small additive ∞-category | Finite k-vector spaces give π₀(core)=ℕ and π₀(group completion)=ℤ; Map_sp(Σk,k) has π₋₁=k, whereas its connective cover has π₋₁=0. | Connective mapping spectra essential. |
| 1.3; projective generator, right modules | End_A(A)=A by left multiplication; zero generator gives End(0)=0; A² is the sum of two copies of the generator. | Right-module convention agrees. |
| 1.4; connected based X, dominated retracts | X=* gives S[ΩX]=S; X=S¹ gives S[ℤ]; augmentation at *=id. Finite versus dominated models give respectively ℤ and K₀(ℤ[π₁X]). | Retract closure cannot be silently removed. |
| 2.1; F-localizing invariant and E-acyclic connective rings | F=0 gives 0→0; A=HA gives τ≤₀A=A and comparison id; E=0 includes every A. | Restricted and global notions distinguished. |
| 2.2; pullback square, π₀-surjectivity | Identity square has zero comparison fiber; k[ε]/ε²→k has kernel I with I²=0; the zero invariant gives a square of zeros. | Nilpotence, not reducedness, is the control. |
| 2.3; connective rational/mod-p equivalence | Identity has fiber 0. For S[1/p]→Hℤ[1/p], rational comparison is an equivalence and the mod-p fibers are 0; K comparison has zero p-completed fiber. | p-inversion control agrees with the stated coefficient comparison. |
| 2.4; connective A, i≤0 | A=Hk⊕ΣHk and τ≤₀A=Hk both have K₀=ℤ and K₋₁=0. At i=0 the rank-one class maps to 1. | Endpoint i=0 retained. |
| 3.1; bounded t-structure, per-object bounds | k[r] has amplitude [r,r], r∈ℤ, so no common finite interval covers Perf(k). The truncation τ≤₀S=Hℤ is not finite. | Boundedness is object-dependent; no t-structure inferred on finite spectra. |
| 3.2; additive stable envelope | Proj(Hk) stabilizes to Perf(k), K₀=ℤ. Zero envelope is 0. For Perf(k) viewed only additively, split K₀=⊕ⱼℤ, while stable K₀=ℤ. | Stable envelope differs from forgetting cofiber relations. |
| 3.3; bounded heart, noetherian for negative degrees | Perf(k) has heart finite k-vector spaces; both K₀=ℤ and negative K=0; [k[1]]=−[k]. | Heart and sign controls agree. |
| 3.4; regular connective R, central positive homogeneous u | R=Hk[u₂]: cofib(Σ²R→R)=Hk; Hk[u⁻¹]=0. Thus the proposed kernel contains exactly the displayed torsion generator in this test. | Degree and direction agree. |
| 3.5; finite-limit presheaves and stable-envelope kernel | Zero category gives zero kernel. For k→0→Σk, the Euler relation is 1−1=0; evaluation on Σk sees a k-valued relation which evaluation on k alone misses. | Finite-limit closure is substantive. |
| 3.6; bounded-heart fiber | For Perf(k), ⊕ⱼℤ→ℤ sends eⱼ↦(−1)ʲ. It kills e₀+e₁; the source does not already equal ℤ. Zero category gives fiber 0. | Relation and parity agree. |
| 4.1; finite type-n object and self-map | Telescope of the zero map is 0; replacing v by v² gives the same colimit. At p=2, H𝔽₃[1/2]=H𝔽₃ but H𝔽₃⊗Hℚ=0. | Global bottom convention discriminates. |
| 4.2; positive periodic homotopy | A finite Postnikov spectrum Hk has all positive periodic groups 0; the based point gives 0. For q≠p, π₀(H𝔽_q[1/p])=𝔽_q, not 0. | Positive and bottom-height definitions separated. |
| 4.3; positive telescopes and completion | T(n)⊗Hℤ=0 for n>0; Hℚ completed at p is 0 but Hℚ[1/p]=Hℚ. | Positive-height restriction essential. |
| 4.4; homotopy unital ring, n>0 | For H𝔽_p both T(n)- and K(n)-localizations vanish. For K(n) both are nonzero. At height zero H𝔽_q, q≠p, separates p-inversion from rationalization. | No global bottom-height extension. |
| 4.5; global and p-local finite localization | At n=0, S[1/p] differs from Hℚ: S/q for q≠p survives the first and dies under rationalization. | Correct separate bottom theories. |
| 4.6; finite localization kernel | At n=0 the global kernel contains S/p, but not S/q (q≠p); the localized unit is compact in the localized category although S[1/p] is not compact in Sp. | Ambient and relative compactness distinguished. |
| 4.7; p-local X | X=S_(p): both bottom localizations give Hℚ. Without p-locality X=H𝔽_q gives H𝔽_q versus 0. | Stated hypothesis necessary. |
| 4.8; chromatic fracture | X=0 gives four zeros; X=H𝔽_q, q≠p, gives the p-inverted component H𝔽_q and positive chromatic component 0. | No lost prime-to-p summand. |
| 4.9; bottom finite-local comparison | At p=2, L₁^(p),f H𝔽₃=H𝔽₃ and its p-inversion is H𝔽₃; the positive-height component is 0. | Bottom retained. |
| 4.10; finite telescopic functor | Φ_v(*)=0; Φ_v(K(k,r))=0 for finite r; Φ_v and Φ_(v²) give the same periodic colimit. | Three discriminating finite-stage tests. |
| 4.11; n≥1, Bousfield–Kuhn | ΦₙΩ∞Hℤ=0=L_T(n)Hℤ. At n=0, X=Σ⁻¹Hℚ has Ω∞X=* but rationalization X≠0. | Positive-height bound cannot be dropped. |
| 4.12; suspension and loops detection | Hℤ→0 has T(n)-acyclic fiber; Σ∞Ω∞Hℤ=Σ∞ℤ has nonzero sphere summands. For Σ⁻¹Hℚ, Ω∞ is * although X≠0. | Tests distinguish the stated implication from its converse and from n=0. |
| 4.13; X⟨r⟩=fib(X→τ≤r−1X) | S³⟨3⟩=S³ has π₃=ℤ; K(ℤ,1)⟨2⟩=*; τ≤₀S⁰=S⁰. | Convention itself consistent; R01 at its later uses. |
| 4.14; augmented homology of fibers | Identity map has fiber * and augmentation E→E=id. Empty→* gives 0→E, not an E-equivalence for E≠0. For E=0 all comparisons are 0→0. | Nonempty fiber and augmentation detected. |
| 4.15; connected spaces and finite chromatic locality | For n=1,2 the lower choices m≥n+1 require m≥2,3; X=* has reduced homology 0. Disconnected X with two points has a sphere summand, not 0. | Connectivity cannot be replaced by periodic-group vanishing alone. |
| 4.16; sufficiently connective map | Identity has fiber 0; Hℤ→0 has fiber Hℤ with π₀=ℤ, so it fails the required positive connectivity. | The counterexample to unrestricted suspension comparison is excluded. |
| 4.17; Bousfield classes of BP truncations | BP⟨0⟩=Hℤ_(p) has class Hℚ∨H𝔽_p. BP⟨1⟩⊗H𝔽_p≠0 but E(1)⊗H𝔽_p=0. | The H𝔽_p summand is indispensable. |
| 4.18; locally Landweber, height≤n | Multiplicative formal group in characteristic p has height 1; additive group has infinite height. The latter has all p,vᵢ zero, not a unit ideal; elliptic formal heights are ≤2. | Finite-height assumption discriminates. |
| 4.19; Lₙ-local spectra | Hℚ is L₁-local and T(1)-acyclic; L₁S has zero T(2)-localization. The comparison is only on the localized input class. | No unrestricted telescope conjecture inferred. |
| 4.20; arbitrary spectra, height one | At p=2,3 both height-one theories kill Hℤ and detect KU_p^∧. | Boundary calculations agree; primary-source issue below. |
| 4.21; BP⟨n⟩ | For p=2,n=1, π₋₂(BP⟨1⟩⊗ℚ)=0 whereas π₋₂(E(1)⊗ℚ)=ℚ; both vanish above chromatic height 1. | Bousfield support does not assert equality of spectra. |
| 4.22; finite G norm | G=1 gives norm id, Tate 0. For trivial Hℚ and G=C_p, norm on π₀ is ×p, an isomorphism, so Tate 0. | Finite-group normalization correct. |
| 4.23; localized transfer | On rational π₀ the transfer is ×p and its section ×1/p; composites at p=2,3 are ×1. Augmentation alone is ×1 and cannot be this transfer. | Section normalization agrees. |
| 4.24; telescopic Tate vanishing | G=1 gives Tate 0. Trivial KU_p^∧ has raw C_p Tate with rational contribution, but T(1)-local Tate 0. | Outer localization cannot be omitted. |
| 4.25; finite-local Tate blueshift | X=0 and rational finite-group Tate both give 0; n=1 allows a p-inverted output at bottom height rather than forcing raw Tate 0. | Bottom convention retained. |
| 4.26; Morava operations and transfer quotient | At p=2, P(2) at basepoint=4, P(1)+P(1)=2; at p=3 the values are 8 and 2. Mixed terms are 2 and 6. Modulo (2,u₁), [2](z) starts u₂z⁴, so g₂ has constant term u₂. | Additivity requires the transfer quotient; indexing computed. |
| 4.27; H∞ acyclicity | H𝔽_p has K(h)=0 for every finite h; Hℚ has K(0)≠0 and K(1)=0. | Implication is upward, not an iff. |
| 4.28; height using global p-inverted bottom | Heights of 0,H𝔽_p,Hℚ,H𝔽_q (q≠p) are −1,−1,0,0 respectively. For the alternative rational-bottom convention the last value would be −1. | The stated global convention gives h(H𝔽_q)=0 because T(0)⊗H𝔽_q=H𝔽_q. |
| 4.29; Tate converse | Zero input and rational input have C_p Tate 0; their positive-height localizations vanish. For height-(h+1) Morava theory the height-h Tate contribution need not vanish. | Direction and zero cases agree. |
| 4.30; modular forms at all primes | At p=2,3, T(3)tmf=T(3)Tmf=0. Δ²⁴ has degree 24·24=576. Negative homotopy of Tmf prevents replacing it integrally by tmf. | Periodicity normalization agrees. |
| 4.31; raw and completed Thom spectra | p=2 gives unit 1−p=−1. Raw integral Thom π₀=ℤ, completed π₀=ℤ₂. The two claimed S³⟨3⟩ definitions yield π₃=ℤ and 0. | R01; distinguish raw and completed values. |
| 4.32; James-filtered y(m),z(m) | m=0: y is the sphere, completed π₀=ℤ_p. m=1: π₀y=𝔽_p, and at p=2 π₀z=ℤ_(2); for J₁S²=S² the stated cover indices give π₂=ℤ versus 0. | R01 for z's source. |
| 4.32; positive-height vanishing theorem | m=1 has empty range 1≤i<m; m=2 tests i=1 and gives T(1)y(2)=T(1)z(2)=0. No assertion at i=m. | Empty range not used as evidence of higher vanishing. |
| 4.32; odd-prime slope theorem | p=3,m=2,i=1: slopes 1/16 and 1/4, gap 3/16>0; p=5 gives 1/48 and 1/8, gap 5/48>0. At i=m slopes coincide. | Strict range necessary; denominators positive. |
| 4.33; reduced James splitting, connected W | W=* gives 0 on both sides. W=S² gives rational reduced summands in degrees 2r, r≥1; no degree-zero sphere appears. | Reduced versus unreduced discriminated. |
| 4.34; H∞ unit detection | Hℚ has nonzero rational homology; H𝔽₂ has nonzero mod-2 homology, so neither is a false zero. A null unit forces id=0. For unit→ℚ×ℚ, Hom(1,−)=ℚ×ℚ, whereas End(ℚ²)=M₂(ℚ). | Commutative scalar ring and endomorphism ring distinguished. |
| 4.35; nilpotent ideal of unital discrete ring | ℤ/4→𝔽₂ and ℤ/9→𝔽₃ both give K₀=ℤ→ℤ=id and K₋₁=0→0; I=0 gives identity. | All integer nonpositive degrees respected. |
| 4.36; continuous big Witt action on NK | In 𝔽₃[ε]/ε², χ(1)=1−t sends the unit 1−εx to itself; sign reversal produces 1+εx, differing by 2εx. χ(0)=1 acts as zero in additive NK; a t² factor acts trivially on this ε²=0 example. | Sign and continuity tested; R03 supplier duplication. |
| 4.37; localization and p-power nilpotent coefficients | On ℤ[1/2][ε]/ε² nil units, ×2 has inverse ×1/2. For 𝔽₂[ε]/ε² it is zero; relative K₁(ℤ/9→𝔽₃)=ℤ/3. | Invertible-prime versus torsion cases separated. |
| 4.38; uniform high-connectivity threshold | Identity fiber 0 passes every threshold. With the proof's N=m−1, m=2 gives N=1. A map with nonzero π₀ fiber does not pass. | Quantifier N precedes the variable input map. |
| 4.39; correction algebra, m/n connective maps | The correction fiber is Σ²(I⊗J); m=n=0 therefore yields connectivity 2, not 0 or −2. If either map is identity, I⊗J=0. | Shift and degenerate square agree. |
| 4.40; finite Postnikov stage | k=0 is the identity stage; k=1 requires one square-zero step. For discrete HA every stage τ≤kHA=HA, so both comparisons are id. | Induction endpoint consistent. |
| 4.41; finite-acyclic connective rings | A=H𝔽_p has K(A)^∧p=Hℤ_p; all positive telescopic localizations are 0, the same as for K(π₀A). | Restricted truncation computed. |
| 4.42; finite p-power characteristic | For 𝔽_p, K₂s−1 has order pˢ−1 prime to p, and K₀=ℤ; p-completion is Hℤ_p and positive telescopic K is 0. For ℤ/pʳ, the conclusion is likewise 0. | Includes p=2,3 and r=1. |
| 4.43; acyclic endomorphism spectra | For finite projective H𝔽_p modules, End is a matrix H𝔽_p-spectrum and positive telescopic K=0. Zero category gives 0. | Endomorphism hypothesis genuinely tied to the category. |
| 4.44; compact module kernel | A=S,n=0: S/p is killed and S/q (q≠p) survives. A=0 gives zero kernel. | Correct prime-primary thick closure. |
| 4.45; Mitchell and p-inverted sphere | T(2)K(ℤ)=0 but height-one K(ℤ) is nonzero. K(S[1/p]) has zero T(n) for n≥2; no height-one vanishing inferred. | Sharp lower bound retained. |
| 4.46; arbitrary ring Theorem A | Already-local A gives identity K comparison; A=0 gives 0→0. At n=1 the bottom factor remains, whereas n≥2 permits its removal. | Two forms have distinct ranges. |
| 5.1; arbitrary A, n≥2 | A=KU has connective cover ku and T(2)K(ku)≃T(2)K(KU); A=Hk gives identity. | Connective cover occurs before K. |
| 5.2; high trace comparison | For KU the trace target is TC(ku), not TC(KU); for 0 both sides 0. At n=2 K(ℤ)'s T(2) term is 0. | Correct connective input to TC. |
| 5.3; finite G induction/restriction | For C₂ and C₃, restriction after induction multiplies the free rank by 2 and 3; for G=1 it is id. | Transfer, not an unscaled augmentation. |
| 5.4; CMNN finite-sphere vanishing | n=2,m=0 reduces to Mitchell; n=3,m=1 uses height-two trace. The C_p cofiber has p−1 copies, namely 1 at p=2 and 2 at p=3. Rational underlying error has zero T(m+1). | Heights and multiplicity agree. |
| 5.5; chromatic purity, n≥1 | Zero input gives 0→0; H𝔽_p has both relevant localized ring pieces zero and positive localized K zero. At n=1 the adjacent lower detector is p-inversion. | No rational replacement at bottom. |
| 5.6; connective π₀-surjection with nilpotent kernel | ℤ/4→𝔽₂ has I²=0, likewise ℤ/9→𝔽₃. Positive telescopic K and TC comparison fibers vanish. Identity gives fiber 0. | Includes p=2 and nonreduced rings. |
| 6.1; E∞ ring of finite height | For H𝔽_p,Hℚ,Eₙ, input heights are −1,0,n and upper bounds for K are 0,1,n+1. K(0)=0 has height −1. | Upper bound does not force redshift at height −1. |
| 6.2; chromatic field maps | Eₙ(L) has identity field map; Hℚ maps to E₀(L). H𝔽_q for q≠p has rationalization 0 and admits no unital map to characteristic-zero L. | Statement passes; proof input missing, R04. |
| 6.3; Lubin–Tate lower bound | For E₁,E₂ at p=2 and 3, claimed first new nonzero pieces are T(2)K(E₁) and T(3)K(E₂), respectively; the upper bound kills the next higher piece. | Indices match source, not a new computation of those deep groups. |
| 6.4; algebraically closed L, characteristic zero | K(E₀(L))^∧p≃ku_p^∧⊕Σku_p^∧ gives π₀=ℤ_p and π₁=ℤ_p. Omitting the suspension would give π₁=0. | Fundamental-Theorem shift tested. |
| 6.5; finite nonnegative height | Hℚ: 0↦1; E₁:1↦2. H𝔽_p has height −1 and lies outside the assertion. | Lower endpoint and excluded case correct. |
| 6.6; two adjacent purity heights | E₀(L)→0 has zero T(1) on rings, but nonzero T(1)K(E₀(L)). For square-zero variation M=HA, stable relative K has ΣM with π₁=A; ΩM would have π₁=0. | Both heights needed; source shift issue recorded. |
| 6.7; ordinary rational-bottom chromatic pieces | For Hℚ, M₀R≠0 and M₁K(R)≠0; for E₁, M₁R≠0, M₂R=0, M₂K(R)≠0 and M₃K(R)=0. | Heights shifted exactly once. |
| 7.1; connective nice map | id:Hℤ→Hℤ is nice; H𝔽_p→0 fails π₀-isomorphism. Hℤ⊕ΣHℤ→Hℤ fails rational π₁ (ℚ→0). | Both defining conditions discriminate. |
| 7.2; K of nice E∞ maps | Identity retains π₀=ℤ and rational groups. On connective Hℤ, connective K still has π₀=ℤ. | No unital map ℤ/p→ℤ smuggled into iteration. |
| 7.3; r-fold K of finite p-power rings | At r=1 target is Hℤ; at r=2 target is K(Hℤ). For ℤ/p and ℤ/p² initial K₀=ℤ, at p=2,3. | Iteration starts after first K, not a nonexistent ring lift. |
| 7.4; Morava K(m), m≥1 | m=1 permits heights 0,1,2 and kills T(3). Rational split π₀ and π₁ are each ℚ; the suspension summand accounts for the latter. | Upper range and parity tested. |
| 7.5; truncated sphere | r=0 gives Hℤ; r=1 retains only π₀,π₁ of S. Both K-theories have zero T(2), while no corresponding claim is made for the untruncated sphere. | Finite-stage hypothesis retained. |
| 7.6; BP⟨n⟩ localization | n=0,1,2 give comparison heights 1,2,3 and vanishing heights ≥2,3,4. The three-term sequence requiring n≥1 is not applied to n=0. | Index boundary consistent. |
| 7.7; suspension A-theory, connected W | W=* gives the identity sphere comparison. If reduced Σ∞W is p-primary finite of type>n, every positive smash-power summand is acyclic for the specified lower telescopes. | Reduction has no extra sphere. |
| 7.8; Thom-family K comparison | m=1 has no positive i<m range; y(1) has characteristic p. m=2 gives T(1)K(y(2))=0 and the integral z comparison at p=2 with K(ℤ_(2)). | Different integral and characteristic-p conclusions preserved. |
| 8.1; ε-enlargement and towers | Empty prime set gives the original thick subcategory. Zero tower is nilpotent with length 1; constant nonzero tower is rapidly converging but not nilpotent. H(ℚ/ℤ) has torsion at infinitely many primes and is not a finite-prime ε error. | Several wrong models excluded. |
| 8.2; perfect algebra, rational transfer | A=R gives identity cobar and zero error. A=ℚ×ℚ over ℚ has transfer (x,y)↦x+y, sending (1,0) to 1. | Rational surjectivity is substantive. |
| 8.3; finite faithful G-Galois extension | Split C₂ torsor A→A×A has transfer (1,0)↦1; G=1 gives K(A)≃K(A). | Fixed-point direction and trivial extension correct. |
| 8.4; finite semilinear H action | H=1 permits the sphere and free rank 1. A free residue representation k[H]^d has k-dimension d·|H|, positive for d>0. | Positivity does not assert rank 1 for arbitrary H. |
| 8.5; higher real K transfer | H=1 gives identity transfer. For |H|=24 or 48 the constructed finite-free dimension is d·24 or d·48, nonzero and invertible after rationalization. | All-prime rational argument, including 2,3. |
| 8.6; ko-algebra | A=ko gives periodic A[β⁻¹]=KO, T(2)K comparison and T(3)K=0; A=0 gives 0. | Claimed range retains height two. |
| 8.7; tmf-algebra | A=tmf: T(2)K(tmf)≃T(2)K(Tmf), T(3) comparison reaches TMF, and T(4)K=0. | Different comparison heights not conflated. |
| 8.8; supersingular fixed points | |GL₂(𝔽₃)|=(9−1)(9−3)=48; |G₂₄|=12·2=24. At p=3, TMF(3) with 3 inverted has K(2)-localization 0, not E₂. | p=2 and p=3 descriptions must differ. |
| 8.9; regular localization checks | Coefficient K(ℤ) has T(2)=0; for a regular field, K→KH is an equivalence. Empty/zero category gives zero localization fiber. | Regularity is used only for the integral comparison. |
| 9.1; height-one truncation and p-inversion | A=H𝔽_p gives A[1/p]=0 and L_K(1)K(A)=0; A=Hℤ has π₀ comparison id. | Correct discrete endpoint. |
| 9.2; nil, Milnor and qcqs blowup descent | k[ε]/ε²→k has nil fiber killed by L_K(1); empty scheme has value 0; identity modification gives an identity pullback square. | Noetherian approximation remains a declared contract. |
| 9.3; flat versus free commutative spectral line | For A=S, degree-2 piece of Sym(S) is Σ∞BΣ₂₊ while flat S[ℕ] has degree-2 piece S; both π₀ are ℤ[x]. A=0 gives 0 in both constructions. | Equal π₀ is insufficient to identify the two lines. |
| 9.4; homotopy invariance | For k[ε]/ε², 1+εx specializes to 1 at x=0 and gives a nontrivial integral NK₁ class; its height-one localization is 0. | Tests actual singular nil term. |
| 9.5; KH comparison | Regular k gives K=KH. Dual numbers have nonzero integral NK₁ but zero L_K(1)NK; both height-one K and KH agree. | General assertion is localized, not integral. |
| 9.6; TC obstruction | L_K(1)TC(ℤ)≠0 while TC(ℤ[1/p])^∧p=0, at p=2 and 3. | Contract values refute p-inversion invariance for TC. |
| 9.7; filtered stable categories | Every finite stage of the stated category construction has localized TC 0; its filtered union has the nonzero L_K(1)TC(ℤ) contribution. | Does not contradict filtered-colimit preservation on discrete rings. |
| 10.1; additive versus stable K | Perf(k) gives ⊕ⱼℤ→ℤ, eⱼ↦(−1)ʲ; e₀+e₁ is killed. The comparison fiber becomes 0 after T(2)-localization. | Does not assert integral equality. |
| 10.2; sifted diagram of connective E₁ rings, n≥2 | Constant diagram at A has colimit A and comparison id. Zero diagram gives 0. Colimit in localized spectra is L_T(n) of the ambient colimit. | Codomain convention matters. |
| 10.3; orbit category of all cyclic subgroups | For G=1,C₂,ℤ, G/G is terminal; S₃ and Q₈ are not cyclic and have no such terminal object in Or_Cyc(G). | Infinite cyclic groups must be included. |
| 10.4; connective R, arbitrary discrete G | Cyclic G gives identity assembly, fiber 0; R=0 gives zero diagram; for S₃ and Q₈ the theorem predicts p-completed fiber 0 without reducing the diagram to a terminal object. | Checks include nonabelian G. |
| 10.5; arbitrary R, n≥2 | R=KU uses TC(ku) in the trace step; cyclic G gives id; S₃,Q₈ give T(2)-localized fiber 0. | No connectivity assumption introduced into final K theorem. |


### Suggested.lean declaration and headline ledger

| Declaration inventory | Section / variables / instances | Computed comparison | Result |
|---|---|---|---|
| No declarations, definitions, instances or examples | Namespace TauCetiRoadmap.GeneralAlgebraicKTheoryPartII; no variable blocks | Number of signatures=0; number requiring elaboration=0; number of duplicate fully qualified names=0 | No Lean invocation; no stand-in or padding theorem. |

The following are the 31 headline families explicitly named in the module docstring, in its order. The absence of the specified native carriers prevents stating these assertions at the pins. Ordinary K₀ groups do not remedy the absence of the K-spectrum or its higher groups. No additional statable headline was identified.

| Headline family | README targets | Missing carrier at pins |
|---|---|---|
| Compact-kernel K localization | 0.1 | Enhanced stable category and K-spectrum |
| Connective plus comparison | 1.1 | Spectral ring, general-linear space and spectral K |
| Additive Morita/projective comparison | 1.2–1.3 | Additive ∞-category and spectral modules |
| A-theory | 1.4 | Retractive-space K and spherical loop-group ring |
| Restricted truncation/excision | 2.1–2.3, 4.38–4.41 | Localizing invariant on spectral categories |
| Nonpositive connective comparison | 2.4 | Spectral ring and integer-graded K |
| Stable envelope/bounded-heart fiber | 3.2, 3.5–3.6 | Additive spectral presheaves and K |
| Heart and regular localization | 3.3–3.4 | Enhanced heart, perfect spectral modules and K |
| Bousfield–Kuhn | 4.10–4.16 | Telescopes, spectrum localization and periodic functors |
| Tate vanishing/blueshift | 4.22–4.25 | Coherent Tate spectra and chromatic localization |
| Hahn/Tate converse | 4.26–4.29 | H∞/E∞ ring spectra and Morava theories |
| Witt action/NK localization | 4.36–4.37 | NK in all integer degrees |
| Acyclic categorical K/Mitchell | 4.43–4.45 | Enhanced K and telescopic localization |
| Theorem A, both forms | 4.46 | Ring-spectral K and finite chromatic localization |
| Connective cover/trace | 5.1–5.2 | K, TC and T(n)-localization |
| CMNN finite-sphere vanishing | 5.4 | Finite-local sphere and its K-spectrum |
| Two-height purity/optimality | 5.5–5.6, 6.6 | Telescopic K of E₁ rings |
| Theorem B/Lubin–Tate/redshift | 6.1, 6.3–6.5 | E∞ rings, Morava spectra, K and height |
| Chromatic graded-piece redshift | 6.7 | Chromatic towers and K |
| Nice maps/iterated finite-p comparison | 7.1–7.3 | Multiplicative iterated K |
| Coefficient-ring and A-theory applications | 7.4–7.8 | Morava/BP/Thom spectra, A-theory and K |
| Rational-transfer/Galois/Lubin–Tate descent | 8.1–8.5 | Linear motives, spectral towers and K transfer |
| ko/tmf/supersingular K descent | 8.6–8.9 | ko/tmf spectra and coherent fixed points |
| Height-one truncation/cdh/KH | 9.1–9.5 | K(1)-local K and spectral scheme KH |
| TC obstructions | 9.6–9.7 | TC on spectral categories |
| Additive-to-stable comparison | 10.1 | Additive/stable K and localization |
| Sifted colimits/cyclic assembly | 10.2–10.5 | Spectral K/TC and coherent orbit diagrams |
| Hopkins–Mahowald/James Thom | 4.31–4.32 | Spectral units, multiplicative Thom colimits and Adams comparisons |
| Uniform locality/elliptic comparison | 4.18–4.21, 4.30 | Spectral orientations and elliptic spectral sheaves |
| Chromatic fields/unit detection | 6.2, 4.34 | Chromatic E∞ fields and ordinary homology of H∞ rings |
| Equivariant Morava free-complex construction | 8.4 | Morava spectra, semilinear modules and spectral coinduction |

Pinned Mathlib revision: 6b7abb3c7686292736be2955bd3eb9ebf63b456a. Pinned Tau Ceti revision: a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Object searches and definition reads were made in these copies, not in a newer library.

| Pinned declaration(s), relative library path | Actual context and test | Boundary of supplied API |
|---|---|---|
| SSet.Quasicategory, Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41 | Inner-horn fillers; a discrete two-object nerve qualifies | Does not assert stability or give a spectrum |
| CategoryTheory.Idempotents.Karoubi, Mathlib/CategoryTheory/Idempotents/Karoubi.lean:43 | Object X, p:X→X, p²=p; p=0 and p=1 both qualify | Ordinary idempotent completion, not a Verdier quotient |
| CategoryTheory.Triangulated.TStructure and .bounded, Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean:54,262 | Triangulated-category context; bounded=plus∩minus. k[r] has its own [r,r] amplitude | No uniform interval; no stable ∞-category |
| TauCeti.ExactStructure, TauCeti/CategoryTheory/Exact/ExactStructure.lean:241 | Preadditive, zero object and binary biproducts; split sequence k→k²→k has dimensions 1,2,1 | Ordinary exact category |
| TauCeti.finiteProjectiveModulesExactStructure and .finiteProjectiveModulesExactStructure_eq_split, TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean:222,231 | Finite projective left modules; short exact sequence splits, rank 2=1+1 | Left/right conversion still needs opposite rings |
| TauCeti.SplitK0, TauCeti/CategoryTheory/GrothendieckGroup/Split.lean:114 | Zero morphisms, binary biproducts, essential smallness; [k²]=2[k] | Split relations only |
| TauCeti.AbelianK0, TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean:79 | Abelian, essentially small; [B]=[A]+[C] for exact A→B→C | Ordinary Grothendieck group |
| TauCeti.TriangulatedK0, TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean:139 | Preadditive, zero, additive integer shift, pretriangulated, essentially small; [k[1]]=−[k] | Group, not K-spectrum |
| TauCeti.SplitK0.finrankEquiv, TauCeti/CategoryTheory/GrothendieckGroup/FiniteDimensionalVectorSpace.lean:148 | DivisionRing k, Small.{v} k, FGModuleCat; k⁰,k¹,k² map to 0,1,2 | Universe hypothesis retained in README |

### Convention tests

| Convention | Explicit values | Result |
|---|---|---|
| Right modules and restriction | End_A(A) acts by left multiplication; rank-d extension sends [B]↦d[A], d=0,1,2 | Direction correct; zero ring gives zero class |
| Suspension sign | k→0→Σk gives 0=1+(−1); π₁ΣHk=k and π₋₁Hom(ΣHk,Hk)=k | Same sign in heart, envelope and K₀ |
| Connected cover | π₃(S³⟨3⟩)=ℤ globally versus 0 in the Thom paragraph | R01 |
| Bottom chromatic detector | At p=2: S[1/2]⊗H𝔽₃=H𝔽₃, Hℚ⊗H𝔽₃=0; both send Hℚ to Hℚ | Distinct global and p-local towers retained |
| Witt sign | χ(1)=1−t; on 1−εx, factor 1−rt gives 1−rεx. At r=1 over 𝔽₃ the inverse-sign answer differs by 2εx | Correct action convention; R03 concerns ownership |
| Tate norms | Finite trivial rational norm ×p has inverse ×1/p; circle norm has a suspension and raw π₀ cofiber ℚ | R02 only for raw circle Check |
| Power operations | p=2: 2²−(1²+1²)=2; p=3: 2³−(1³+1³)=6 | Transfer quotient necessary |
| Homotopy-fixed-point maps | Split degree-two torsor: transfer (a,b)↦a+b; (1,0)↦1; trivial group gives two identity comparisons | Direction agrees with descent hypotheses |
| Uniformity/cardinality | Perf(k) includes k[r] for every integer r; κ=ω does not close finite objects under countable sums; ε tests use one finite set of primes | No uniform amplitude or finite-stage swindle substituted |

### Supplier and ownership audit

Each row refers to the named roadmap's README under TauCetiRoadmap, at main or the supplied open head. The exception is the explicitly identified board design. Roadmap-service searches were used for object ownership; local sibling heads were used for the supplied sibling names and numbering. Matches were read before using them as witnesses. No existing Lean name is duplicated because Suggested.lean has none.

| Supplier group | Sections inspected / result |
|---|---|
| GeneralAlgebraicKTheory | §§3.12–3.14, 6.9, 6.19, 7.1–7.7, 9.8–9.17, 10.1–10.13, 11.15–11.16, 13.6, 13.8a–c; classical K, Nil and Bass belong there. Finite fields give K₁(𝔽₂)=0 and K₁(𝔽₃)=ℤ/2. |
| StableHomotopyKTheory | Layers 3–7, especially §§3.18–3.21, 5.12, 5.18–5.19 and coefficients/completion; twisted Postnikov and coherent spectra are actual targets, not supplied by bare quasicategories. |
| StableHomotopyKTheoryPartII | packages/StableHomotopyKTheoryPartII/design/README.md:668,739–785 contains PO.4 and the two named operations. This is an earlier design, not a finished package. P(2)=4 at p=2; transfer-ideal addition supplies the needed difference. |
| EnhancedDerivedSheaves | E0.4, E0.7, E3.1, E5:abstract.1–4 and E5:presentability.1–3; enhanced modules, compact Ind/quotient and coherent actions are present. Multiplicative Postnikov refinement is explicitly a gap. |
| RefinedTraceMethods | §§2.1–2.17, 4.6, 4.9–4.19 at supplied head; exact target titles for correction algebra, stable-K derivative, DGM and C_p assembly exist. Relative κ-linear motive refinements are explicitly excluded and appropriately contracted. Stable relative K is ΣTHH, not ΩTHH. |
| AInfCohomology | AI.7.2: circle norm, orbit lemma and completed bounded-below comparison; raw rational circle value distinguishes R02. |
| BordismFormalGroups | F6.1–F6.4 and cited F1–F3 infrastructure; actual Smith/Koszul, periodicity, smashing, Morava coefficients and Chouinard targets were located. These do not provide the BSY cover construction of R04. |
| GeneralizedCohomology | G2 and G5.1–5.4: spectral models, finite duality, Thom infrastructure and KU/KO; ordinary finite duality sends S² to S⁻². |
| TopologicalKTheory | T4 and T7: complex and real Bott; complex period 2 differs from real period 8 at p=2. |
| HomotopySpheres | §3B: James filtration and smash-power quotients; §4C: stable J. The full natural reduced stable splitting is explicitly contracted. |
| EllipticCohomology | E1–E6, with base height-one/two realization and elliptic sheaves; all-height realization and additional global spectral comparisons are gaps. Degree of Δ²⁴=576. |
| QWittVectors | §§1.3–1.4a at supplied head; inverse-series comparison exists. R03. |
| KTheoryLowDegrees | §§1.1–1.3 and 13.1: projective K₀ and Euler normalization; nilpotent-ideal K₀ lifting is separately contracted. |
| KTheoryFiniteLocalFields | §6.5a supplies field étale comparison under its coefficient/cohomological-dimension hypotheses, not the general spectral étale site; the spectral contracts state the extra scope. |
| SchemeKTheoryOperations | §§4.12, 5.2, 5.6, 5.7: existing NK/Bass and regular comparisons retained; general localizing and noncommutative KH refinements are contracted. This package owns the new continuous Witt action, not the NK carrier. |
| AlgebraicTopology | Stages 4 and 8: CW/simplicial and homotopy substrate; no replacement for stable spectral carriers. |
| ModularCurves | §7E: p-divisible/formal-height input; ordinary and supersingular elliptic heights 1 and 2. |

The existing repair disposition F15 at packages/GeneralAlgebraicKTheoryPartII/reports/FIX-PKG-GeneralAlgebraicKTheoryPartII~2.md:59 concerns external ownership repairs in ChromaticHomotopyTheory and StableHomotopyKTheoryPartII. It is not re-raised. The package assigns the chromatic extensions to itself and directs the downstream consumer accordingly. R04 concerns a distinct prerequisite missing from this package's own proof plan.

The requested dependency check returned exactly:

```text
depcheck: 56 roadmaps, 651 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The read-only diff against origin/main confines the submitted changes to this package: README, Suggested.lean, design/plan.json, metadata.toml, three reports and sources.toml. No set_option, lemma declaration, computational algorithm, sorry'd data or forbidden import was found in Suggested.lean.

### Declared-gap ledger

All 33 names occur in both the plan's top-level gaps and the README contracts; all have named suppliers. The tests below check the formulation against boundary examples, not whether the future supplier has already proved it. Apart from R03, none was found to duplicate an available result. Coherent constructions include their compatibility data as one interface, rather than being treated as unrelated compound requests.

| Gap slug / supplier | Boundary computation and scope check | Result |
|---|---|---|
| witt-characteristic-series / QWittVectors §1.3 | χ(1)=1−t; γ∞(1)=(1−t)⁻¹; ordinary inversion interchanges them | R03: already supplied in §1.4a |
| multiplicative-postnikov / EnhancedDerivedSheaves E5:abstract.2 | For HA every τ≤r is HA; for HA⊕ΣHA first truncation kills precisely π₁=A | Conditional E₁ refinement, including bimodule/derivation data |
| nilpotent-kzero / KTheoryLowDegrees §1.2 | ℤ/4→𝔽₂ sends rank 1↦1; K₀=ℤ on both sides; I=0 gives id | Nilpotent two-sided ideal, unital ring retained |
| tc-mod-p-cyclotomic-colimits / RefinedTraceMethods §2.10 | Empty diagram gives 0; constant diagram comparison id | Underlying connective spectra explicitly required |
| tc-mod-p-ring-sifted-colimits / RefinedTraceMethods §2.10 | Constant sifted diagram at A has colimit A, comparison id | Restricts to connective E₁ rings; stronger ambient claim not inferred |
| thh-all-cyclic-assembly / RefinedTraceMethods §2.10 | G=ℤ has terminal G/G only when infinite cyclic subgroups are included | Correct family; no finite-cyclic substitution |
| tc-z-k1-nonzero / RefinedTraceMethods §4.17 | Values at p=2 and 3 both required ≠0 | One nonvanishing assertion, not a good-prime version |
| tc-z-inverse-p-vanishing / RefinedTraceMethods §2.10 | Derived p-completion of p-inverted input contribution is 0 | All primes, raw TC not asserted zero |
| k1-tc-filtered-colimits / RefinedTraceMethods §2.10 | Constant discrete-ring diagram gives identity | Does not assert preservation for arbitrary stable categories |
| linear-weak-additive-motives / RefinedTraceMethods §4.6 | Zero category has zero motive; κ-compact input bound precedes universal functor | A-linear and accessibility hypotheses explicit |
| linear-motive-tensor-unit / RefinedTraceMethods §4.10 | Unit tensor itself=unit; base A=0 has zero perfect category | Commutative A required |
| linear-motive-kzero-unit / RefinedTraceMethods §4.10 | [A]↦1 and [A⊕A]↦2 | Map, not unsupported equivalence |
| linear-motive-projection-formula / RefinedTraceMethods §4.10 | A=B gives identity; B=A² gives rank multiplication by 2 | B perfect over A required for restriction |
| spectral-etale-descent / KTheoryFiniteLocalFields §6.5a | Empty scheme value 0; identity cover equalizer=id | D₀=Hℚ explicitly, not S[1/p] |
| spectral-strict-henselian-detection / KTheoryFiniteLocalFields §6.5a | R=0 fails nonzero premise; algebraically closed field has its own strict local point | Nonzero premise prevents empty-spectrum failure |
| suslin-algebraically-closed-comparison / KTheoryFiniteLocalFields §6.5a | L characteristic zero: completed π₀=ℤ_p, π₁=0; ku gives same | Algebraic closure and characteristic zero retained |
| localizing-nisnevich-descent / SchemeKTheoryOperations §4.12 | Empty value 0; identity distinguished square is pullback | qcqs and localizing hypotheses explicit |
| localizing-derived-blowup / SchemeKTheoryOperations §5.7 | Unit ideal has empty center and identity modification; square error 0 | Derived construction and finite sequence retained |
| abstract-blowup-noetherian-approximation / SchemeKTheoryOperations §5.7 | Identity modification over a noetherian ring descends to itself | Finitely presented modification and center both required |
| abstract-blowup-platification-domination / SchemeKTheoryOperations §5.7 | U=X gives identity blowup; empty U is schematically dense only on empty X | Noetherian, proper and schematically dense hypotheses retained |
| kh-simplicial-model / SchemeKTheoryOperations §5.2 | r=0: A[x₀]/(x₀−1)=A; r=1: A[x₀,x₁]/(x₀+x₁−1)=A[x₁] | Central variables accommodate noncommutative A |
| kh-regular-comparison / SchemeKTheoryOperations §5.2 | Field k: NK=0, K=KH; singular dual numbers have nonzero integral NK₁ | Regular noetherian restriction discriminates |
| kv-relative-comparison / SchemeKTheoryOperations §5.6 | Identity relative complex=0 in every simplicial degree, abutment=0 | Uniform lower bound required for convergence |
| kh-nilpotent-invariance / SchemeKTheoryOperations §5.6 | Dual numbers and k have equal KH; their integral K₁ differ by 1+εk | Correctly about KH, in all integer degrees |
| stable-james-splitting / HomotopySpheres §3B | W=*:0=0; W=S²: summands S²,S⁴,… with no S⁰ | Connected, pointed and reduced versions match |
| all-height-morava-realization / EllipticCohomology E2 | h=1,2 recover supplied heights; h=3 requires new realization | Perfect residue field, marking and semilinear action retained |
| elliptic-spectral-affineness / EllipticCohomology E3 | Unit sheaf maps to its global ring; tensoring by 0 gives 0 | Both compactified and open elliptic stacks named |
| elliptic-level-three-galois / EllipticCohomology E6 | GL₂(𝔽₃) order=(9−1)(9−3)=48 | Base explicitly inverts 3; faithfulness requested |
| elliptic-supersingular-at-two / EllipticCohomology E2 | p=2, residue 𝔽₄, full deck group order 48 | Cannot replace by order-24 geometric subgroup |
| elliptic-supersingular-at-three / EllipticCohomology E2 | p=3, residue 𝔽₉, semilinear order 12·2=24 | Cannot use level-three ring with 3 inverted |
| spectral-units-and-lines / EllipticCohomology E5 | R=Hℤ: π₀GL₁R={±1}; 0∈ℤ is not a unit | Uses unit components, not all Ω∞R |
| relative-thom-colimit / EllipticCohomology E5 | X=* gives R; empty X gives zero module | Source X and target R-modules specified |
| multiplicative-thom-refinement / EllipticCohomology E5 | Constant loop map from * gives E_n-algebra R; n=1 included | Group-like E_n and loop-map coherence retained |

### Source-locator ledger

Ranges below identify the passages inspected, grouped by source rather than repeating every use of an anchor. Locator accuracy does not by itself certify a proof; source defects are listed separately; the missing Weibel extraction fragment was resolved by inspecting the scanned page.

| Source | Inspected statement/proof passages and outcome |
|---|---|
| lmmt | Lines 80–180, 206–422, 460–799, 850–1218: Theorems A/B, §2 chromatic arguments, truncation, stable envelopes and applications. R05 corrects four anchor uses; introductory height-zero and derivative-shift issues below. |
| bgt | Lines 1352–1384, 1559–1661, 2007 onward, 2664–2730, 3128–3171, 3363–3409: spectral Morita, exact/localizing, suspension K and nonpositive comparison. |
| lt | Lines 193–241, 366 onward, 689–735, 1170–1245, 1430–1535: correction algebra, connectivity, truncating invariants and descent appendix. |
| cmnn20 | Lines 300–342, 497–545, 798–840, 975–1010, 1650–1735: ε definitions, rational unit detection, Galois descent and finite Morava free complexes. |
| cmnn24 | Lines 101 onward, 827–920: Theorem C, Tate converse and finite-sphere proof; i=0 coefficient formula needs the clarification below. |
| barwick | Lines 805–852: bounded theorem of the heart with its exact-category context. |
| agh | Lines 241–280, 1227–1245, 1490–1577: boundedness, noetherian-heart negative vanishing and regular spectral examples. |
| hs | §3.1 at lines 783 onward, 865–925 and Corollary 8.1.3 at 3711 onward: additive/projective and group-completion comparisons. |
| pp | Lines 1610–1705: Lemmas 4.24–4.25 and Theorem 4.26, finite-limit stable-envelope argument. |
| mitchell | Lines 35–95, 575–627: Theorems A/B and Theorem 3.8, including arbitrary discrete rings. |
| yuan | Lines 58 onward, 96 onward, 280–365: Lubin–Tate redshift, spectral étale descent and strict-henselian detection. |
| bsy | Lines 809–835, 2138–2163, 2405–2490, 2500–2550, 2590–2607, 2630–2638, 3800–3950: cover-to-field route, rational case and redshift. Missing ownership of the cover route is R04. |
| weibel | Lines 38–65, 180–250, 469–490: characteristic-series sign, localization/torsion and nilpotence comparison. Corollary 3.3(a), lost in the extraction at line 236, was verified visually on printed p.475: localization of the coefficient ring gives the corresponding localized NK-module. [Author copy](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/MV-NK-854.pdf). |
| bgt-mult | Lines 1015–1055: multiplicative K and trace, Theorem 5.8 through Corollary 5.11. |
| hopkins-smith | Lines 89–180 and cited nilpotence/periodicity proof passages: ring-unit argument, thick subcategories and central powers. OCR inequality characters were not treated as new mathematical restrictions. |
| ravenel | Lines 377–472: Theorem 2.1 Bousfield-class formulas and BP/Johnson–Wilson comparisons. |
| cdh | Lines 4314–4360: retractive spaces, compact parametrized spectra and Spanier–Whitehead stabilization. A missing-desuspension phrase is recorded below. |
| kuhn-guide | Lines 113–160, 393–475, 699–773: finite telescopic functors, Bousfield–Kuhn and rigidification. |
| kuhn-tate | Lines 142–184: telescopic Tate vanishing and finite-local blueshift. |
| cm-tate | Lines 60–131: norm/transfer criterion, reduction to C_p and vanishing. Incorrect BΣ_p p-inversion parenthesis below. |
| hahn | Lines 14–104, 340–452: H∞ acyclicity, transfer quotient, DVR and Tate converse; coefficient-index typo below. |
| csy | Lines 4030–4074: Theorem 5.4.4 and Remark 5.4.5, height and Tate comparison. |
| bhm | Lines 215–253: Theorem 3.1 and Lemmas 3.2–3.3, connective periodic detection. |
| mm | Lines 1244–1275, 1680–1760, 1793–1807: finite-height locality, elliptic affineness and levels. |
| behrens | Lines 861 onward, 1048 onward, 1156–1188: elliptic chromatic locality, periodicity and supersingular descriptions. |
| goerss | Lines 670–708: Theorem 3.6 and semilinear Morava automorphisms. |
| thom | Definition 3.1 at line 400 and lines 768–861: versal E_n characteristic, Hopkins–Mahowald and connected-cover p-complete Thom identification. |
| akq | Lines 130–253, 632–674: integral/2-local/completed Thom variants and acyclicity. Raw integral claims require the corrections below; the package already distinguishes the variants. |
| bhls | Lines 84–105: Theorem A is a higher-height counterexample, not the height-one proof cited in R06. |
| may-nilpotence | Line 47 and lines 107–135: ordinary-homology unit detection, with all primes retained. |
| mah81 (additional primary source) | Lines 46–60, 633–650: Theorem 1.1 and Theorem 6.3, printed pp.365–366,382; legal publisher copy. |
| mil81 (additional primary source) | Lines 272–286: Theorem 4.11 and Corollary 4.12, printed pp.294–295; legal author copy. |

## Not verifiable

- No Lean elaboration was run, as required by this read-only pass. Suggested.lean contains zero declarations, so there are no elaborated signatures to compare. The pinned-definition inspection above is not presented as a build result.
- The 32 nonredundant supplier contracts are future obligations. The report checks their hypotheses, boundaries, ownership and declaration, and accepts them conditionally; it does not certify their implementations. StableHomotopyKTheoryPartII's PO.4 was inspectable as a board design, not as a finished README/Lean package.
- Ownership was compared with main, board packages and the supplied sibling heads, using object searches. This is not a claim to have inspected every unrelated open revision or unpublished implementation. The settled external ownership repair F15 was not reopened.
- Computed instances test the statements and conventions; they cannot certify every deep theorem's proof. In particular the Morava redshift and nonzero TC values in the tables are source/contract consequences, not newly computed homotopy groups. The unsupplied proof input actually found is R04.

## Source issues

- **Misprint** in lmmt at Remark 3.11, printed p.1026 (lmmt line 747): the source says the stabilized relative K-spectrum of sphere square-zero extensions is ΩM; it should be ΣM, agreeing with the shifted THH derivative; affects the proof.
- **Error** in lmmt at the introductory field-map claim and Redshift Theorem, printed p.1014 (lmmt lines 172–176): the source says nonzero global T(0)-localization suffices for a characteristic-zero field map and height-zero redshift; it should be nonzero rationalization at height zero; affects a stated result.
- **Error** in cm-tate at the explanation after Theorem 2.5, printed p.3 (cm-tate line 113): the source says the suspension spectrum of BΣ_p becomes the sphere after inverting p; it should be BC_p in that assertion; BΣ₃ retains mod-2 H₁ after inverting 3; affects the proof.
- **Misprint** in hahn at the proof of Proposition 4.3, printed p.8 (hahn lines 358–359): the source says the coefficient power-series variable in the Eisenstein argument is u_n; it should be u_h, as in the proposition and the polynomial's constant term; affects nothing.
- **Misprint** in cmnn24 at Lemma 4.7, printed p.19 (cmnn24 lines 831–834): the source says the displayed quotient by p followed by inversion of v_i gives k((v_i)) throughout the i≥0 argument; it should be interpreted separately at i=0 as W(k)[1/p], with no quotient by p; affects the proof.
- **Error** in akq at §2.1's integral connected-cover Thom identification, printed p.5 (akq lines 199–203): the source says the sign Thom spectrum over the integral sphere is Hℤ; it should be Hℤ_(2) after 2-localization; at 3 the null twist retains a sphere retract with nonzero π₃; affects a stated result.
- **Misprint** in akq at the proof of Proposition 2.22, printed p.15 (akq line 648): the source says raw z(n) has π₀=ℤ₂; it should be π₀=ℤ before localization, ℤ_(2) after localization, and ℤ₂ only after completion; affects the proof.
- **Misprint** in cdh at §4.4's comparison preceding Lemma 4.4.11, printed p.89 (cdh lines 4320–4326): the source says all perfect parametrized spectra are suspension spectra of finitely dominated retractive spaces; it should be their Spanier–Whitehead stabilization, including desuspensions, as the following sentence specifies; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f0cf796419574218f8ebb11ecd8a00a717b118d2", "job": "RT-GeneralAlgebraicKTheoryPartII~1a", "model": "gpt-6-astra", "worker": "chris-30"} -->
