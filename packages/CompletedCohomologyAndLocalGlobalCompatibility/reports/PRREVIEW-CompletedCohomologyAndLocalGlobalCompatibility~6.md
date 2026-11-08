# Review of CompletedCohomologyAndLocalGlobalCompatibility (pull request #1270 at 1148c33)

**Verdict:** accepted

This is an incremental re-review of `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/` at `1148c33c2546b502267e5af93d629e8030ba11b0`. It covers the 42 lines changed since `873a475`: 21 lines of `README.md`, and no change to `Suggested.lean` or `metadata.toml`.

All five findings of the previous review are repaired, and none of the repairs introduces a new defect. I checked every changed line against the README's own targets, the supplier sections it now cites and the source texts at their locators. Two changed lines alter a stated hypothesis (§4.12, §5.7), and both now match their sources word for word. The gate passes and the dependency check is clean.

No findings.

## Previous findings

- R01 — repaired: line 133 “PhiGammaModulesAndIwasawaCohomology §1.1 supplies the relative annulus and the relative Robba ring … its §7.5 the saturated triangulations”; line 197 “the residual Eisenstein vanishing of … §R18.4.8”; line 2133 “nice in the sense of GL2ModularityLifting §10.1 (Pan’s nice Hecke prime)”.
- R02 — repaired: line 650 “the Shimura H⁰ coefficient extension of the further comparison inputs”; line 1268 “§3.5a (allowable-point deformation comparison)”; lines 1594, 1674 “§4.1 (finite-residue-field descent and product co-Whittaker comparison)”; line 1807 “the Pan block dimension comparison of the arithmetic extensions of supplier contracts”.
- R03 — repaired: line 278 “Prove the reducible Banach structure comparison, in the cohomological convention, on the domain of Definition 3.3.15”; line 280 “the cohomological adapter of PadicLocalLanglandsForGL2Qp §§3.8 and 4.3”; line 1050 “The cohomological Hecke-image comparison identifies this ring”; line 1824 “Then §1.5’s integral duality comparison transports (1)”.
- R04 — repaired: lines 280, 1741 and 2388 read “CDP Theorem 3.23(a), §3.3.4, pp. 25–26”; no “24–26” remains for CDP (the one at line 1897 is CEGGPS §2.8).
- R05 — repaired: line 907 “`… ⊗ Sym^{a−b−1}E² ⊗ det^{b+1} ⊗ π_p(V)`, by EM-PAMQ Theorem 7.4.2 (EM11 prints `det^b` here, a slip for the `det^{b+1}` of its Theorem 3.3.22; see §6.3)”.

## Verified sound

### Gate, dependency check and elaboration

The worker's gate at this head:

```text
gate CompletedCohomologyAndLocalGlobalCompatibility: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

I re-ran the gate: it printed the same counters, all zero, ending `source-material=0 OK` with no `build` field, and exited 0. The build is covered by the worker's `build=0` and by the elaboration below. Separate checks:

- **Dependency check** (`--movable`): exit 0, with no UPWARD, CYCLE or `moved:` line. Its output:

  ```text
  depcheck: 243 roadmaps, 2481 edges, 0 problem(s)
  ```

- **Elaboration:** `lake env lean` on `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/Suggested.lean` exits 0 with no output.
- **`Suggested.lean`:** unchanged since `873a475` (`git diff --stat` is empty). It still holds `module`, `import Mathlib`, the docstring and an empty namespace. So the `#check @name` comparison and the one-tactic padding probe have nothing to test.
- **Worker's signature extractor:** it failed with "unexpected token". That is a failure of the extractor, not of the file: with no declarations there is no signature to print.
- **Other changes:** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

### The 21 changed lines

| Line | Change | Check made | Outcome |
|---|---|---|---|
| 43 | `PanNicePrime` → “Pan’s nice Hecke primes of GL2ModularityLifting §10.1” | §10.1 heading at GL2ModularityLifting README line 2478 (head `5dd2828`) | Resolves |
| 133 | Lean names → prose | PhiGammaModulesAndIwasawaCohomology README at `09f2de3`: relative annulus and Robba ring (line 772, §1.1), “Construct the relative realization D_rig(V)” (885, §1.2), character module `R_(A,K)(δ)` (2803, §7.1), triangulations (3010, §7.5) | All four objects are there, in the cited sections |
| 197 | `residualEisensteinVanishing` → prose | HilbertModularVarietiesAndShimuraCurves at `9107b6b`, §R18.4.8 (line 3474; theorem at 3476: absolutely irreducible residual ideal, H⁰ = H² = 0, components via R18.4.7) | Matches the hypotheses stated at line 197 |
| 278 | Garble repaired | Sentence parses. Dichotomy `χ₁χ₂⁻¹ ≠ ε` (EM11 Prop 3.4.2) versus `= ε` (Prop 3.4.5) is unchanged | Sound |
| 280 | Garble repaired; pp. 25–26 | PadicLocalLanglandsForGL2Qp at `84416ad`: §3.8 (line 1155), §4.3 (1440). CDP: page-25 marker at CDP line 1142, §3.3.4 at 1146, Thm 3.23 at 1161, page-26 marker at 1189 | Resolves; pages correct |
| 650 | Handles → prose | “Further comparison inputs” is the heading at README line 191; item 2 is at 197 | Resolves |
| 907 | `det^b` → `det^{b+1}`, with the slip flagged | EM11 line 1441 (Thm 3.3.22, p. 28) prints `det^{b+1}`; EM11 line 5129 (§7.4, p. 97) prints `det^b`. Consistent with README lines 221, 2251 and 2273 | Self-consistent |
| 1050 | Garble repaired | Parses | Sound |
| 1268 | Handle → prose | “Prove the allowable-point deformation comparison” at line 1237 (§3.5a) | Resolves |
| 1594, 1674 | Handles → prose | Both targets are named at line 146 and line 1844 | Resolve |
| 1741, 2388 | pp. 25–26 | As for line 280 | Correct |
| 1807 | Handle → prose | “Arithmetic extensions of supplier contracts” is the heading at line 143; “Construct the Pan block dimension comparison” is at 174 | Resolves |
| 1816 | “with p split” → “totally real of even degree in which p splits completely” | CDN line 1783–1784 (Prop 4.5, p. 47): a totally real field of even degree over ℚ in which p is totally split. §1.5 line 654 says the same | Matches the source |
| 1824 | Garble repaired | “integral duality comparison” is defined at line 623 (§1.5) | Resolves |
| 1916 | Garble repaired | Parses; §2.8 and CEGGPS Lemma 4.14 are unchanged | Sound |
| 2109 | Stray “,.” removed | — | Sound |
| 2133 | “F of even degree with p split” → “F totally real of even degree in which p splits completely” | PAN line 1591 (§4.1.1, p. 38) says the same. §3.8 line 1362 and GL2ModularityLifting §10.1 (line 2480) agree. Conditions (i)–(v) match PAN Def 4.1.4 (lines 1645–1663, p. 39). The `p = 3` clause matches PAN line 1674 | Matches the source |
| 2135, 2150 | Names → prose | GL2ModularityLifting §10.1 states the predicate, lattice extraction and characterisation as API bullets (README lines 2488–2493) | Resolves |

A residual search over the folder for every handle and name in R01–R03 finds no occurrence:
- the R01 names: `PanNicePrime`, `residualEisensteinVanishing`, `relativeAnnulus`, `relativeRobba`, `RelativePhiGammaModule`, `relativeDrig`, `characterModule`, `Triangulation`;
- the R02 handles: `shimuraH0`, `allowablePoint_`, `awayFamily_`, `panBlockDimension`;
- the R03 garbles: “its the” and “comparison the”.

### Sources read this round

- **CDN** (arXiv 2204.11214v2, fetched through the sources service):
  - Prop 4.5 at lines 1783–1789;
  - the chapter-4 standing assumptions at line 1753 and footnotes 23 and 26 (lines 1771–1773);
  - §4.1.2 at lines 1805–1815.

  Footnote 23 confines `p > 2` to the existence of the globalisation of Prop 4.5. §4.12 takes the globalising π as part of its setting, so it needs no separate prime hypothesis.
- **PAN** (arXiv 1901.07166v2):
  - §4.1.1–4.1.3 at lines 1590–1643;
  - Definition 4.1.4 and Remarks 4.1.5–4.1.6 at lines 1645–1671;
  - Theorem 4.1.7 and Corollary 4.1.8 at lines 1673–1683.
- **EM11** (cached): lines 1437–1446 and 5119–5135.
- **CDP** (cached): lines 1142–1163 and 1189.

### Seeded sample

- **4.12** is in the changed passages (lines 1816 and 1824). Its hypotheses were re-read at CDN Prop 4.5 (above) and agree. The r5 review read CDN Props 4.7–4.8 and 4.11–4.12 and Paškūnas–Ludwig Lemma 6.2; this diff does not touch those passages.
- **6.3** is cited by changed line 907. Its exponent statement (line 2251) agrees with EM11 lines 1441 and 5129.
- The other 13 seeded targets lie outside the changed passages, so this incremental review does not re-read them: 0.7, 1.1, 1.2, 2.2, 2.4, 2.7, 4.2, 4.3, 4.8, 5.2a, 5.5, 5.5a and 6.4. Of these, 2.7, 4.8, 5.2a and 5.5a were verified at their locators in the r5 review at `873a475`, and their text is unchanged.
- The README flags no locator as unverified.

### Headline theorems

The changes leave the headline list H1–H10 of the r5 review unchanged. None is statable at the pins: Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9` have no p-level towers with G-action, no B(V), no deformation rings and no eigenform Galois representations. The `Suggested.lean` docstring, unchanged, names each missing carrier.

### Ownership and overlaps

- The overlap report lists no open pull request changing this roadmap, no dropped id and no revision-only id.
- The changed lines add no owned object. They only turn supplier names into prose citations of the same sections.
- §5.7 still cites GL2ModularityLifting §10.1 for the predicate, and §10.1's setting line (2480) matches the corrected wording of line 2133. The consumer's input CC2 is stated as a hypothesis there, so the citation is not upward.

### Adversarial pass

New rows, one for each changed statement, with values computed this round:

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §2.5 line 907, algebraic factor | weight 2, (a,b)=(0,−1); weight 4, (0,−3); scalar uI | (0,−1): `Sym⁰⊗det⁰` trivial, matching worked example line 898. (0,−3): `Sym²⊗det^{−2}` scalar u²·u⁻⁴=u⁻², and `(Sym²)^∨` scalar u⁻² (equal); printed `det^{−3}` gives u⁻⁴ | `b+1` correct; matches lines 221 and 1481 |
| §4.12 line 1816, setting | E₀=ℚ; E₀=ℚ(√5) with p=11; p=3 in ℚ(√5) | ℚ: definite D₀ split at all finite places would ramify only at ∞ (1 place, odd), so it cannot exist. ℚ(√5): (11/5)=(1/5)=1, so 11 splits, and ramification {∞₁,∞₂} has 2 places (even), so D₀ exists. p=3: (3/5)=−1, so E₀,𝔭=ℚ₉≠ℚ₃ and the GL₂(ℚ_p) statement fails | Even degree and complete splitting are both needed, as written |
| §5.7 line 2133, setting | F=ℚ; Def 4.1.4 conditions | F=ℚ: Pan's D ramified exactly at ∞ (1 place) does not exist. README (i) p∈q, dim 1; (ii) irreducible lattice; (iii) nonsplit (∗ ∗; 0 ∗); (iv) dihedral L∩F(ζ_p)=F; (v) trivial lift. Pan has these as preamble plus (1)–(4) | Exact match; p=3 clause retained |
| §0.3 line 278, reducible comparison | χ₁=χ₂=1; χ₁=ε, χ₂=1 | `χ₁χ₂⁻¹`=1≠ε gives Prop 3.4.2, central character ε; `χ₁χ₂⁻¹`=ε gives Prop 3.4.5, central character ε² | Dichotomy as stated |
| §0.3 line 280, completion factor | weights (0,1); (0,3) | `Sym^{b−a−1}⊗det^a`: Sym⁰⊗det⁰ trivial; Sym²⊗det⁰. CDP pages: §3.3.4 after the p. 25 marker, proof through p. 26 | Consistent; pages corrected |
| Line 133 supplier objects | PhiGamma §§1.1, 1.2, 7.1, 7.5 | Objects found at README lines 772, 885, 2803 and 3010 of #1310 (`09f2de3`) | Single owner, cited |
| Line 197 / 650 import | HilbertModularVarietiesAndShimuraCurves §R18.4.8 | Theorem at line 3476: H⁰_m=H²_m=0 for absolutely irreducible residual m, no weight bound | Matches the stated import |
| Lines 1268, 1594, 1674, 1807, 1824 (renamed inputs) | Prose titles | Targets at lines 1237, 146/1844, 174 and 623 | Each title names exactly one target |

Rows carried from the r5 review at `873a475`, for statements this diff does not touch. Their values are in that report.

| Statement | Values (r5) | Result (r5) |
|---|---|---|
| §0.1 integral-isomorphism criterion | `O→O²`, x↦(x,0): rational inj., socle k→k² inj., coker O | Corrected Lemma 3.1.6 form needed |
| §0.1 ordinary parts | χ≠χ^w: `Hom_T(χ,χ^w)=0` | Opposite Borel required |
| §0.3 p=5 filtered module | t_H=3=t_N; ratio p | Weakly admissible, nongeneric |
| §0.3 nonspecial versus exceptional | ε≠x | Exceptional points nonspecial |
| §0.4/§4.10 E_B | Thm 2.22 any p | Check holds |
| §0.7 coset counts | n=4, q=2: 225=120+105 | Quadratic relation holds |
| §0.7 Hecke polynomial | n=2: `X²−T^{(1)}X+qT^{(2)}` | Agrees |
| §0.7 conjugate place | `T_{w^c}^{(j)}=(T^{(n)})⁻¹T^{(n−j)}` | Holds |
| §0.7 Iwahori count | q versus q+1 | Discriminates |
| §1.4 Check, level 11, p=3 | disc −7≡2, a nonsquare mod 3 | Irreducible |
| §1.5 Check, discriminant 26, p=2 | ψ₅(2)=−1 gives 2A_n=0 | Consistent |
| §1.6 odd ψ, p=2 | 2f=0 | Checks hold |
| §2.8 Frobenius and Hensel checks | 5/6, 1/6; roots 2±√5∉ℚ₅ | Hold |
| §3.2 determinant | ℓS_ℓ=2=χ(2)·2 | ℓS_ℓ correct |
| §3.4 Mahler Check | v₃(66)=1; mH=H | lim H/mⁿH=0 |
| §3.7a Pan Prop 5.6.1 | traces 3, θ̄χ̄=(2,1) | Holds |
| §3.8 pro-modular primes | ℤ→ℚ, (2) not a contraction | Surjectivity needed |
| §4.5 hypotheses | 1⊕1 not p-distinguished | Only (1) applies |
| §5.1 n=1 projectivity | t−u non-zero-divisor | Uniformizer-only Λ |
| §5.5 dyadic fibre and −I | length 2 times 2⁻¹ = 1; ([−I]−1)²=0 | Normalisation correct |
| §5.4/§5.6 components | k[x,y]/(xy), M=R/(x) | Ambient ring needed |
| §6.2 density | k[x]→k: kernel (x)≠0 | Both conditions needed |
| §6.3 non-crystabelline ⇒ irreducible | unipotent and finite gives trivial | Holds |
| Worked examples 11a1 | #E(F₅)=5, a₅=1 | Correct |
| Headlines H1–H10 | carriers absent at pins | Not statable |

### Counts

- **Cross-roadmap citations resolved this round:** 11. These are PhiGammaModulesAndIwasawaCohomology §§1.1, 1.2, 7.1 and 7.5; HilbertModularVarietiesAndShimuraCurves §R18.4.8; GL2ModularityLifting §10.1 (cited three times); and PadicLocalLanglandsForGL2Qp §§3.8 and 4.3.
- **Internal targets resolved:** 7 (lines 146, 174, 197, 623, 1237, 1362 and 1844).
- **Source passages read:** 9.
- **Library declarations:** none newly cited by the diff. The 24 opened in the r5 review are unaffected.

## Not verifiable

These items are carried from the r5 review. None is in a passage this diff changes:
- CHT §3.3: no legal copy found (author URL 404, IAS 403, Publ. IHÉS paywalled).
- Shimura, *Introduction to the arithmetic theory of automorphic functions*, Proposition 3.3: a book with no legal copy.
- Ribet 1990, Proposition 3.8, and Ribet 1995: paywalled, uncertified.
- González–Rotger, Theorem 3.1 and Table 3.2: not fetched. The §1.5 Check was checked only for internal consistency.

## Source issues

- **Misprint** in EM11 at §7.4, p. 97: the source writes the locally algebraic factor of B(V′) with det^b (EM11 line 5129); it should be det^{b+1}, as in Theorem 3.3.22 (line 1441), which §7.4 proves; affects nothing.
