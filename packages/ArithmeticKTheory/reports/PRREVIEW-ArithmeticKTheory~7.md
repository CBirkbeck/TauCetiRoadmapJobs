# Review of ArithmeticKTheory (pull request #1418 at e627510)

**Verdict:** needs changes

This is a full re-review: 245 lines changed since 3f68345. All four findings of the previous review are repaired; R03 is repaired as far as the uncertified Grayson text allows (details under Verified sound). The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with exactly three `sorry` warnings. No finding is blocking. Three P3 findings remain: §7.5 now owns a sphere Adams–Novikov computation that no target here uses; §8.8 is a certificate table; and the module docstring does not mention the Steinberg-homology theorems. The new §7.5 cobar computations are mathematically correct. They were recomputed in full (table below), and every new Ravenel locator was checked against the author's posted copy.

## R01 (P3) — §7.5 owns a sphere Adams–Novikov computation that no target here uses

Location: `TauCetiRoadmap/ArithmeticKTheory/README.md` lines 73–76, “Section 7.5 owns the low Adams–Novikov E₂-term of the sphere (sphereAdamsNovikovLowE2) and the 2-primary differential d₃ onto E₃^(4,8)”, and the block at lines 3958–4033.

Claim: arithmetic K-theory is the right owner of the stem-one and stem-four Adams–Novikov E₂-terms of the sphere, sparseness, the zero line and d₃(ᾱ₃)=ᾱ₁⁴.

Witness: no target here uses them. k4_int_eq_zero (lines 4053–4065) needs only HomotopySpheres §9.2's π₄ˢ=0. The sole consumer, K3BlochGroups §4.9 (its README lines 1351–1369 at #1430), already computes E₂^(3,6) on the same complex.

The block also overlaps the existing owner of explicit sphere calculations. EllipticCohomology (on main) §E4.S, item 4 (its README line 954) constructs α₁∈E₂^(1,4) at p=3, which is this block's first Check, and item 1 detects η at p=2 by a normalized cobar representative. Ravenel's book, the block's only source, has no entry in the package manifest. Ravenel's Corollary 4.3.15 holds only modulo I_n. At p=2 it gives Δ(t₂)≡…+v₁b₁₀ modulo 2, in Araki's generators. It therefore does not supply the exact Hazewinkel formula with −v₁(t₁⊗t₁). That exact formula follows from A2.1.27(e), which the README also cites.

Repair: move the material to its consumer.
- In the README, delete:
  - the scope sentence at lines 73–76;
  - the G3 item 9 sentence at lines 471–473;
  - the clause “and for the first 2-primary Adams–Novikov differential” at lines 525–526;
  - the BordismFormalGroups subsection at lines 528–537;
  - lines 3958–4033;
  - the basic-law bullet at lines 4075–4076;
  - the Adams–Novikov clauses at lines 4111–4114, 4118–4119 and 4243–4245;
  - the sentence at lines 5156–5158;
  - the Ravenel entry at lines 5195–5206.
- In `Suggested.lean`, delete the docstring sentence at lines 31–36.
- K3BlochGroups §4.9 then states E₂^(1,2)=ℤ/2·[t₁], sparseness and the zero line itself, citing BordismFormalGroups F3–F4 directly as it already does for E₂^(3,6). Its README lines 111, 1356, 1367, 1369 and 1765 at #1430 cite ArithmeticKTheory §7.5 and change with it.

Tested: after these deletions the README contains no occurrence of sphereAdamsNovikov, Adams–Novikov, BordismFormalGroups, Ravenel or “G3 item 9”, and the K₄(ℤ) argument at lines 4053–4065 is unchanged.

If the block stays here instead:
- say in Scope and ownership why this roadmap owns it;
- record `ravenel` in the manifest (the author-page copy is legal, and every locator checks out, see below);
- cite EllipticCohomology §E4.S item 4 at the p=3 Check;
- mark Corollary 4.3.15 as “modulo I₁, Araki's generators”.

## R02 (P3) — §8.8 is a certificate table

Location: `README.md` lines 4760–4768, “For compact exact data, each row below gives exponent vectors A,B,C … The relation column is A−B”, followed by eleven tables (lines 4794–5064, 173 rows of exponent vectors plus selected signed minors).

Claim: README content is mathematics written as prose.

Witness: the house rules exclude certificates and large computations. Each row witnesses an identity a−b=π_v w, the minor lists are chosen determinants, and the README calls them “explicit calculations, rather than a table in either source” (lines 4745–4746).

Repair:
- Replace lines 4760–4772 and the eleven tables with one target: “For each of the eleven primes of norm ≤33 listed above, β̄:U/U₁→k(v)× is an isomorphism. Prove it by the lattice-index theorem from old-unit relations a−b=π_v w whose relation lattice has index q−1.”
- Keep the prime list, the completeness argument, the residue description and the lattice-index theorem (lines 4729–4758).
- Keep the norm-4 table (lines 4794–4803) as the single worked Check.
- In §8.9 (lines 5088–5089), replace “the complete finite data and sign calculation are given in §§8.8–8.9” with “the finite residue steps are §8.8's targets and the sign calculation is §8.9's”.

Tested on the retained Check, with ε²=ε+1:
- Row 1: −ε⁻⁶−ε⁻³=2·(−ε⁻⁴) is equivalent to −1−ε³=−2ε², which holds since ε³=2ε+1.
- Row 4: 1+ε⁻³=2ε⁻¹ is equivalent to ε³+1=2ε², which holds.
- The relation vectors are (1,−3), (0,3), (1,3) and (−1,3). The minors (1,3)↦6 and (4,2)↦−3 have gcd 3=q−1.

## R03 (P3) — the module docstring does not mention the Steinberg-homology theorems

Location: `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean` lines 20–37. README §3.2 states projectiveSteinbergHomology_fg (lines 1107–1109) and curveSteinbergHomology_fg (lines 1221–1228).

Claim: the docstring names every headline that is not statable at the pins, and what it lacks.

Witness: curveSteinbergHomology_fg, exported to EllipticKTheory (README lines 5160–5162), is a group-homology statement, and for §3.2 the docstring names only the CW model. Mathlib has `GroupHomology`, but neither pin has a Tits building or Steinberg module.

Repair: add to the docstring: “The Steinberg-homology finiteness theorems of README §3.2, projectiveSteinbergHomology_fg and curveSteinbergHomology_fg, lack the Tits building of a vector space and its Steinberg module: Mathlib has group homology but no building.” This is a docstring-only change, so elaboration is unaffected. If R01 is applied, its Adams–Novikov sentence goes as well.

## Verified sound

### The previous review's findings

- R01 (supplier ids that existed nowhere): repaired. README lines 556–561 now read “AL.3.10.5 supplies … slopes, semistability, and existence and uniqueness of Harder–Narasimhan filtrations … AL.3.10.7 supplies the boundedness …”. The same ids appear at lines 1289–1290 and 1638. Both headings resolve at the #924 head (its README lines 2345 and 2365).
- R02 (module header): repaired. `Suggested.lean` lines 1–5 are `module` / `public import Mathlib` / `@[expose] public section`, and the gate passes.
- R03 (Grayson locator, manifest): repaired as far as the text allows. README lines 1265–1269 now say what is drawn from each source: Quillen p. 7 for the statement, Grayson for the unstable-subcomplex comparison. The manifest now records `quillen-oberwolfach` (institutional, certified, p. 7) and `grayson-curve` (uncertified, pp. 69–90), so the page range is the settled locator.
- R04 (AlgebraicCurves layer): repaired. README line 565 reads “Layer 0 supplies the constant field … Layer 12 its regular projective model”. On main, AlgebraicCurves Layer 0 is at line 403 and Layer 12 at line 1468.

### Gate, dependency check, Lean

- Gate rerun at this head: `gate ArithmeticKTheory: set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's gate file shows `build=0 OK`.
- Dependency check: `depcheck: 242 roadmaps, 2452 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake env lean` on `Suggested.lean` runs in 4.6 s and gives exactly three `declaration uses 'sorry'` warnings, at lines 59, 65 and 78.
- `#check @name` for all four declarations, run on a scratch copy, matches `signatures.md` and the README. `sUnitSubmonoid` and the two §1.1 theorems carry `[IsDedekindDomain R]`, `[IsFractionRing R F]` and an arbitrary `S`. `regularPrime_dividedBernoulli_num` carries `Nat.Prime p`, `Odd p`, the class-number hypothesis and `1 ≤ k`. No binder is lost and nothing needed changing.
- One-tactic probes on a scratch copy: `simp`, `aesop`, `infer_instance` and `simp_all` close none of the three theorems. Neither pin has an S-integer localization theorem or a regular-prime predicate. Nothing in the file is padding.
- Remark, not a finding: `Odd p` is not needed for truth. At p=2, von Staudt–Clausen gives v₂(B_(2k)/k)=−1−v₂(k)<0 for every k≥1. The hypothesis matches Kummer's setting.

### Adversarial pass

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| `integer_isLocalization_iff` | R=ℤ, S={(2)}: M=⟨2⟩, M={1}, M=⟨6⟩; R a field; 0∈M | ⟨2⟩: ℤ[1/2] is the localization, and 2 is a unit meeting (2), so both sides are true. {1}: ℤ≠ℤ[1/2], and no m∈(2), so both are false. ⟨6⟩: ℤ[1/6]≠ℤ[1/2], and 6 is not a unit in ℤ[1/2], so both are false. Field: S=∅ and both are true. 0∈M: the zero ring is not a field and 0∉sUnitSubmonoid, so both are false. | Pass |
| `integer_isLocalization_of_torsion_classGroup` | ℤ[√−5], S={𝔭}, 𝔭=(2,1+√−5); a non-torsion class as control | 𝔭²=(2), and 2 is an S-unit meeting 𝔭. For a curve with a non-torsion point class [P] and S={P}, the S-unit elements of R are the constants, which meet no prime, so the hypothesis is needed. | Pass |
| `regularPrime_dividedBernoulli_num` | (5,5), (5,7), (5,2), (3,1), (5,63); (37,16) and k=0 as controls | B₁₀/5=1/66, B₁₄/7=1/6, B₄/2=−1/60 (v₅=−1), B₂/1=1/6. B₁₂₆/126≡B₂/2≡3 mod 5, so B₁₂₆/63≡1. At p=37, num(B₃₂/16)=−7709321041217=−37·208360028141, but p=37 is irregular and excluded. At k=0 Lean gives B₀/0=0, whose numerator is divisible by p, so the case is excluded by 1≤k. | Pass |
| §2.1 support indexing | R a field; ℤ→ℤ[1/p] | Spec¹=∅ gives the identity; the relative sequence is indexed by {p} only. | Pass |
| §2.1 signed Bockstein identity | ℤ[ζ₅] at (11,ζ₅−3), m=5 | 3⁵=243≡1 mod 11, so ζ₅↦3. δB₅x=3, while Bδx=3⁻¹=4, since 3·4≡1. So B∘δ=−δ∘B, multiplicatively. | Pass |
| §2.1 reduction S/p^(r+1)→S/p^r | p=2, r=1 | Multiplication by 2 on K_(n−1)[4]→K_(n−1)[2]; reduction ℤ/4→ℤ/2 on K_n/4. | Pass |
| §3.4 Borel range | SL₂/ℚ; SL₂(ℤ[i]); m=5, q=1; F=ℚ and ℚ(i) | Borel Thm 7.5 with 9.5(3) gives q≤[rk/4]′, i.e. 4q<rk. Γ(3) has index 24 and χ=24·(−1/12)=−2, so it is free of rank 3: H¹=ℝ³ against H¹(sl₂,SO(2))=0. SL₂(ℤ[i]) has vcd 3−1=2, so H³=0 against ℝ. At m=5, q=1, 4q=4=m−1 is excluded. The degree-5 class over ℚ needs m≥22; q=3 over ℚ(i) needs m≥14, against m≥26 for the [F:ℚ]-scaled range. | Pass |
| §3.4 ranks ρ(n) | signatures (1,0) and (0,1); ℤ[1/p] | (1,0): ranks 0 and 1 in degrees 3 and 5. (0,1): ranks 1 and 1. K₁ rank is 1 for ℤ[1/p] against 0 for ℤ. | Pass |
| §3.5 L-tables | R=ℤ | L^s=ℤ, ℤ/2, 0, 0: here W(𝔽₂)=ℤ/2 and coker=Pic(ℤ)/2=0. L^q=ℤ, 0, ℤ/2, 0. | Pass |
| §3.5 homotopy-orbit Checks | Hℤ with trivial and sign C₂-actions; golden ⟨1⟩,⟨ε⟩ | Trivial action: H₀,₁,₂(C₂;ℤ)=ℤ, ℤ/2, 0. Sign action: ℤ/2, 0, ℤ/2. Golden signature vectors (1,1) and (1,−1) have determinant −2. | Pass |
| §4.2 odd-primary w_i | ℓ=3, F=ℚ (r=2, a=1), i=1, 2, 6 | i=1: 1; i=2: 3; i=6=2·3 gives 3^(1+1)=9. Check: w₆(ℚ)=504=8·9·7. | Pass |
| §4.3 dyadic table | ℚ; ℚ(i); ℚ(√−2) | ℚ (a=2): 8 and 2. ℚ(i): 8 and 4. ℚ(√−2): a=3 and 2^(3+1−1)=8, since the image is ⟨3⟩ and gcd_k(3^(2k)−1)=8; weight 1 gives 2. | Pass |
| §4.4 rational values | i=2, 4, 6, 10 | 2³·3=24; 2⁴·3·5=240; 2³·3²·7=504; 2³·3·11=264 (5 is excluded since 4∤10). | Pass |
| §5.4 odd table | ℚ, n=3, 5; w=8 with r=1 and r=2 | ℤ/48; w₃/2=1 with rank 1; ℤ/16; ℤ/16⊕ℤ/2. | Pass |
| §5.5 Sylow valuation | q=7, ℓ=3, r=2; q=19, ℓ=3; q=3, ℓ=2 | |GL₂(𝔽₇)|=2016 and |μ₃≀Σ₂|=18, index 112, which is prime to 3. v₃(18)=2, so μ₃ has index 6. v₂(48)=4≠2+1. | Pass |
| §6.2 signature defect | ℚ(√7), ℚ(√34)[1/2] | ℚ(√7): ε=8+3√7 and 3+√7 (norm 2) are totally positive and −1 is diagonal, so j=1. ℚ(√34)[1/2]: N(5+√34)=−9, and (5+√34)=𝔭₃² has signs (+,−), so j=0. | Pass |
| §6.4 mod-two orders | ℤ[1/2]: r₁=1, r₂=0, s=1, t=j=0 | a=2, b=1, c=1, d=0. The orders 2^(d+1), 2^a, …, 2^c are 2, 4, 4, 4, 2, 2, 1, 2, which is the K-book Cor. VI.9.8 list. | Pass |
| §6.4 two-rank | (1,1,0,0); (2,1,0,1); ℚ(√7) adding the prime above 7 | 1,0,0,0; 2,1,1,0; (s,j) goes from (1,1) to (2,0), so j+s+t−1 stays 1. | Pass |
| §6.5 order ratio | ℚ, i=2 and i=4 | i=2: 2·2/48=1/12 against (H²₂=2)/24=1/12. i=4: 2·1/240=1/120 against 2/240=1/120=|ζ(−3)|. | Pass |
| §6.8 Moore order identity | four-term exact sequence of finite groups; ℚ at i=1 | |A|·|C|=|B|·|D|; WK=0 and {−1,−1}∉K⁺. | Pass |
| §6.9 K versus H² comparison | i mod 4, compared with Weibel §8 | i≡0,1: K{2}=H². i≡3: K{2}↪H² with cokernel (ℤ/2)^(r₁). i≡2: kernel (ℤ/2)^ρ with j≤ρ<r₁. For ℚ(√7), ρ=1, K₄{2}=ℤ/2 and H²=0. | Pass |
| §6.10 norm test | m=4 and m=8 with q^i=3 | m=4: 1+3≡0 and the invariants are {0,2}. m=8: the norm is 4 and the coinvariants and invariants {0,4} both have order 2, so the norm is an isomorphism. | Pass |
| §6.12 special obstruction | ℚ; ℚ(√−14) | ℚ is not special, so the quotient is 0. −14≡2 mod 16, so the field is special (Weibel Ex. 5.6) and the quotient is ℤ/2. | Pass |
| §6.14 matched presentation | K₂(ℤ); ℤ/4↠ℤ/2; K₄(O_(ℚ(√7))) | Upper bound 2 equals the sign-quotient lower bound 2. Upper 4 against lower 2 is rejected. 2^ρ|H²|=2·1=2. | Pass |
| §6.16 degree one | q odd, ℤ against ℤ[1/p] | K₁(ℤ;ℤ/q)=(ℤ/2)/q⊕0=0, while K₁(ℤ[1/p];ℤ/q)=ℤ/q (FGV Lemma 2.10). | Pass |
| §7.1 Bernoulli and w | b₁, b₂, b₅, b₆; D at (5,2,2) and (7,3,4) | 1/6, 1/30, 5/66, 691/2730. D=1/2−4·7=−55/2. D=−8/3−108·773=−250460/3; the correction 378·269=101682 gives 54586/3=49·1114/3, while v₇(250460)=1. | Pass |
| §7.3 Herbrand–Ribet indexing | ℓ=37, k=16; Teichmüller sums at p=5 | 1−32≡5 mod 36, so Ribet (1.1) gives ω^(−31)=ω⁵. The lifts are 1, 7, 18, 24, with Σaω(a)=165 and 165/5=33≡3≡B₂/2; Σaω⁻¹(a)=154≡−1 mod 5. | Pass |
| §7.4 generator degrees | ℓ=3, 5 | Degrees 0, 3, 1 and 0, 7, 1, 5. The dimensions by residue are 1,1,0,1 and 1,1,0,0,0,1,0,1. | Pass |
| §7.5 even orders and Vandiver table | a=0, 2 | c₁=num(1/24)=1, so K₂=ℤ/2. c₂=1, so K₆=0. c₆=691=|K₂₂(ℤ)|. K₃=ℤ/48 and K₇=ℤ/240. | Pass |
| §7.5 structure formulas (R01) | p=2, Hazewinkel ℓ₁=v₁/2; Araki ℓ₁=−v₁/2 | From A2.1.27(e), Δ(t₂)=t₂⊗1+t₁⊗t₁²+1⊗t₂−2ℓ₁(t₁⊗t₁), which is −v₁(t₁⊗t₁) for Hazewinkel and +v₁(t₁⊗t₁) for Araki; this agrees with Ravenel 4.3.15's +v₁b₁₀ (b₁₀=t₁⊗t₁) modulo 2. η_R(v₁)=v₁+2t₁ for Hazewinkel and v₁−2t₁ for Araki. | Pass |
| §7.5 low E₂ (R01) | (1,2), (2,6), (4,8) | d(v₁)=2[t₁], giving ℤ/2. On e₁, e₂, e₃: d=2g, 2g, −2g, so the cocycles are ⟨e₁+e₃, e₂+e₃⟩; d[t₁³]=−3(e₂+e₃) and d[t₂]=e₁−e₂ span them over ℤ_(2), giving 0. The coboundaries in (4,8) are ±2g, giving ℤ/2. | Pass |
| §7.5 stem four (R01) | odd p; p=2 | Odd p: s≥1 forces 3s≤4, so (1,5), which 4∤5 excludes. p=2: s∈{0,2,4}, with (0,4) zero (4<6). d_r out of (4,8) lands in (4+r,7+r), where t<2s. The only d_r into (4,8) is r=3, from (1,6); d₂ and d₄ start in odd t. | Pass |
| §8.1 golden data | ℚ(√5) | r₁+2r₂=2, unit rank 1, order 4, w₂=8·3·5=120, and 4/120=1/30=ζ_F(−1). | Pass |
| §8.6 congruence lattice | n=2, Δ=5; s=2, 3; v=(2) | d=2√5/π≈1.4235. vol(B_t)=2πt=4√5t/d. Covolumes 5q and 5√5q². The tuple (2,2) at q=t=4 lies in B₄², since (4+4)/2=4, but has zero residues. N[a,b]=a²+ab−b², with N(ε)=−1 and N(ε²)=1. | Pass |
| §8.7 cutoff | four bounds | 16d²=320/π²≈32.4<33; (20d)^(2/3)≈9.3<10; d³≈2.88<27/8; (2d)^(12/5)≈12.3<16d², equivalent to d<16. | Pass |
| §8.8 norm-4 step (R02) | rows 1 and 4; minors | Both row identities hold; the minors are 6 and −3, with gcd 3=q−1. | Pass (the data are correct; the finding is about form) |
| §8.9 real signs | g={−1,−1}, h={−1,ε} | (−1,−1) and (1,−1) generate {±1}². | Pass |
| §3.2 curveSteinbergHomology_fg (R03) | rank one over 𝔽_q[t]; 𝔽₂[t,t⁻¹] as control | H_i(𝔽_q^×) is finite for i>0; the control has H₁(ℤ)=ℤ, so the one-point hypothesis is retained. | Pass |

### Sources opened (seeded sample, new passages)

| Target | Source, locator, cache line | Result |
| --- | --- | --- |
| 2.1–2.2 | kbook V.4.3 line 24007, p. 401; V.6.1 line 24317, p. 406; (6.6) line 24544, p. 409; Exercise I.3.8 line 1742, p. 29 | at the cited pages |
| 3.4 | borel1974 Thm 7.5 line 934, p. 259; 9.1 line 1006, p. 261; 9.5(3) line 1070, p. 262; 0.1 line 110, p. 237; 3.3 line 325, p. 243; 3.6 line 422, p. 245; Thm 7.4 line 837, p. 256. borel1977 §5.2 lines 440–461, pp. 626–627 (range below (n−1)/4). kbook IV.1.17–1.18 lines 15754–15779, p. 271; Ex. 1.18.2 line 15795, p. 272 | hypotheses and range as stated |
| 3.5 | hermitian Prop 2.3.1 line 1881 and Cor 2.3.2 line 1904, p. 41; Rem 2.3.3 line 1933, p. 42; 2.3.6 line 1976, p. 43; 2.3.9 line 2031, p. 44; 2.3.10 line 2072, p. 45; Cor 2.3.16 line 2217, p. 47, with proof lines 2222–2239, p. 48 (strict-Lagrangian injectivity); 2.3.18–2.3.19 lines 2250–2264, p. 48; 1.2.12 line 811, p. 18; 1.3.9 line 1380, p. 30; Cor 8 line 214, p. 5 | as cited |
| 4.2–4.3 | kbook Prop VI.2.2 line 28465, pp. 470–471; Prop VI.2.3 line 28494, p. 471 | formula and four-row table as stated |
| 6.4 | kbook (9.6) line 31761, Lemma 9.6.3 line 31793, Thm 9.7 line 31799, pp. 520–521; Cor 9.8 line 31869, Cor 9.9 line 31898, pp. 522–523 | e-row and two-rank formulas as stated |
| 6.5 | kbook Thm VI.9.12 line 32095, p. 525 | statement as cited (misprint in its proof, below) |
| 6.8 | wildkernel Def 0.2 line 51, Lemma 0.3 line 58, Cor 0.4 line 71, pp. 2–3 | as cited, with the positive-group convention |
| 6.9 | wildkernel (0.5)–(0.6) lines 89–96, p. 3; Prop 8.1 line 602, (8.2) line 618, final diagram lines 659–664, pp. 20–21 | as cited |
| 6.12 | wildkernel Thm 5.5 line 449, p. 14; Lemma 7.2 line 556, p. 18; Props 7.6 and 7.8 lines 584 and 592, p. 19; Prop 8.4 line 624, Lemmas 8.5–8.6 lines 637 and 646, Thm 8.7 line 655, pp. 20–21. hutchinson Lemma 5.2 line 800, Cor 5.3 line 802, Rem 5.4 line 809, p. 18; Thm 5.6 line 829, p. 18; Cor 5.7 line 858, p. 19 | as cited |
| 6.14 | kbook III.5.2.2 line 12497, p. 218; III.6.2.1 line 13376, p. 232; VI.8.2 line 31296, p. 513; VI.9.11 line 32029, pp. 524–525 | as cited |
| 6.16 | fgv Prop 2.9 line 533 and (2.6) line 517, p. 12; Lemma 2.10 line 566 and Lemma 2.11 line 586, p. 13; Cor 2.12 line 609 and Rem 2.13 line 636, p. 14; Lemma 2.14 line 649, p. 15 | Prop 2.9 gives i≥2 for ℤ and O_q; the i=0 statement follows from Lemma 2.10 and §2.7, as the README says |
| 7.2 | sharifi Prop 5.2.5 line 4230, p. 134; Rems 5.2.8–5.2.9 lines 4262 and 4267, pp. 135–136 (unrestricted Kummer congruences through the measures E_c^(k)); Cors 4.4.4–4.4.5 lines 3545–3547, p. 113 | supports the all-index congruence used |
| 7.3 | ribet (1.1) line 73, p. 151; (1.2)–(1.3) lines 83 and 97, p. 152; (4.4) line 469, p. 161. sharifi Thm 4.5.7 line 3690, p. 117 | as cited |
| 8.1 | a definitional target with a Needs line and no source locator | Checks recomputed above |
| 8.6 | groenewegen Lemma 6 line 226 (PDF p. 5, printed p. 1447), Lemma 9 line 333 (PDF p. 8, printed p. 1450), Lemma 12 (PDF p. 11, printed p. 1453; proof reference line 473) | journal locators correct |
| 7.5 (new) | ravenel, read from the author's posted copy and fetched only into the review's scratch manifest: A2.1.27(d)–(e) line 18302, pp. 350–351; Def 4.3.14 and Cor 4.3.15 lines 6284–6301, p. 123 (the corollary is stated modulo I_n); Thm 4.4.1 and Prop 4.4.2 lines 6667–6681, p. 130; Thm 4.4.37 line 7270, p. 143; Fig. 4.4.45 line 7320, p. 144; Thm 4.4.47 line 7390, with the preceding paragraph at lines 7382–7389, p. 145; A2.2.1 line 18519, p. 353; A2.2.2 line 18530, p. 354; A2.2.6 line 18662, p. 356 | every page correct. The README's misprint note on 4.4.47 is right. Corollary 4.3.15 is modulo I_n (R01). |

### Library declarations opened at the pins

- Mathlib `Mathlib/RingTheory/DedekindDomain/SInteger.lean:124` `Set.unitEquivUnitsInteger`. The README correctly moved it to the Mathlib contract.
- Mathlib `Mathlib/RepresentationTheory/Homological/GroupHomology/` has group homology. Neither pin has a Tits building, a Steinberg module, Milnor K or a tame symbol (searched by object).
- Tau Ceti `TauCeti/CategoryTheory/Exact/ExactStructure.lean:241` declares `structure ExactStructure` in namespace `TauCeti` (line 63), matching README line 233. `TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean:179` declares `ExactK0`, and line 354 `liftEquiv`.
- Tau Ceti S-integer files: `SInteger/Spectrum.lean:180` `integerHeightOneSpectrumEquiv`; `SInteger/ClassGroup.lean:145` `integerClassGroupEquiv` (the README now attributes it correctly in §7.3); `SInteger/Unit.lean:105` `unitValuation`, with `unitValuation_ker` at line 130; `RingTheory/ClassGroup/RelNorm.lean:154` `relNorm_extendedHom`.
- Docstring claim on formal groups: `TauCeti/RingTheory/FormalGroup/CoordinateChange/HopfAlgebroid.lean` has the Lazard Hopf algebroid (L, L[b₁,…]) and proves its Hopf algebroid equations. `TauCeti/Algebra/Coalgebra/Comodule/Basic.lean:50` has `class Comodule` over a coalgebra. There is no cobar complex and no p-typical BP_*BP. The docstring sentence is accurate.

### Cross-roadmap citations resolved

- HomotopySpheres, open pull request #1287 head: §3A.3 (README line 916, the stable stem as a sequential colimit in `AddCommGrpCat`), §9.2 (line 2709, π₄ˢ=0), and `sphere_homotopyGroup_fourthStem` (its `Suggested.lean` line 177), all as cited. Note for the worker: the other open HomotopySpheres head, #284, numbers the same result “Stage 9, item 2” and has no §3A.3. The pull-request description still says “HomotopySpheres Stage 9, item 2 (#284 or #1287)”, while the README follows #1287's numbering.
- BordismFormalGroups (main): F3 (line 284) covers Hazewinkel generators, the logarithm recursion and BP_*BP with its Hopf-algebroid structure. F4 (line 329) covers comodules, the normalized cobar complex, Ext, the Adams–Novikov spectral sequence, its multiplicative and naturality laws, and convergence to X_(p) for bounded-below X (line 450).
- GeneralizedCohomology (main): G2 item 5 (line 302) identifies π_n S with the stabilized sphere colimit. G3 item 9 (line 878) gives π_n(S⁻¹E)=S⁻¹π_nE.
- AutomorphicLFunctionsAndLocalFactors at #924: AL.3.10.5 and AL.3.10.7, at lines 2345 and 2365.
- On main: AlgebraicCurves Layers 0 and 12; JacobianChallenge Layer B (line 135); SchemeAndStackFoundations §3.3 (line 4713); EllipticCohomology §E4.S (line 913; the overlap is in R01).
- Declared gaps: both slugs are in `design/plan.json` (StableHomotopyKTheory Layer 7; GeometryOfNumbersAndQuadraticArithmetic §6.11) and in README lines 269 and 410. Both are unchanged and precise.
- Ownership against open pull requests, checked by object with the roadmap search over main and all 472 open heads: wild kernels, the Harris–Segal summand, K₄(ℤ)=0, the signature defect, Steinberg homology, the golden tame kernel and borelInvariantFormComparison have no second owner. BorelRegulators (#1461) consumes ArithmeticKTheory §§3.2–3.4, and K2SymbolsBrauer (#1302, its line 2849) mentions K₂(ℤ[i]) only in a Check. The overlap report finds no pull request that changes this roadmap and no cited id that is dropped.

## Not verifiable

- Grayson, LNM 966, pp. 69–90 (`grayson-curve`): paywalled, uncertified and cited by its page range, which is settled.
- Waived texts (`harris-segal`, `mitchell`, `quillen` Seattle, `bass-tate`, `serre`, `groenewegen-preprint`): their locators were kept as given and not read. The Groenewegen locators not marked “journal” are declared to be preprint pages (References, README lines 5227–5229). They coincide with the journal PDF's page indices (Lemma 6 on p. 5, Lemma 7 on p. 6, Lemma 9 on p. 8, Lemma 12 on p. 11, Theorem 15 on p. 12), so whether they match the preprint could not be checked.
- AINTLIB declaration names and signatures in §§7.1–7.3 (external repository at commit 02bd7de): not opened. The argument of §7.2 relies on the supplier's unrestricted statements, not on those signatures.

## Source issues

- **Misprint** in ravenel at Theorem 4.4.47, printed page 145: the source says d₃(ᾱ_(4i+3))=ᾱ₁³ᾱ_(4i+3); it should be ᾱ₁³ᾱ_(4i+1), as the paragraph before it derives and as the target bidegree (4,8i+8) requires; affects nothing.
- **Misprint** in kbook at proof of Theorem VI.9.12, printed page 525: the source says the 2-primary order of K_(2i−2)(O_S) for 2i−2≡6 mod 8 is h_(1,i)(2)/2^(r₁); it should be h_(2,i)(2)/2^(r₁), the order of H̃² from Theorem 9.11; affects nothing (the stated formula is correct).
