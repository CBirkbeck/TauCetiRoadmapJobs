<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13067#issuecomment-6895766375 -->
Review (claude) of ab9e9d6

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §10.4 does not hand §10.5 the geometric connectedness that §6.1 requires

   **Location:** `README.md:2906–2911` (§10.4): "there is a proper birational `C̃ → C` with `C̃` smooth, an
   isomorphism over a dense smooth open `U`, spread out over a finite localization"; consumed at
   `README.md:2928` (§10.5): "For a smooth positive-dimensional arithmetic base `X/ℚ` from §10.4".

   **Claim:** the base produced by §10.4 can be fed to §6.1 (through §10.5), whose hypothesis
   (`README.md:2185`) is a "smooth geometrically connected generic fibre".

   **Witness:** `C : x² − 2y² = 0` in `𝔸²_ℚ` is irreducible, its normalization is `Spec ℚ(√2)[t]`: smooth,
   connected, two geometric components. Only the density of rational points (here `C(ℚ) = {(0,0)}`, not
   dense) excludes it, and §10.4 never draws that conclusion; §7.7 (`README.md:2386–2387`) does.

   **Repair:** in §10.4 add to the statement, after "with `C̃` smooth": "and geometrically connected: `C`
   has a Zariski-dense set of ℚ-points, so it is geometrically irreducible (the Galois conjugates of a
   geometric component through a dense set of rational points coincide), and `C̃` is birational to it";
   add the API bullet "`C̃` is smooth and geometrically connected over ℚ" and the negative-control Check
   "`x² − 2y² = 0` over ℚ is irreducible with normalization `Spec ℚ(√2)[t]`, not geometrically connected;
   its only rational point is the origin, so the density hypothesis excludes it". In §10.5 write "smooth
   geometrically connected positive-dimensional". Tested on the witness: density fails there, so the
   repaired statement does not apply to it, and for a component with dense rational points the argument of
   §7.7 gives the conclusion.

2. **F02** (P3) Four locator slips against the cached texts

   **Location and witness** (each read at the cited place):

   1. `README.md:691–692` (§0.4): "(LS, Examples 5.8–5.9, p. 43; Definition 5.13, p. 44)". LS line 1935:
      Example 5.8 begins on preprint p. 42 (p. 43 starts at LS line 1940), and LS line 1950 is *Remark* 5.9,
      not an example.
   2. `README.md:2488` (§8.2): "LV, §10.2, printed pp. 972–974". The laws `α_p` and `β_p` are defined at
      LV (10.7), LV line 2959, printed p. 971; the difference-law statement is (10.10), LV line 2992,
      printed p. 972.
   3. `README.md:2652–2653` (§8.9): "LV, Proposition 10.2 and proof, printed pp. 970–975". The proof ends
      before LV line 3065 (heading of §10.3), on printed p. 974.
   4. `README.md:2787` (§9.3): "LV, Theorem 10.1 with Proposition 10.2, printed pp. 969–975": same end
      page, 974.

   **Repair:** (1) "(LS, Example 5.8 and Remark 5.9, pp. 42–43; Definition 5.13, p. 44)"; (2) "LV, (10.7)
   and (10.10), printed pp. 971–972"; (3) "printed pp. 970–974"; (4) "printed pp. 969–974".

3. **F03** (P3) Two source examples are restated three times without a locator

   **Location:** `README.md:1839–1841` (Layer 4, Examples: "On eight indices with classes `{1,2}, {3,4},
   {5,6}, {7,8}`, the permutation `(13)(24)(57)(68)` …"); `README.md:2167–2169` (Layer 5, Examples, the
   `2 + 2 + 2` flag in `GL₆`); `README.md:3100–3102` (Worked examples, "Semibalance in `GL₆`").

   **Claim:** these are worked instances of this roadmap. (Maintainer note 2; it holds.)

   **Witness:** LS line 3133 (Example 6.7, p. 68) has the same four classes and the same permutation; LS
   line 3417 (Example 8.6, pp. 75–76) has the same flag, `dim F¹ = 3`, `4(a₀ − a₂)`, `(1,1,1)` and
   `(2,1,0)`. §4.2 and §5.3 cite them (`README.md:1750`, `1921`); the three restatements do not.

   **Repair:** append "(LS, Example 6.7, p. 68)" to the Layer 4 Examples sentence, and "(LS, Example 8.6,
   pp. 75–76; the `4 + 4 + 4` instance is this roadmap's)" to the Layer 5 Examples paragraph and to the
   "Semibalance in `GL₆`" bullet.

Three findings, all P3 (none blocking). The three repairs of the previous round are complete and their
new text passed the adversarial pass. `Suggested.lean` elaborates with `sorry` as its only warning and
neither headline is padding. All paths below are relative to the board repository; `README.md` means
`packages/MordellLawrenceVenkateshPartII/README.md`.

## Verified sound

### Previous findings (REV-PKG-MordellLawrenceVenkateshPartII~5), checked first

| Finding | Repaired passage | Status |
|---|---|---|
| F01 (P2) duplicate ownership of complete reducibility | `README.md:1179–1185`: "G-complete reducibility … and, over `k̄`, the **Levi semisimplification** … are LanglandsParameterStacks §§2.3–2.4, extending ArithmeticGaloisRepresentations §1.11"; Scope `README.md:89–96`; contract `README.md:347–365`; Needs `README.md:1247–1249`; Layer 2 Dependencies `README.md:1504–1505` | Repaired. Both suppliers read at their open heads: ArithmeticGaloisRepresentations §1.11 has the paragraph **Complete reducibility and closed tuples** (connected, algebraically closed, every characteristic); LanglandsParameterStacks has "### 2.3 Complete reducibility and strong reductivity" (all R-parabolics `P_λ`, R-Levis `Z_G(λ)`, cocharacters of `G⁰`) and "### 2.4 Closed tuples and Levi semisimplification" (uniqueness up to `G⁰(k)`, equal dimension and component count). Merge-order lines 59 and 81, before 320. |
| F02 (P3) support at `n = 0` | `README.md:327`: "its contiguous support, which is `0 ≤ q < n` for `n ≥ 1` and `{0}` for `n = 0`"; the `gaps` entry of `design/plan.json` is character-for-character the same | Repaired. |
| F03 (P3) finite order "essential" | `README.md:2022–2028`: "Finite order of `ψ` is needed for the statement to apply directly to all of `U`, not for its conclusion"; `README.md:2043–2045` | Repaired. |

The repaired patterns were searched for in the rest of the package: no other owner-less generic
group-theoretic construction (the remaining Layer 2 targets are coefficient-normalizer specializations
or rational/local statements that neither supplier states); every other `0 ≤ q < n` stands under
`n ≥ 2`; no other "is essential/needed" Check contradicts a reduction stated elsewhere.

### Coverage

Read in full: the README (3164 lines, 11 layers, 79 numbered targets with their Needs lines),
`Suggested.lean`, `metadata.toml`, `sources.toml`, the previous review and repair report, the maintainer
notes, the overlap, citation, signature and library-match files. Every layer ends with Examples and
Dependencies; every definition has an API list and at least three Checks; no LaTeX delimiters, no
process words, pull-request numbers, paths, `lemma`, `set_option`, sorry'd data or field-list blocks
(grep over both files, no hit). The six backticked names the README attributes to this roadmap
(`eulerian`, `eulerian_central_mass_le_half`, `HypersurfaceMonomial`, `IsSmoothHypersurface`,
`HasGoodReductionOutside`, `integralHypersurfaces_not_zariskiDense`) are all declared.

### Seeded source sample (15 targets, all read in the cached texts)

| Target | Text read | Result |
|---|---|---|
| 0.4 | LS lines 1935–1954 (Example 5.8, Remark 5.9), 2009–2011 (Definition 5.13, p. 44) | Statement supported (trivial system `O_E`, Frobenius through `K_v` only, constant = pulled back from `Spec O_K,S`); locator slip, R02. |
| 0.7 | LS lines 1926–1934 (Remark 5.7, p. 42), 3861–3873 (proof of Theorem 8.17, p. 84) | `(V, φ)` independent of the point of the disk, `Φ_p` into the flag variety: supported. |
| 1.3 | LS lines 2141–2163 (Definition 5.22, Remark 5.23, p. 47) | Unit and associativity, coequalizer tensor product: supported; balancedness is the roadmap's own term, defined in place. |
| 1.4 | LS lines 2164–2186 (Definitions 5.24–5.25, Lemma 5.26, pp. 47–48) | Free of finite rank ⇔ equal factor dimensions; all four realizations: supported. |
| 2.2 | LS lines 2455–2478 (Lemma 5.33, pp. 53–54) | `E^σ = E₀`, `dim Z_G(φ) ≤ dim H`; proof by one cycle: supported. |
| 2.4 | LS lines 2583–2593 (Definition 5.38, Remark 5.39, p. 56) | Characteristic zero, rigid abelian tensor category with fibre functor, exact faithful tensor functor with trivialization: supported. |
| 2.7 | LS lines 2761–2773 (Definitions 5.44–5.45, p. 60); LV lines 2858–2880 ((10.2)–(10.3), printed pp. 968–969) | `T′(x) = k` between the partial sums: equal to the README's interpolation. LS writes the graded piece with `F^(a−1)`; the README's `F^a/F^(a+1)` is the listed correction. |
| 5.1 | LS lines 3383–3407 (p. 74–75), footnote 9 at LS lines 3434–3441; LV lines 3505–3545 (printed pp. 985–986) | `a_S`, weight, `ι_GM` from the centres (LS line 3391), `γ_P` the inverse determinant, `γ_P(diag(a,b)) = a⁻¹b`: supported. |
| 5.5 | LS lines 3511–3545 (Definition 8.8, Remark 8.9, pp. 77–78) | Equivalence uses `gP₁g⁻¹ = P₂`, the Levi filtration and the Levi image of `φ` only: `f` enters through its parabolic, as stated. |
| 7.8 | LV lines 3865–3941 (Lemma 12.1, printed pp. 995–996) | Hypotheses match; the source bounds power sums through `N` while its kernel has frequencies to `2N`; the README's cutoff `2M` is right (values below). |
| 8.2 | LS lines 4237–4249 (p. 91); LV lines 2933–2993 | `a_i = Σ_k A(n,k)A(n,k−i)/(n!)²`: the README's `β_j`. Page range, R02. |
| 9.3 | LV lines 2885–2903 (Theorem 10.1), 2916–2918 (Proposition 10.2) | `∃ n₀`, `D₀(n)`, `d ≥ D₀(n)`; non-density of `Y(ℤ[S⁻¹])`: supported. End page, R02. |
| 10.4 | LS lines 3930–3944 (p. 86) | The source lifts every integral point by properness; the README restricts to the locus where the resolution is an isomorphism, which is what is true. R01 is about what §10.4 passes on. |
| 10.8 | LS lines 3900–3902, 4003–4012, 4022–4024 | Orbits of `A(K)`; isogeny defined over `K`: supported; the cokernel argument is the roadmap's own and was recomputed. |
| 10.9 | LS lines 4013–4040 (Corollary 9.3, Theorems 9.4–9.5, pp. 87–88) | "Not a multiple" in the corollary, "`φ³` not divisible" in Theorem 9.5 after cancelling `3! = 6`: equal to the README's two forms. |

No locator in the README is flagged by the author as unverified.

### Adversarial pass (changed text, sampled targets, headlines, targets of findings)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §2.3 rational form | `w = ((0,−1),(1,0)) ∈ GL₂(ℚ)` | char. poly. `t² + 1`, no rational root: no ℚ-Borel contains it; over `ℚ̄` eigenlines of `±i` | Minimal ℚ-parabolic `GL₂`; image `⟨w⟩` reductive; same geometric class. Sound |
| §2.3 route, preimage step | `μ` a cocharacter of `L_λ` | `c_λ⁻¹(P_μ(L_λ)) = P_(Nλ+μ) ⊊ P_λ` for large `N` when `P_μ(L_λ) ≠ L_λ` | Minimality over `k` gives irreducibility in `L_λ` over `k` |
| §2.3 nonconnected Check | `J = SL₂² ⋊ C₂`, `λ = (diag(t,t⁻¹), 1)`, element `(a,b)s` | `λ(t)(a,b)sλ(t)⁻¹ = (λ₁a, bλ₁⁻¹)s`; rows of `λ₁a` scale by `t, t⁻¹`, limit needs row 2 of `a` zero: impossible | `P_λ = B × SL₂`; image `⟨(1,D),(1,W)⟩`, `W e₁ = e₂`: irreducible. Sound |
| §2.3 `O(xy)` Check | `r_b(x,y) = (by, b⁻¹x)` over `ℚ₃` | `(by)(b⁻¹x) = xy`; `diag(a,a⁻¹) r_b diag(a,a⁻¹)⁻¹ = r_(a²b)`; `r_c r_b r_c = r_(c²/b)`; trace 0, det −1 for all `b` | 4 classes (`|ℚ₃^×/ℚ₃^(×2)| = 4`), one `GL₂`-class. Sound |
| §2.3 degenerate | `Γ = 1`; `G` a torus; `G` finite; `k = k̄` | image `1`; `P_λ = G`; only `λ = 1`; statement of the supplier | Sound |
| gap support (F02) | `n = 0, 1, 2, 3` | rows `(1)`, `(1)`, `(1,1)`, `(1,4,1)` by enumeration; `{q < 0} = ∅ ≠ {0}` | Repaired wording true |
| §5.6 Check (F03) | `ψ(x,y) = (−x,2y)`, `r = 2`, `u = (2,0)`, `v = (−1,0)` | `u + ψu = 0`; `ψv − v = (2,0)`; `ψ²(x,y) = (x,4y)` fixes `y = 0` only | Sound |
| §2.2 | `E = E₀²`, `φ = (a,b)∘swap` | `g₁a = ag₂`, `g₂b = bg₁` ⇒ `g₂ = a⁻¹g₁a`, `g₁(ab) = (ab)g₁` | Centralizer ≅ `Z(ab)` in one factor |
| §2.7 | weights `2, 0, −2` | `T(1/2) = 1`, `T(1) = 2`, `T(2) = 2`, `T(3) = 0`; `A = 1`, `B = 2 = T(A) = T(A + h⁰)` | Sound |
| §1.4 | ranks `(2,2)`, `(1,3)`; `E = 0` | dimensions 4 and 4; common rank only in the first; no homomorphisms from `0` | Sound |
| §5.1 / §5.3 | `GL₂` Borel; `GL₆` `2+2+2`; `GL₁₂` `4+4+4` | `det(Ad | Lie P)⁻¹(diag(a,b)) = a⁻¹b`; weights on the three off-diagonal blocks sum to `4(a_bot − a_top)`, inverse `4(a₀ − a₂)`; for blocks of size 4: `8(a₀ − a₂)` | README formulas right (in central-exponent coordinates the constant is 8, see Source issues) |
| §7.8 | `M = 1..5`, `Q = q^(m/2+1) ≥ 4` | `‖g_M‖² = 19, 85, 231, 489, 891`; `(2M+1)²/‖g_M‖² ≤ 3/(4M)` each; `Σ_(r≤2M)(2M+1−r)Q^r ≤ (16/9)Q^(2M)`, giving `(2M+1+32/27)²/‖g_M‖² = 0.92, 0.45, 0.29, 0.21, 0.17 ≤ 3/M` | Sound with cutoff `2M` |
| §8.2–8.3 | `n = 2..8` | `β₀ = 1/2, 1/2, 61/144, 571/1440, 47227/129600, 6907/20160, 4374067/13547520`; second moment `(n+1)/6` each; log-concave each | Sound |
| §8.4 / Lean headline | `n = 0..8` | `2Σ_(q<n)A² ` vs `(n!)²`: `0/1`, `2/1` (fails), `4/4`, `36/36`, `488/576`, `11420/14400`, `377816/518400`, `17405640/25401600`, `1049776080/1625702400` | True for `2 ≤ n ≤ 8`; `n ≥ 2` needed; `n = 8`: moment `3/2`, not `< 3/2` |
| §8.1 | `(n,d) = (2,1),(3,1),(4,1),(3,2),(5,1)` | `2h⁰` vs `dim + rank`: GL `4/6, 36/42, 488/600, 144/156, 11420/14520`; geometric GSp `4/6`, `246/314`; GO `16/20`, `66/74`, `5646/7202`; nongeometric `GO₂`: `4/4` | Sound; parity restriction needed |
| §8.6–8.7 | `(n,d) = (2,3),(3,4),(4,5),(3,3),(5,4)` | `(1,1)`, `(1,19,1)`, `(1,101,101,1)`, `(0,6,0)`, `(0,21,141,21,0)`; `binomial(6,4) − 1 = 14`, `binomial(6,3) − 1 = 19` | Sound |
| §9.3 Lean statement | `F = 0`; `G` constant; `p | d` | zero form: no `x ≠ 0` passes, so never smooth; a constant `G ≠ 0` would assert there is no such form; partials of `Σ x_i^p` vanish | Carrier right; homogeneity makes vanishing scale-invariant |
| §10.4 (R01) | `x² − 2y² = 0` over ℚ | normalization `Spec ℚ(√2)[t]`; rational points `{(0,0)}` | Geometric connectedness needs the density hypothesis |
| §10.8 | `T ⊂ A[m]`, `m = |T|` | `[m]_A = ψ∘π`, `π∘ψ = [m]_(A/T)`, so `m(A/T)(K) ⊂ π(A(K))` | Quotient finite by weak Mordell–Weil |
| §10.9 | `D₁` | `binomial(25,5) = 53130`, `/6 = 8855`; `8855 | 17710` | Divisibility versus equality right |

### Lean acceptance

`lake env lean` on `packages/MordellLawrenceVenkateshPartII/Suggested.lean` from the content checkout:
exit 0, the only output `declaration uses sorry` at 69:8 and 106:8. One import, `import Mathlib`.
`#check @name` on a scratch copy for the four definitions: `eulerian : ℕ → ℕ → ℕ`,
`HypersurfaceMonomial : ℕ → ℕ → Type`,
`IsSmoothHypersurface : {k} → [Field k] → {n} → MvPolynomial (Fin (n + 1)) k → Prop`,
`HasGoodReductionOutside : {n} → Finset ℕ → MvPolynomial (Fin (n + 1)) ℤ → Prop`; no binder lost,
nothing changed. (The seventh "declaration" of the supplied signature file, named `,`, is a parser
artefact from the word "structure" in the module docstring.) `decide` confirms `eulerian 0 0 = 1` and
`eulerian 3 1 = 4`.

One-tactic probe on both sorried theorems (scratch copy): `simp`, `rfl`, `infer_instance`, `decide`,
`omega`, `positivity`, `simp` with the definitions unfolded, `aesop`: thirteen attempts, none closes.
No padding.

Headlines: §6.1, §§7.6–7.7, §7.8, §§10.6/10.9/10.10 are named in the module docstring as not statable
with the missing carriers (family cohomology and comparisons; abelian schemes over a base other than a
field, checked: `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` is over a field); §8.4 and §9.3
are stated. None statable is absent.

### Library declarations opened at the pins

`TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154` (`parabolic`, namespace
`TauCeti.Cocharacter`); `…/Representation/Tannaka/Equivalence.lean:188` (`fgPointTensorIsoEquiv`);
`TauCeti/Geometry/Hodge/Mixed/Basic.lean:72`, `Morphism.lean:77`, `Strictness.lean:110, 118, 131`,
`Abelian.lean:33`; `TauCeti/AlgebraicGeometry/LineBundle/Ample.lean:71`,
`CartierDivisor/Basic.lean:127`, `CartierDivisor/Effective/Basic.lean:45`,
`IntersectionNumber/Basic.lean:111`, `LineBundle/Degree.lean:74, 130`;
`Mathlib/RingTheory/Filtration.lean:432` (`[IsNoetherianRing R] [IsLocalRing R] (h : I ≠ ⊤)`);
`Mathlib/Data/Finsupp/Weight.lean:216`; `Mathlib/RingTheory/Regular/RegularSequence.lean:147`. All exist
as cited.

### Suppliers, gaps, overlaps

`roadmaps resolve`: no cross-roadmap citation found nowhere; its one Lean lead,
`VanishingCycles.lisseDirectImageTransport`, is the target named at
`TauCetiRoadmap/EtaleCohomologyFoundations/README.md:707`, cited as that. Resolved again this round:
ClassicalArithmeticCompletion §§2.18, 2.39, 2.56 (main, lines 3008, 3604, 4071);
`ruckert_nullstellensatz` (`TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean:226`);
`hilbert_quot_schemes` (`TauCetiRoadmap/SchemeAndStackFoundations/README.md:7028`); the two new
suppliers above. The other supplier rows rest on the previous round's register, whose text no repair
touched.

The seven gap slugs agree, sentence for sentence, between `design/plan.json` and the README; each has a
named earlier supplier and one precise request. Acceptance would be conditional on all seven.

Dependency check (the prescribed command):

```text
depcheck: 245 roadmaps, 2253 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

Duplication by object: no other roadmap's `Suggested.lean` declares one of the six fully qualified
names (`FiniteGroupInvariants` has an unrelated `eulerian` in its own namespace); "Hodge–Deligne
system" is defined by no other roadmap. The overlap file lists no head changing this roadmap, no
dropped id and no revision-only id.

Overlap check: read SheafConvolutionOnAbelianVarieties, MordellLawrenceVenkatesh,
GaloisSectionsPadicPeriodMaps; convolution monodromy and character sheaves — SheafConvolutionOnAbelianVarieties;
Lie-Goursat, Faltings's lemma, residue disks, the Lagrangian period variety — MordellLawrenceVenkatesh;
Eulerian numbers — ClassicalArithmeticCompletion; nothing owned twice.

### Maintainer notes

1. Arrangement: confirmed independent (see Source independence). The round-6 repair moved no layer.
2. Worked instances without a locator: holds; raised as R03.
3. Licence remarks: carried to the last section.

### Copyright, wording and arrangement

Wording compared at the 15 sampled locators and at six further passages (§2.3 route against LV §2.4;
§4.2 Check against LS Example 6.7; §5.3 Checks against LS Example 8.6; §8.4 route against LS Lemmas
A.4–A.5; §10.10 route against LS proof of Theorem 9.6; the docstring of
`integralHypersurfaces_not_zariskiDense` against LV Theorem 10.1). No sentence follows a source clause
by clause; the longest shared runs are standard phrases of under ten words ("exact faithful tensor
functor", "not Zariski dense in"). The two examples of R03 share their data with the source, in the
roadmap's own sentences and with added content.

Arrangement: LS has §5 (5.1–5.10), §6 (6.1–6.2), §7, §8, §9, Appendix A. The roadmap splits LS §5 over
Layers 0, 1, 2, joins LS §6.2 with §7 in Layer 4, splits §8 over Layers 5 and 6, puts Appendix A in
Layer 8 before the projective application, and Layers 7–9 carry LV §§10, 12, Beauville and
Batyrev–Cox. The order 0 < 1 < 2 < 3 < 4 < 5 < 6 is forced: §2.1 needs §1.5, §3.1 needs §2.5, §4.4
needs §3.2, §5.12 needs §4.2, §6.1 needs §§5.8, 5.12. No one-to-one run of layers onto sections.

Source independence: 21 passages compared with 2 sources (LS, LV), none shared; largest share LS, 72 of
104 parenthetical locators; contents compared with LS: independent.

## Not verifiable

- Serre, *Galois cohomology*, I §5.4 and III §4.3: settled as uncertified; the text was not read. The
  local cases of §2.11 were recomputed (`|H¹(ℚ₃, μ₂)| = 4`).
- LawrenceVenkateshMethod (a separate board package listed in the index): its README is not in this
  checkout and was not read; ownership against it was not checked.
- Open roadmap pull requests were searched through the indexed heads (`roadmaps grep`, `roadmaps
  show`); only the scopes named in the overlap line were read in full.

## Source issues

- **Gap** in LS at the proof of Theorem 9.2, preprint p. 86: the source says every integral point lifts to the resolution by properness; it should lift only points over the locus where the resolution is an isomorphism, which stay dense; affects the proof.
- **Misprint** in LS at Example 8.6, preprint p. 75: the source says the modular character has exponent `4(a₀ − a₂)` on block scalars with exponents `a_k`; it should be `8(a₀ − a₂)`, the factor 4 belonging to the dimension counts defined next; affects nothing.
- **Error** in LV at §10.2 before (10.8), printed p. 971: the source says the parameter space has dimension `binomial(n+d, d−1) − 1`; it should be `binomial(n+d, d) − 1`, 14 for plane quartics; affects nothing.
- **Gap** in LV at Lemma 12.1 and proof, printed pp. 995–996: the source says power sums through `N` bound a kernel whose frequencies reach `2N`; it should require the cutoff through `2N`; affects a stated result.
- **Misprint** in LS at Definition 5.44, preprint p. 60: the source says the graded piece of a decreasing filtration has denominator `F^(a−1)`; it should be `F^(a+1)`; affects nothing.
- **Error** in LS at §5.8.2 after Definition 5.40, preprint p. 57: the source says a parabolic determines the filtration up to reindexing; it should require conjugacy of cocharacters in the parabolic, as its own criterion does; affects a stated result.
- **Misprint** in LS at Definition 9.1, preprint p. 85: the source says no translation may fix a primitive hypersurface; it should exclude only nonzero translations; affects a stated result.
- **Misprint** in LS at the proof of Lemma A.4, preprint p. 91: the source says the propagated bound has denominator `3^j`; it should be `3^i`; affects the proof.
- **Misprint** in LS at the proof of Lemma A.5, preprint p. 91: the source says the tail comparison is "greater than" and the last sum has `3^i`; it should be "less than" and `3^k`; affects nothing.

The remaining entries of the README's "Source corrections" (LV Lemma 10.4, LV Example 4, LV Lemma 11.4,
LS Lemmas 5.49, 8.14, A.1) were recorded by the previous round and not re-read in this one.

## For the human reviewers

- **Licence.** `sources.toml` records `Serre` (Springer monograph) as `uncertified`, `licence_class = "none"`, cited by section number only at `README.md:1457–1459`; no text was read.
- **Licence.** The `LV` text was cached from `bimsa.net/doc/publication/2578.pdf` (`licence_class = "institutional"`), a host that is neither author's institution; the README cites the journal and arXiv:1807.02721v3.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ab9e9d62570fcb7d29659fb79a89570315c762c0", "job": "REV-PKG-MordellLawrenceVenkateshPartII~6", "model": "fable", "worker": "chris-x82"} -->
