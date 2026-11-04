# Review of SerreWeightAndLevelOptimisation (pull request #1013 at c9bed25)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/SerreWeightAndLevelOptimisation/README.md` and `Suggested.lean` at head c9bed259. The gate fails on one rule (`residue`, 67 hits), the dependency check is clean, the targeted build and a fresh elaboration pass with `sorry` as the only warning, and the three stated theorems match their sources. Two blocking findings: a supplier declaration cited by a name that does not exist (R01) and a statable headline theorem missing from `Suggested.lean` (R02). The rest is P3.

## R01 (P2) — Cited FiniteFlatGroups declaration `HasFiniteFlatModel.of_isUnramified` does not exist

Location: `README.md` line 87 (supplier contracts: "From `FiniteFlatGroupsAndIntegralPadicHodgeTheory:§§R07.1.2, R07.6.8` (`HasFiniteFlatModel.of_isUnramified`)"), consumed by §6.5 (line 1594, *Needs:*).

Claim: FFG §§R07.1.2, R07.6.8 supply, under the name `HasFiniteFlatModel.of_isUnramified`, "finite étale models of unramified finite local Galois modules over `Z_2` and the implication finite étale ⇒ finite flat".

Witness: in FiniteFlatGroupsAndIntegralPadicHodgeTheory at its open head, §R07.6.8 is titled "Finite flatness under unramified base change, finite extension and twisting" and proves `finiteFlatBaseChangeTwist` (parts (i)–(iv): base change along unramified extensions, restriction to finite extensions, twisting by unramified characters, uniqueness for `e<p−1`). The only named `HasFiniteFlatModel.*` declarations in that README are `HasFiniteFlatModel.of_addEquiv` and `HasFiniteFlatModel.prod` (its §R07.6.6 region, lines 8627–8629 of the shown README); `of_isUnramified` occurs nowhere in FFG, on main, in any open head, or at the pinned Tau Ceti (`roadmaps resolve` lead confirmed by grep).

Repair: in the contract and in §6.5 cite the sections that actually carry the content: "FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.2 (finite étale group schemes over a connected base are `π₁`-modules: an unramified finite `G_{ℚ₂}`-module is the generic fibre of a finite étale `ℤ₂`-group) and §R07.1.24a (`HasFiniteFlatModel`, satisfied by any finite étale model)". Delete the invented name. Keep §R07.6.8 only for the twisting clause (iii), if §6.5 uses it.

## R02 (P2) — Ribet's weight-two bridge (§4.7) is statable at the pins but absent from `Suggested.lean`

Location: `README.md` §4.7 "Weight two at level Nℓ" (line 1139); Scope line 7 ("§4.7 owns the weight-two coefficient-prime bridge"); `Suggested.lean` module docstring lines 20–34 (does not name §4.7).

Claim: the docstring lists which headline theorems are not statable; §4.7 is neither stated nor listed.

Witness: §4.7 restates Ribet, Report, Theorem 2.2 (ribet94 lines 280–281): `ρ` arises from `S_k(Γ1(N))`, `ℓ∤N`, `2≤k≤ℓ+1`, `ℓ>3` or `N>3`, then `ρ` arises from `S_2(Γ1(Nℓ))`. Every carrier is already in the file: `HeckeRing.GL2.Eigenform N k`, `IsResidualEigenform`, `CharP k ℓ`, `IsAlgClosed k`. The sibling theorem `strip_coefficient_prime_powers` (Theorem 2.1 of the same source) is stated with exactly these carriers. The Scope paragraph names §4.7 as one of three owned theorems alongside §§2.10 and 4.8, and §3.9 and the §6.12 manifest consume it.

Repair: add, after `strip_coefficient_prime_powers`,

```lean
/-- Weight two at level Nℓ (README §4.7; Ribet, Report, Theorem 2.2). -/
theorem weight_two_at_level_mul_prime
    (ℓ N : ℕ) [NeZero N] [NeZero (N * ℓ)] [CharP k ℓ] [IsAlgClosed k]
    (hℓ : 3 ≤ ℓ) (hN : ¬ ℓ ∣ N) (hsmall : 3 < ℓ ∨ 3 < N)
    (ρ : Representation k (L ≃ₐ[ℚ] L) (Fin 2 → k)) [Representation.IsIrreducible ρ]
    (red : integralClosure ℤ ℂ →+* k) {w : ℤ} (hw : 2 ≤ w ∧ w ≤ ℓ + 1)
    (f : HeckeRing.GL2.Eigenform N w)
    (hnorm : (qExpansion 1 f.toCuspForm).coeff 1 = 1)
    (hf : IsResidualEigenform ℓ ρ red f) :
    ∃ g : HeckeRing.GL2.Eigenform (N * ℓ) 2,
      (qExpansion 1 g.toCuspForm).coeff 1 = 1 ∧ IsResidualEigenform ℓ ρ red g := by
  sorry
```

and mention it in the README's `Suggested.lean` paragraph (line 54). The level-raising criterion of §2.4 is the other candidate; it needs a q-newness predicate, so naming it in the docstring as not statable is enough.

## R03 (P3) — Gate failure: 67 `<a id=…>` anchors

Location: `README.md` lines 167, 187, 217, 249, 273, 287, 316, 336, 356, 406, 428, … (every target carries one; 67 in total, `grep -c '<a id='`).

Claim: the gate's `residue` rule forbids `<a id=` anchor tags; the gate reports FAIL on this rule alone (all other scanners, depcheck and the build pass).

Witness: `gate.md` for c9bed25: `residue=67 … FAIL`; the listed lines are all anchor tags.

Repair: delete the 67 anchor lines; the board reads only `### k.n` headings, so link intra-README by section number ("§2.10") instead of `[…](#level-lowering-unramified-prime)`. No acceptance while the gate fails.

## R04 (P3) — Backticked Lean names and Check labels that claim declarations `Suggested.lean` does not have

Location: `README.md` §2.3 lines 370–386 (`complexConjugationAuxiliaryPrime`, `…_residue`, `…_trace_det`, `…_infinite`, `…_ext`, `…_simp`, `…_baseChange`, `…_chebotarev`, `…_five`), §3.13 lines 917–935 (`minimalWeightOneIdeal` and nine variants), §5.1 lines 1205–1221 (`buzzardMultiplicityOne` and eight variants), §6.6 lines 1613–1633 (`kwOptimisationData` and ten variants) and `kwOptimisationData_determinant_alignment` (lines 1597, 1657); Check labels `(aux_trace.)`, `(aux_joint.)`, `(aux_bad_prime.)`, `(weight_one_bad_trace.)`, `(buzzard_full_factor.)`, `(kw_k2_overlap.)`, … (14 labels, lines 394–398, 949–953, 1231–1237, 1639–1645).

Claim: 41 API bullets of the form "- `name`:" and 14 Checks carry backticked or parenthesised Lean-style names.

Witness: `Suggested.lean` declares only `UnramifiedAt`, `IsResidualEigenform`, `ribet_level_lowering`, `strip_coefficient_prime_powers`, `congruent_nebentypus` (SigCheck probe, `#check` on all five). The README's own contract paragraph (line 54) states the rule: a backticked name of this roadmap's own is a claim that `Suggested.lean` declares it; a Check never names a Lean counterpart.

Repair: write the API bullets in prose ("The predicate depends only on …"), drop the trailing `(…)` labels from the Checks. The mathematics of the bullets is sound (see the adversarial table) and should stay.

## R05 (P3) — Stale supplier anchors and a misplaced namespace

Location: `README.md` line 113 ("From `AlgebraicModularFormsAndSerreWeights:target-s-type-arises-from-and-modular`: Use `TauCeti.ResidualModularity.ArisesFrom`"), lines 125 and 1594 area (`r16-0-local-langlands`), §1.4 lines 259, 279, 293.

Claim: AMFSW has a target with anchor `target-s-type-arises-from-and-modular`, Tau Ceti has `TauCeti.ResidualModularity.ArisesFrom`, and GL2AutomorphicRepresentationsAndTransfer has an anchor `r16-0-local-langlands`.

Witness: AMFSW at its open head numbers its targets flatly; the predicate is defined in prose in `### 7.5 S-type and modularity predicates` ("Define `ArisesFrom(f,p,ρ̄)` by the existence of one unital ring map …"); no `<a id=` with that slug exists. The pinned Tau Ceti (a91d3aa) has no `ResidualModularity` namespace (grep of `.lake/packages/TauCeti`); AMFSW's `Suggested.lean` uses `namespace TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights` … `namespace ResidualModularity` and states `residual_attachment`, not `ArisesFrom`. GL2ART has `### R16.0.1 The finite-place local Langlands interface` and no `r16-0-local-langlands` anchor.

Repair: cite "AlgebraicModularFormsAndSerreWeights §7.5 (`ArisesFrom`, defined there)" without the `TauCeti.` prefix, and "GL2AutomorphicRepresentationsAndTransfer §R16.0.1" without the anchor. Same for the three §1.4 *Needs:* lines.

## R06 (P3) — `strip_coefficient_prime_powers` admits weight one, beyond §4.2 and its source

Location: `Suggested.lean` lines 92–103 (`{w : ℤ}` unconstrained); `README.md` §4.2 line 1041.

Claim: README §4.2 restates Ribet, Report, Theorem 2.1; the Lean statement is at the same generality.

Witness: Ribet's "arises from Γ" means from weight-k cusp forms, `k ≥ 2` (ribet94 lines 168–169; Step 1 line 201 "We assume that k ≥ 2"). The Lean quantifies over every `w : ℤ`, so it asserts the theorem for a classical weight-one eigenform at level `Nℓ^r`. The assertion is true: multiply by `E_{ℓ−1}` (`ℓ≥5`) or `E₄` (`ℓ=3`), both `≡ 1 mod ℓ` (240 ≡ 0 mod 3), lift by Deligne–Serre to weight `≥ 2` at the same level with the same good-prime traces and determinants (`r^{ℓ−1} ≡ 1`, `r^4 ≡ 1 mod 3`), then apply Theorem 2.1; but that step is in neither §4.2 nor its *Needs:*.

Repair: either add `(hw : 2 ≤ w)` to the theorem, or add the weight-one Eisenstein step to §4.2 with `ModularForms:Layer 0` and `AlgebraicModularFormsAndSerreWeights:R15.5` in its *Needs:*.

## R07 (P3) — Sharifi page locators do not match the text served at the cited URL

Location: `README.md` line 227 ("Theorems 4.2.5, 4.2.7, 4.2.9 and Corollary 4.2.12, pp. 46–47; §4.3, equation (4.3.1) and Theorem 4.3.3, pp. 50–51"), line 229 ("proof of Theorem 4.3.3, p. 50"), References line 1886 ("printed pp. 45–51").

Witness: the file at `https://www.math.ucla.edu/~sharifi/aws-iwasawa.pdf` (served as `misc/aws-iwasawa.pdf`, 77 pages, printed page numbers equal to PDF pages) has Theorems 4.2.5 and 4.2.7 on p. 43 (sharifi lines 1484, 1493), Theorem 4.2.9 and Corollary 4.2.12 on p. 44 (lines 1513, 1526), (4.3.1) and Theorem 4.3.3 on p. 47 (lines 1638, 1646) and the proof on pp. 47–48 (lines 1647–1656). The statements themselves match the README (constant term `ξ/2`, `T₀` with image `½ξ`, `h/I ≅ Λ/(ξ)`).

Repair: correct the pages to 43–44 and 47–48, or name the revision of the notes that has pp. 45–51.

## R08 (P3) — Diamond, *The refined conjecture of Serre*, is cited but not in References

Location: `README.md` line 155 ("Theorem 1.1, *The refined conjecture of Serre*, Hong Kong proceedings (1995), pp. 22–37") and line 1267 (§5.2a, "Diamond, *The refined conjecture of Serre*, Lemma 2.2 with m=r>3").

Claim: both the general-character descent (§2.13) and the auxiliary-level character replacement (§5.2a) rest on this text.

Witness: the References list (lines 1852–1886) has no entry for it; no open copy was found (International Press proceedings; see Not verifiable).

Repair: add a References entry with the full bibliographic data, marked as cited by locator only.

## R09 (P3) — Deferrals to roadmaps that exist nowhere

Location: `README.md` lines 17 ("belongs to GL2ModularityLiftingDefectOne"), 1848 ("GL2ModularityLiftingDefectOne consumes …", "GSp4NonregularModularityLifting consumes …", "Weight-zero higher-rank automorphy consumes …").

Witness: `roadmaps show GL2ModularityLiftingDefectOne` and `… GSp4NonregularModularityLifting` return "no roadmap … on main or in an open roadmap pull request"; neither is in the board's package index or the merge order. The Scope paragraph assigns ownership of Calegari–Geraghty 2018 Theorem 4.8's scalar upper bound to the first of them.

Repair: either name an existing owner for the CG18 Theorem 4.8 upper bound (GL2ModularityLifting is open and cites this roadmap's §§3.7, 3.14) or phrase line 17 as a boundary of this roadmap ("not built here") without naming an owner, and keep the three consumers only as prospective consumers.

## R10 (P3) — §1.3 misattributes its nodal-algebra test to IKM Proposition 2.10

Location: `README.md` line 71 ("including the nodal-algebra test of IKM24 Proposition 2.10").

Witness: IKM (arXiv 2206.08212v3, p. 16, lines 732–740) Proposition 2.10 is the comparison `M/(M[p_A]+M[I_A]) ↠ Ψ_A(M)` with torsion kernel, an isomorphism when `depth_A M ≥ 1`; its worked example (Example 2.11) is `A = O[[t]]/(ϖ²t)`, `M = A/(ϖ³)`. The nodal algebra `{(a,b): a ≡ b mod π}` is this roadmap's own Check; its values `η=(π)`, `Ψ_λ(A)=O/(π)` are correct (computed below).

Repair: "including the nodal-algebra test below, compared with IKM24 Proposition 2.10 and Example 2.11".

## Verified sound

**Gate and build.** Worker gate at c9bed25: every scanner 0 except `residue=67`; `depcheck=0`, `build=0`. My rerun of the dependency check: `depcheck: 208 roadmaps, 1474 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line; the roadmap is at line 145 of the merge order and every cited supplier is earlier (AMFSW 84, HilbertModularVarietiesAndShimuraCurves 142; the consumers AutomorphicGaloisRepresentations 147, ClassicalSerreModularity 150, EllipticCurveModularity 151, PadicFamilies 153, GL2ModularityLifting 155 are later). `lake env lean Suggested.lean` from the worktree: exit 0, three `declaration uses sorry` warnings (lines 74, 92, 107), 11 s. No edit outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SerreWeightAndLevelOptimisation'` empty); `metadata.toml` is `topic = "math.NT"`.

**Lean signatures.** `#check @` on all five declarations (scratch `SigCheck.lean`, elaborated against the built module): `UnramifiedAt`, `IsResidualEigenform` carry `[Field L] [NumberField L] [Field k]` only; the three theorems carry `[hGalois : IsGalois ℚ L]` through `include`, `[CharP k ℓ] [IsAlgClosed k]`, `[ρ.IsIrreducible]`, and the README hypotheses (`3 ≤ ℓ`, `¬q ∣ M*ℓ`, `f.χ = 1`, `a₁ = 1`; `¬ℓ ∣ N`; `5 ≤ ℓ`, `2 ≤ w`, `hε`). Nothing was lost to section variables. Pinned carriers opened: `HeckeRing.GL2.Eigenform` (TauCeti `NumberTheory/ModularForms/Newforms/Eigenform.lean:76–90`: `extends CuspForm ((Gamma1 N).map (mapGL ℝ)) k`, `χ : (ZMod N)ˣ →* ℂˣ`, `eigenvalue : ℕ+ → ℂ`, `isEigen` at every positive index, `ne_zero`); `IsArithFrobAt` (Mathlib `RingTheory/Frobenius.lean:183`, `variable (R)`, `σ • x ≡ x^{#(R/Q∩R)} mod Q`, hence arithmetic Frobenius `x ↦ x^r`); `AddSubgroup.inertia` (`Algebra/Group/Subgroup/Basic.lean:1177`, `{σ | ∀ x, σ•x − x ∈ I}`); `Ideal.LiesOver` (`RingTheory/Ideal/Over.lean:124`); `MulChar.ofUnitHom` (`NumberTheory/MulChar/Basic.lean:158`); `Representation.IsIrreducible` (`RepresentationTheory/Irreducible.lean:29`, `IsSimpleOrder (Subrepresentation ρ)`); `UpperHalfPlane.qExpansion` (`NumberTheory/ModularForms/QExpansion.lean:171`). The fixed `red : integralClosure ℤ ℂ →+* k` is equivalent to the classical "some prime λ′ of the coefficient field": `Aut(ℚ̄)` acts transitively on primes of `ℤ̄` above `ℓ` and surjects onto `Gal(F̄_ℓ/F_ℓ)`, so a Galois conjugate of any witness `g` reduces through `red` to the prescribed eigensystem.

**One-tactic probe.** Copy with each `sorry` replaced by `first | (simp; done) | infer_instance | trivial`: all three theorems fail (`assumption failed` with the full goal). No padding; both definitions have real bodies on native carriers.

**Sampled targets against the texts** (source ids: ribet94 = Ribet, Report; buzzard00; edixhoven92 = author revision, PDF pages = author pages; gross90 printed = scan + 444; cg18/cg20 author pages; kw2 author pages; wiese04/wiese07 printed = PDF + 122 / + 66; bs20 printed; rs = Ribet–Stein, README pages = printed = PDF − 4):

| Target | Locator checked | Result |
| --- | --- | --- |
| 2.1 | ribet94 lines 152–165 (`n(p,ρ)=Σ (1/(G₀:G_i)) dim V/V_i`), Thm 4.2 lines 394–395, (4.3) line 427 | matches; exponent 3 for Swan 1 with no invariants, 1 for tame rank-one fixed space |
| 2.5 | ribet94 Thm 6.1 lines 823–840: `U=[[T_q,q],[−1,0]]`, `η=U²−1`, `δ′δ=[[q+1,T_q],[T_q,q+1]]`, `σ=[[−1,T_q],[0,−1]]∘δ′`; character-group transpose lines 871–876; general-weight `η=U²−q^{k−2}⟨q⟩` line 696 | matches; product recomputed below |
| 2.11 | ribet94 (4.5) lines 499–506, remark lines 507–510 | matches; the "φ quadratic" remark is the vacuous case the README notes (Source issues) |
| 2.13 | wiese04 Thm 10 p. 131 lines 388–396 (`p≠2` is Diamond Thm 1.1); ribet94 §4, §7 | matches; Diamond's text not readable (Not verifiable) |
| 3.6 | gross90 Prop 13.8 p. 497 lines 2069–2102 (part 3: `ρ_f|G_p` diagonalisable; `k=p` needs `a_p²≠ε(p)`); bcg25 §2.3 p. 515 lines 321–338 (`f=ΔE₄²E₆`, `a₁₀₇≡−1`, companion weight 82, `ρ_f≅ε^{−25}ρ_g`, cites Prop 13.8(3)) | matches, including the inverse-cyclotomic convention |
| 3.7 | edixhoven92 Rem 4.4 p. 10 lines 365–371 (`k(ρ)≤k_ρ`; cases `1` vs `p`, `3` vs `4`; exceptional = extension of an unramified ε by itself), Thm 4.5 p. 11 lines 374–380, intro items 1–3 p. 3 lines 79–88; cv92 Thm 0.1 p. 1, Cor 0.2 p. 3 | matches; README's `k(ρ)`/`k_ρ` swap is stated in Conventions |
| 3.13 | cg18 §3.2.4 pp. 20–22 lines 820–861 (`T^an`, `T_∅`, `m_∅`, char. poly `X²−T_xX+⟨x⟩`); cv92 Cor 0.2 and the following paragraph p. 3 lines 90–94 | matches |
| 4.1 | ribet94 Thm 1.3 lines 106–110 (`ℓ≥5`, `ε′≡ε mod v` ⇒ same weight/level, character `ε′`); gross90 Prop 9.3 remarks p. 478 lines 1295–1302 (level-13 counterexamples for `p=2,3`) | matches `congruent_nebentypus` |
| 5.1 | buzzard00 Def 2.1 p. 100 lines 273–274, Def 2.2 pp. 100–101 lines 280–292 (odd M if finite, `2∥M` otherwise), Lemma 2.3 p. 101, Prop 2.4 p. 101 lines 304–327 | matches |
| 5.2a | buzzard00 Cor 2.6 proof p. 103 lines 402–414 (Diamond Lemma 2.2 with `m=q>3`; `χ′_q(−1)=1`, `q≡3 mod 4` ⇒ odd order ⇒ trivial; `a₂` preserved) | matches |
| 5.3 | buzzard00 Lemma 2.5 p. 102 lines 351–353, Cor 2.6 p. 103 | matches (trace nonzero, `q≡3 mod 4`, `a₂` kept) |
| 5.7 | buzzard00 Prop 1.1 p. 97, Lemma 1.2 p. 99 lines 228–233, Prop 1.3 p. 99 lines 234–239; gross90 Prop 8.18 p. 477 (nonsplit example `N=11,p=3`), Prop 9.3 pp. 478–479 | matches |
| 5.11 | buzzard00 Prop 2.4 and remark pp. 101–102 lines 328–338, remarks to Thm 3.1 p. 107 lines 594–603; wiese07 Cor 4.2 p. 77 (`r=½(dim T[m]+1)`), Cor 4.5 pp. 78–79 (`p=2` needs a Katz weight-one form); kw1 §1 pp. 2–3 lines 79–82 | matches |
| 6.3 | bs20 Lemma 2.1 p. 359 lines 191–193 ((i) `p∤ℓMM₀`; (ii) `p∤ℓM₀`, `p∥M`, `p+1≡±c_p`); eq. (3) p. 358 lines 169–173 | matches; `q=ℓ` excluded by `q∤ℓM₀` |
| 6.11 | kw2 §8.3 pp. 74–75 lines 3446–3496 (A/B/C, `γ_v²=ψ_v`, A↔(i), B,C↔(ii)), Thm 8.4 pp. 75–76 lines 3504–3540, proof pp. 76–78 (tower, `r₀`, "up to unramified order 2 twist", not split at p in `(C),k=2` or `p=2,k=4`) | matches |

Also checked while reading: ribet94 Thm 1.5 lines 131–136 (M may contain `ℓ`-powers) = `ribet_level_lowering`; Thm 2.1 lines 177–178 = `strip_coefficient_prime_powers` (see R06); Thm 5.1 lines 610–618 and the auxiliary-prime paragraph lines 629–644 = §§2.3–2.4; (6.2)–(6.3) lines 889–899 = §2.7; §7 (7.1)–(7.10) lines 1175–1304 = §§2.8, 2.10 (`2μ≤λ`, `2λ≤2μ`, splitting from `q≡−1 mod ℓ` odd); Thm 8.1 lines 1311–1313 = §2.9 weight-two branch for odd `ℓ`. edixhoven92 Thm 2.5 p. 5, 2.6 p. 6, Prop 2.7 p. 6, Thm 2.8 pp. 6–7 (with the `p=2` adaptation) = §§3.1–3.4; Thm 9.2 p. 28 cases (2)–(3) = §5.2. cg18 Thm 4.8 and Rem 4.9 p. 65 lines 2586–2606 (`p≥3`, minimal among twists, `N*`, `T∋T_p`) and the Tate sequence lines 2620–2623 = §§3.10–3.11. cg20 Lemma 8.14 pp. 65–66 = §3.14 (see Source issues). kw2 Def 7.9 p. 68, Lemma 7.10 p. 69, Lemma 8.1 p. 70, Thm 8.2 p. 71 (all branches of the §6.7 table), Lemma 8.3 pp. 73–74 (`F[P¹(k_w)]=1⊕V`, `V=⊗Sym^{p−1}`), Lemma 7.1 p. 60, Lemma 7.7 p. 67 = §§6.6–6.10. kisin09 §3.1 opening p. 1145 "We continue to assume p>2" = §6.9. rs §1.4 pp. 12–13 (141A1: `N=3·47`, `Δ=3⁷·47`, `N(ρ₃)=47`, `k=4`), §2.4 pp. 30–31 (Thm 2.10), Thm 3.19 p. 49 (unramified hypothesis explicit), Lemma 3.17 p. 50 (`Frob_p = pT_p` on `T(F̄_p)`) = §§6.1–6.2, 5.6, 2.6. wiese04 Thm 9 pp. 130–131 (odd dihedral, unramified at p ⇒ Katz weight one of level `N`, character `det ρ`) = §5.10 and the GL2ART §R17.6.12 contract. ribet90 Prop 3.3/Variant 3.4 p. 440, Prop 3.7 p. 445 (`w_q=−T_q` on the torus), Prop 3.8 p. 446 = §2.6 Deuring–Eichler paragraph. IKM Prop 2.10 (arXiv v3 p. 16) = the §1.3 definition of `Ψ`.

**Adversarial pass** (values on both sides):

| Statement | Instance | Computed | Result |
| --- | --- | --- | --- |
| 1.2 `C_level=H/(P+Q)` | `O²`, `P=O(1,0)`, `Q=O(1,π)` | `R²/(R(1,0)+R(1,a)) ≅ R/(a)`: `a=π` gives `O/(π)`; `a` unit gives 0; `a=0` (`Q=P`) gives `O`, not torsion | matches the three Checks; complement hypothesis needed |
| 1.3 `η_λ`, `Ψ_λ` | `A={(a,b):a≡b mod π}`, `λ=pr₁`, `M=A` | `ker λ={(0,πb)}`; `Ann={(πa,0)}`; `η=(π)`; `(ker λ)A=0×πO`; `A/(ker λ)A≅O` via `pr₁`; image of `M[ker λ]={(πa,0)}` is `πO`; `Ψ=O/(π)` | matches; `M=O` through λ: `Ψ=0` while `O⊗_A O′=O/(π)≠0` |
| 1.3 Eisenstein specialisation | `p≥5` | `λ_E(T₀)=ξ/2`, `η=(ξ/2)=(ξ)` since 2 is a unit | matches sharifi Thm 4.3.3 proof |
| 1.4 Jacobian support | `N=1`: `J₀(1)=0`, zero ring; `N=11`: `T=ℤ`, `J[p]≠0` for all `p` | no maximal ideal / nonzero torsion | matches Checks |
| 2.3 auxiliary prime | `ℓ=5`, `diag(1,−1)` | trace 0, `det=−1≡4`, `χ(Frob_r)=−1` ⇒ `r≡4 mod 5` | matches; at `ℓ=2`, `1≡−1`, scalars merge (§2.10 Check) |
| 2.4 criterion | roots `a, qa` | `tr=a(1+q)`, `det=qa²=ε(q)q^{k−1}` ⇒ `a²=ε(q)q^{k−2}` ⇒ `a_q²=ε(q)q^{k−2}(q+1)²`; converse over `F̄_ℓ` by choosing the sign of `a` | equivalence holds; `a≠0` automatic since `det≠0` |
| 2.4 Check 11a1 | `ℓ=7`, `q=29` | `#E(F₂)=5`, `a₂=−2`; `#E(F₂₉)=30`, `a₂₉=0`; disc of `X²+2X+2` is `−4≡3`, a nonsquare mod 7 (squares `1,2,4`); `(29+1)²≡4≠0` | matches |
| 2.5 `σ∘δ=η` | symbolic | `[[−1,T_q],[0,−1]]·[[q+1,T_q],[T_q,q+1]] = [[T_q²−q−1, qT_q],[−T_q, −q−1]] = U²−1` with `U²=[[T_q²−q, qT_q],[−T_q,−q]]` | identity holds over any commutative ring |
| 2.9 counting identity | `μ_ℓ×ℤ/ℓ` over `ℤ_ℓ`, `ℓ` odd | `[M:W]=ℓ`; special fibre points: `μ_ℓ` gives 1, `ℤ/ℓ` gives `ℓ` ⇒ `ℓ` | matches |
| 2.11 twist | `α|I_q=ω_q^i`, `φ=ω_q^{−i}` | conductor `q²→q`, residual trivial | matches (4.5); with `ε` of prime-to-`ℓ` order the case is empty (see Source issues) |
| 3.1 determinant | `χ^{k−1}λ(ε(p)/a_p)·λ(a_p)` | `=χ^{k−1}λ(ε(p))` | matches Check |
| 3.5 companion | `k′=p+1−k` | `(k′−1)+(k−1)=p−1`; `det(χ^{k−1}⊗ρ_g)=εχ^{2k−2+p−k}=εχ^{k−1}`; `p=107,k=26 ⇒ 82`; `k=p ⇒ k′=1` | matches |
| 3.14 socle | `F₇`, `α=2`, `β=3` | `⟨p⟩=αβ=6`; from `T=U+⟨p⟩V`, `TF=5F`, `UF=2F` ⇒ `6·VF=3F` ⇒ `VF=4F=α^{−1}F`; `VF=βF=3F` would give `UVF=6F≠F` | matches; exposes the cg20 misprint |
| 3.14a | `ℤ₂/8`, `A=E₄` | `240≡0 mod 8` so `E₄≡1`; `2⁴≡0`; odd `n`: `n⁴≡1 mod 16` | matches |
| 3.3 negative controls | supersingular `E[p]`; `μ₂` vs `ℤ/2` over `ℤ₂` | `p²` generic points, 1 special point; `μ₂`,`ℤ/2` same generic module, 1 vs 2 special points | matches |
| 4.1 parity | odd `ℓ` | `ε′(−1)≡ε(−1)=(−1)^k`, `±1` distinct mod `λ` ⇒ `ε′(−1)=(−1)^k` | hypothesis is derivable, as stated |
| 4.1 Check `η(τ)η(23τ)` | `ℓ=11`, `θ` of order 11 mod 23 | `ε′=εθ` has order 22 and is odd; conductor exponent 1 ⇒ `ρ|I₂₃=1⊕ψ`, `ψ` of order 22 ⇒ projective inertia cyclic of order 22 ⇒ dihedral image; rotations contain inertia so the quadratic field is unramified at 23 and everywhere else (level 23) ⇒ impossible | matches |
| 4.3 square root | `θ` of order `ℓ^a`, `2t≡−1 mod ℓ^a` | `ξ=θ^t`, `ξ²=θ^{−1}`; no solution at `ℓ=2` | matches |
| 4.4 constant | `ℓ=3`, `i=4` | `L(−3, 1 mod 3)=(1−3³)ζ(−3)=−26/120`, `c=−13/120`, `v₃(c)=−1<0` | matches Check |
| 4.6 trace step | `ℓ=5`, `E=E₄`, `a=4` | `g=E−625E(q⁵)`: `q`-coefficient 240, `v₅=1`; `g|W=25E(q⁵)−25E(q)` (using `E|W=25E|V`, `(E|V)|W=E/25`, `W²=1`): `q`-coefficient `−6000=−2⁴·3·5³`, `v₅=3=1+a/2` | matches |
| 5.2a parity | `r≡3 mod 4` | `v₂(r−1)=1`; even ⇒ odd order; `≡1 mod λ` ⇒ trivial; unramified special trace `a(1+r)≡0 mod 2` | matches |
| 6.1 `M₀` | `(33; 6,2; 3)`, `(141; 7,1; 3)`, `(141; 7,1; 7)`, `(45; 7,7; 7)` | `11`, `141`, `47`, `9` | matches all four Checks |
| 6.6 alignment | odd `p`, ratio of order `p^m` | `ζ=(ψ′/ψ)^{(p^m+1)/2}`, `ζ²=ψ′/ψ` | matches; the `ℚ(i)` example at `p=2` is odd, so no square on a totally real field |
| 6.8 Steinberg | `f=2` | `#P¹(F_{p²})=p²+1`, `dim V=p²=(p)(p)` | matches |
| 6.9 Gram | symbolic | `det[[Nq+1,T_q],[T_q,ψ(π_q)(Nq+1)]]=(Nq+1)²ψ(π_q)−T_q²` | matches |
| `ribet_level_lowering` | `M=1`, `q≥11` | conclusion asks for a level-one weight-two eigenform, which does not exist; the theorem then says an irreducible `ρ̄_f` of prime level `q` is ramified at `q` (Mazur/Ribet) | consistent |
| `strip_coefficient_prime_powers` | `w≤0`: no eigenform (vacuous); `w=1`: true via `E_{ℓ−1}`/`E₄` | see R06 | true, wider than source |
| `congruent_nebentypus` | `N≤2`: `(ZMod N)ˣ` trivial, `ε′=χ=1`, `g=f` | — | consistent |

**Cross-roadmap citations resolved** (each at the cited roadmap's open head or on main): AlgebraicModularFormsAndSerreWeights identifiers R15.1–R15.5 = Layers 1–5, R15.5A = Layer 6, R15.6 = Layer 7 (its line 18), §§3.1, 3.2, 3.3, 3.4, 3.7, 3.8 (`p≥3`, `N≥5` as the README says), 3.13, 3.14, 4.1, 4.5, 4.9, 4.10, 4.11, 5.10, 6.2, 6.4, 7.5; ModularCurvesPartII §§7.1, 7.2, 9.11, 11.1, 12.2–12.4, 13.2–13.6, 14.1–14.15 (incl. 14.4a), 15.1–15.8, 17.7 (`modularJacobian_semistableTorsion`); NeronModelsAndSemistableAbelianVarieties §§2.4, 4.1–4.7, 4.14 (`SemistableTorsionDatum`, `SemistableTorsionLaws`, `SemistableTorsionFrobeniusLaws`, `TwoPlaceSemistableTorsionDatum`), 5.3h; HilbertModularVarietiesAndShimuraCurves R18.3 (two parts), R18.4, §§R18.3.5, R18.3.18, R18.3.24 (`twTwist_commonLiftableImage`), R18.3.25–27, R18.3.29, R18.3.31, R18.3.32 (`ramifiedSign_independentOfEigenform`), R18.4.17, R18.5.15–R18.5.18 (`ShimuraJacobianTorsionDatum`), R18.6; GL2AutomorphicRepresentationsAndTransfer §§R16.0.1, R16.3.1–R16.3.5, R17.3, R17.4, R17.5, R17.5.1, R17.5.9, R17.6.4, R17.6.12; ArithmeticGaloisRepresentations Layers 3, 4, §§1.7–1.8, 3.1–3.3, 3.6, 4.1, 4.4–4.7, 5.1–5.7, 6.1–6.4, anchor `inertia-filtration-predicates` (§6.3: `InertiaUnipotentTowards`, `IsInertiaFiltration`, `HasMultiplicativeType`); ArithmeticGaloisDuality §§R02.4.5b, R02.4.6, R02.6.2 ("Finite-order determinant twists"); GlobalGaloisDeformations §§4.4, 4.8–4.11; LocalGaloisDeformationRings §§8.2–8.5, 8.13–8.18; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.2, R07.1.3 (`card_points_quot_multiplicativePart`), R07.1.7–1.9, R07.1.24a (`HasFiniteFlatModel`, `GaloisModel`), R07.1.26–1.32, R07.3.4–3.18, R07.5, R07.6.1, R07.6.8 (see R01); IntegralIwasawaTheory §§9.0–9.1; IntegralHeckeAndGaloisDeterminants IHG.1 = Layer 1; AutomorphicFormsOnReductiveGroups anchors `anemic-eigensystems`, `galois-anemic-eigensystem`, `arithmetic-hecke-normalization`, `eigenIdeal`; on main: ModularForms Layers 0, 2, 3, 4, 5, 6, 8, 8G, 8W (sublayer of 8), ClassFieldTheory Layers 7, 11, 12, Chebotarev Layer 10, ModularCurves, LocalGaloisGroups (Completed). The AutomorphicCongruences cited as a consumer is board package #129.

**Ownership.** No other open pull request or main roadmap states Ribet's lowering, the coefficient-prime stripping or Carayol's lemma as a target: `roadmaps grep --lean-only` for `level_lowering`, `ribet_level`, `congruent_nebentypus`, `strip_coefficient` finds only this file. AutomorphicGaloisRepresentations §6.5 and §7.6 (merge order 147) import SerreWeightAndLevelOptimisation §§2.10, 2.13, 4.7–4.8 by name, consistent with this README's Scope. ClassicalSerreModularity (supplier table, "SerreWeightAndLevelOptimisation Layers 3–6"), EllipticCurveModularity (§4.8), ModularIwasawaMainConjectures (§2.9) and GL2ModularityLifting (§§3.7, 3.14, 4.2, 4.7, 6.6–6.11) cite this roadmap as a supplier. "Mazur's principle" also appears in CompletedCohomologyAndLocalGlobalCompatibility §4.2, but as Emerton's version in families, a different object. Ownership against open pull requests whose files the brief did not give was not checked beyond `roadmaps grep`.

## Not verifiable

- Diamond, *The refined conjecture of Serre* (Hong Kong 1993 proceedings, International Press, 1995), Theorem 1.1 and Lemma 2.2: no open copy found (tried the sources service by citation; the proceedings volume is not on arXiv, author pages or an open repository). Cited here through wiese04 Thm 10 and buzzard00 Cor 2.6, which were read.
- Kisin 2009, Lemmas 3.1.8–3.1.10, Corollary 3.1.11 (pp. 1150–1152) and Lemma 3.5.3 (pp. 1168–1169): the Annals PDF's text layer does not carry the statement numbers (font artefacts), so only the §3.1 opening with its standing `p>2` (p. 1145) was verified.
- Iyengar–Khare–Manning, published pagination (Prop. 2.10 on p. 786): only arXiv 2206.08212v3 was readable (Prop. 2.10 on its p. 16); content matches.
- Sharifi notes: the version with the README's pages 45–51 (see R07).
- Edixhoven's `.dvi` link: the `.ps.gz` at the same page was read instead (32 pages, author pagination as cited).

## Source issues

- **Error** in buzzard00 at Theorem 2.8, printed p. 103: the statement omits that `ρ` is unramified at the removed prime p, while the proof (p. 105) uses that `J1(M,p)[m]` is unramified at p; it should include "ρ unramified at p" (without it a newform ramified at p is a counterexample); affects a stated result; corrected in print at Ribet–Stein, Theorem 3.19, p. 49.
- **Misprint** in cg20 at proof of Lemma 8.14, author p. 66: the final identity for the kernel form is written `VF=βF`; it should be `VF=α⁻¹F` (from `UVF=F` and `UF=αF`; e.g. `α=2,β=3` in `F₇` gives `4F`, not `3F`); affects nothing (the smallest-exponent argument works for any scalar).
- **Gap** in ribet94 at the remark after Proposition (4.5), author p. 11: the source says that in the situation of (4.5) with `ε` of prime-to-`ℓ` order, `f` is new on `Γ1(M)∩Γ0(p²)` and `φ` is quadratic; it should note that `α|I_p` then has both odd `ℓ`-power order and order dividing 2, so the case is empty; affects nothing.
