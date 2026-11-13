<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13767#issuecomment-6850463516 -->
Red team round 2 pass a (claude) of fcefcb8

Verdict: needs_changes

1. **F01** (P3) VonNeumannAlgebras V13b is cited for a Powers–Størmer statement it does not make

   **Location.** `packages/AmenableTracesOnCStarAlgebras/README.md:415-417`: "V13b: … the
   Powers–Størmer inequality `‖h^{1/2} − k^{1/2}‖_HS² ≤ ‖h − k‖₁` for positive trace-class `h, k`";
   used at `README.md:1003-1006` (§2.4, *Needs:* "VonNeumannAlgebras V13b (Powers–Størmer)").

   **Claim.** V13b supplies the inequality for positive trace-class operators on `B(H)` with the
   canonical (semifinite) trace.

   **Witness.** `TauCetiRoadmap/VonNeumannAlgebras/README.md:4829`: "prove the Powers–Størmer
   inequality `‖a^(1/2)-b^(1/2)‖₂²≤‖a-b‖₁` for positive L¹ elements", in V6's tracial `L²` of a
   finite `(M, τ)` (`:4860`). `(B(H), Tr)` with `dim H = ∞` is not such a pair.

   **Repair.** §2.4 only uses finite-rank `h` and `uhu*`. Replace the V13b contract clause by: "the
   Powers–Størmer inequality `‖a^{1/2} − b^{1/2}‖₂² ≤ ‖a − b‖₁` for positive `L¹` elements of a von
   Neumann algebra with a faithful normal tracial state; §2.4 applies it to `(B(E), tr_E)` for a
   finite-dimensional subspace `E ⊆ H` containing the ranges of `h` and `uhu*`, where both sides are
   `(dim E)⁻¹` times the Hilbert–Schmidt and trace-norm expressions". In §2.4 after "applies the
   Powers–Størmer inequality `…`" insert "(for the finite-rank `h`, `uhu*`, inside `B(E)` with
   `E = ran h + ran uhu*`)". Tested on the Check of §2.4, `h` rank one, `E = span{v, uv}`:
   `‖uh^{1/2}u* − h^{1/2}‖_HS² = 2(1 − c²) ≤ 2(1 − c²)^{1/2} = ‖uhu* − h‖₁`, both computed in
   `B(E) ≅ M_2` (or `M_1` when `c = 1`: `0 ≤ 0`).

2. **F02** (P3) the norm unitalization of §2.1 states no multiplicativity estimate, which §3.2 and §8.1 consume

   **Location.** `README.md:883-887`: "`ψ(a) = (Qφ(1)Q)^{-1/2}Qφ(a)Q(Qφ(1)Q)^{-1/2}` is a u.c.p. map
   into `M_{rank Q}` within `C·δ‖a‖` of `QφQ` in norm"; consumers `README.md:1137-1138` ("for
   quasidiagonal traces use the norm version") and `:2044` ("the norm unitalization of §2.1 makes it
   u.c.p.").

   **Claim.** The stated estimate lets the consumers keep norm-asymptotic multiplicativity after
   unitalization (the 2-norm version at `:881-882` states its product estimate; the norm version
   does not).

   **Witness.** Closeness to `QφQ` controls nothing by itself: `φ(a) = V*aV` on `M_2`,
   `V = diag(1, 1/10)`, has `φ(1) = diag(1, 1/100)`, `δ = 0.0099`, `Q = e₁₁`, `ψ(a) = a₁₁`, and
   `ψ(e₁₂e₂₁) − ψ(e₁₂)ψ(e₂₁) = 1`. The bound needs the defect of `φ` at `(1, b)`.

   **Repair.** Add to §2.1 after the sentence quoted above: "Moreover, with
   `η_b = ‖φ(b) − φ(1)φ(b)‖`, `‖(1 − Q)φ(b)‖ ≤ η_b + 2δ‖b‖`, hence
   `‖ψ(ab) − ψ(a)ψ(b)‖ ≤ ‖φ(ab) − φ(a)φ(b)‖ + ‖a‖η_b + C′δ‖a‖‖b‖` for an absolute constant `C′`;
   so `ψ` is norm-almost multiplicative on `F` when `φ` is on `F ∪ {1}`." Add the same clause to the
   API bullet "The 2-norm and the norm unitalization estimates". Tested on the witness, `a = e₁₂`,
   `b = e₂₁`: left side `1`; right side `‖e₁₁ − e₁₁/100‖ + ‖e₂₁/10 − e₂₁/1000‖ + C′δ = 0.99 + 0.099 + C′δ ≥ 1`.
   Derivation: `Qφ(ab)Q − Qφ(a)Qφ(b)Q = Q(φ(ab) − φ(a)φ(b))Q + Qφ(a)(1 − Q)φ(b)Q` and
   `(1 − Q)φ(b) = (1 − Q)(φ(b) − φ(1)φ(b)) + (1 − Q)φ(1)φ(b)` with `‖(1 − Q)φ(1)‖ ≤ 2δ`.

3. **F03** (P3) a locator attached to a clause the source lines do not contain

   **Location.** `README.md:2118-2119`: "so `C*_r(F₂)` is not quasidiagonal, although it is stably
   finite as a C*-algebra with a faithful tracial state (brown2006, lines 340–341)".

   **Claim.** brown2006 lines 340–341 support the stable finiteness of `C*_r(F₂)`.

   **Witness.** brown2006 line 340–341 is a footnote saying only that quasidiagonal algebras cannot
   contain the non-quasidiagonal `C*_r(F₂)`; stable finiteness is not mentioned there.

   **Repair.** Rewrite the Check as: "`Γ = F₂`: `F₂` is not amenable, so `C*_r(F₂)` is not
   quasidiagonal (brown2006, lines 340–341, records the non-quasidiagonality), although it is stably
   finite, having the faithful tracial state `τ_{F₂}` (§7.3): for `v` in `M_n(C*_r(F₂))` with
   `v*v = 1`, `(τ_{F₂} ⊗ Tr_n)(1 − vv*) = 0` forces `vv* = 1`."

4. **F04** (P3) a downstream consumer is named after the wrong roadmap

   **Location.** `README.md:2176-2177`: "**TemperleyLieb, Part II** can consume Layer 1 and §7.2 for
   the tracial states of AF C*-towers".

   **Claim.** The roadmap TemperleyLieb has AF C*-towers with tracial states.

   **Witness.** `TauCetiRoadmap/TemperleyLieb/README.md` (diagrams, categories, algebras over a ring)
   contains neither "AF" nor "tracial state". The AF presentation of `B_δ` and the Jones tower are
   `TauCetiRoadmap/TemperleyLiebOperatorAlgebras/README.md:66`, `:1230`.

   **Repair.** Replace "**TemperleyLieb, Part II**" by "**TemperleyLiebOperatorAlgebras, Part II**"
   and "AF C*-towers" by "the AF algebras `B_δ` of the Jones tower (its Layer 2)".

Round 2. Four new findings, all P3 (S01–S04). All eight round-1 findings are repaired at this head
and no repair introduced an error. No statement of `Suggested.lean` or of the README was found
false.

## Round-1 findings at this head

| Round-1 id | Status | Repaired passage (quoted) and witness |
|---|---|---|
| 1a/F01 (P2), comparison `generatedCStarAlgebra lam ≅ ℂ ⋊_r Γ` unowned | repaired | `packages/AmenableTracesOnCStarAlgebras/README.md:1930-1946`: "Prove the comparison with OperatorAlgebraDynamics D2 … `x ↦ WxW*` induces a star isomorphism of `generatedCStarAlgebra lam` onto `ℂ ⋊_r Γ` with `λ_g ↦ u_g`"; API bullet at `:1977-1980`; scope bullet at `:107-112`. Checked: Tau Ceti's `regular` needs `IsMulLeftInvariant`, `InnerRegularCompactLTTop`, `IsLocallyFiniteMeasure` (`TauCeti/Analysis/CStarAlgebra/Action/Covariant/Regular.lean:104-106`), all true for `count` on a discrete group; `u_sξ(r) = ξ(s⁻¹r)` (`:126`) equals `λ_s`. |
| 1a/F02 (P3), C8.2 cited for a u.c.p. compression | repaired | `README.md:1427-1433`: "by Stinespring (CStarAlgebras C4.2), `φ_n = W*ρ(·)W` … C8.2 gives unitaries `U_m : H → H ⊕ K` … `V_m = U_m*(0 ⊕ W)`". Recomputed: `V_m*V_m = W*W = 1`, `V_m*π(a)V_m − φ_n(a) = (0⊕W)*(U_mπ(a)U_m* − π(a)⊕ρ(a))(0⊕W) → 0`. C8.2's hypotheses (`TauCetiRoadmap/CStarAlgebras/README.md:1619-1623`) are the ones stated at `README.md:372-375`. |
| 1a/F03 (P3), no Check pins the `Aᵒᵖ` convention | repaired | `README.md:1404-1410`: "the family `(e_{ij}, e_{ji})_{i,j}` gives `Σ τ(e_{ij}e_{ji}) = n²·(1/n) = n` and `Σ e_{ij} ⊗ e_{ij} = n·P`". Recomputed: `Σ e_ij⊗e_ij (e_k⊗e_l) = δ_kl Σ_i e_i⊗e_i`, norm `n`; flip norm `1`. |
| 1a/F04 and 1b/F03 (P3), `IsNormalState` and faithfulness without Checks | repaired | `README.md:1505-1520`: "`τ(x) = Σ_{n≥0} 2^{-n-1}x_n` is the vector state at `(2^{-(n+1)/2})_n`", "`σ(x) = lim_U x_n` … `σ(p_m) = 0` … `σ(1) = 1`", "on `M = L(F₂) ⊕ ℂ` … `τ(x, λ) = λ` is normal … while `M` is not injective". Recomputed: `Σ 2^{-n-1} = 1`, `τ(p_m) = 1 − 2^{-m-1}`; corners inherit injectivity (`TauCetiRoadmap/VonNeumannAlgebras/README.md:4663-4664`). |
| 1b/F01 (P2), vector-trace clause declared not statable | repaired | `Suggested.lean:300-306`, `isUniformAmenableTrace_iff_isAmenableTrace_gns`; module docstring `:31-32`; `README.md:1595-1600` and the uniqueness bullet `:693-696`. The "not statable" list now has two entries (bimodule form, `⊗min`). Without `hn` the statement fails on `(c₀, Σ2^{-n}δ_n)`, `σ′ = τ'' + lim_U`: `σ′(1) = 2`, `tr_k φ(1) ≤ 1` (`README.md:1635-1640`). |
| 1b/F02 (P3), §6.5 estimate assumed its conclusion | repaired (differently, soundly) | `README.md:1826-1831`: "`d₂(ψ, x(1 − e)) ≤ tr ψ̃((1 − e)x*x(1 − e)) ≤ ‖x‖²(1 − tr_k φ(e))`, and `d₂(ψ, xe) = d₂(φ, xe)`". Recomputed on `c₀ ⊆ c`, `e = δ_1`, `ψ = (1−η)δ_1 + η·lim`: `tr ψ̃((1−e)²) = η = 1 − tr φ(e)`; the trace step gives `|η·lim x| ≤ 2‖x‖η^{1/2}`. No value of `tr ∘ ψ` off the ideal is compared with `γ`. |
| 1b/F04 (P3), `generatedCStarAlgebra` restatement unnamed | repaired | `Suggested.lean:19-22` ("… and the C*-algebra generated by a family of operators restate the notions of … OperatorAlgebraDynamics D2.FreeGroups"), `:421-424`; `README.md:1925-1926`. |

## Verified sound

**Dependency check** (run on the package README at this head):

    depcheck: 207 roadmaps, 1900 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. CStarAlgebras, VonNeumannAlgebras, CStarClassification,
OperatorAlgebraDynamics, BanachSpaceTheory and FactorRigidity are folders of `TauCetiRoadmap/` on
main; FactorRigidity stands after this roadmap in `merge-order/ORDER.txt` (line 234 against 232)
but is on main, and is cited for a remark only. No gap is declared (`design/plan.json`,
`"gaps": []`) and none is needed. The pull request changes only
`packages/AmenableTracesOnCStarAlgebras/`.

**Counts.** Declarations read: 45 (22 theorems, 18 definitions, 1 abbreviation, 4 instances),
each compared with its elaborated type in the worker's signature table and with its README
statement. README targets read: 40 subsections (all 2213 lines), each with a Checks block. Source
locators verified: brown2006 66 line locators and 7 in-proof ranges, schafhauser2020 4,
tikuisis-white-winter2017 7; each says what the README attributes to it except S03. Check items
read: about 150; recomputed with values: about 70 (every one carrying a number or a formula).
Sibling citations resolved on main this round: 21 (CStarAlgebras C2.1, C2.8, C4.1, C4.2, C5.2,
C5.4, C6.1, C6.5, C7.1, C8.1, C8.2, C8.3, C9.1, C9.7; VonNeumannAlgebras V13a, V13b.SpatialNorm,
V13b; OperatorAlgebraDynamics D2, D2.FreeGroups; FactorRigidity §2.2; BanachSpaceTheory B1), one
with a finding (S01). Pinned declarations grepped in the file the README names: 73 names, all
present; statements read for `isKMSState_zero_iff`, `closure_kmsStates_inter_subset`,
`IsKMSState.eq_zero_of_apply_toPreGNS_one_eq_zero`, `Amenable`, `Amenable.of_lpTop`,
`CovariantRepresentation.regular`, `Subtype.starOrderedRing`, `CompletelyPositiveMap`.

**Policy.** No `set_option`, `lemma`, `#check`, `#eval`, `True` placeholder, sorry'd data,
pull-request number, process narrative or machine path in README or Lean. Imports: `import Mathlib`
and three `TauCeti.*` modules, each used. Every Lean name occurs backticked in the README and
every backticked own name of the README is declared. The four dropped binders of the signature
table (`[StarOrderedRing A]` on `IsFaithfulTrace`, `IsHypertrace`, `IsFoelnerTrace`; both order
instances on `IsAF`) are not needed by those bodies; every theorem carries its own hypotheses.

**Headlines.** Stated: unitization; Connes–Kirchberg in hypertrace, extension and tensor form;
Følner sufficiency and equivalence; tracial von Neumann form; uniform amenable ⇔ injective and
⇔ amenable vector trace; nuclear; exact; both faces; normalized restriction; ideal extension;
commutative; AF; group TFAE; quasidiagonal algebra ⇒ quasidiagonal trace; faithful quasidiagonal
trace ⇒ quasidiagonal; Rosenberg; AF-subalgebra necessity. Declared not statable, and confirmed:
the bimodule form (no right GNS representation at the pins) and `⊗min` permanence (no C*-tensor
product at the pins; `H ⊗[ℂ] K` is not complete, so the product algebra would need an ad hoc
completion). Padding: none found; the four instances are needed for the statements to elaborate
(`Subtype.starOrderedRing` has a scalar field `𝕜` that the goal does not determine).

**Ownership.** `roadmaps grep` for amenable trace, quasidiagonal trace and hypertrace: the only
other occurrences are V13b's von Neumann hypertraces on `B(L²M)` (main and the open revision of
VonNeumannAlgebras), FactorRigidity and Subfactors citing V13; the README distinguishes them
(§4.6). No pinned declaration states a tracial-state, nuclear-map, quasidiagonality, injectivity or
C*-tensor notion. No declaration shares a fully qualified name with a readable roadmap.

**The computed pass.**

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| `IsTracialState` | `A = 0`; `M_2`, `x ↦ x₁₁`; `Tr` on `M_2` | norm `0 ≠ 1`; `1` vs `0` at `e₁₂e₂₁`, `e₂₁e₁₂`; norm `2` | all excluded |
| `matrixTrace`, `matrixTwoNorm` | `e₁₁ ∈ M_2`; `k = 0` | `1/2`, `2^{-1/2}`; `0⁻¹·0 = 0`, `√0 = 0` | junk value harmless |
| `IsAmenableTrace`, `k = 0` witness | `F = {a}`, `|τ(a)| < ε` | `M_0` passes on `F`; adding `e` with `τ(e) > ε` excludes it | unitization proof must enlarge `F`; statement true |
| `isAmenableTrace_unitization_iff` | `A = ℂ`; `A = c₀`, `δ_1`; unital `A` | `Ã ≅ ℂ²`, `τ̃ = pr₁`; `x ↦ x_1` both ways; `|λ| ≤ max(‖a+λ‖, |λ|)` | true, factor `2` at `(1/2, −1/2)` |
| hypertrace form | `ℂ² ⊆ M_2`, `(t, 1−t)`; `H = 0` | `ψ = tT₁₁ + (1−t)T₂₂` central; `A` trivial, `hτ` false | true |
| extension form | `(ℂ², pr₁)` on `ℂ²` | `Φ(T) = T₁₁`, `Φ(1) = 1` | true |
| tensor form | `M_n`, `(e_ij, e_ji)`; `n = 0` family | `n ≤ n`, wrong model `n ≤ 1`; `0 ≤ 0` | true, convention pinned |
| `IsFoelnerTrace` | `P = e₁₁`, `T = e₁₂`; `L²(𝕋)`, `P_n`, `z` | `0 + 1 = ‖e₁₂‖²_HS`; entries at `z^{n−1}`, `z^{−1}`: `2 < εn` | formula right |
| Følner sufficiency | compression `PπP` | `‖φ(ab) − φ(a)φ(b)‖₂ ≤ ‖a‖(ε)^{1/2}` | true |
| Følner iff | `ℂ² ⊆ M_2`, `(1/3, 2/3)` | rank one: `2·(1/3)(2/3) = 4/9`; rank two: `1/2 ≠ 1/3` | `hess` needed, present |
| `IsInjective` | `H = 0`; `M_n` | zero map, norm `0`; identity | no norm-one claim |
| `IsNormalState` | `ℓ∞`: `Σ2^{-n-1}x_n`, `lim_U` | `1 − 2^{-m-1} → 1`; `0 ↛ 1` | discriminates |
| `isAmenableTrace_iff_isInjective` | `L(F₂) ⊕ ℂ`, `pr₂` | amenable, not injective, `τ((1,0)) = 0` | `hf` needed, present |
| `isUniformAmenableTrace_iff_isInjective` | `M_n`; `C*(F₂)` regular trace | both true; both false | true |
| `…_iff_isAmenableTrace_gns` | `c₀`: `σ = Σ2^{-n}x_n`; `σ′ = τ'' + lim_U` | forced by `π_τ(p_m) ↑ 1`; `σ′(1) = 2`, error `≥ 1` | `hn` needed, present |
| `IsNuclearMap` | zero map, `n = 0`; `id_{B(ℓ²)}` | holds; fails | as intended |
| exact TFAE | `C*_r(F₂)`; `C*(F₂)` | all four false; hypothesis fails (amenable, `L(F₂)` not injective) | true |
| face theorems | `ℂ²`, `(1/2,1/2)`; `C*_r(F₂) ⊕ ℂ` | `P = e₁₁`; `AT = {χ∘pr₂}` | true |
| normalized restriction | `M_3 → M_4`; `c = 1/2`; `c₀ ⊆ c` | `3/4·(tr_3)~ + 1/4·χ₀`; norm `3/2`; `δ_1` | true, `c` forced |
| ideal extension | `c₀ ⊆ c`, `ψ = (1−η)δ_1 + η lim`; `C*(F₂) → C*_r(F₂)` | `η ≤ η^{1/2}`; amenable ↦ non-amenable | true; `hι` needed, present |
| commutative, AF | `C[0,1]`, `f = x`; `M_2 ⊕ ℂ`; `K(ℓ²)` | `(n+1)/(2n) → 1/2`; `(Tr x + 2λ)/4`; `T = ∅` | true |
| group TFAE, Rosenberg | `1`, `ℤ`, `S₃`, `F₂`; uncountable `Γ` | all true ×3, all false; `ℓ∞(Γ) = L∞(count)`, `of_lpTop` has no countability hypothesis | true |
| `(12)(23)` convention | `S₃` | `gh = (123)`, `hg⁻¹ = (132)` | Check right |
| QD ⇒ QD trace | `π(1) = q ≠ 1`; `SO₂` | `PqP` near a nonzero projection; no trace | unit needed, present |
| faithful QD trace ⇒ QD | Toeplitz; `ℂ²`, `(1/2,1/2)` | traces not faithful; `‖a‖ = ‖φ(a)‖` | faithfulness needed, present |
| `subalgebra_isAF_simple` | `B = 0`; `B = ℂ²`; `M_3 ⊆` CAR | contradicts `Nontrivial A`; `pr₁` not faithful; `c = 3/4`, `tr_3` | simplicity needed, present |
| §1.3 traciality of the ideal extension | `γ(ab)` | `lim τ((ea)(be)) = lim τ((be)(ea)) = lim γ(be²a) = γ(ba)` | sound |
| §1.6 expectation formula | `x = e_kl ∈ B`; `ℂ³`, `(1/2,1/2,0)` | `Φ_B(e_kl) = e_kl`; `((x₁+x₂)/2, (x₁+x₂)/2, x₃)` | sound |
| §2.1 2-norm unitalization | `φ = id/2` | `‖x‖₂/2 ≤ 2‖x‖·2^{-1/2}`; product constant `2 + 4 = 6` | sound |
| §2.1 norm unitalization | `V = diag(1, 1/10)` | `ψ` defect `1` at `(e₁₂, e₂₁)` | estimate missing: S02 |
| §2.2 defects | `T(a) = (1−VV*)^{1/2}π(a)V` | `φ(ab) − φ(a)φ(b) = T(a*)*T(b)`; `T(ab) = T(a)φ(b) + (…)T(b)` | sound |
| §2.4 Ozawa | `diag(1/3, 2/3)`; rank one | `min`: `1/3 ≤ 1/3`, `max`: `2/3`; `1 − c² ≤ 2^{3/2}(1−c²)^{1/4}` | sound |
| §3.1 normalization control | `φ_m = τ(·)1_m/m` | `1/(2m)`, `1/(2m^{1/2})`, recovery error `1 − 1/m` | rejected, as stated |
| §4.5 compression | `V_m = U_m*(0 ⊕ W)` | `V_m*V_m = 1`, difference `→ 0` | sound |
| §5.1 commuting-range lemma | `β = id_{M_2}`, `y_kl = e_lk` | `2·1` against norm `1` | commutation needed, stated |
| §5.2 defect bound | `y = x − a`, `‖a‖ ≤ ‖x‖` | `d₂(y) ≤ τ**(y*y) + 4‖x‖²‖tr∘φ − τ‖` | sound |
| §6.3 decomposition | `a + λ1` | `τ(ιa) + λ = c(γ(a) + λ) + (1 − c)λ` | sound |
| §8.3 isometry | `limsup` to limit | block sums over `[n, N(n)]` on a dense sequence | sound |

Source independence: 24 passages compared with 3 sources, none shared beyond statements the mathematics forces; largest share brown2006, 77 of 101 locators; contents compared with brown2006: independent (its §3.1 ↔ Layer 4, §3.2 with §4.2–§4.3 ↔ Layer 5, §3.3 with part of §4.1 ↔ Layer 8, §3.5 split over Layers 3 and 6, §4.1 split over Layers 7 and 8: no run of layers follows its sections in order).

## Not verifiable

- **Lean elaboration.** No Lean was run in this pass; types were read from the worker's signature
  table, which the repair report says was regenerated after the last edit.
- **Instance necessity.** That `Subtype.starOrderedRing` cannot be found by instance search without
  `(𝕜 := ℂ)` was concluded by reading its binders
  (`Mathlib/Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Range.lean:279-285`), not by
  deleting the two instances and elaborating.
- **Waived or uncertified sources** (`connes1976`, `brown-ozawa2008`, `paulsen2002`,
  `pedersen2018`, `kirchberg1993`): cited as background by locator; texts not read.
- **Published numbering of brown2006.** The Memoir's numbering was not compared with the arXiv v2
  numbering the README cites; the manifest records this.
- **D2's nuclearity theorem for uncountable amenable `Γ`.** OperatorAlgebraDynamics D2 states it
  for locally compact `G` without a countability hypothesis
  (`TauCetiRoadmap/OperatorAlgebraDynamics/README.md:1549-1551`); its route was not checked for a
  hidden use of second countability.

## Source issues

- none

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "fcefcb83341d80f56cdd1a3a1c9162c2f8afa855", "job": "RT-AmenableTracesOnCStarAlgebras~2a", "model": "fable", "worker": "chris-x8"} -->
