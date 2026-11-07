# Review of GL2AutomorphicRepresentationsAndTransfer (pull request #931 at 385d7a8)
**Verdict:** needs changes

**Previous findings (round 3 at dfb2bb6), checked passage by passage.**

- **R01 (AlgebraicModularFormsAndSerreWeights fragment names): repaired.** `README.md:346–349` now reads "R15.5 (§5.10, Deligne–Serre eigenvalue lifting, and §5.14, eigenform lifting with weight shifts) … R15.6 (§7.4–§7.5, residual modularity witness)". The *Needs* lines at `:2980`, `:3055`, `:3070` and `:3080` cite §§1.1, 1.2, 2.1, 2.3, 2.5, 3.1, 5.10, 5.14, 7.4–7.5 and 7.7. I resolved every one at that roadmap's open head, at its README lines 115, 143, 275, 295, 311, 592, 1297, 1341, 1554, 1586 and 1682. No slug remains (0 hits). The resolver's leads at `:3055` (R15.2) and `:3080` (R15.3) are false positives: its line 18 defines R15.1–R15.5 as aliases of Layers 1–5.
- **R02 (AL.2.2 cited for the lower-right quotient): repaired.** `:296–297` reads "The lower-right quotient and the integral-scalar decomposition of K₀ are stated in R16.1.3, not supplied". `:571–573` states both facts. `:582` adds the 𝔽₂ Check. Both are verified in the table.
- **R03 (gaps not recorded where the intake reads them): unchanged, not re-raised.** The repair lies outside this folder. Under the brief's gap rules it is not a defect of the folder: the two contracts at `:252–275` remain precise, minimal and addressed to a named roadmap. The worker should still post them on ArithmeticGaloisRepresentations' job: at its head (README lines 157–160) that roadmap assigns both items to an "ArithmeticGaloisRepresentations Part II" that exists nowhere.
- **R04 (mutual citation with QuaternionicModularForms): superseded.** At its head 69e6e45, QuaternionicModularForms no longer cites this roadmap upward. Its only mention of it is under Downstream consumers (its line 1192). QuaternionicModularForms is now in the merge order at position 67, before this roadmap at 91. So the citation this roadmap used to make was a valid downward one. The author instead moved that roadmap's material into this one, which is R01 below.
- **R05 (garbled API sentences): repaired at all five places** (`:734–736`, `:800`, `:1557`, `:1589`, `:2708`). A sixth sentence with the same pattern is R06.

## R01 (P2) — R17.3.8a–R17.3.8d re-plan QuaternionicModularForms §§1.3, 2.1–2.3 and 3.1, an earlier supplier

**Location:** `README.md:78–81` "R17.3.8a–R17.3.8d own the algebraic coefficient modules with their determinant normalization, the quaternionic level forms with their evaluation and norms, the classical quaternionic form spaces and their Hecke operators". Also `README.md:1688–1987` and the 15 declarations at `Suggested.lean:187–367`.

**Claim:** This roadmap owns the coefficient modules `L_{n,s}`, the level forms `M_D(U,A)`, the classical spaces with their dimension formula, and the Hecke operators with `T_v²=T_{v²}+(q_v+1)S_v`.

**Witness:** QuaternionicModularForms (merge order 67; head 69e6e45), README:465 dimension `∏_σ(n_σ+1)`, :468 `SymmetricPower` comparison, :532 level forms on `D_fˣ`, :589 `#Cl(U)·∏_σ(n_σ+1)`, :875 `T_v²=T_{v²}+(q_v+1)S_v`. Its :1192 names this roadmap as their consumer.

**Repair:**
- **Delete the duplicated material.**
  - In the README: R17.3.8a–R17.3.8d, together with the passages that introduce or cite them (`:5–9`, `:78–83`, `:150–155`, `:196–201`, `:351–363`, `:407–409`, `:2075`, `:2079`) and the references `[gross99]`, `[loeffler11]` and `[shimura71]` (`:3243–3245`).
  - In `Suggested.lean`: the declarations `algWeightSlash` … `gl2_hecke_T_sq` (lines 187–367), the docstring paragraph (lines 28–37 and the clause at 50), and the three imports used only by them (`HeckeRing.Associativity`, `CharacterTwist`, `ClassicalGroups.SymmetricPower`).
- **Restore the previous head's consumption.** Scope and the supplier contracts should cite QuaternionicModularForms §1.3 (algebraic weights and the determinant normalisation), §2.1 (`M(U,A)` over any number field), §2.2–§2.3 (classical spaces and the trivial-stabiliser dimension) and §3.1 (`T_v`, `T_{v²}`, `S_v`, `U_v`, diamonds, the relation, commutation and bounds).
- **Keep in R17.3.9 only what that roadmap does not state.** That is the division-place coefficient adapter `w|u=τ(u_p)⁻¹w`, the Pan colimit and the inverse-coset comparison, as at dfb2bb6. If R17.3.9 needs something QuaternionicModularForms lacks (forms at an open non-compact level, splittings at a ramified place), declare it as a gap on that roadmap; do not restate it here. The Hurwitz-level Check (dimensions 1, 0, 0, 1) can move to R17.3.9 as a test of the adapter.
- **Pull-request description.** Once the citation is restored, the merge-order paragraph must name QuaternionicModularForms.
- **These are not headline theorems in any case.** Independently of ownership, the 15 declarations are API facts of the coefficient and Hecke formalism, not headline theorems of this roadmap: a unit law, a rank count, a Hecke-triple instance and a degree identity.
- **Tested:** a scratch copy with lines 187–367 and the three imports removed (and with R02 and R03 applied) elaborates with exactly 10 `declaration uses sorry` warnings and nothing else.

## R02 (P3) — The gate's build check fails on Lake's module-system warning

**Location:** `Suggested.lean:1–7` (`import Mathlib` and six `import TauCeti.…` lines, with no `module` header).

**Claim:** The targeted build is clean apart from `sorry`.

**Witness:** The gate reports `build=2 FAIL`, twice: "imports `Mathlib` … designed for use with the module system". Merging main moved the pins to Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`; all six imported Tau Ceti modules open with `module`.

**Repair:** Begin the file with `module`, write `public import Mathlib` and `public import TauCeti.…`, and wrap the namespace in `public section … end`. Tested on a scratch copy of the present file: `lake env lean` exits 0 with 19 `declaration uses sorry` warnings and nothing else. Elaboration itself is clean: this is the gate counting a Lake advisory, hence P3.

## R03 (P3) — Three statement-hygiene hits of the gate

**Location:** `Suggested.lean:163–183` (`quaternionAlgEquivOfLocalSplitting … : Nonempty (QuaternionAlgebra K (a : K) 0 (b : K) ≃ₐ[K] …)`); `:394` (`letI : v.asIdeal.IsPrime := v.isPrime`); `:359` (`haveI := gl2Integral_isHeckeTriple L`).

**Claim:** The statements are written cleanly.

**Witness:** `gate.md` lists exactly these three hits. Mathlib already makes the `letI` redundant: `Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean:495` has `attribute [instance] HeightOneSpectrum.isPrime`.

**Repair:**
- **The `Nonempty` theorem.** Rename it `nonempty_quaternionAlgEquiv_of_localSplitting`; no canonical isomorphism exists to state instead. Update `README.md:1470`. QuaternionArithmetic's README line 227 cites the old name, so give the old → new name in one line of R17.1.5, or have the worker notify that roadmap.
- **The `letI`.** Delete the line.
- **The `haveI`.** It goes with R01. If kept, declare `gl2Integral_isHeckeTriple` as an `instance`.
- **Tested:** a scratch copy with the rename and without the `letI` elaborates with 19 `sorry` warnings and nothing else.

## R04 (P3) — R17.2.5 states and cites a condition that JL (16.1.7) is not, while R17.2.6 relies on JL's form

**Location:** `README.md:1567` "If a finite local factor `f_v` satisfies `∫_{N(Fv)}f_v(xny)dn=0` for every x,y … The K-averaged constant-term identity printed for the Steinberg projector is weaker and is not substituted". Also `:1573` "*Source:* [jl70], §16 equation (16.1.7)".

**Claim:** (16.1.7) is the all-x,y condition, and the K-averaged identity is not used.

**Witness:** jl70-ubc lines 16816–16823: (16.1.7) is `∫_K∫_N f_v(k⁻¹ank)=0` for diagonal `a`, giving trace `ρ(f_v,μ,ν,s)=0` and the vanishing of (iv)–(viii). R17.2.6 (`:1587`) applies it to Steinberg projectors, whose operator on unramified principal series is nonzero (`:1496`).

**Repair:** State R17.2.5 in JL's form: vanishing of the K-averaged constant term at every diagonal `a` kills the split orbital integrals, `θ(0,f_v)` and every trace `tr ρ(f_v,μ,ν,s)`. It therefore kills the continuous and derivative terms, which JL write as products of these local traces (jl70-ubc lines 16784–16790). Cite (16.1.7) for this. Keep the all-x,y operator statement only as a stronger variant with its own justification, or drop it, since R17.2.6 is its only consumer.

Instance: `ζ_χ` satisfies the restated hypothesis, and its trace is 0 on an unramified unitary principal series. It fails the all-x,y hypothesis, since its operator there is `e_H^ξ−e_K^χ`, the difference of projections onto two different lines.

## R05 (P3) — The supplier contracts name superseded pins

**Location:** `README.md:114` "At Mathlib `6b7abb3`, the matrix carrier is …"; `:159` "At Tau Ceti `a91d3aa`, import the following APIs".

**Claim:** These are the pins the contracts are checked against.

**Witness:** Since the merge of main, `lake-manifest.json` pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, with `lean-toolchain` at `v4.36.0-rc2`.

**Repair:** Replace both hashes. Every declaration the contracts name that I checked resolves at the new pins (list under Verified sound), so nothing else changes.

## R06 (P3) — One garbled API sentence remains

**Location:** `README.md:2926` "The API includes Ramified Frobenius-semisimple compatibility with N; equality of characteristic-zero conductor …".

**Claim:** The API lists are prose.

**Witness:** This is the same list-fragment pattern as the five sentences repaired at `:734`, `:800`, `:1557`, `:1589` and `:2708`.

**Repair:** Write "The API gives: ramified Frobenius-semisimple compatibility with N; equality of the characteristic-zero conductor and the primitive level away from ℓ; …".

## Verified sound

**Scope.**
- I read both files at 385d7a8 in full: README 3252 lines, `Suggested.lean` 465 lines, and the one-line `metadata.toml`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder adds a new roadmap and re-plans none on main, apart from R01, which concerns an open roadmap.
- A grep for "so far|to be checked|current|removed|checkpoint|handoff|packet|deferred|optional|for later|round n|review" gives 0 hits.
- The worker's gate is 0 on every other scanner (sorry-data, set_option, latex, residue, imports, readme-ids, depcheck and the rest).

**Dependency check (run this round):**

```text
depcheck: 240 roadmaps, 2389 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Every supplier cited is on main or earlier in the merge order. That includes RestrictedPowerSeries (on main), AdelicAlgebraicGroups (34), AutomorphicFormsOnReductiveGroups (66), QuaternionicModularForms (67) and AlgebraicModularFormsAndSerreWeights (90). ModularCharactersAndBlocks (92) consumes R17.5.11–R17.5.12 (its README lines 80–89 and 185–189). That is a downward edge, consistent with this roadmap's ownership of Brauer characters and Fong–Swan.

**Elaboration.**
- I ran `lake env lean` on a scratch copy with `#check @name` for all 25 declarations: no errors and 19 `declaration uses sorry` warnings, one per theorem.
- `gl2Integral` and `gl2IntegralMonoid` drop `[TopologicalSpace L] [IsNonarchimedeanLocalField L]`. This is harmless: they need only `ValuativeRel`, and the two theorems that use them keep both binders.
- The other 23 elaborated types keep their stated binders and match their README statements in generality. Examples:
  - `supercuspidalProjective` keeps the local-field instances.
  - `chevalley_power_congruence` keeps `[Group.FG ↥E]` and `0 < n`.
  - `solvable_finite_image_integral_lift` keeps `[Finite Γ]`, solvability, `[Fact p.Prime] [CharP k p] [IsAlgClosed k]`.
  - The two newform statements keep `[IsGalois ℚ E]`, coprimality, `Q.LiesOver`, `Algebra.IsUnramifiedAt ℤ Q` and `IsArithFrobAt ℤ σ Q`.
  - `classicalForms_finrank` is more general than the README (any homomorphism `τ`, not only `ι_T`). That point is moot under R01.

**One-tactic probe.** I replaced each `sorry` by `first | rfl | simp | infer_instance | decide | exact trivial | aesop` in a scratch copy. All 19 theorems fail: unsolved goals, aesop failures, and one heartbeat timeout on `algWeightSlash_mul`. No declaration closes in one tactic.

**Headline inventory.** The README headlines are unchanged from round 3. They are:
- the finite-place correspondence with its conductor and factor comparisons;
- Chevalley congruence and full-local prescription;
- supercuspidal projectivity;
- the classical and Hilbert dictionaries;
- quaternion ramification and local–global isomorphism;
- local and global Jacquet–Langlands;
- cyclic, solvable and cubic base change;
- solvable Artin automorphy;
- the characteristic-two classification and residual modularity.

The ten statements at `Suggested.lean:78–183, 375–463` are those statable at the pins. The module docstring (`:39–62`) names what the others lack. I found no further statable headline and no stand-in.

**Seeded sample.** I read the texts from the sources cache, at the line numbers given.

| Target | Text and locator | Outcome |
|---|---|---|
| Fixed-space comparison (R16.2.7, now via R16.1.3) | cg20 lines 182–191 (§1.3, printed pp.805–806) | `dim π^Iw = 2 = 2·dim π^Sph`; in characteristic zero `U_p` spans `π^Iw` from the spherical vector. The source's "not trivial" is a slip (Source issues). The scalar decomposition is now proved in R16.1.3 (table). |
| Ramification realization (R17.1.5) | prr23 not readable (Not verifiable). Main-branch inputs: GlobalQuadraticForms `Suggested.lean:350` `exists_hilbertSymbol_eq_neg_one_iff_pair`; ClassFieldTheory `Suggested.lean:3116` `eq_zero_of_localInv_eq_zero` | Inputs exist; the parity and sign instances are in the table. |
| Quaternion proof (R17.2.6) | jl70-ubc lines 15824–15832 (Theorem 16.1, printed p.260), 16816–16841 ((16.1.7), printed p.275) | (16.1.7) at two or more places kills (iv)–(viii). The source calls its proof a formal sketch (Source issues). R17.2.5's use of the same equation is R04. |
| Classical coefficient and Hecke adapter to Pan's spaces (R17.3.9) | pan26-global lines 2967–2970 (§5.4.1, p.68), 3075–3086 (Definition 5.4.11, p.71), 3231–3288 (§5.5.5, pp.75–76) | The source gives: the law `f(dh^p h_p)=h_p⁻¹·f(d)` and the action `(h_p·f)(d)=h_p·f(dh_p)`; `A¹` nonzero only for `n₁=n₂`; `T_S=ℤ_p[T_l,S_l]`; for k≥1 the spectrum lies in `σ_{k+2,1}`, with `π_p` special or supercuspidal and highest weight `(0,−k)`; for k=0 it is `σ_{2,1}∪σ_0`. The README matches all of these. The identification `W(k,0)=L_{k,−k}` is computed in the table. The adapter's present dependence on R17.3.8 is R01. |
| Whittaker-type-module bridge (R17.4.13b) | gj78 lines 2055–2070 ((9.1.2.1)–(9.1.2.2)), 2089–2110 (§9.2), 2151–2158 (Theorem 9.3(4)), 2212–2224 ((9.5.1) at t=1/4, (9.5.5)) | Matches as stated. |
| Cubic monomial input (R17.4.17) | jpss79 (OCR) lines 1519–1531 (Theorem 14.2, pp.253–254), 1587–1595 (p.255) | Gives a unique `π_v` matching all GL₁-twisted factors, with π cuspidal. The non-normal remark says the induction is irreducible, or a character plus a degree-two monomial. As stated. |
| All-place comparison (R17.4.17) | henniart02 lines 126–131 (théorème of §1.5, printed p.590); deligne73 lines 1282–1289 ((5.6.2), p.549), 1335–1341 (5.11, p.551), 901 (Théorème 4.1), 1972–1977 ((8.12.1), p.572) | The locators are correct. The local constants are the declared gap. |
| Oddness API (R17.5.13) | bcgp21 line 12593 (Proposition 10.1.3) and the solvable case of its proof | Tate lift, then Langlands–Tunnell. The determinant lemma is the README's own deduction (table). |
| Domain test, Order test (R17.5.15) | tunnell78 (OCR) lines 193–197 (Theorem 1.3, pp.182–183) | Gives a global F and place v with `F_v≅K` and `ρ_v≅σ`; the type is preserved; for S₄ over ℚ₂, F=ℚ and `det ρ(c)=−1`. The two tests are computed in the table. |
| Construction and local finiteness (R17.5.16) | patrikis line 1374 (Lemma 2.3.1, p.28); carayol86 line 1558 (§11.2, p.450) | As stated. |
| Parabolic comparison (R17.6.4, R17.6.3a–b) | varshavsky05 lines 323, 360, 371 (§1.2.2, Proposition 1.2.5, Corollary 1.2.6), 605 (§1.5.7), 629–652 (Definition 2.1.1, Theorem 2.1.3); carayol86 lines 1808–1860 (§12.2.1–12.2.3) | The stabilise and contract definitions and the contraction theorem match R17.6.3b word for word in content; branch values are in the table. |
| Finite stabilisers (R17.3.8c, touched by R01) | loeffler11 lines 691–699 (Assumption 3.1.3, Proposition 3.1.4, p.15) | Locator correct. |

**Adversarial pass.** Values were computed this round, the numerical ones by script. "Retain" means no change.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| R16.1.3 two new facts (previous R02) | g, h ∈ K₀(pⁿ); g·diag(g₂₂⁻¹,g₂₂⁻¹); residue 𝔽₂ | `(gh)₂₂=g₂₁h₁₂+g₂₂h₂₂≡g₂₂h₂₂` mod pⁿ, so the map is a homomorphism with kernel K₁ and section `diag(1,d)`; the product has (2,2) entry 1 and (2,1) entry `g₂₁/g₂₂∈pⁿ`, so it lies in K₁; over 𝔽₂, `(O/p)ˣ=1` and K₀(p)=K₁(p) | Retain |
| R16.2.7 Iwahori oldforms | basis (v, π(s)v); (2 1;−1 0); unramified χ∘det | matrix [[λ,qc],[−1,0]] gives `X²−λX+qc`; `(U−1)=(1 1;−1 −1)` squares to 0; both invariant spaces are 1-dimensional | Retain |
| `chevalley_power_congruence` | E=⟨2⟩⊂ℚˣ: n=2 with T={2}; n=3 | `2^j mod 3 = 1,2,1,2,1,2` (≡1 iff 2∣j); `2^j mod 7 = 1,2,4,1,2,4` (≡1 iff 3∣j) | Retain |
| `finite_hecke_full_local_prescription` | ℚ, S={2}, `χ₂=(−1)^{v₂}` | Ψ = quadratic character mod 5: Ψ(2)=−1, Ψ(−1)=Ψ(4)=+1 (even, trivial at ∞), unramified at 2; the value −1 is the same under either reciprocity sign | Retain |
| `supercuspidalProjective` | `𝔽_q((t))`, ℝ; trivial character; `π⊗ρ` with `ρ(g)=(1 v(det g);0 1)` | the instance holds for `𝔽_q((t))` and fails for ℝ; the trivial character is the non-split quotient of `I(ν^{−1/2},ν^{1/2})`; ϖI acts by `ω(ϖ)(1 2;0 1)`, not semisimple, so this module is outside the fixed-ω category | Retain |
| `existsQuaternionRamification_iff` | ℚ: ∅; {2,∞}; {2}; a complex place | (1,1) gives M₂(ℚ); `(−1,−1)_∞=(−1,−1)_2=−1` and +1 at odd p (even set); {2} is odd and excluded by the product formula; a complex place is never nonsplit and the right side is false | Retain |
| `quaternionAlgEquivOfLocalSplitting` (rename: R03) | (−1,−1) vs (−1,−3) over ℚ | `(−1,−3)_∞=−1`, `(−1,−3)_3=(−1/3)=−1`, so it ramifies at {3,∞} ≠ {2,∞}: the hypothesis fails and the conclusion is false, consistently | Retain |
| Quaternion proof (R17.2.6) | (16.1.7) at two places; two Steinberg factors | jl70-ubc line 16823: (iv)–(viii) vanish; trace product (−1)(−1)=+1 | Retain |
| R17.2.5 (R04) | ζ_χ on unramified unitary principal series | trace `1−1=0`, but the operator is a difference of projections onto the K-line and a w-eigenline, which are different lines, so it is nonzero; it satisfies (16.1.7)'s conclusion and fails the all-x,y hypothesis | R04 |
| Pan adapter (R17.3.9) | `W(k,0)`, right action `w|u=τ(u)⁻¹w`; scalar z | `W(k,0)≅Sym^k`; R17.3.8a's left module `Sym^n⊗det^{−n−s}` equals it at `n=k, s=−k`; scalar u acts on `L_{k,−k}` by `u^{n+2s}=u^{−k}`, which equals `τ(u)⁻¹` | Retain (source of `L_{k,−k}`: R01) |
| R17.3.8a slash (R01) | n=1, s=0, γ=(1 1;0 1), δ=(1 0;1 1); 50 random γ, δ at n=3, s=2; scalar 2 on L_{3,1}; diag(1/2,1) | `(1|γ)|δ=z+1=1|(γδ)`, `1|(δγ)=z+2`; right action holds in all 50; factor 32=2^{3+2}; eigenvalues 1, 1/2 = `std⊗det⁻¹` at diag(2,1) | Mathematics correct; owner is QuaternionicModularForms |
| `algWeight_equiv_symPowerRep` (R01) | `w=(0 1;−1 0)`, generic g | `w g w⁻¹=(d −c;−b a)=det(g)·(g⁻¹)ᵀ`, so `P|g⁻¹=det^{−n−s}·Sym^n(w)Sym^n(g)Sym^n(w)⁻¹`; Sym^n of a free rank-2 module is free on the monomials over any commutative ring | True; R01 |
| R17.3.8a global units (R01) | ℚ(√3), u=2+√3: n+2s=(1,3) and (2,2) | `σ₁(u)σ₂(u)³=0.07180=7−4√3`, not a root of unity; `N(u)²=1.0000` | True; R01 |
| `quaternionLevelForms_finite` / `classicalForms_finrank` (R01) | M₂(ℚ), GL₂(Ẑ), τ trivial; open non-compact U | one class, space = L, dimension ∏(n_i+1); open U contains a compact open U′ and Cl(U′)→Cl(U) is onto; invariants of a finite module over a Noetherian ring are finite | True; R01 |
| R17.3.8c Hurwitz Check (R01) | 2T/±1 = A₄ on the (2ℓ+1)-dimensional representation, ℓ=0..3 | `(χ(1)+3χ(π)+8χ(2π/3))/12 = 1, 0, 0, 1`; `dim S_k(Γ₀(2)) = 0, 0, 1` at k=4, 6, 8 | Correct; move to R17.3.9 |
| R17.3.8c Splittings (R01) | K = ℚ̄₃ (allowed), A = M₂(K) over F_v = ℚ₃ | `TauCeti.skolemNoether` (`TauCeti/Algebra/CentralSimple/SkolemNoether.lean:107`) needs `[FiniteDimensional F_v A]`, which fails here; it applies over K to `D_v⊗_{F_v,σ}K` instead | Note for any kept adapter |
| R17.3.8d / `gl2_hecke_T_sq` (R01) | degree identity at q=2,3,4,5; U_ϖ at t=2, q=2 | (q+1)² = q²+q+(q+1): 9, 16, 25, 36; α over O/p² gives 4 matrices for 2 cosets | True; R01 |
| `finite_projective_lift` | trivial r; open kernel | lifts; an open kernel in a profinite group gives finite image | Retain |
| `solvable_finite_image_integral_lift` | GL₂(𝔽₂)≅S₃, p=2; n=0 | lifts to the reflection lattice, `det(transposition)=−1≡1`; the zero module is not irreducible | Retain |
| R17.5.13 oddness | diag(1,−1) over ℤ at 3 and at 2; −I | det −1, −1≠1 mod 3; mod 2 the identity has residual det 1=−1; det(−I)=+1 | Retain |
| R17.5.15 tests | x=2, −1, 5; a=1, 2, 3 in ℤ/4 | values −1, 1, 1; i, −1, −i, with `χ(1)²=χ(2)=−1` | Retain |
| R17.5.16 CM construction | L=ℚ(i), a=1+i | `a/ā=i`; the phase `e^{iπ/4}` has order 8 and its square is i | Retain |
| `solvable_characteristicTwo_projective_dihedral` | GL₂(𝔽₂); A₄; S₄ | ≅D₃ (n=3); a normal V₄ fixes a unique line, so the representation is reducible; S₄ has a nonabelian Sylow 2-subgroup | Retain |
| `odd_solvable_artin_weight_one` | Std(S₃) of ℚ(∛2,ζ₃): p=5, 7, 31 | 3³≡2 mod 5 and `x²+3x+4` is irreducible mod 5 (disc 3 is a non-residue), so a transposition: trace 0, det −1, `(−3/5)=−1`; 2 is not a cube mod 7, so a 3-cycle: trace −1, det 1; at 31 the roots are 4, 7, 20 (4³=64≡2, 7³=343≡2, 20³=8000≡2), split, trace 2 | Retain |
| `characteristicTwo_solvable_weight_one` | the same field, mod 2 | traces 0, 1, 0 at 5, 7, 31; det 1; the lift's `a_p = 0, −1, 2` reduce to these | Retain |
| R17.4.13b bridge | q=4, t=1/4, χ=1, s=2 | full L = 1.25837; constituent 1.10108; ratio 1.14286 = 8/7 | Retain |
| R17.4.17 cubic | `Ind 1` for a non-normal cubic; A=diag(2,3) | `1⊕Std(S₃)`; 3-cycle eigenvalues 1, ζ, ζ²; transposition 1, 1, −1; type (1,2) gives A and A² | Retain |
| R17.4.17 norm phase | `N(C+a,b,c)−3(C+a)` identity on [−3,3]³; values | identity True for C=±1; N(0,1,0)=2, N(0,0,1)=4, N(1,1,1)=1; Q = −3, 0, 3; disc −108, −108/4 = −27; −3≡5 mod 8 is a non-square | Retain |
| R17.4.17 λ-constants | ℝ³, ℝ×ℂ | `(d,−1)_∞ = +1, −1` | Retain |
| R17.5.7 exclusion | A=diag(e^{iπ/6},e^{−iπ/6}), B=−A | tr A = 1.7321, tr B = −1.7321, tr A² = tr B² = 1.0, tr A³ = tr B³ = 0; projective order of A is 6 | Retain |
| R17.5.17 mod-3 section | the two generators over ℤ[√−2] | the group they generate has 48 elements; under √−2↦−1 they reduce to (1 1;0 1) and (0 1;1 0) | Retain |
| R16.3.6 gamma | Γℂ(1), Γℝ(1)Γℝ(2), Γℂ(2) | 0.31831, 0.31831, 0.050661 = 1/(2π²) | Retain |
| R17.6.3b ℙ¹×ℙ¹ | c₁(t,s)=(t²,s) | H⁰, H², H⁴ traces 1, 2+1, 2 (total 6); fixed components t=0, 1, ∞ with χ(ℙ¹)=2 each | Retain |
| R17.6.4 branches | (a,d) = (2,3), (1,pᵐ), (3,2) | 6 ≥ 6, so contraction with n=a; pᵐ ≥ 2; (3,2) uses the dual stalk; equal orders give a positive-dimensional fixed locus | Retain |

**Pinned declarations opened** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`).

*Mathlib:*
- `IsHeckeTriple` (`Mathlib/NumberTheory/HeckeRing/Defs.lean:75`, fields `left_le`, `right_le`, `commensurable`, `le_commensurator_right`)
- `HeightOneSpectrum.isPrime` (`Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean:495`, made an instance there)
- `MvPolynomial.basisRestrictSupport`, `DoubleCoset.Quotient`, `MvPowerSeries.IsRestricted`
- `NumberField.Units.dirichletUnitTheorem.unitLattice_span_eq_top`, `NumberField.Units.mem_torsion`, `MonoidHom.domRestrict_surjective` (each by `#check`)

*Tau Ceti:*
- `TauCeti.symPowerRep` (`TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:57`)
- `Representation.charTwist` (`TauCeti/RepresentationTheory/CharacterTwist.lean:86`)
- `HeckeCosetModule.single` (`TauCeti/NumberTheory/HeckeRing/Basic.lean:969`)
- `LeftCosetModule.deg` (`TauCeti/NumberTheory/HeckeRing/Degree.lean:104`)
- `TauCeti.skolemNoether` (`TauCeti/Algebra/CentralSimple/SkolemNoether.lean:107`, A finite-dimensional and simple, B central simple)
- `TauCeti.QuaternionAlgebra.oneEquivMatrix` (`TauCeti/Algebra/Quaternion/Split.lean:121`)
- `TauCeti.IsProjectiveRep.exists_monoidHom_of_cohomologyClass_eq_zero` (`TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean:223`)
- `TauCeti.simple_indFDRep_ofLinearCharacter_iff` (`TauCeti/RepresentationTheory/Induction/Mackey/LinearCharacter.lean:115`)
- `TauCeti.Matrix.GeneralLinearGroup.not_isSolvable_fin_two` (`TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Solvable.lean:36`)
- `HeckeRing.GL2.Newform` and `dirichletLift` (`…/Newforms/Newform.lean:104, 134`), `qExpansion_coeff_one` (`:164`)
- `Newform.eq_of_forall_notMem_eigenvalue_eq` (`…/StrongMultiplicityOne.lean:172`)
- `satakeParameters_eq_pair_iff` (`…/Newforms/Satake.lean`, namespace `HeckeRing.GL2.Newform`)
- `CuspForm.LSeries_qExpansion_coeff_eq` (`…/LFunction/Basic.lean:177`)
- `TauCeti.GlobalNumberFields.Modulus` and `infinitePart` (`…/RayClass/Modulus.lean:98, 104`), `support` (`:174`)
- `TauCeti.GlobalNumberFields.HeckeCharacter` (`…/HeckeCharacter/Basic.lean:70`)

The README's descriptions of what each provides match.

**Cross-roadmap citations resolved this round.**
- AlgebraicModularFormsAndSerreWeights: §§1.1–7.7 as listed above, at its head.
- QuaternionicModularForms: lines 22–60, 387–600, 867–905 and 1190–1200, at 69e6e45.
- AutomorphicFormsOnReductiveGroups: §7.4 (its line 1220, the abstract carrier `S(J,M)` with `IsHeckeTriple`-based Hecke operators), §7.5 and §7.6.
- AdelicAlgebraicGroups: §5.3 *quaternion-class-sets* and *definite-quaternion-stabilizers* (its lines 5497–5530), finite class sets at compact open levels for every quaternion algebra.
- ArithmeticGaloisRepresentations: lines 157–160 and 2408–2409.
- ModularCharactersAndBlocks: lines 80–89 and 185–189.
- QuaternionArithmetic: line 227.
- On main: GlobalQuadraticForms and ClassFieldTheory (lines above), RestrictedPowerSeries §§0.1 and 2.2 (its lines 193 and 324).

The other citations are unchanged since dfb2bb6 and were resolved in round 3. The citation resolver's three Lean-name leads (`jacquetLanglands`, `localJacquetLanglands`, `AutomorphicForm`) are planned names of PadicLocalLanglandsForGL2Qp §6.9 and ArithmeticLocallySymmetricSpaces ALS.F.6, not pinned declarations.

**Ownership by object.**
- R17.3.8a–R17.3.8d: the coefficient modules, level forms, classical spaces and quaternionic Hecke operators are owned by QuaternionicModularForms, the abstract carrier by AutomorphicFormsOnReductiveGroups §7.4, and the class sets by AdelicAlgebraicGroups §5.3. That is R01.
- The global Weil group, Chevalley's theorem, Brauer characters and Fong–Swan, the n=2 outside-S converse and the Varshavsky interfaces have no other owner among main and the open pull requests searched with `roadmaps grep`. ModularCharactersAndBlocks explicitly defers Brauer characters and Fong–Swan to R17.5.11–R17.5.12.
- Ownership against open pull requests whose files the brief does not supply was checked only through the `roadmaps grep` index.
- No declaration of `Suggested.lean` shares a fully qualified name with a declaration in a roadmap I could read; QuaternionicModularForms' `Suggested.lean` declares nothing.

## Not verifiable

- **prr23**, Theorem 1.33, pp.42–43. Cambridge book; no legal copy (unchanged from round 3). Its inputs were checked through GlobalQuadraticForms and ClassFieldTheory on main.
- **jl70** paginations. The README cites the IAS retypeset. In the UBC retypeset I read (jl70-ubc), Theorem 16.1 is on printed p.260 and (16.1.7) on p.275. The content is verified; the IAS page numbers are not.
- **gross99** (Israel J. Math., cited without any theorem, section or page) and **shimura71** (book). Neither was fetched. Both are cited only by the R17.3.8 block that R01 deletes.
- **jpss79** and **tunnell78**: read from the OCR text already in the sources cache. jpss79 is the copy from Jacquet's author page; my re-fetch without a licence class was refused for that host. The fetch of cg20 timed out this round; I read cg20 from the cached copy of the same URL. No text is requested.
- Not read this round; their locators are cited by number only: bh06 (uncertified), bz76, casselman73, converse, cogdell-fields, getz15, ddt, wiese04, langlands80, ac89, cdt99, cg18, hkp10, dlb17, nt26, artin-tate, tate-global, clozel90, rt83, rt97.

## Source issues

- **Error** in cg20 at §1.3, printed p.805: the source says a smooth admissible irreducible unramified representation that is not trivial has a two-dimensional Iwahori-fixed space; it should say infinite-dimensional, since a nontrivial unramified determinant character has a one-dimensional one; affects a stated result.
- **Gap** in jl70 at Theorem 16.1 and the paragraph after it, printed p.260 of the UBC retypeset: the source says its proof is only a formal sketch whose analytic facts it has not verified; it should supply the convergence and trace identities; affects the proof.
